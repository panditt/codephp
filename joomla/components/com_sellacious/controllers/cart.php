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

use Joomla\Utilities\ArrayHelper;

/**
 * Cart controller class
 *
 * @since  1.0
 */
class SellaciousControllerCart extends SellaciousControllerBase
{
	/**
	 * @var     string  The prefix to use with controller messages.
	 *
	 * @since  1.6
	 */
	protected $text_prefix = 'COM_SELLACIOUS_CART';

	/**
	 * Add a product item to the shopping cart
	 *
	 * @return  bool
	 */
	public function add()
	{
		// Check for request forgeries
		JSession::checkToken() or jexit(JText::_('JINVALID_TOKEN'));

		$app = JFactory::getApplication();

		$this->setRedirect($this->getReturnURL());

		try
		{
			$code     = $app->input->get('p');
			$quantity = $app->input->post->getInt('quantity', 1);

			$this->helper->product->parseCode($code, $product_id, $variant_id, $seller_uid);

			if (!$product_id)
			{
				throw new Exception(JText::_($this->text_prefix . '_INVALID_PRODUCT_SELECTED'));
			}

			$cart = $this->helper->cart->getCart();

			$cart->addProduct($product_id, $variant_id, $seller_uid, $quantity);

			// Explicit store call is needed to commit the cart update
			$cart->store();

			$this->setMessage(JText::_($this->text_prefix . '_ADD_PRODUCT_SUCCESS'), 'success');
		}
		catch (Exception $e)
		{
			JLog::add($e->getMessage(), JLog::WARNING, 'jerror');

			return false;
		}

		return true;
	}

	/**
	 * Add a product item to the shopping cart via Ajax call
	 *
	 * @return  bool
	 */
	public function addAjax()
	{
		$app = JFactory::getApplication();

		$this->setRedirect($this->getReturnURL());

		try
		{
			$code     = $app->input->get('p');
			$quantity = $app->input->post->getInt('quantity', 1);
			$options  = $app->input->post->get('options', array(), 'array');

			$this->helper->product->parseCode($code, $product_id, $variant_id, $seller_uid);

			if (!$product_id)
			{
				throw new Exception(JText::_($this->text_prefix . '_INVALID_PRODUCT_SELECTED'));
			}

			$cart = $this->helper->cart->getCart();
			$uid  = $cart->addProduct($product_id, $variant_id, $seller_uid, $quantity, array('options' => $options));

			// Explicit store call is needed to commit the cart update
			$cart->store();

			$response = array(
				'state'   => 1,
				'message' => JText::_($this->text_prefix . '_ADD_PRODUCT_SUCCESS'),
				'data'    => array(
					'uid'      => $uid,
					'redirect' => JRoute::_('index.php?option=com_sellacious&view=cart', false),
					'token'    => JSession::getFormToken(),
				),
			);
		}
		catch (Exception $e)
		{
			$response = array(
				'state'   => 0,
				'message' => $e->getMessage(),
				'data'    => null,
			);
		}

		echo json_encode($response); jexit();
	}

	/**
	 * Update selected cart items, quantity etc
	 *
	 * @return  bool
	 * @throws Exception
	 */
	public function update()
	{
		// Check for request forgeries
		JSession::checkToken() or jexit(JText::_('JINVALID_TOKEN'));

		$app  = JFactory::getApplication();
		$data = $app->input->post->get('jform', array(), 'array');

		$this->setRedirect($this->getReturnURL());

		try
		{
			$cart = $this->helper->cart->getCart();
			$data = ArrayHelper::getValue($data, 'quantity');

			foreach ($data as $uid => $quantity)
			{
				$cart->setQuantity($uid, (int) $quantity);
			}

			$cart->store();

			$this->setMessage(JText::_($this->text_prefix . '_UPDATE_SUCCESS'), 'success');
		}
		catch (Exception $e)
		{
			JLog::add($e->getMessage(), JLog::WARNING, 'jerror');

			return false;
		}

		return true;
	}

