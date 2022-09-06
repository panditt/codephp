<?php
/**
 * @version     1.4.4
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access.
defined('_JEXEC') or die;

use Joomla\Utilities\ArrayHelper;

/**
 * list controller class
 *
 * @since  GJ: v1
 */
class SellaciousControllerOrder extends SellaciousControllerBase
{
	/**
	 * The prefix to use with controller messages.
	 *
	 * @var  string
	 */
	protected $text_prefix = 'COM_SELLACIOUS_ORDER';

	/**
	 * Constructor.
	 *
	 * @param  array $config An optional associative array of configuration settings.
	 *
	 * @see    JController
	 * @since  3.0
	 */
	public function __construct(array $config)
	{
		parent::__construct($config);

		$this->registerTask('placeReturn', 'placeRequest');
		$this->registerTask('placeExchange', 'placeRequest');
	}

	/**
	 * Place a return or exchange request for an order item
	 *
	 * @return  bool
	 */
	public function placeRequest()
	{
		JSession::checkToken('request') or jexit(JText::_('JINVALID_TOKEN'));

		$app  = JFactory::getApplication();
		$data = $app->input->get('jform', array(), 'array');

		$this->setRedirect(JRoute::_('index.php?option=com_sellacious&view=orders&layout=tiles', false));

		if (empty($data['item_uid']) || empty($data['order_id']))
		{
			$this->setMessage(JText::_($this->text_prefix . '_NO_ORDER_ITEM_SELECTED'));

			return false;
		}

		try
		{
			if (strcasecmp($this->getTask(), 'placeReturn') == 0)
			{
				$data['status'] = $this->helper->order->getStatusId('return_placed', true, 'order.physical');

				$message = JText::_($this->text_prefix . '_ITEM_RETURN_PLACED_SUCCESS');
			}
			elseif (strcasecmp($this->getTask(), 'placeExchange') == 0)
			{
				$data['status'] = $this->helper->order->getStatusId('exchange_placed', true, 'order.physical');

				$message = JText::_($this->text_prefix . '_ITEM_EXCHANGE_PLACED_SUCCESS');
			}
			else
			{
				return false;
			}

			// todo: May be validate at some point, and access check
			$this->helper->order->setStatus($data);

			$this->setMessage($message);
		}
		catch (Exception $e)
		{
			$this->setMessage($e->getMessage(), 'error');

			return false;
		}

		return true;
	}

	/**
	 * Set payment info to an existing order
	 *
	 * @return  bool
	 *
	 * @throws  Exception
	 */
	public function setPaymentAjax()
	{
		$app = JFactory::getApplication();
		$me  = JFactory::getUser();

		try
		{
			if (!JSession::checkToken())
			{
				throw new Exception(JText::_('JINVALID_TOKEN'));
			}

			// Values are: [method_id, handler, [params]];
			$orderId  = $app->input->post->getInt('id');
			$formData = $app->input->post->get('jform', array(), 'array');

			// Validate order id selection first
			$order = $this->helper->order->getTable();
			$order->load($orderId);

			if (!$order->get('id'))
			{
				throw new Exception(JText::_($this->text_prefix . '_INVALID_ITEM'));
			}

			if ($order->get('customer_uid') != $me->id && !$this->helper->access->check('core.admin'))
			{
				throw new Exception(JText::_($this->text_prefix . '_NO_ACCESS'));
			}

			// For now we ignore "handler" from request as we can get it from method object
			if (empty($formData['method_id']))
			{
				throw new Exception(JText::_($this->text_prefix . '_PAYMENT_INFO_INVALID_METHOD'));
			}

			$form = $this->helper->paymentMethod->getForm($formData['method_id']);

			if (!($form instanceof JForm))
			{
				throw new Exception(JText::_($this->text_prefix . '_PAYMENT_INFO_INVALID_METHOD_FORM'));
			}

			if (!$form->validate($formData))
			{
				$messages = array();
				$errors   = $form->getErrors();

				foreach ($errors as $error)
				{
					$messages[] = $error instanceof Exception ? $error->getMessage() : $error;
				}

				throw new Exception(JText::sprintf($this->text_prefix . '_PAYMENT_INFO_INVALID_FORM_PARAMS', implode('<br>', $messages)));
			}

			$methodId = ArrayHelper::getValue($formData, 'method_id');
			$params   = ArrayHelper::getValue($formData, 'params', array() , 'array');

			// Set payment parameters
			$paymentId = $this->helper->payment->create('order', $order->get('id'), $methodId, $order->get('grand_total'), $order->get('currency'));

			// These URLs are for quick context identification only. Actual response cannot be faked as we check the payment response back here again.
			$token = JSession::getFormToken();

			$successLink = JRoute::_('index.php?option=com_sellacious&task=order.onPayment&status=success&payment_id=' . $paymentId, false);
			$failureLink = JRoute::_('index.php?option=com_sellacious&task=order.onPayment&status=failure&payment_id=' . $paymentId, false);
			$cancelLink  = JRoute::_('index.php?option=com_sellacious&task=order.onPayment&status=cancel&payment_id=' . $paymentId, false);

			$app->setUserState('com_sellacious.payment.execution.id', $paymentId);
			$app->setUserState('com_sellacious.payment.execution.params', $params);
			$app->setUserState('com_sellacious.payment.execution.success', $successLink . '&' . $token . '=1');
			$app->setUserState('com_sellacious.payment.execution.failure', $failureLink . '&' . $token . '=1');
			$app->setUserState('com_sellacious.payment.execution.cancel', $cancelLink . '&' . $token . '=1');

			$response = array(
				'message'  => '',
				'data'     => $order->get('id'),
				'redirect' => 'index.php?option=com_sellacious&task=payment.initialize&' . $token . '=1',
				'status'   => 1,
			);
		}
		catch (Exception $e)
		{
			$app->setUserState('com_sellacious.payment.execution', null);

			$response = array(
				'message'  => JText::sprintf($this->text_prefix . '_PAYMENT_CONFIGURATION_FAILED', $e->getMessage()),
				'data'     => null,
				'status'   => 0,
			);

			if (isset($orderId))
			{
				$response['redirect'] = JRoute::_('index.php?option=com_sellacious&view=order&id=' . $orderId, false);
			}
			else
			{
				$response['redirect'] = JRoute::_('index.php?option=com_sellacious&view=orders', false);
			}
		}

		echo json_encode($response);

		$app->close();
	}

