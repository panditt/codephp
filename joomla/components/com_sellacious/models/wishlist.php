<?php
/**
 * @version     1.4.0
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access.
defined('_JEXEC') or die;

/**
 * Methods supporting a list of Products.
 */
class SellaciousModelWishlist extends SellaciousModelList
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
	 * Method to auto-populate the model state.
	 *
	 * This method should only be called once per instantiation and is designed
	 * to be called on the first call to the getState() method unless the model
	 * configuration flag to ignore the request is set.
	 *
	 * Note. Calling getState in this method will result in recursion.
	 *
	 * @param   string $ordering  An optional ordering field.
	 * @param   string $direction An optional direction (asc|desc).
	 *
	 * @return  void
	 *
	 * @since   12.2
	 */
	protected function populateState($ordering = null, $direction = null)
	{
		parent::populateState($ordering, $direction);

		$app  = JFactory::getApplication();
		$uid  = $app->input->get('user_id', null);
		$user = JFactory::getUser($uid);

		$this->state->set('wishlist.user_id', $user->id);
	}

	protected function getListQuery()
	{
		$db       = $this->getDbo();
		$query    = $db->getQuery(true);
		$currency = $this->helper->currency->current('code_3');

		// Include main products.
		$query->select('a.id, a.title, a.type, a.local_sku, a.manufacturer_sku, a.manufacturer_id, a.features')
			->select('a.introtext, a.description, a.metakey, a.metadesc, a.state, a.ordering, a.tags, a.params')
			->from($db->qn('#__sellacious_products', 'a'))
			->where('a.state = 1');

		$query->select('0 AS variant_id')
			->select($db->q('') . ' AS variant_title')
			->select($db->q('') . ' AS variant_sku')
			->select($db->q('') . ' AS variant_description')
			->select($db->q('') . ' AS variant_features');

		if ($multi_variant = $this->helper->config->get('multi_variant', 0))
		{
			$queryV = $db->getQuery(true);

			// Include all variants, except main product (use INNER JOIN)
			$queryV->select('a.id, a.title, a.type, a.local_sku, a.manufacturer_sku, a.manufacturer_id, a.features')
				->select('a.introtext, a.description, a.metakey, a.metadesc, a.state, a.ordering, a.tags, a.params')
				->from($db->qn('#__sellacious_products', 'a'))
				->where('a.state = 1');

			$queryV->select('v.id AS variant_id')
				->select('v.title AS variant_title')
				->select('v.local_sku AS variant_sku')
				->select('v.description AS variant_description')
				->select('v.features AS variant_features')
				->join('INNER', '#__sellacious_variants AS v ON v.product_id = a.id')
				->where('v.state = 1');

			$queryP = (string) $query;

			$query->clear()->select('a.*')->from("($queryP UNION ALL $queryV) AS a");
		}

		// $query->select('w.seller_uid')
		$query->join('INNER', '#__sellacious_wishlist AS w ON w.product_id = a.id' . ($multi_variant ? ' AND w.variant_id = a.variant_id' : ' AND w.variant_id = 0'))
		// $query->join('INNER', '#__sellacious_wishlist AS w ON w.product_id = a.id AND w.variant_id = a.variant_id')
			->where('w.user_id = ' . (int) $this->state->get('wishlist.user_id'));

		$pQuery = $this->priceQuery();
		// $pQuery->group('product_id, seller_uid');
		$pQuery->group('product_id');

		$query->select('pq.*')
		//	->join('LEFT', "($pQuery) AS pq ON pq.product_id = a.id AND pq.seller_uid = w.seller_uid");
			->join('LEFT', "($pQuery) AS pq ON pq.product_id = a.id");

		// Variant stock and prices
		$price_mod     = 'IFNULL(vs.price_mod, 0)';
		$mod_perc      = 'IFNULL(vs.price_mod_perc, 0)';
		$variant_price = "IF($mod_perc, pq.product_price * $price_mod / 100.0, $price_mod)";
		$stock         = 'IFNULL(vs.stock, IF(vs.variant_id, 0, pq.stock))';
		$ov_stock      = 'IFNULL(vs.over_stock, IF(vs.variant_id, 0, pq.over_stock))';

		$query->select("$price_mod AS price_mod");
		$query->select("$mod_perc AS price_mod_perc");
		$query->select("$variant_price AS variant_price");
		$query->select("$variant_price + pq.product_price AS sales_price");
		$query->select("$stock AS stock");
		$query->select("$ov_stock AS over_stock");
		$query->select("$stock + $ov_stock AS stock_capacity");

		$query->select('vs.variant_id')
			->join('LEFT', $db->qn('#__sellacious_variant_sellers', 'vs') . ' ON vs.seller_uid = pq.seller_uid' . ($multi_variant ? ' AND vs.variant_id = a.variant_id' : ' AND vs.variant_id = 0'));

		$query->order('pq.price_display ASC, sales_price = 0 ASC, sales_price ASC, pq.is_fallback ASC');

		// Add seller information
		$query->select('u.email AS seller_email')
			->join('LEFT', $db->qn('#__users', 'u') . ' ON u.id = pq.seller_uid');

		if ($this->helper->config->get('listing_currency'))
		{
			$seller_currency = $this->_db->qn('su.currency');
		}
		else
		{
			$seller_currency = $this->_db->q($this->helper->currency->getGlobal('code_3'));
		}

		$query->select($seller_currency . ' AS seller_currency, su.mobile AS seller_mobile')
			->join('LEFT', $db->qn('#__sellacious_profiles', 'su') . ' ON su.user_id = pq.seller_uid');

		// Add forex
		$query->select('fx.x_factor AS forex_rate')
			->join('LEFT', '#__sellacious_forex AS fx ON fx.x_from = ' . $seller_currency . ' AND fx.x_to = ' . $db->q($currency));

		return $query;
	}

	/**
	 * Extended properties to the main query
	 *
	 * @return  JDatabaseQuery
	 */
	protected function priceQuery()
	{
		$db      = $this->getDbo();
		$pQuery  = $db->getQuery(true);
		$now     = JFactory::getDate()->toSql();
		$nullDt  = $db->getNullDate();
		$qNow    = $db->q($now);
		$qNullDt = $db->q($nullDt);
		$him     = JFactory::getUser();
		$cat_id  = (int) $this->helper->client->getFieldValue(array('user_id' => $him->id), 'category_id');

		$sdate = "(pp.sdate <= $qNow OR pp.sdate = $qNullDt)";
		$edate = "(pp.edate >= $qNow OR pp.edate = $qNullDt)";

		// Add price and stock info
		$pQuery->select('pp.product_id, pp.seller_uid, pp.id AS price_id, pp.cost_price, pp.margin, pp.margin_type')
			->select('pp.list_price, pp.calculated_price, pp.ovr_price, pp.is_fallback')
			->from($db->qn('#__sellacious_product_prices', 'pp'))
			->where("(($sdate AND $edate) OR pp.is_fallback = 1)")
			->where("pp.state = 1");

		// PSX(+T) applied
		$pQuery->select('IF(psx.price_display = 0, pp.product_price, 0) AS product_price')
			->select('psx.price_display, psx.stock, psx.over_stock')
			->join('LEFT', $db->qn('#__sellacious_product_sellers', 'psx') . ' ON psx.product_id = pp.product_id AND psx.seller_uid = pp.seller_uid')
			->where('(pp.product_price > 0 OR psx.price_display > 0)')
			->where('psx.state = 1');

		// Add customer category filter (IS NULL check makes up for fallback prices)
		$pQuery->select('pcx.cat_id AS client_catid')
			->join('LEFT', $db->qn('#__sellacious_productprices_clientcategory_xref', 'pcx') . ' ON pcx.product_price_id = pp.id AND (pcx.cat_id = ' . $cat_id . ' OR pcx.cat_id IS NULL)');

		// List only items with a valid standard listing subscription
		$pQuery->join('INNER', $db->qn('#__sellacious_seller_listing', 'l') . ' ON l.product_id = pp.product_id AND l.seller_uid = pp.seller_uid')
			->where('l.category_id = 0')
			->where('l.publish_up != ' . $qNullDt)
			->where('l.publish_down != ' . $qNullDt)
			->where('l.publish_up < ' . $qNow)
			->where('l.publish_down > ' . $qNow)
			->where('l.state = 1');

		$pQuery->order('psx.price_display ASC, pp.is_fallback ASC, pp.product_price ASC');

		return $pQuery;
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
		foreach ($items as &$item)
		{
			$item->images      = $this->helper->product->getImages($item->id, $item->variant_id, true);
			$item->basic_price = $item->sales_price;
			$item->shoprules   = $this->helper->shopRule->toProduct($item);
			$item->code        = $this->helper->product->getCode($item->id, $item->variant_id, $item->seller_uid);

			// Todo: get ratings
			$rating       = $this->helper->rating->getProductRating($item->id);
			$item->rating = $rating ? $rating->rating : 0;
		}

		return $items;
	}
}