	/**
	 * Remove selected cart items
	 *
	 * @return  bool
	 * @throws Exception
	 */
	public function remove()
	{
		// Check for request forgeries
		JSession::checkToken() or jexit(JText::_('JINVALID_TOKEN'));

		$app = JFactory::getApplication();
		$cid = $app->input->post->get('cid', array(), 'array');

		$this->setRedirect($this->getReturnURL());

		try
		{
			$cart = $this->helper->cart->getCart();

			array_walk($cid, array($cart, 'remove'));

			$cart->store();

			$this->setMessage(JText::_($this->text_prefix . '_REMOVE_SUCCESS'), 'success');
		}
		catch (Exception $e)
		{
			JLog::add($e->getMessage(), JLog::WARNING, 'jerror');

			return false;
		}

		return true;
	}

	/**
	 * Clear all cart items
	 *
	 * @return  bool
	 * @throws Exception
	 */
	public function clear()
	{
		// Check for request forgeries
		JSession::checkToken() or jexit(JText::_('JINVALID_TOKEN'));

		$this->setRedirect($this->getReturnURL());

		try
		{
			$cart = $this->helper->cart->getCart();
			$cart->clear();
			$cart->store();

			$this->setMessage(JText::_($this->text_prefix . '_CLEAR_SUCCESS'), 'success');
		}
		catch (Exception $e)
		{
			JLog::add($e->getMessage(), JLog::WARNING, 'jerror');

			return false;
		}

		return true;
	}

	/**
	 * Checkout cart
	 *
	 * @return  bool
	 * @throws  Exception
	 */
	public function checkout()
	{
		// Check for request forgeries
		JSession::checkToken() or jexit(JText::_('JINVALID_TOKEN'));

		$this->setRedirect($this->getReturnURL());

		try
		{
			$cart = $this->helper->cart->getCart();

			// Checkout only if the cart has something added to it.
			if ($cart->count() <= 0)
			{
				throw new Exception(JText::_($this->text_prefix . '_CHECKOUT_CART_EMPTY'));
			}

			$user        = JFactory::getUser();
			$destination = JRoute::_('index.php?option=com_sellacious&view=cart&layout=aio', false);

			if ($user->guest)
			{
				// First let user login if not already!
				$this->setMessage(JText::_($this->text_prefix . '_CHECKOUT_LOGIN_REQUIRED'), 'info');
				$this->setRedirect(JRoute::_('index.php?option=com_users&task=login&return=' . base64_encode($destination), false));
			}
			else
			{
				// Otherwise cart is already assigned to him till now. Ready to checkout! More logic later, if any.
				$this->setRedirect($destination);
			}
		}
		catch (Exception $e)
		{
			JLog::add($e->getMessage(), JLog::WARNING, 'jerror');

			return false;
		}

		return true;
	}

	/**
	 * Add billing info to cart
	 *
	 * @return  bool
	 */
	public function setBilling()
	{
		// Check for request forgeries
		JSession::checkToken() or jexit(JText::_('JINVALID_TOKEN'));

		$app  = JFactory::getApplication();
		$data = $app->input->post->get('jform', array(), 'array');

		$this->setRedirect($this->getReturnURL());

		try
		{
			$cart = $this->helper->cart->getCart();

			if (empty($data['billing']))
			{
				throw new Exception(JText::_($this->text_prefix . '_BILLING_INFO_INVALID'));
			}

			$cart->setBilling($data['billing']);

			$cart->store();

			$this->setMessage(JText::_($this->text_prefix . '_BILLING_UPDATE_SUCCESS'), 'success');
			$this->setRedirect(JRoute::_('index.php?option=com_sellacious&view=cart&layout=shipping', false));
		}
		catch (Exception $e)
		{
			JLog::add($e->getMessage(), JLog::WARNING, 'jerror');

			return false;
		}

		return true;
	}