	/**
	 * Post process the order payment. The order status will be updated and the user will be notified according to the payment status.
	 *
	 * @return  bool
	 * @throws  Exception
	 */
	public function onPayment()
	{
		JSession::checkToken('request') or jexit(JText::_('JINVALID_TOKEN'));

		$app        = JFactory::getApplication();
		$payment_id = $app->input->getInt('payment_id');
		// $state   = $app->input->getCmd('status');

		$payment  = $this->helper->payment->getItem($payment_id);
		$order_id = $payment->order_id;

		if ($payment->context != 'order' || !$order_id)
		{
			$this->setMessage(JText::_($this->text_prefix . '_INVALID_PAYMENT_RESPONSE'), 'warning');
			$this->setRedirect(JRoute::_('index.php?option=com_sellacious&view=orders', false));

			return false;
		}

		if ($payment->state == 2)
		{
			// Set payment Approved
			$this->helper->order->setStatusByType('order', 'approved', $order_id, '', true, true, 'Payment Approved');

			$this->setRedirect(JRoute::_('index.php?option=com_sellacious&view=order&id=' . $order_id . '&layout=complete', false));
		}
		elseif ($payment->state == 1)
		{
			// Set payment Approval pending
			$this->helper->order->setStatusByType('order', 'paid', $order_id, '', true, true, 'Payment Approval Pending');

			// Don't execute any transactions yet
			$this->setRedirect(JRoute::_('index.php?option=com_sellacious&view=order&id=' . $order_id . '&layout=complete', false));
		}
		elseif ($payment->state == 0)
		{
			// We leave the order status to "pending" status in case payment "failed" or was "aborted" by the customer.
			$this->setRedirect(JRoute::_('index.php?option=com_sellacious&view=order&id=' . $order_id . '&layout=cancelled', false));
		}
		elseif ($payment->state == -1)
		{
			// We leave the order status to "pending" status in case payment "failed" or was "aborted" by the customer.
			$this->setRedirect(JRoute::_('index.php?option=com_sellacious&view=order&id=' . $order_id . '&layout=failed', false));
		}

		try
		{
			// Call plugins
			$dispatcher = $this->helper->core->loadPlugins();
			$dispatcher->trigger('onAfterOrderPayment', array('com_sellacious.order', $payment));
		}
		catch (Exception $e)
		{
			$this->setMessage($e->getMessage(), 'warning');
		}

		return true;
	}
}
