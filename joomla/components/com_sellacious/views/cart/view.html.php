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

use Joomla\Registry\Registry;

class SellaciousViewCart extends SellaciousView
{
	/** @var  Registry */
	protected $state;

	/** @var  SellaciousCart */
	protected $cart;

	protected $item;

	/** @var  JForm */
	protected $form;

	/** @var  array */
	protected $lists;

	/**
	 * @param string $tpl
	 *
	 * @return void
	 * @throws Exception
	 */
	public function display($tpl = null)
	{
		if (!$this->helper->config->get('allow_checkout'))
		{
			JLog::add(JText::_('COM_SELLACIOUS_CART_CHECKOUT_DISABLED_MESSAGE'), JLog::WARNING, 'jerror');

			$redirect = $this->helper->config->get('redirect', 'index.php');

			JFactory::getApplication()->redirect($redirect);

			return;
		}

		$this->state = $this->get('State');
		$this->cart  = $this->get('Cart');

		if (count($errors = $this->get('Errors')))
		{
			JLog::add(implode("\n", $errors), JLog::WARNING, 'jerror');

			return;
		}

		$layout = $this->getLayout();

		if (!in_array($layout, array('cancelled', 'complete', 'default')))
		{
			$this->setLayout($this->cart->count() == 0 ? 'empty' : 'aio');
		}

		$this->lists = $this->getLists();

		$doc = JFactory::getDocument();
		$doc->setTitle(JText::_('COM_SELLACIOUS_CART_TITLE'));

		parent::display($tpl);
	}

	/**
	 * Load lists to be used in layout
	 *
	 * @return array
	 */
	protected function getLists()
	{
		$lists  = array();

		return $lists;
	}
}
