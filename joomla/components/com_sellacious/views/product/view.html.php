<?php
/**
 * @version     1.4.4
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access
defined('_JEXEC') or die;

use Joomla\Registry\Registry;
use Joomla\Utilities\ArrayHelper;

/**
 * View to edit
 */
class SellaciousViewProduct extends SellaciousView
{
	/** @var  JDocumentHTML */
	public $document;

	/** @var  JObject */
	protected $state;

	/** @var  Registry */
	protected $item;

	/** @var  JForm */
	protected $form;

	/**
	 * Display the view
	 *
	 * @param   string  $tpl
	 *
	 * @return  mixed
	 * @throws  Exception
	 */
	public function display($tpl = null)
	{
		$app         = JFactory::getApplication();
		$this->state = $this->get('State');

		if ($this->_layout == 'default')
		{
			// If detail view is disabled, we should not continue.
			// However administrators and seller (for own items) can be permitted for the obvious reason.
			$me          = JFactory::getUser();
			$show_detail = $this->helper->config->get('product_detail_page');
			$is_admin    = $me->authorise('core.admin');
			$is_seller   = $this->state->get('product.seller_uid') == $me->id;

			if (!$show_detail && !$is_admin && !$is_seller)
			{
				JLog::add(JText::_('COM_SELLACIOUS_PAGE_NOT_FOUND'), JLog::WARNING, 'jerror');

				$redirect = $this->helper->config->get('redirect', 'index.php');

				$app->redirect(JRoute::_($redirect, false));

				// This should not be needed.
				return false;
			}

			try
			{
				$item       = $this->get('Item');
				$this->item = new Registry($item);
			}
			catch (Exception $e)
			{
				JLog::add($e->getMessage(), JLog::WARNING, 'jerror');

				return false;
			}
		}
		elseif ($this->_layout == 'query')
		{
			$allowed_price_display = (array) $this->helper->config->get('allowed_price_display');

			if (!in_array(3, $allowed_price_display))
			{
				JLog::add(JText::_('COM_SELLACIOUS_PAGE_NOT_FOUND'), JLog::WARNING, 'jerror');

				return false;
			}

			if ($app->input->get('sent'))
			{
				$tpl = 'sent';
			}
			else
			{
				try
				{
					$item       = $this->get('Item');
					$this->item = new Registry($item);

					$this->form = $this->get('QueryForm');

					if (!$this->form instanceof JForm)
					{
						throw new Exception(JText::_('COM_SELLACIOUS_PRODUCT_QUERY_FORM_LOAD_FAILED'), JLog::WARNING, 'jerror');
					}
				}
				catch (Exception $e)
				{
					JLog::add($e->getMessage(), JLog::WARNING, 'jerror');

					return false;
				}
			}
		}
		else
		{
			try
			{
				$item       = $this->get('Item');
				$this->item = new Registry($item);
			}
			catch (Exception $e)
			{
				JLog::add($e->getMessage(), JLog::WARNING, 'jerror');

				return false;
			}
		}

		// Check for errors.
		if (count($errors = $this->get('Errors')))
		{
			JLog::add(implode("\n", $errors), JLog::WARNING, 'jerror');

			return false;
		}

		if ($this->item && ($title = $this->item->get('title')))
		{
			if (empty($title))
			{
				$title = $app->get('sitename');
			}
			elseif ($app->get('sitename_pagetitles', 0) == 1)
			{
				$title = JText::sprintf('JPAGETITLE', $app->get('sitename'), $title);
			}
			elseif ($app->get('sitename_pagetitles', 0) == 2)
			{
				$title = JText::sprintf('JPAGETITLE', $title, $app->get('sitename'));
			}

			$this->document->setTitle($title);

			$this->document->setMetaData('keywords', $this->item->get('metakey'));
			$this->document->setMetaData('description', $this->item->get('metadesc'));
		}

		return parent::display($tpl);
	}

	/**
	 * Get choices of the variants options to be selected by the customer
	 *
	 * @return  stdClass[]
	 */
	public function getVariantChoices()
	{
		if (!$this->helper->config->get('multi_variant', 0))
		{
			return array();
		}

		$product_id     = $this->item->get('id');
		$specifications = (array) $this->item->get('specifications');
		$specifications = $this->helper->core->arrayAssoc($specifications, 'id', 'value');
		$variants       = $this->helper->product->getVariants($product_id);
		$variations     = $this->helper->variant->getVariations($product_id);
		$valid_choices  = array();

		foreach ($variations as $variation)
		{
			$specs = (array) $specifications;

			unset($specs[$variation->id]);

			$variants_picked = $this->helper->variant->pick($specs, $variants);
			$fields_picked   = ArrayHelper::getColumn($variants_picked, 'fields');
			$values_picked   = array();

			foreach ($fields_picked as $fldP)
			{
				$fld_value = ArrayHelper::getValue($fldP, $variation->id);

				$values_picked = array_merge($values_picked, is_array($fld_value) ? $fld_value : array($fld_value));
			}

			$variation->available = ArrayHelper::arrayUnique($values_picked);
			$variation->selected  = ArrayHelper::getValue($specifications, $variation->id);

			// Array diff doesn't work with non-scalar elements, use un/serialise to overcome this.
			$variation->unavailable = array_diff(array_map('serialize', $variation->values), array_map('serialize', $variation->available));
			$variation->unavailable = array_map('unserialize', $variation->unavailable);

			if (count($variation->available) || count($variation->unavailable))
			{
				$valid_choices[] = $variation;
			}
		}

		return $valid_choices;
	}

	/**
	 * Get the applicable review form
	 *
	 * @return  JForm
	 */
	public function getReviewForm()
	{
		$product_id = $this->item->get('id');
		$variant_id = $this->item->get('variant_id');
		$seller_uid = $this->item->get('seller_uid');

		return $this->helper->rating->getForm($product_id, $variant_id, $seller_uid);
	}

	/**
	 * Get a list of reviews/ratings for current product
	 *
	 * @return  stdClass[]
	 */
	public function getReviews()
	{
		$filters = array(
			'type'       => 'product',
			'product_id' => (int) $this->item->get('id'),
			'state'      => 1,
			'list.where' => "a.comment != ''"
		);
		$list    = $this->helper->rating->loadObjectList($filters);

		return $list;
	}

	/**
	 * Get consolidated stats of ratings for current product
	 *
	 * @return  stdClass[]
	 */
	public function getReviewStats()
	{
		$list = array();

		$filters = array(
			'list.select' => array('COUNT(1) AS count'),
			'list.where'  => array('a.rating > 0'),
			'type'        => 'product',
			'product_id'  => (int) $this->item->get('id'),
			'state'       => 1,
		);
		$total   = (int) $this->helper->rating->loadResult($filters);

		if ($total > 0)
		{
			$filters['list.select'] = array('a.rating', 'COUNT(1) AS count', "$total AS total");
			$filters['list.group']  = 'a.rating';
			$filters['list.limit']  = '10';

			$list = $this->helper->rating->loadObjectList($filters, 'rating');
		}

		return $list;
	}
}