	/**
	 * Add shipping info to cart
	 *
	 * @return  bool
	 */
	public function setShipping()
	{
		// Check for request forgeries
		JSession::checkToken() or jexit(JText::_('JINVALID_TOKEN'));

		$app  = JFactory::getApplication();
		$data = $app->input->post->get('jform', array(), 'array');

		$this->setRedirect($this->getReturnURL());

		try
		{
			$cart = $this->helper->cart->getCart();

			if (empty($data['shipping']))
			{
				throw new Exception(JText::_($this->text_prefix . '_SHIPPING_INFO_INVALID'));
			}

			$cart->setShipping($data['shipping']);

			$cart->store();

			$this->setMessage(JText::_($this->text_prefix . '_BILLING_UPDATE_SUCCESS'), 'success');
			$this->setRedirect(JRoute::_('index.php?option=com_sellacious&view=cart&layout=verify', false));
		}
		catch (Exception $e)
		{
			JLog::add($e->getMessage(), JLog::WARNING, 'jerror');

			return false;
		}

		return true;
	}

	/**
	 * Add shipping and billing info to cart via Ajax call
	 *
	 * @return  void
	 */
	public function setAddressesAjax()
	{
		$app = JFactory::getApplication();

		try
		{
			if (!JSession::checkToken())
			{
				throw new Exception(JText::_('JINVALID_TOKEN'));
			}

			if (JFactory::getUser()->guest)
			{
				throw new Exception(JText::_($this->text_prefix . '_NOT_LOGGED_IN'));
			}

			$billing  = $app->input->post->getInt('billing');
			$shipping = $app->input->post->getInt('shipping');
			$cart     = $this->helper->cart->getCart();

			if ($shipping)
			{
				$cart->setShipping($shipping);
			}

			if ($billing)
			{
				$cart->setBilling($billing);
			}

			$cart->store();

			$response = array(
				'message' => JText::_($this->text_prefix . '_ADDRESS_SAVE_SUCCESS'),
				'data'    => null,
				'status'  => 1,
			);
		}
		catch (Exception $e)
		{
			$response = array(
				'message' => $e->getMessage(),
				'data'    => null,
				'status'  => 0,
			);
		}

		echo json_encode($response);

		$app->close();
	}

	/**
	 * Get the checkout form via ajax
	 *
	 * @return  void
	 */
	public function getCheckoutFormAjax()
	{
		$app = JFactory::getApplication();

		try
		{
			if (!JSession::checkToken())
			{
				throw new Exception(JText::_('JINVALID_TOKEN'));
			}

			$html = false;
			$form = $this->helper->cart->getCheckoutForm(true);

			if ($form)
			{
				$args       = new stdClass;
				$args->form = $form;
				$html       = JLayoutHelper::render('com_sellacious.cart.checkoutform', $args, '', array('debug' => 0));
			}

			$response = array(
				'message' => '',
				'data'    => $html,
				'status'  => 1,
			);
		}
		catch (Exception $e)
		{
			$response = array(
				'message' => $e->getMessage(),
				'data'    => null,
				'status'  => 0,
			);
		}

		echo json_encode($response);

		$app->close();
	}

	/**
	 * Save the checkout form submitted by the user
	 *
	 * @return  void
	 */
	public function saveCheckoutFormAjax()
	{
		$app = JFactory::getApplication();

		try
		{
			if (!JSession::checkToken())
			{
				throw new Exception(JText::_('JINVALID_TOKEN'));
			}

			if (JFactory::getUser()->guest)
			{
				throw new Exception(JText::_($this->text_prefix . '_NOT_LOGGED_IN'));
			}

			$form = $this->helper->cart->getCheckoutForm(true);

			if ($form)
			{
				// We don't know if there are any files inputs, we'd process if any
				$files = $this->input->files->get('jform', array(), 'array');
				$post  = $this->input->post->get('jform', array(), 'array');
				$data  = array_merge_recursive($post, $files);
				$cart  = $this->helper->cart->getCart();

				if (!$form->validate($data))
				{
					$errs = $form->getErrors();

					foreach ($errs as $ei => $error)
					{
						if ($error instanceof Exception)
						{
							$errs[$ei] = $error->getMessage();
						}
					}

					throw new Exception(implode('<br>', $errs));
				}

				$object     = (object) $data;
				$dispatcher = $this->helper->core->loadPlugins();
				$dispatcher->trigger('onContentBeforeSave', array('com_sellacious.cart.checkoutform', &$object, false));

				if ($errors = $dispatcher->getErrors())
				{
					throw new Exception(implode('<br/>', $errors));
				}

				$formData = ArrayHelper::fromObject($object);
				$values   = $this->helper->cart->buildCheckoutformData($formData);

				$cart->set('params.checkoutform', $object);
				$cart->set('params.checkoutformdata', $values);
				$cart->store();

				$dispatcher->trigger('onContentAfterSave', array('com_sellacious.cart.checkoutform', &$object, false));

				$args         = new stdClass;
				$args->cart   = $cart;
				$args->values = $values;
				$html         = JLayoutHelper::render('com_sellacious.cart.aio.checkoutform.viewer', $args, '', array('debug' => false));

				$response = array(
					'message' => JText::_($this->text_prefix . '_CHECKOUTFORM_SAVE_SUCCESS'),
					'data'    => $html,
					'status'  => 1,
				);
			}
			else
			{
				$response = array(
					'message' => '',
					'data'    => null,
					'status'  => 1,
				);
			}
		}
		catch (Exception $e)
		{
			$response = array(
				'message' => $e->getMessage(),
				'data'    => null,
				'status'  => 0,
			);
		}

		echo json_encode($response);

		$app->close();
	}

