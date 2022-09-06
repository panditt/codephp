<?php
/**
 * @version     1.4.2
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access
defined('_JEXEC') or die;

use Joomla\Registry\Registry;

class SellaciousViewAddresses extends SellaciousView
{
	/** @var  Registry */
	protected $state;

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
		$this->state = $this->get('State');

		parent::display($tpl);
	}
}
