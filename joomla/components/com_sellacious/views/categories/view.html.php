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

/**
 * View class for a list of categories.
 */
class SellaciousViewCategories extends SellaciousView
{
	public $activeFilters;

	public $filterForm;

	/** @var  stdClass[] */
	protected $items;

	/** @var  stdClass[] */
	protected $products;

	/** @var  JPagination */
	protected $pagination;

	/** @var  JObject */
	protected $state;

	protected $ordering;

	protected $types;

	protected $sidebar;

	/** @var  stdClass */
	protected $current;

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
		$this->products   = $this->getProducts();
		// $this->filterForm    = $this->get('FilterForm');
		// $this->activeFilters = $this->get('ActiveFilters');

		// Check for errors.
		if (count($errors = $this->get('Errors')))
		{
			JLog::add(implode("\n", $errors), JLog::WARNING, 'jerror');

			return false;
		}

		foreach ($this->items as &$item)
		{
			$this->ordering[$item->parent_id][] = $item->id;
		}

		$this->current = $this->getCurrent();
		$this->types   = $this->helper->category->getTypes(true);
		$this->sidebar = JHtmlSidebar::render();

		return parent::display($tpl);
	}

	/**
	 * Get current category which is selected as parent
	 *
	 * @return  stdClass
	 */
	protected function getCurrent()
	{
		$cat_id = $this->state->get('categories.id', 1);

		if ($cat_id <= 1)
		{
			return null;
		}

		$item = $this->helper->category->getItem($cat_id);

		if ($item->level > 0)
		{
			$children = $this->helper->category->getChildren($item->id, false, array('a.state = 1'));

			$item->subcat_count  = count($children);
			$item->product_count = $this->helper->category->countItems($item->id, false);
		}

		return $item;
	}

	/**
	 * Get a list of products to display
	 *
	 * @return  stdClass[]
	 */
	protected function getProducts()
	{
		$items = array();
		$limit = $this->helper->config->get('category_page_product_limit', 3);

		if ($limit > 0)
		{
			$cat_id = $this->state->get('categories.id', 1);

			/** @var  SellaciousModelProducts  $model */
			$model = JModelLegacy::getInstance('Products', 'SellaciousModel', array('ignore_request' => true));

			$model->setState('filter.category_id', $cat_id);
			$model->setState('list.limit', $limit);

			$items = $model->getItems();
		}

		return $items;
	}
}