	/**
	 * Get the checkout form via ajax
	 *
	 * @return  void
	 */
	public function getShippingFormAjax()
	{
		$app = JFactory::getApplication();

		try
		{
			if (!JSession::checkToken())
			{
				throw new Exception(JText::_('JINVALID_TOKEN'));
			}

			$itemisedShip = $this->helper->config->get('itemised_shipping', true);
			$shippedBy    = $this->helper->config->get('shipped_by');
			$flatShip     = $this->helper->config->get('flat_shipping');

			if (!$itemisedShip && $shippedBy == 'shop' && $flatShip)
			{
				$args        = new stdClass;
				$args->cart  = $this->helper->cart->getCart();

				$html = JLayoutHelper::render('com_sellacious.cart.shippingform.flat_ship', $args, '', array('debug' => 0));
			}
			else
			{
				$args        = new stdClass;
				$args->cart  = $this->helper->cart->getCart();
				$args->forms = $this->helper->cart->getShippingForms();
				$layout      = $itemisedShip ? 'item_quotes' : 'cart_quotes';

				$html = JLayoutHelper::render('com_sellacious.cart.shippingform.' . $layout, $args, '', array('debug' => 0));
			}

			$response = array(
				'message' => '',
				'data'    => $html ?: false,
				'status'  => 1,
			);
		}
		catch (Exception $e)
		{
			$response = array(
				'message' => $e->getMessage(),
				'data'    => null,
				'status'  => 0,
			);
		}

		echo json_encode($response);

		$app->close();
	}

