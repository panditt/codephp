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
 * View class for a Comparison.
 */
class SellaciousViewCompare extends SellaciousView
{
	/** @var  stdClass[] */
	protected $items;

	/** @var  JObject */
	protected $state;

	/** @var  stdClass[] */
	protected $groups;

	/**
	 * Display the view
	 *
	 * @param   string  $tpl
	 *
	 * @return  mixed
	 */
	public function display($tpl = null)
	{
		$me       = JFactory::getUser();
		$app      = JFactory::getApplication();
		$is_admin = $me->authorise('core.admin');

		if (!$this->helper->config->get('product_compare') && !$is_admin)
		{
			JLog::add(JText::_('COM_SELLACIOUS_PAGE_NOT_FOUND'), JLog::WARNING);

			$redirect = $this->helper->config->get('redirect', 'index.php');

			$app->redirect(JRoute::_($redirect, false));

			// This should not be needed.
			return false;
		}

		$this->state  = $this->get('State');
		$this->items  = $this->get('Items');
		$this->groups = $this->get('Attributes');

		// Check for errors.
		if (count($errors = $this->get('Errors')))
		{
			JLog::add(implode("\n", $errors), JLog::WARNING, 'jerror');

			return false;
		}

		return parent::display($tpl);
	}
}
