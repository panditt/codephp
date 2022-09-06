<?php
/**
 * @version     1.4.4
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access.
defined('_JEXEC') or die;

use Joomla\Registry\Registry;
use Joomla\Utilities\ArrayHelper;

/**
 * Methods supporting a list of Products.
 */
class SellaciousModelProducts extends SellaciousModelList
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
				'title', 'a.title',
				'alias', 'a.alias',
				'state', 'a.state',
			);
		}

		parent::__construct($config);
	}

	/**
	 * Method to build the list query.
	 *
	 * @return  JDatabaseQuery  A JDatabaseQuery object
	 *
	 * @since   12.2
	 */
	protected function getListQuery()
	{
		// Get products/variants
		$query = $this->getItemsQuery();

		$seller_uids = $this->getShippingSellers();

		if (!$query || $seller_uids === false)
		{
			// Just a fallacy
			return $this->_db->getQuery(true)->select('id')->from('#__sellacious_products')->where('0');
		}

		// Add product prices, variant prices etc.
		$queryP = $this->getPriceQuery();

		if ($this->helper->config->get('listing_currency'))
		{
			$seller_currency = $this->_db->qn('pp.seller_currency');
		}
		else
		{
			$seller_currency = $this->_db->q($this->helper->currency->getGlobal('code_3'));
		}

		if ($this->helper->config->get('shipped_by') == 'seller')
		{
			$flat_shipping     = 'pp.flat_shipping';
			$shipping_flat_fee = 'pp.shipping_flat_fee';
		}
		else
		{
			$flat_shipping     = $this->_db->q($this->helper->config->get('flat_shipping'));
			$shipping_flat_fee = $this->_db->q($flat_shipping ? $this->helper->config->get('shipping_flat_fee') : '0');
		}

		$query->select('pp.price_id, pp.seller_uid, pp.qty_min, pp.qty_max, pp.is_fallback, pp.cost_price, pp.margin')
			->select('pp.margin_type, pp.list_price, pp.calculated_price, pp.ovr_price, pp.product_price, pp.price_display')
			->select('pp.client_catid, pp.listing_type, pp.item_condition')
			// ->select('pp.flat_shipping, pp.shipping_flat_fee')
			->select($flat_shipping . ' AS flat_shipping, ' . $shipping_flat_fee . ' AS shipping_flat_fee')
			->select('pp.shipping_country, pp.shipping_state, pp.shipping_district, pp.shipping_zip, pp.whats_in_box')
			->select('pp.return_days, pp.return_tnc, pp.exchange_days, pp.exchange_tnc, pp.seller_company, pp.seller_code')
			->select('pp.seller_name, seller_username, pp.seller_email, pp.seller_mobile')
			->select('pp.product_stock, pp.product_over_stock, pp.stock_reserved, pp.stock_sold')
			->select($seller_currency . ' AS seller_currency');

		if (is_array($seller_uids) && count($seller_uids))
		{
			// Sub query is required for picking best price
			$query->join('INNER', "($queryP) AS pp ON pp.product_id = a.id AND pp.seller_uid IN (" . implode(', ', $seller_uids) . ")");
		}
		else
		{
			// Sub query is required for picking best price
			$query->join('INNER', "($queryP) AS pp ON pp.product_id = a.id");
		}

		$currency = $this->helper->currency->current('code_3');

		if ($this->helper->config->get('listing_currency'))
		{
			$seller_currency = $this->_db->qn('pp.seller_currency');
		}
		else
		{
			$seller_currency = $this->_db->q($this->helper->currency->getGlobal('code_3'));
		}

		$query->select('fx.x_factor AS forex_rate')
			->join('LEFT', $this->_db->qn('#__sellacious_forex', 'fx') . ' ON fx.x_from = ' . $seller_currency . ' AND fx.state = 1 AND fx.x_to = ' . $this->_db->q($currency));

		// Add active listing information
		$queryL = $this->getListingQuery();

		// Sub query is required to get latest listing
		$query->join('INNER', "($queryL) AS pl ON a.id = pl.product_id AND pp.seller_uid = pl.seller_uid");

		$price_mod     = 'IFNULL(vs.price_mod, 0)';
		$mod_perc      = 'IFNULL(vs.price_mod_perc, 0)';
		$variant_price = "IF($mod_perc, pp.product_price * $price_mod / 100.0, $price_mod)";
		$stock         = 'IFNULL(vs.stock, IF(a.variant_id, 0, pp.product_stock))';
		$ov_stock      = 'IFNULL(vs.over_stock, IF(a.variant_id, 0, pp.product_over_stock))';

		$query->select("$price_mod AS price_mod");
		$query->select("$mod_perc AS price_mod_perc");
		$query->select("$variant_price AS variant_price");
		$query->select("$variant_price + pp.product_price AS sales_price");
		$query->select("$stock AS stock");
		$query->select("$ov_stock AS over_stock");
		$query->select("$stock + $ov_stock AS stock_capacity");

		$query->join('LEFT', $this->_db->qn('#__sellacious_variant_sellers', 'vs') . ' ON vs.variant_id = a.variant_id AND vs.seller_uid = pp.seller_uid');

		// Add special listing attributes
		$queryS = $this->getSpecialListingQuery();

		$query->select('spl.spl_listing_catid, spl.spl_listing_date, spl.spl_listing_params, spl.spl_listing_ordering')
			->join('LEFT', "($queryS) AS spl ON a.id = spl.product_id AND pp.seller_uid = spl.seller_uid")
			->order('spl.spl_listing_catid IS NULL, price_display, sales_price = 0, sales_price * fx.x_factor, stock_capacity DESC');

		$multi_seller     = $this->helper->config->get('multi_seller', 0);
		$multi_variant    = $this->helper->config->get('multi_variant', 0);
		$seller_separate  = $multi_seller == 2;
		$variant_separate = $multi_variant == 2;
		$default_seller   = $this->helper->config->get('default_seller', -1);

		$grouping = array('a.id');

		if ($multi_variant)
		{
			if ($variant_separate)
			{
				$query->select('null AS variant_count');
				$grouping[] = 'a.variant_id';
			}
			else
			{
				$query->select('a.variant_count');
			}
		}

		if (!$multi_seller)
		{
			$query->select('null AS seller_count')->where('pp.seller_uid = ' . (int) $default_seller);
			$grouping[] = 'pp.seller_uid';
		}
		elseif ($seller_separate)
		{
			$query->select('null AS seller_count');
			$grouping[] = 'pp.seller_uid';
		}
		else
		{
			$query->select('COUNT(DISTINCT pp.seller_uid) AS seller_count');
		}

		$query->group($grouping);

		$listQuery = $this->_db->getQuery(true);
		$listQuery->select('a.*')
			->from($query, 'a')
			->order('spl_listing_catid IS NULL, price_display, sales_price = 0, sales_price * forex_rate, stock_capacity DESC');

		// Show/hide out of stock items
		if ($this->helper->config->get('hide_out_of_stock'))
		{
			$listQuery->where('a.stock_capacity > 0');
		}

		return $listQuery;
	}

	/**
	 * Query for price and related attribute for a product-seller combo
	 *
	 * @return  string
	 */
	protected function getPriceQuery()
	{
		$him    = JFactory::getUser();
		$uid    = array('user_id' => $him->id);
		$cat_id = $this->helper->client->getFieldValue($uid, 'category_id');

		$price  = $this->_db->getQuery(true);
		$now    = JFactory::getDate()->toSql();
		$nullDt = $this->_db->getNullDate();
		$sdate  = '(pp.sdate <= ' . $this->_db->q($now) . ' OR pp.sdate = ' . $this->_db->q($nullDt) . ')';
		$edate  = '(pp.edate >= ' . $this->_db->q($now) . ' OR pp.edate = ' . $this->_db->q($nullDt) . ')';

		if ($this->helper->config->get('listing_currency'))
		{
			$seller_currency = $this->_db->qn('pp.seller_currency');
		}
		else
		{
			$seller_currency = $this->_db->q($this->helper->currency->getGlobal('code_3'));
		}

		if ($this->helper->config->get('shipped_by') == 'seller')
		{
			$flat_shipping     = 'pp.flat_shipping';
			$shipping_flat_fee = 'pp.shipping_flat_fee';
		}
		else
		{
			$flat_shipping     = $this->_db->q($this->helper->config->get('flat_shipping'));
			$shipping_flat_fee = $this->_db->q($flat_shipping ? $this->helper->config->get('shipping_flat_fee') : '0');
		}

		$price->select('pp.price_id, pp.product_id, pp.seller_uid, pp.qty_min, pp.qty_max, pp.cost_price')
			->select('pp.margin, pp.margin_type, pp.list_price, pp.calculated_price, pp.ovr_price, pp.is_fallback')
			->select('pp.product_price, pp.price_display, pp.listing_type, pp.item_condition')
			// ->select('pp.flat_shipping, pp.shipping_flat_fee')
			->select($flat_shipping . ' AS flat_shipping, ' . $shipping_flat_fee . ' AS shipping_flat_fee')
			->select('pp.shipping_country, pp.shipping_state, pp.shipping_district, pp.shipping_zip')
			->select('pp.whats_in_box, pp.return_days, pp.return_tnc, pp.exchange_days, pp.exchange_tnc')
			->select('pp.seller_company, pp.seller_code, pp.seller_name, pp.seller_username, pp.seller_email')
			->select('pp.client_catid, ' . $seller_currency . ' AS seller_currency, pp.seller_mobile')
			->from($this->_db->qn('#__sellacious_prices_cache', 'pp'))
			// Matched client_id OR (Not Defined = Fallback for ALL) OR (0 = ALL)
			->where('(pp.client_catid = ' . ((int) $cat_id) . ' OR pp.client_catid IS NULL OR pp.client_catid = 0)')
			->where("(pp.is_fallback = 1 OR ($sdate AND $edate))");

		if ($this->helper->config->get('hide_zero_priced'))
		{
			$price->where('(pp.product_price > 0 OR pp.price_display > 0)');
		}

		// Stock info needs to be precise, keep out of cache, PSX(+T) applied
		$price->select('psx.stock AS product_stock')
			->select('psx.over_stock AS product_over_stock')
			->select('psx.stock_reserved, psx.stock_sold')
			->select('psx.stock + psx.over_stock AS stock_capacity');

		$price->join('LEFT', $this->_db->qn('#__sellacious_product_sellers', 'psx') . ' ON psx.product_id = pp.product_id AND psx.seller_uid = pp.seller_uid');

		$price->order('pp.price_display ASC, pp.product_price = 0 ASC, pp.product_price ASC, pp.is_fallback ASC');

		return $price;
	}

	/**
	 * Query for active basic listing for products-sellers
	 *
	 * @return  string
	 */
	protected function getListingQuery()
	{
		$db     = $this->getDbo();
		$query  = $db->getQuery(true);
		$now    = JFactory::getDate()->toSql();
		$nullDt = $db->getNullDate();

		// List only items with a valid standard listing subscription
		$query->select('l.seller_uid, l.product_id')
			->from($db->qn('#__sellacious_seller_listing', 'l'))
			->where('l.category_id = 0')
			->where('l.publish_up != ' . $db->q($nullDt))
			->where('l.publish_down != ' . $db->q($nullDt))
			->where('l.publish_up < ' . $db->q($now))
			->where('l.publish_down > ' . $db->q($now))
			->where('l.state = 1')
			->group('l.seller_uid, l.product_id');

		return $query;
	}

	/**
	 * Query for products and variants
	 *
	 * @return  JDatabaseQuery
	 */
	protected function getItemsQuery()
	{
		$db    = $this->getDbo();
		$query = $db->getQuery(true);

		$query->select('a.id, a.title, a.type, a.local_sku, a.manufacturer_sku, a.manufacturer_id, a.features, a.introtext')
			->select('a.description, a.metakey, a.metadesc, a.ordering, a.tags, a.params')
			->select('a.variant_id, a.variant_title, a.variant_sku, a.variant_description, a.variant_features')
			->from($db->qn('#__sellacious_products_cache', 'a'));

		$where_filter  = array();
		$multi_variant = $this->helper->config->get('multi_variant', 0);

		list($pks_p, $pks_v) = $this->getFilteredIds('products');

		// Validate against filters
		if (!isset($pks_p))
		{
			// ALLOW all main products - don't use absolute TRUTH'Y here, we must only handle main products
			$where_filter[] = 'a.variant_id = 0';
		}
		elseif (is_array($pks_p) && count($pks_p) != 0)
		{
			$pids = implode(', ', $db->q(array_unique($pks_p)));

			$where_filter[] = "a.id IN ($pids) AND a.variant_id = 0";
		}
		else
		{
			// Suppress all main products, don't add a criteria to be OR'ed
		}

		if ($multi_variant)
		{
			list($vks_p, $vks_v) = $this->getFilteredIds('variants');

			if (!isset($vks_p))
			{
				// ALLOW any product if the below vv criteria matches
				$where_filter_vp = '1';
			}
			elseif (!is_array($vks_p) || count($vks_p) == 0)
			{
				// Suppress all variants, how??
				$where_filter_vp = '0';
			}
			else
			{
				$pids = implode(', ', $db->q(array_unique($vks_p)));

				$where_filter_vp = "a.id IN ($pids)";
			}

			if (!isset($vks_v))
			{
				// ALLOW all variants if the above vp criteria matches
				$where_filter_vv = '1';
			}
			elseif (!is_array($vks_v) || count($vks_v) == 0)
			{
				// Suppress all variants, how??
				$where_filter_vv = '0';
			}
			else
			{
				$vids = implode(', ', $db->q(array_unique($vks_v)));

				$where_filter_vv = "a.variant_id IN ($vids)";
			}

			// ALLOW all variants - don't use absolute TRUTH'Y here, we must only handle variants

			if ($where_filter_vp == '0' || $where_filter_vv == '0')
			{
				// We want to suppress all variants, don't add a criteria to be OR'ed
			}
			elseif ($where_filter_vp == '1' && $where_filter_vv == '1')
			{
				// We want to allow all variants irrespective of parent product
				$where_filter[] = 'a.variant_id != 0';
			}
			else
			{
				// If we want to depend on both or the other only (X AND 1 = X :: X AND Y = X AND Y) so just - AND - both criteria
				$where_filter[] = $where_filter_vp . ' AND ' . $where_filter_vv;
			}
		}
		else
		{
			$query->select('null AS variant_count')->where('a.variant_id = 0');
		}

		if (count($where_filter))
		{
			$query->where('((' . implode(")\nOR (", $where_filter) . '))');
		}
		else
		{
			// Mock a default FALSE'Y so as to allowing OR'ing allow suppress of all products/variants by filter.
			$query->where('0');
		}

		return $query;
	}

	/**
	 * Query for active special listing
	 *
	 * @return  mixed
	 */
	protected function getSpecialListingQuery()
	{
		$db     = $this->getDbo();
		$now    = JFactory::getDate()->toSql();
		$nullDt = $db->getNullDate();

		// Special category listing
		$queryS = $db->getQuery(true);
		$queryS->select('l.seller_uid, l.product_id')
			->select('l.category_id AS spl_listing_catid, l.subscription_date AS spl_listing_date')
			->from($db->qn('#__sellacious_seller_listing', 'l'))
			->where('l.category_id > 0')
			->where('l.publish_up != ' . $db->q($nullDt))
			->where('l.publish_down != ' . $db->q($nullDt))
			->where('l.publish_up < ' . $db->q($now))
			->where('l.publish_down > ' . $db->q($now))
			->where('l.state = 1');

		$queryS->select('c.params AS spl_listing_params, c.lft AS spl_listing_ordering')
			->join('INNER', $db->qn('#__sellacious_splcategories', 'c') . ' ON c.id = l.category_id')
			->where('c.state = 1')
			->group('l.seller_uid, l.product_id')
			->order('c.lft ASC');

		return $queryS;
	}

	/**
	 * Pre-process loaded list before returning if needed
	 *
	 * @param   stdClass[]  $items  List loaded from the listQuery
	 *
	 * @return  stdClass[]
	 */
	protected function processList($items)
	{
		foreach ($items as &$item)
		{
			$item->categories  = $this->helper->product->getCategories($item->id);
			$item->images      = $this->helper->product->getImages($item->id, $item->variant_id, true);
			$item->basic_price = $item->sales_price;
			$item->shoprules   = $this->helper->shopRule->toProduct($item);
			$item->code        = $this->helper->product->getCode($item->id, $item->variant_id, $item->seller_uid);

			$rating       = $this->helper->rating->getProductRating($item->id);
			$item->rating = $rating ? $rating->rating : 0;
		}

		return $items;
	}

	/**
	 * Get fully qualified filter list; i.e. all values, available values and selected values included
	 *
	 * @return   stdClass[]
	 */
	public function getFilters()
	{
		// We only have to get disable/enable choice for custom filters.
		$filters = $this->getCustomFilters();

		$db    = $this->_db;
		$query = $db->getQuery(true);
		$query->select('DISTINCT field_value')
			->from('#__sellacious_field_values');

		foreach ($filters as $key => $filter)
		{
			list($p_pks, $p_vks) = $this->getFilteredIds('products', "f$filter->id");
			list($v_pks, $v_vks) = $this->getFilteredIds('variants', "f$filter->id");

			// Filter for products
			$p_where   = array();
			$p_where[] = 'table_name = ' . $db->q('products');
			$p_where[] = 'field_id = ' . (int) $filter->id;

			if (isset($p_pks))
			{
				$p_where[] = count($p_pks) ? 'record_id IN (' . implode(', ', $db->q($p_pks)) . ')' : '0';
			}

			// Filter for variants
			if (isset($v_pks))
			{
				// Get variant ids from product ids
				$v_pid = count($v_pks) ? 'a.product_id IN (' . implode(', ', $db->q($v_pks)) . ')' : '0';
				$v_ids = $this->helper->variant->loadColumn(array('list.select' => 'a.id', 'list.where' => $v_pid));

				// Intersect with the in hand variant ids if any
				$v_vks = isset($v_vks) ? array_intersect($v_vks, $v_ids) : $v_ids;
			}

			$v_where   = array();
			$v_where[] = 'table_name = ' . $db->q('variants');
			$v_where[] = 'field_id = ' . (int) $filter->id;

			if (isset($v_vks))
			{
				$v_where[] = count($v_vks) ? 'record_id IN (' . implode(', ', $db->q($v_vks)) . ')' : '0';
			}

			// Build the query
			$subQueryP = $db->getQuery(true);
			$subQueryP->select('product_id')
				->from('#__sellacious_product_sellers')
				->where('state = 1')
				->where('stock + over_stock > 0');

			$subQueryV = $db->getQuery(true);
			$subQueryV->select('id')->from('#__sellacious_variants')
				->where('product_id IN (' . $subQueryP . ')');

			$query->clear('where')->where('((' . implode(' AND ', $p_where) . ') OR (' . implode(' AND ', $v_where) . '))');
			$query->where("((table_name = 'products' AND record_id IN (" . $subQueryP . ")) OR (table_name = 'variants' AND record_id IN (" . $subQueryV . ')))');

			$available = (array) $db->setQuery($query)->loadColumn();
			$available = array_map('json_decode', $available);

			$filter->available = array();

			foreach ($available as $av)
			{
				$av = (array) $av;

				foreach (array_filter($av, 'strlen') as $avv)
				{
					$filter->available[] = $avv;
				}
			}

			$filter->available = array_unique($filter->available);

			foreach ($filter->choices as $choice)
			{
				$choice->disabled = !in_array($choice->value, $filter->available);
				$choice->selected = !$choice->disabled && in_array($choice->value, $filter->selected);
			}

			$filter->choices = ArrayHelper::sortObjects($filter->choices, array('selected', 'disabled'), array(-1, 1));
		}

		return $filters;
	}

	/**
	 * Get a list of products/variants that matches user filter based on category / specifications etc.
	 *
	 * @param   string  $type     Whether to load 'variants' or 'products'
	 * @param   string  $exclude  Filter field id to skip while calculating intersection of filters
	 *
	 * @return  array
	 */
	protected function getFilteredIds($type, $exclude = null)
	{
		$filter_lists = $this->applyFilters();

		$pk_products  = null;
		$pk_variants  = null;

		// If we have any item in the filter criteria list which needs to be excluded, we just unset it here.
		if (isset($exclude) && isset($filter_lists[$exclude]))
		{
			unset($filter_lists[$exclude]);
		}

		$filters = ArrayHelper::getColumn($filter_lists, $type);
		$pids    = ArrayHelper::getColumn($filters, 'product_id');
		$vids    = ArrayHelper::getColumn($filters, 'variant_id');

		// ArrayHelper::getColumn already ignores null values, still checked here for just in case this behavior changes.
		$pids = array_filter($pids, 'is_array');
		$vids = array_filter($vids, 'is_array');

		foreach ($pids as $pid)
		{
			$pk_products = isset($pk_products) ? array_intersect($pk_products, $pid) : $pid;
		}

		foreach ($vids as $vid)
		{
			$pk_variants = isset($pk_variants) ? array_intersect($pk_variants, $vid) : $vid;
		}

		return array($pk_products, $pk_variants);
	}

	/**
	 * Apply each filter one by one individually without considering any of the others at the same time.
	 * This is supposed to also include basic filters as well as the custom (specifications) filters.
	 *
	 * @return  array
	 */
	protected function applyFilters()
	{
		static $filtered = null;

		if ($filtered instanceof Registry)
		{
			return $filtered->toArray();
		}

		$filtered = new Registry;

		// Apply each filter and generate items list separately for each of them.
		// Later we'll intersect those lists as needed.
		$p_ids = $this->categoryFilter();

		if (isset($p_ids))
		{
			$filtered->set("categories.products.product_id", $p_ids);
			$filtered->set("categories.products.variant_id", array(0));
			$filtered->set("categories.variants.product_id", $p_ids);
			$filtered->set("categories.variants.variant_id", null);
		}

		// Process main products for custom filters.
		$filtersA = $this->getCustomFilters();

		foreach ($filtersA as $field)
		{
			$p_ids = $this->specFilter($field, 'products');

			if (isset($p_ids))
			{
				$filtered->set("f$field->id.products.product_id", $p_ids);
				$filtered->set("f$field->id.products.variant_id", array(0));
			}
		}

		// Process product variants for custom filters.
		$multi_variant = $this->helper->config->get('multi_variant', 0);

		if ($multi_variant)
		{
			$filtersC = $this->getCustomFilters('core');
			$filtersV = $this->getCustomFilters('variant');

			foreach ($filtersC as $field)
			{
				$p_ids = $this->specFilter($field, 'products');

				if (isset($p_ids))
				{
					$filtered->set("f$field->id.variants.product_id", $p_ids);
					$filtered->set("f$field->id.variants.variant_id", null);
				}
			}

			foreach ($filtersV as $field)
			{
				$v_ids = $this->specFilter($field, 'variants');

				if (isset($v_ids))
				{
					$filtered->set("f$field->id.variants.product_id", null);
					$filtered->set("f$field->id.variants.variant_id", $v_ids);
				}
			}
		}

		return $filtered->toArray();
	}

	/**
	 * Get a list of product ids filtered by selected category and its all sub-categories
	 *
	 * @return  mixed
	 * @throws  Exception
	 */
	protected function categoryFilter()
	{
		$db     = $this->_db;
		$query  = $db->getQuery(true);
		$cat_id = $this->state->get('filter.category_id', 1);
		$cats   = $this->helper->category->getChildren($cat_id, true);
		$cats[] = 0;

		$query->select('a.product_id')
			->from($db->qn('#__sellacious_product_categories', 'a'))
			// Todo: Show only published categories
			// ->where('c.state = 1')
			->where('a.category_id IN (' . implode(',', $db->q($cats)) . ')');

		$p_ids = $db->setQuery($query)->loadColumn();

		return $p_ids;
	}

	/**
	 * Apply a single specification field
	 *
	 * @param   stdClass  $field
	 * @param   string    $table_name
	 *
	 * @return  array
	 */
	protected function specFilter($field, $table_name)
	{
		$values = null;

		if (count($field->selected))
		{
			$db    = $this->_db;
			$query = $db->getQuery(true);
			$where = array();

			// All stored values are json_encoded with string type elements in JSON
			foreach ($field->selected as $sel)
			{
				$value   = $db->q('%' . $db->escape(json_encode(strval($sel)), true) . '%', false);
				$where[] = 'field_value LIKE ' . $value;
			}

			$query->select('record_id')
				->from('#__sellacious_field_values')
				->where('table_name = ' . $db->q($table_name))
				->where('field_id = ' . (int) $field->id)
				->where('(' . implode(' OR ' , $where) . ')');

			$values = $db->setQuery($query)->loadColumn();
		}

		return $values;
	}

	/**
	 * Get the filter values for the products based on the selected category
	 *
	 * @param   mixed  $type  The field context in the category, 'core' or 'variant'
	 *
	 * @return  stdClass[]
	 */
	protected function getCustomFilters($type = array('core', 'variant'))
	{
		static $filters = array();

		$result = array();
		$cat_id = $this->state->get('filter.category_id', 1);
		$types  = array_intersect((array) $type, array('core', 'variant'));

		foreach ($types as $cType)
		{
			// Build data if not already built
			if (!isset($filters[$cType]))
			{
				$pks    = $this->helper->category->getFields($cat_id, $cType, true);
				$keys   = array('id' => $pks, 'filterable' => 1, 'state' => 1);
				$fields = $this->helper->field->loadObjectList($keys);

				if (count($fields))
				{
					$this->helper->field->getFilterChoices($fields, array('products', 'variants'));

					$values   = $this->state->get('filter.fields');
					$registry = new Registry($values);

					foreach ($fields as $fld)
					{
						$fld->selected = (array) $registry->get("f$fld->id");
					}
				}

				$filters[$cType] = $fields;
			}

			// Some fields may be set in both types. Keep them like a unique set.
			foreach ($filters[$cType] as $field)
			{
				if (!array_key_exists($field->id, $result))
				{
					$result[$field->id] = $field;
				}
			}
		}

		return $result;
	}

	/**
	 * Get a list of sellers who are capable of shipping to the selected zip code if any
	 *
	 * @return  array|bool  Seller UIDs if filtered to allow selectively. False = Not allowed, True = Allow
	 * @throws  Exception
	 */
	protected function getShippingSellers()
	{
		$zip = $this->getState('filter.zip');

		// Nothing to filter, allow all
		if (empty($zip))
		{
			return true;
		}

		$find_zip = array('list.select' => 'a.id', 'title' => $zip, 'type' => 'zip', 'state' => 1);
		$zip_id   = $this->helper->location->loadResult($find_zip);

		// ZIP code not recognised, meaning we can't ship
		if (!$zip_id)
		{
			return false;
		}

		/*
		 * Get all ancestor locations, we'll match them with the allowed locations
		 * Do not forget that a larger region set in configuration always allows it sub-regions
		 *
		 * Todo: Check whether this location is shippable or not
		 */
		$queried  = $this->helper->location->getAncestry($zip_id, 'A');
		$global   = $this->helper->location->getShipping();
		$filtered = empty($global) ? $queried : array_intersect((array) $global, (array) $queried);

		// No match with global, meaning we can't ship
		if (count($filtered) == 0)
		{
			return false;
		}

		$seller_preferable = $this->helper->config->get('shipped_by') == 'seller' && $this->helper->config->get('shippable_location_by_seller');

		// Seller cannot set preference, meaning allow all as global test already passed
		if (!$seller_preferable)
		{
			return true;
		}

		// Now get the list of sellers that allow as they can set preference.
		// Match with queried hierarchy list as it may contain wider scope than global.
		$query = $this->_db->getQuery(true);
		$query->select('DISTINCT seller_uid')->from('#__sellacious_seller_shippable')
			->where('(gl_id = 0 OR gl_id = ' . implode(' OR gl_id = ', $queried) . ')')
			->where('state = 1');

		$seller_uids = (array) $this->_db->setQuery($query)->loadColumn();

		if (count($seller_uids) == 0)
		{
			return false;
		}

		return $seller_uids;
	}
}