	/**
	 * Save the shipping form submitted by the user
	 *
	 * @return  void
	 */
	public function saveShippingFormAjax()
	{
		$app = JFactory::getApplication();

		try
		{
			if (!JSession::checkToken())
			{
				throw new Exception(JText::_('JINVALID_TOKEN'));
			}

			if (JFactory::getUser()->guest)
			{
				throw new Exception(JText::_($this->text_prefix . '_NOT_LOGGED_IN'));
			}

			$cart         = $this->helper->cart->getCart();
			$allForms     = $this->helper->cart->getShippingForms();
			$itemisedShip = $this->helper->config->get('itemised_shipping', true);

			$files   = $this->input->files->get('cart', array(), 'array');
			$post    = $this->input->post->get('cart', array(), 'array');
			$allData = array_merge_recursive($post, $files);

			if ($itemisedShip)
			{
				$uids     = array_keys((array) $cart->get('items', array()));
				$quoteIds = $this->input->get('shipment', array(), 'array');

				foreach ($uids as $uid)
				{
					$quoteId = ArrayHelper::getValue($quoteIds, $uid);

					if ($quoteId)
					{
						$data = ArrayHelper::getValue($allData, $uid);
						$form = ArrayHelper::getValue($allForms, $uid);
						$data = ArrayHelper::getValue($data, $quoteId);
						$form = ArrayHelper::getValue($form, $quoteId);

						if (!$form instanceof $form)
						{
							throw new Exception(JText::_('COM_SELLACIOUS_CART_SHIPRULE_FORM_VALIDATE_LOAD_FAILED'));
						}

						if (!$form->validate($data))
						{
							$errs = $form->getErrors();

							foreach ($errs as $ei => $error)
							{
								if ($error instanceof Exception)
								{
									$errs[$ei] = $error->getMessage();
								}
							}

							if (count($errs))
							{
								throw new Exception(implode('<br>', $errs));
							}
						}

						$object     = (object) $data;
						$dispatcher = $this->helper->core->loadPlugins();
						$dispatcher->trigger('onContentBeforeSave', array('com_sellacious.cart.shippingform', &$object, false));

						if ($errors = $dispatcher->getErrors())
						{
							throw new Exception(implode('<br/>', $errors));
						}

						$formData = ArrayHelper::fromObject($object);
						$values   = $this->helper->cart->buildShipmentFormData($formData);

						$cart->setShiprule($quoteId, $uid);
						$cart->set('items.' . $uid . '.params.shippingform', $object);
						$cart->set('items.' . $uid . '.params.shippingformdata', $values);
						$cart->store();

						$cart->getItems(true);

						$dispatcher->trigger('onContentAfterSave', array('com_sellacious.cart.shippingform', &$object, false));
					}
					else
					{
						// NO method was selected for this item, ignore for now
					}
				}

				$args       = new stdClass;
				$args->cart = $cart;
				$html       = JLayoutHelper::render('com_sellacious.cart.aio.shipping.itemised', $args);
				$response   = array(
					'message' => JText::_($this->text_prefix . '_SHIPPINGFORM_SAVE_SUCCESS'),
					'data'    => $html,
					'status'  => 1,
				);
			}
			elseif ($quoteId = $this->input->get('shipment'))
			{
				$data = ArrayHelper::getValue($allData, $quoteId);
				$form = ArrayHelper::getValue($allForms, $quoteId);

				if ($form)
				{
					if (!$form instanceof JForm)
					{
						throw new Exception(JText::_('COM_SELLACIOUS_CART_SHIPRULE_FORM_VALIDATE_LOAD_FAILED'));
					}

					if (!$form->validate($data))
					{
						$errs = $form->getErrors();

						foreach ($errs as $ei => $error)
						{
							if ($error instanceof Exception)
							{
								$errs[$ei] = $error->getMessage();
							}
						}

						if (count($errs))
						{
							throw new Exception(implode('<br/>', $errs));
						}
					}

					$object     = (object) $data;
					$dispatcher = $this->helper->core->loadPlugins();
					$dispatcher->trigger('onContentBeforeSave', array('com_sellacious.cart.shippingform', &$object, false));

					if ($errors = $dispatcher->getErrors())
					{
						throw new Exception(implode('<br/>', $errors));
					}

					$formData = ArrayHelper::fromObject($object) ?: (array) $object;
					$values   = $this->helper->cart->buildShipmentFormData($formData);

					$cart->set('params.shippingform', $object);
					$cart->set('params.shippingformdata', $values);

					$dispatcher->trigger('onContentAfterSave', array('com_sellacious.cart.shippingform', &$object, false));
				}

				$cart->setShiprule($quoteId, null);
				$cart->store();

				$cart->getTotals(true);

				$args       = new stdClass;
				$args->cart = $cart;
				$html       = JLayoutHelper::render('com_sellacious.cart.aio.shipping.cart', $args);

				$response = array(
					'message' => JText::_($this->text_prefix . '_SHIPPINGFORM_SAVE_SUCCESS'),
					'data'    => $html,
					'status'  => 1,
				);
			}
			else
			{
				$args       = new stdClass;
				$args->cart = $cart;
				$html       = JLayoutHelper::render('com_sellacious.cart.aio.shipping.cart', $args);

				$response = array(
					'message' => JText::_($this->text_prefix . '_SHIPPINGFORM_SAVE_NO_DATA'),
					'data'    => $html,
					'status'  => 1,
				);
			}
		}
		catch (Exception $e)
		{
			$response = array(
				'message' => $e->getMessage(),
				'data'    => null,
				'status'  => 0,
			);
		}

		echo json_encode($response);

		$app->close();
	}

