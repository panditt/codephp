<?php
/**
 * @version     1.3.3
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access.
defined('_JEXEC') or die;

/**
 * Methods supporting a list of PRODUCT Categories.
 */
class SellaciousModelCategories extends SellaciousModelList
{
	/**
	 * Constructor.
	 *
	 * @param  array  $config  An optional associative array of configuration settings.
	 *
	 * @see    JController
	 * @since  1.6
	 */
	public function __construct($config = array())
	{
		if (empty($config['filter_fields']))
		{
			$config['filter_fields'] = array(
				'id', 'a.id',
				'parent_id', 'a.parent_id',
				'title', 'a.title',
				'lft', 'a.lft',
				'rgt', 'a.rgt',
				'alias', 'a.alias',
				'state', 'a.state',
				'level', 'a.level',
				'path', 'a.path',
				'type', 'a.type',
				'is_default', 'a.is_default',
			);
		}

		parent::__construct($config);
	}

	/**
	 * Method to auto-populate the model state.
	 *
	 * This method should only be called once per instantiation and is designed
	 * to be called on the first call to the getState() method unless the model
	 * configuration flag to ignore the request is set.
	 *
	 * Note. Calling getState in this method will result in recursion.
	 *
	 * @param  string  $ordering   An optional ordering field.
	 * @param  string  $direction  An optional direction (asc|desc).
	 *
	 * @return  void
	 */
	protected function populateState($ordering = null, $direction = null)
	{
		parent::populateState($ordering, $direction);

		$this->state->set('list.start', 0);
		$this->state->set('list.limit', 0);

		$app = JFactory::getApplication();

		if ($parent_id = $app->input->get('parent_id'))
		{
			$this->state->set('categories.id', $parent_id);
		}

		$show_cat         = $this->helper->config->get('show_category_child_count', 1);
		$show_product     = $this->helper->config->get('show_category_product_count', 1);
		$show_description = $this->helper->config->get('show_category_description', 1);

		$this->state->set('show_cat', $show_cat);
		$this->state->set('show_product', $show_product);
		$this->state->set('show_description', $show_description);
	}

	/**
	 * Build an SQL query to load the list data.
	 *
	 * @return  JDatabaseQuery
	 */
	protected function getListQuery()
	{
		// Create a new query object.
		$db    = $this->getDbo();
		$query = $db->getQuery(true);

		$parent_id = (int) $this->getState('categories.id', 1);

		// Select the required fields from the table.
		$query->select($this->getState('list.select', 'a.*'))
			  ->from($db->qn('#__sellacious_categories', 'a'))
			  ->where('a.level > 0')
			  ->where('a.state = 1')
			  ->where('a.parent_id = ' . (int) $parent_id)
			  ->where('a.type LIKE ' . $db->q('product%', false))
			  ->select('COUNT(DISTINCT c2.id) AS level')
			  ->join('LEFT OUTER', $db->qn('#__sellacious_categories', 'c2') . ' ON a.lft > c2.lft AND a.rgt < c2.rgt')
			  ->group('a.id, a.lft, a.rgt, a.parent_id, a.title');

		$ordering = $this->state->get('list.fullordering', 'a.lft ASC');

		if ($ordering)
		{
			$query->order($db->escape($ordering));
		}

		return $query;
	}

	/**
	 * Pre-process loaded list before returning if needed
	 *
	 * @param   stdClass[]  $items
	 *
	 * @return  stdClass[]
	 */
	protected function processList($items)
	{
		if (is_array($items))
		{
			foreach ($items as $item)
			{
				$children = $this->helper->category->getChildren($item->id, false, array('a.state = 1'));

				$item->subcat_count  = $this->getState('show_cat') ? count($children) : null;
				$item->product_count = $this->getState('show_product') ? $this->helper->category->countItems($item->id, false) : null;
			}
		}

		return $items;
	}
}
