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

/**
 * View to edit
 *
 * @property int counter
 */
class SellaciousViewOrder extends SellaciousView
{
	/** @var  JObject */
	protected $state;

	/** @var  Registry */
	protected $item;

	/**
	 * Display the view
	 *
	 * @param  string $tpl
	 *
	 * @return mixed
	 * @throws Exception
	 */
	public function display($tpl = null)
	{
		$this->state = $this->get('State');
		$this->item  = $this->get('Item');

		// Check for errors.
		if (count($errors = $this->get('Errors')))
		{
			JLog::add(implode("\n", $errors), JLog::WARNING, 'jerror');

			return false;
		}

		if (!$this->helper->order->isPaid($this->item->get('id')))
		{
			$this->setLayout('payment');
		}
		elseif ($this->_layout == 'payment')
		{
			$this->setLayout('default');
		}

		$doc = JFactory::getDocument();
		$doc->setTitle('Order - ' . $this->item->get('order_number'));

		return parent::display($tpl);
	}
}
