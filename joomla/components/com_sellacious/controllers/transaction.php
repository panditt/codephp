<?php
/**
 * @version     1.3.3
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access
defined('_JEXEC') or die;

/**
 * Transaction controller class copied from backend for the Wallet related function support in cart.
 */
class SellaciousControllerTransaction extends SellaciousControllerForm
{
	/**
	 * @var string
	 */
	protected $view_list = 'transactions';

	/**
	 * @var  string  The prefix to use with controller messages.
	 *
	 * @since  1.6
	 */
	protected $text_prefix = 'COM_SELLACIOUS_TRANSACTION';

	/**
	 * Get wallet balance of the selected user id via ajax
	 *
	 * @return  void
	 */
	public function getWalletBalanceAjax()
	{
		// fixme: Access check
		$app     = JFactory::getApplication();
		$user_id = $app->input->post->getInt('user_id');

		try
		{
			if (!$user_id)
			{
				throw new Exception(JText::_($this->text_prefix . '_NO_USER_SPECIFIED'));
			}

			$currency = $this->helper->currency->getGlobal('code_3');
			$balances = $this->helper->transaction->getBalance($user_id);

			$balances = array_filter($balances, function ($value)
			{
				return $value->amount > 0;
			});

			foreach ($balances as &$balance)
			{
				$balance->convert_currency = $currency;
				$balance->convert_amount   = $this->helper->currency->convert($balance->amount, $balance->currency, $currency);
				$balance->convert_display  = $this->helper->currency->display($balance->amount, $balance->currency, $currency);
			}

			$response = array(
				'state'   => 1,
				'message' => '',
				'data'    => array_values($balances),
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

		echo json_encode($response);

		$app->close();
	}

	/**
	 * Convert wallet balance in a selected currency of the selected seller uid to shop currency; via ajax
	 *
	 * @return  void
	 */
	public function convertBalanceAjax()
	{
		// fixme: access check
		$app      = JFactory::getApplication();
		$user_id  = $app->input->post->getInt('user_id');
		$currency = $app->input->post->getString('currency');

		try
		{
			if (!$user_id)
			{
				throw new Exception(JText::_($this->text_prefix . '_NO_USER_SPECIFIED'));
			}

			$balance = $this->helper->transaction->getBalance($user_id, $currency);

			if (!is_object($balance) || !isset($balance->amount) || $balance->amount <= 0)
			{
				throw new Exception(JText::_($this->text_prefix . '_INVALID_FOREX_PARAMS'));
			}

			// TODO: Allow conversion to other currencies also by parameter
			$g_currency = $this->helper->currency->getGlobal('code_3');
			$done       = $this->helper->transaction->doForex(round($balance->amount, 2), $balance->currency, $g_currency, 'user.id', $user_id);

			$response = array(
				'state'   => $done,
				'message' => JText::_($this->text_prefix . ($done ? '_FOREX_SUCCESS' : '_FOREX_FAILED')),
				'data'    => null,
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

		echo json_encode($response);

		$app->close();
	}
}
