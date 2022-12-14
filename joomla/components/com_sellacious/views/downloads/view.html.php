<?php
/**
 * @version     1.3.4
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access
defined('_JEXEC') or die;

/**
 * View class for a list of downloads.
 *
 * @since  3.0
 */
class SellaciousViewDownloads extends SellaciousView
{
	/**
	 * @var  stdClass[]
	 */
	protected $items;

	/**
	 * @var  JPagination
	 */
	protected $pagination;

	/**
	 * @var  JObject
	 */
	protected $state;

	/**
	 * Display the view
	 *
	 * @param   string  $tpl  Sub-layout to load
	 *
	 * @return  mixed
	 */
	public function display($tpl = null)
	{
		$this->helper->core->checkGuest();

		// Preserve state info
		$this->state      = $this->get('State');
		$this->items      = $this->get('Items');
		$this->pagination = $this->get('Pagination');

		// Check for errors.
		if (count($errors = $this->get('Errors')))
		{
			JLog::add(implode("\n", $errors), JLog::ERROR, 'jerror');

			return false;
		}

		return parent::display($tpl);
	}
}
