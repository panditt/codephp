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

/**
 * View class for a list of products by a seller.
 */
class SellaciousViewStore extends SellaciousView
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

	/** @var  stdClass */
	protected $seller;

	/**
	 * Display the view
	 *
	 * @param   string  $tpl
	 *
	 * @return  mixed
	 */
	public function display($tpl = null)
	{
		$this->state = $this->get('State');
		$storeId     = $this->state->get('store.id');

		if (!$storeId)
		{
			JLog::add(JText::_('COM_SELLACIOUS_STORE_SELECTED_INVALID_SHOWING_ALL_STORES_MESSAGE'), JLog::WARNING, 'jerror');

			$app = JFactory::getApplication();
			$app->redirect(JRoute::_('index.php?option=com_sellacious&view=products', false));
		}

		$this->items      = $this->get('Items');
		$this->pagination = $this->get('Pagination');
		$this->filters    = $this->get('Filters');

		$profile = $this->helper->profile->getItem(array('user_id' => $storeId));
		$seller  = $this->helper->seller->getItem(array('user_id' => $storeId));
		$rating  = $this->helper->rating->getSellerRating($storeId);

		$this->seller          = $seller;
		$this->seller->profile = $profile;
		$this->seller->rating  = $rating;

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
		$db    = JFactory::getDbo();
		$query = $db->getQuery(true);

		$query->select('pc.category_id')
			->from('#__sellacious_product_categories pc')
			->join('inner', '#__sellacious_product_sellers psx ON psx.product_id = pc.product_id')
			->where('psx.seller_uid = ' . (int) $this->state->get('store.id'));

		try
		{
			$selling = $db->setQuery($query)->loadColumn();
			$selling = $this->helper->category->getParents($selling, true);
		}
		catch (Exception $e)
		{
			$selling = array();
		}

		$cat_id   = $this->state->get('filter.category_id', 1);
		$category = $this->helper->category->getItem($cat_id);

		$filters = array(
			'list.select' => 'a.id',
			'list.where'  => array(
				'a.lft <= ' . $db->q($category->lft),
				'a.rgt >= ' . $db->q($category->rgt),
				'a.state = 1',
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
			'id'          => array_intersect(array_merge($children, $parents), $selling),
		);

		$this->categories = $this->helper->category->loadObjectList($filter);
	}
}
