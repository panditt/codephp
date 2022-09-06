<?php
/**
 * @version     1.3.4
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access.
defined('_JEXEC') or die;

/**
 * Methods supporting a list of Sellacious records.
 *
 * @since  3.0
 */
class SellaciousModelDownloads extends SellaciousModelList
{
	/**
	 * Build an SQL query to load the list data.
	 *
	 * @return  JDatabaseQuery
	 */
	protected function getListQuery()
	{
		$me    = JFactory::getUser();
		$db    = JFactory::getDbo();
		$query = $db->getQuery(true);

		$query->select($db->qn(array('a.id', 'a.order_id', 'a.item_uid')))
			->select($db->qn(array('license_id', 'mode', 'download_limit', 'expiry', 'preview_mode', 'preview_url')))
			->from($db->qn('#__sellacious_eproduct_delivery', 'a'))
			->where('a.state = 1');
		// Only 'download' delivery mode files should be listed.

		$query->select($db->qn('l.title', 'license_title'))
			->join('left', $db->qn('#__sellacious_licenses', 'l') . ' ON l.id = a.license_id');

		$query->select('o.order_number')
			->select($db->qn('o.created', 'order_date'))
			->join('inner', $db->qn('#__sellacious_orders', 'o') . ' ON o.id = a.order_id')
			->where($db->qn('o.customer_uid') . ' = ' . $db->q($me->id));

		$query->select($db->qn(array('oi.product_id', 'oi.product_title', 'oi.local_sku')))
			->select($db->qn(array('oi.manufacturer_sku', 'oi.manufacturer_id', 'oi.manufacturer_title')))
			->select($db->qn(array('oi.variant_id', 'oi.variant_title', 'oi.variant_sku')))
			->select($db->qn(array('oi.seller_uid', 'oi.seller_email', 'oi.seller_code', 'oi.seller_name', 'oi.seller_company')))
			->select($db->qn(array('oi.quantity')))
			->join('inner', $db->qn('#__sellacious_order_items', 'oi') . ' ON oi.order_id = a.order_id AND oi.item_uid = a.item_uid');

		$query->order('o.created DESC, o.id DESC');

		return $query;
	}

	/**
	 * Process list to add items in order
	 *
	 * @param   stdClass[]  $items
	 *
	 * @return  stdClass[]
	 */
	protected function processList($items)
	{
		foreach ($items as $delivery)
		{
			$download_limit  = (int) $delivery->download_limit;
			$delivery->items = $this->helper->product->getEProductMedia($delivery->product_id, $delivery->variant_id, $delivery->seller_uid);

			foreach ($delivery->items as $media)
			{
				if (isset($media->media->id) && $download_limit > 0)
				{
					$dl_count = array(
						'list.select' => 'SUM(a.dl_count) AS download_count',
						'list.from'   => '#__sellacious_eproduct_downloads',
						'delivery_id' => $delivery->id,
						'file_id'     => $media->media->id,
					);

					$count = $this->helper->order->loadResult($dl_count);

					$media->media->limit = $download_limit - (int) $count;
				}
			}
		}

		return $items;
	}
}