	/**
	 * Get cart items html via ajax
	 *
	 * @return  void
	 */
	public function getItemsHtmlAjax()
	{
		$app = JFactory::getApplication();

		try
		{
			if (!JSession::checkToken())
			{
				throw new Exception(JText::_('JINVALID_TOKEN'));
			}

			$modal    = $app->input->getBool('modal', false);
			$readonly = $app->input->getBool('readonly', false);

			$options    = array('debug' => false);
			$args       = new stdClass;
			$args->cart = $this->helper->cart->getCart();

			if (!$args->cart->count())
			{
				$layout = 'empty';
			}
			elseif ($modal)
			{
				$layout = 'items_modal';
			}
			elseif ($readonly)
			{
				$layout = 'items_summary';
			}
			else
			{
				$layout = 'items';
			}

			$html     = JLayoutHelper::render('com_sellacious.cart.aio.' . $layout, $args, '', $options);
			$response = array(
				'message' => '',
				'data'    => $html,
				'status'  => 1,
			);
		}
		catch (Exception $e)
		{
			$response = array(
				'message' => $e->getMessage(),
				'data'    => null,
				'status'  => 0,
			);
		}

		echo json_encode($response);

		$app->close();
	}

	/**
	 * Remove selected cart item via Ajax
	 *
	 * @return  void
	 * @throws  Exception
	 */
	public function removeItemAjax()
	{
		$app = JFactory::getApplication();

		try
		{
			if (!JSession::checkToken())
			{
				throw new Exception(JText::_('JINVALID_TOKEN'));
			}

			$uid  = $app->input->post->getString('uid');
			$cart = $this->helper->cart->getCart();
			$cart->remove($uid);
			$cart->store();

			$response = array(
				'message' => JText::_($this->text_prefix . '_REMOVE_SUCCESS'),
				'data'    => null,
				'status'  => 1,
			);
		}
		catch (Exception $e)
		{
			$response = array(
				'message' => $e->getMessage(),
				'data'    => null,
				'status'  => 0,
			);
		}

		echo json_encode($response);

		$app->close();
	}

	/**
	 * Remove selected cart item via Ajax
	 *
	 * @return  void
	 * @throws  Exception
	 */
	public function clearAjax()
	{
		$app = JFactory::getApplication();

		try
		{
			if (!JSession::checkToken())
			{
				throw new Exception(JText::_('JINVALID_TOKEN'));
			}

			$cart = $this->helper->cart->getCart();
			$cart->clear();
			$cart->store();

			$response = array(
				'message' => JText::_($this->text_prefix . '_CLEAR_SUCCESS'),
				'data'    => null,
				'status'  => 1,
			);
		}
		catch (Exception $e)
		{
			$response = array(
				'message' => $e->getMessage(),
				'data'    => null,
				'status'  => 0,
			);
		}

		echo json_encode($response);

		$app->close();
	}

	/**
	 * Set quantity of the selected item via Ajax
	 *
	 * @return  void
	 * @throws  Exception
	 */
	public function setQuantityAjax()
	{
		$app = JFactory::getApplication();

		try
		{
			if (!JSession::checkToken())
			{
				throw new Exception(JText::_('JINVALID_TOKEN'));
			}

			$uid  = $app->input->post->getString('uid');
			$qty  = $app->input->post->getInt('quantity');
			$cart = $this->helper->cart->getCart();

			$cart->setQuantity($uid, $qty);
			$cart->store();

			$response = array(
				'message' => JText::_($this->text_prefix . '_QUANTITY_UPDATE_SUCCESS'),
				'data'    => null,
				'status'  => 1,
			);
		}
		catch (Exception $e)
		{
			$response = array(
				'message' => $e->getMessage(),
				'data'    => null,
				'status'  => 0,
			);
		}

		echo json_encode($response);

		$app->close();
	}

