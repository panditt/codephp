<?php
/**
 * @version     1.4.1
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
 *
 * @since  1.0
 */
class SellaciousModelCart extends SellaciousModel
{
	/**
	 * Populate state of the model
	 *
	 * @throws  Exception
	 */
	protected function populateState()
	{
		$app    = JFactory::getApplication();
		$userId = $app->input->get('user_id', null);

		$this->state->set('cart.user', $userId);

		parent::populateState();
	}

	/**
	 * Load the cart for the user
	 *
	 * @return  SellaciousCart
	 *
	 * @throws  Exception
	 */
	public function getCart()
	{
		/** @var int $user_id */
		$user_id = $this->getState('cart.user');

		$me   = JFactory::getUser();
		$user = JFactory::getUser($user_id);

		if ($me->id != $user->id && !$me->authorise('core.admin', 'com_sellacious'))
		{
			throw new Exception(JText::_('COM_SELLACIOUS_ACCESS_NOT_ALLOWED'), 403);
		}

		return $this->helper->cart->getCart($user->id);
	}
}
