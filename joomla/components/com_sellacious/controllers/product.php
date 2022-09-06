<?php
/**
 * @version     1.4.0
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access
defined('_JEXEC') or die;

use Joomla\Utilities\ArrayHelper;

/**
 * Product controller class.
 */
class SellaciousControllerProduct extends SellaciousControllerForm
{
	/**
	 * @var    string  The prefix to use with controller messages.
	 *
	 * @since  1.6
	 */
	protected $text_prefix = 'COM_SELLACIOUS_PRODUCT';

	/**
	 * Switch the variant selection for the product page according to the selected variant specifications
	 *
	 * @return  bool
	 */
	public function switchVariant()
	{
		JSession::checkToken() or jexit(JText::_('JINVALID_TOKEN'));

		$app = JFactory::getApplication();

		/** @var JModelLegacy $model */
		$this->setRedirect($this->getReturnURL());

		$code  = $app->input->get('p');
		$valid = $this->helper->product->parseCode($code, $product_id, $variant_id, $seller_uid);

		if (!$valid)
		{
			$this->setMessage(JText::_($this->text_prefix . '_INVALID_ITEM_SELECTED'));

			return false;
		}

		$specs = $app->input->post->get('jform', array(), 'array');
		$specs = ArrayHelper::getValue($specs, 'variant_spec', array(), 'array');

		$variants = $this->helper->product->getVariants($product_id);
		$filtered = $this->helper->variant->pick($specs, $variants, 1);

		// What are we doing here? Add proper comment for below!
		if (count($filtered) == 0)
		{
			$var_specs = $this->helper->variant->getSpecifications($variant_id);

			foreach ($specs as $s_field => $s_value)
			{
				if (!isset($var_specs[$s_field]) || $var_specs[$s_field] != $s_value)
				{
					$spec_min = array($s_field => $s_value);
					$filtered = $this->helper->variant->pick($spec_min, $variants, 1);

					break;
				}
			}
		}

		if (count($filtered))
		{
			$variant    = reset($filtered);
			$variant_id = $variant->id;
		}
		else
		{
			$this->setMessage(JText::_('COM_SELLACIOUS_PRODUCT_VARIANT_SPEC_NO_MATCH'));
		}

		// Clear 'edit' layout param from request
		$app->input->set('layout', '');
		$p_code = $this->helper->product->getCode($product_id, $variant_id, $seller_uid);
		$this->setRedirect(JRoute::_('index.php?option=com_sellacious&view=product&p=' . $p_code, false));

		return true;
	}

	/**
	 * Save customer query for the specified product
	 *
	 * @throws  Exception
	 */
	public function submitQuery()
	{
		JSession::checkToken() or jexit(JText::_('JINVALID_TOKEN'));

		$app   = JFactory::getApplication();
		$model = $this->getModel();
		$code  = $app->input->getString('p');
		$data  = $app->input->get('jform', array(), 'array');

		try
		{
			$query = ArrayHelper::getValue($data, 'query', array(), 'array');

			if (empty($query) || empty($code))
			{
				throw new Exception(JText::_($this->text_prefix . '_QUERY_FORM_INVALID_CONTENT'));
			}

			// todo: Validate against the query form instance
			$model->saveQuery($query, $code);

			$this->setRedirect('index.php?option=com_sellacious&view=product&layout=query&tmpl=component&sent=1');
		}
		catch (Exception $e)
		{
			$this->setRedirect('index.php?option=com_sellacious&view=product&layout=query&tmpl=component&p=' . $code);

			JLog::add($e->getMessage(), JLog::WARNING);
		}
	}

	/**
	 * Save customer rating and review for the specified product
	 *
	 * @throws  Exception
	 */
	public function saveRating()
	{
		JSession::checkToken() or jexit(JText::_('JINVALID_TOKEN'));

		$app  = JFactory::getApplication();
		$data = $app->input->get('jform', array(), 'array');

		// Redirect back to product page always
		$this->setRedirect($this->getReturnURL());

		if (empty($data['product_id']) || empty($data['seller_uid']) || !isset($data['variant_id']))
		{
			$this->setMessage(JText::_($this->text_prefix . '_RATING_INVALID_VALUES'), 'warning');

			return false;
		}

		try
		{
			$form = $this->helper->rating->getForm($data['product_id'], $data['variant_id'], $data['seller_uid']);

			// Filter and validate the form data.
			$data   = $form->filter($data);
			$return = $form->validate($data);

			// Check for an error.
			if ($return instanceof Exception)
			{
				throw $return;
			}

			// Check the validation results.
			if ($return === false)
			{
				// Get the validation messages from the form.
				foreach ($form->getErrors() as $message)
				{
					$app->enqueueMessage($message);
				}

				return false;
			}

			$user = JFactory::getUser();

			if (!$user->guest)
			{
				$data['author_id']    = $user->id;
				$data['author_name']  = $user->name;
				$data['author_email'] = $user->email;
			}
			else
			{
				if (empty($data['author_name']) || empty($data['author_email']))
				{
					$this->setMessage(JText::_($this->text_prefix . '_RATING_USER_INFO_REQUIRED'), 'warning');

					return false;
				}

				$data['author_id'] = 0;
			}

			foreach (array('product', 'seller', 'packaging', 'shipment') as $type)
			{
				if (!empty($data[$type]) && is_array($data[$type]))
				{
					$record = $data[$type];

					$record['product_id']   = $data['product_id'];
					$record['variant_id']   = $data['variant_id'];
					$record['seller_uid']   = $data['seller_uid'];
					$record['author_id']    = $data['author_id'];
					$record['author_name']  = $data['author_name'];
					$record['author_email'] = $data['author_email'];
					$record['type']         = $type;
					$record['state']        = 1;

					$table = JTable::getInstance('Rating', 'SellaciousTable');

					// Product is to handled differently as we need to overwrite previous review for it
					if ($type == 'product')
					{
						if ($user->guest)
						{
							$args = array('type' => $type, 'author_email' => $record['author_email']);
						}
						else
						{
							$args = array('type' => $type, 'author_id' => $record['author_id']);
						}

						// Select based solely on product id, ignore variant and seller
						$args['product_id'] = $record['product_id'];

						$table->load($args);
					}

					$table->bind($record);
					$table->check();
					$table->store();

					if ($type != 'product')
					{
						// If non product review, this is a certified buyer
						$table->set('buyer', 1);
						$table->store();
					}
					elseif (!$user->guest)
					{
						// Mark as reviewed where pending order review for registered customers
						$db    = JFactory::getDbo();
						$sub   = $db->getQuery(true);
						$query = $db->getQuery(true);

						$sub->select('i.id')
							->from($db->qn('#__sellacious_order_items', 'i'))
							->where('i.product_id = ' . (int) $record['product_id'])
							->where('reviewed = 0')
							->join('INNER', $db->qn('#__sellacious_orders', 'o') . ' ON o.id = i.order_id')
							->where('o.customer_uid = ' . (int) $user->id);

						$pks = $db->setQuery($sub)->loadColumn();

						if (count($pks))
						{
							$query->update($db->qn('#__sellacious_order_items'))
								->set('reviewed = 1')
								->where('id IN (' . implode(', ', $pks) . ')');

							$db->setQuery($query)->execute();

							// If anything was pending, this is a certified buyer
							$table->set('buyer', 1);
							$table->store();
						}
					}
				}
			}
		}
		catch (Exception $e)
		{
			$this->setMessage($e->getMessage(), 'error');

			return false;
		}

		$this->setMessage(JText::_($this->text_prefix . '_RATING_SAVE_SUCCESS'));

		return true;
	}
}