	/**
	 * Set Shiprule selected for the selected item via Ajax
	 *
	 * @return  void
	 * @throws  Exception
	 */
	public function setShipruleAjax()
	{
		$app = JFactory::getApplication();

		try
		{
			if (!JSession::checkToken())
			{
				throw new Exception(JText::_('JINVALID_TOKEN'));
			}

			$uid      = $app->input->post->getString('uid');
			$quote_id = $app->input->post->getString('quote_id');
			$cart     = $this->helper->cart->getCart();

			$cart->setShiprule($quote_id, $uid);
			$cart->store();

			$response = array(
				'message' => JText::_($this->text_prefix . '_SHIPRULE_UPDATE_SUCCESS'),
				'data'    => null,
				'status'  => 1,
			);
		}
		catch (Exception $e)
		{
			$response = array(
				'message' => $e->getMessage(),
				'data'    => null,
				'status'  => 0,
			);
		}

		echo json_encode($response);

		$app->close();
	}

	/**
	 * Set coupon code to the user's cart
	 *
	 * @return  void
	 * @throws  Exception
	 */
	public function setCoupon()
	{
		$app = JFactory::getApplication();

		try
		{
			if (!JSession::checkToken())
			{
				throw new Exception(JText::_('JINVALID_TOKEN'));
			}

			$code = $app->input->post->getString('code');
			$cart = $this->helper->cart->getCart();

			$cart->setCoupon($code);
			$cart->store();

			$response = array(
				'message' => JText::_($this->text_prefix . '_COUPON_' . (strlen($code) ? 'APPLY_SUCCESS' : 'REMOVE_SUCCESS')),
				'data'    => $this->helper->coupon->loadObject(array('coupon_code' => $code)),
				'status'  => 1,
			);
		}
		catch (Exception $e)
		{
			$response = array(
				'message' => $e->getMessage(),
				'data'    => null,
				'status'  => 0,
			);
		}

		echo json_encode($response);

		$app->close();
	}

	/**
	 * Get cart summary like total item count, total payable
	 */
	public function getSummaryAjax()
	{
		$app = JFactory::getApplication();

		try
		{
			if (!JSession::checkToken())
			{
				throw new Exception(JText::_('JINVALID_TOKEN'));
			}

			if (JFactory::getUser()->guest)
			{
				throw new Exception(JText::_($this->text_prefix . '_NOT_LOGGED_IN'));
			}

			$cart  = $this->helper->cart->getCart();
			$count = $cart->count();
			$total = $cart->getTotals(true);
			$hash  = $cart->getHashCode();

			// On success a redirect is needed.
			$response = array(
				'message' => JText::_($this->text_prefix . '_SUMMARY_SAVE_SUCCESS'),
				'data'    => array(
					'hash'            => $hash,
					'count'           => $count,
					'total'           => $total->get('grand_total'),
					'total_formatted' => $this->helper->currency->display($total->get('grand_total'), $cart->getCurrency('code_3'), '', true),
				),
				'status'  => 1,
			);
		}
		catch (Exception $e)
		{
			$response = array(
				'message' => $e->getMessage(),
				'data'    => null,
				'status'  => 0,
			);
		}

		echo json_encode($response);

		$app->close();
	}

	/**
	 * Get the forms for each payment method available for the cart
	 *
	 * @return void
	 */
	public function getPaymentFormsAjax()
	{
		$app = JFactory::getApplication();

		try
		{
			if (!JSession::checkToken())
			{
				throw new Exception(JText::_('JINVALID_TOKEN'));
			}

			$user = JFactory::getUser();

			if ($user->guest)
			{
				$response = array(
					'message' => JText::_($this->text_prefix . '_NOT_LOGGED_IN'),
					'data'    => null,
					'status'  => 1031,
				);
			}
			else
			{
				$options       = array('debug' => 0);
				$args          = new stdClass;
				$args->cart    = $this->helper->cart->getCart($user->id);
				$args->methods = $this->helper->paymentMethod->getMethods('cart', true);

				$layout = $args->cart->count() ? 'com_sellacious.payment.forms' : 'com_sellacious.cart.aio.empty';
				$html   = JLayoutHelper::render($layout, $args, '', $options);

				$response = array(
					'message' => '',
					'data'    => $html,
					'status'  => 1,
				);
			}
		}
		catch (Exception $e)
		{
			$response = array(
				'message' => $e->getMessage(),
				'data'    => null,
				'status'  => 0,
			);
		}

		echo json_encode($response);

		$app->close();
	}

