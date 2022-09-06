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

/**
 * Sellacious model.
 */
class SellaciousModelOrder extends SellaciousModelAdmin
{
	/**
	 * Abstract method for getting the form from the model.
	 *
	 * @param   array    $data      Data for the form.
	 * @param   boolean  $loadData  True if the form is to load its own data (default case), false if not.
	 *
	 * @return  mixed  A JForm object on success, false on failure
	 *
	 * @since   12.2
	 */
	public function getForm($data = array(), $loadData = true)
	{
		return false;
	}

	/**
	 * Method to return a single record. Joomla model doesn't use caching, we use.
	 *
	 * @param   int  $pk  (optional) The record id of desired item.
	 *
	 * @return  JObject
	 */
	public function getItem($pk = null)
	{
		$item = parent::getItem($pk);

		if ($item)
		{
			$order_id = $item->get('id');

			$item->set('items', $this->helper->order->getOrderItems($order_id));
			$item->set('status', $this->helper->order->getStatus($order_id));
			$item->set('coupon', $this->helper->order->getCoupon($order_id));

			$keys = array(
				'context'    => 'order',
				'order_id'   => $order_id,
				'list.where' => 'a.state > 0',
			);

			$item->set('payment', $this->helper->payment->loadObject($keys));
		}

		return $item;
	}
}
