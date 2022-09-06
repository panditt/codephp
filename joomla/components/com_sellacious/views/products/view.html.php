<?php
/**
 * @version     1.4.1
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access
defined('_JEXEC') or die;

/**
 * View class for a list of categories.
 */
class SellaciousViewProducts extends SellaciousView
{
	/** @var  array */
	public $activeFilters;

	/** @var  JForm */
	public $filterForm;

	/** @var  stdClass[] */
	protected $items;

	/** @var  stdClass[] */
	protected $categories;

	/** @var  stdClass[] */
	protected $filters;

	/** @var  JPagination */
	protected $pagination;

	/** @var  JObject */
	protected $state;

	/**
	 * Display the view
	 *
	 * @param   string  $tpl
	 *
	 * @return  mixed
	 */
	public function display($tpl = null)
	{
		$this->state      = $this->get('State');
		$this->items      = $this->get('Items');
		$this->pagination = $this->get('Pagination');
		$this->filters    = $this->get('Filters');

		$this->getCategories();

		// Check for errors.
		if (count($errors = $this->get('Errors')))
		{
			JLog::add(implode("\n", $errors), JLog::WARNING, 'jerror');

			return false;
		}

		return parent::display($tpl);
	}

	/**
	 * Get the Categories and subcategories for the filter bar
	 *
	 * @return  stdClass[]
	 */
	public function getCategories()
	{
		$db       = JFactory::getDbo();
		$cat_id   = $this->state->get('filter.category_id', 1);
		$category = $this->helper->category->getItem($cat_id);

		$filters = array(
			'list.select' => 'a.id',
			'list.where'  => array(
				'a.lft <= ' . $db->q($category->lft),
				'a.rgt >= ' . $db->q($category->rgt),
				'a.state = 1',
				// 'a.parent_id > 0',
				'a.type LIKE ' . $db->q('product%', false),
			),
			'list.order'  => 'a.lft',
		);
		$parents = $this->helper->category->loadColumn($filters);

		if (count($parents) <= 1 && reset($parents) > 1)
		{
			$parents[] = 1;
		}

		$filters  = array(
			'list.select' => 'a.id',
			'list.where'  => array(
				'a.parent_id = ' . (int) $cat_id,
				'a.state = 1',
				'a.type LIKE ' . $db->q('product%', false),
			),
			'list.order'  => 'a.lft',
		);
		$children = $this->helper->category->loadColumn($filters);

		$filter = array(
			'list.select' => 'a.id, a.title',
			'id'          => array_merge($children, $parents),
		);

		$this->categories = $this->helper->category->loadObjectList($filter);
	}
}