	/**
	 * Checkout cart and place order
	 *
	 * @return  bool
	 * @throws  Exception
	 */
	public function placeOrderAjax()
	{
		$app = JFactory::getApplication();

		try
		{
			if (!JSession::checkToken())
			{
				throw new Exception(JText::_('JINVALID_TOKEN'));
			}

			if (JFactory::getUser()->guest)
			{
				throw new Exception(JText::_($this->text_prefix . '_NOT_LOGGED_IN'));
			}

			$hash = $app->input->post->getString('hash');
			$cart = $this->helper->cart->getCart();

			if ($hash == '' || $hash != $cart->getHashCode())
			{
				throw new Exception(JText::_($this->text_prefix . '_HASH_MISMATCH'), 1041);
			}

			$orderId = $this->helper->cart->makeOrder();
			$order   = $this->helper->order->getItem($orderId);

			if (!$order->id)
			{
				throw new Exception(JText::_($this->text_prefix . '_PLACE_ORDER_FAILED'));
			}

			$cart->clear();
			$cart->store();

			$response = array(
				'message' => JText::_($this->text_prefix . '_PLACE_ORDER_SUCCESS'),
				'data'    => $order->id,
				'status'  => 1,
			);
		}
		catch (Exception $e)
		{
			$response = array(
				'message' => $e->getMessage(),
				'data'    => null,
				'status'  => $e->getCode(),
			);
		}

		echo json_encode($response);

		$app->close();
	}

	/**
	 * Get Cart content from helper.
	 *
	 * @return SellaciousCart
	 */
	public function getCartAjax()
	{
		$app = JFactory::getApplication();

		try
		{
			if (!JSession::checkToken())
			{
				throw new Exception(JText::_('JINVALID_TOKEN'));
			}

			$cart   = $this->helper->cart->getCart();
			$items  = $cart->getItems();
			$totals = $cart->getTotals(true);

			$g_currency = $cart->getCurrency('code_3');
			$c_currency = $this->helper->currency->current('code_3');

			$data = array();
			foreach ($items as $i => $item)
			{
				$p_code = $this->helper->product->getCode($item->get('id'), $item->get('variant_id'), $item->get('seller_uid'));
				$link   = JRoute::_('index.php?option=com_sellacious&view=product&p=' . $p_code);

				$obj            = new stdClass();
				$obj->title     = trim($item->get('title') . ' - ' . $item->get('variant_title'), '- ');
				$obj->link      = $link;
				$obj->quantity  = $item->get('quantity');
				$obj->total     = $this->helper->currency->display($item->get('sub_total'), $g_currency, $c_currency, true);

				$data[] = $obj;
			}

			$grandTotal = $this->helper->currency->display($totals->get('grand_total'), $g_currency, $c_currency, true);

			$response = array(
				'message' => '',
				'data'    => $data,
				'total'   => $grandTotal,
				'status'  => 1,
			);
		}
		catch (Exception $e)
		{
			$response = array(
				'message' => $e->getMessage(),
				'data'    => null,
				'status'  => 0,
			);
		}

		echo json_encode($response);

		$app->close();
	}

	/**
	 * Get redirect url taking care of all modifiers
	 *
	 * @return string
	 */
	protected function getRedirectURL()
	{
		$app = JFactory::getApplication();

		$return = $app->input->get('return', null, 'base64');

		if ($return)
		{
			$return = base64_decode($return);

			// Should we check for isInternal here?
			return $return;
		}

		$tmpl   = $app->input->get('tmpl', null);
		$layout = $app->input->get('layout', null);

		$tmpl   = !empty($tmpl) ? '&tmpl=' . $tmpl : '';
		$layout = !empty($layout) ? '&layout=' . $layout : '';

		return JRoute::_('index.php?option=com_sellacious&view=cart' . $tmpl . $layout, false);
	}

	/**
	 * Return to referrer url
	 *
	 * @return string URL to redirect
	 */
	protected function getReturnURL()
	{
		$app = JFactory::getApplication();

		$referrer = $app->input->server->getString('HTTP_REFERER');

		if (!JUri::isInternal($referrer))
		{
			$referrer = JRoute::_('index.php?option=com_sellacious&view=products', false);
		}

		return $referrer;
	}
}
