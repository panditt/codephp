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

use Joomla\Utilities\ArrayHelper;

/**
 * Methods supporting a list of Product Categories.
 *
 */
class SellaciousModelCompare extends SellaciousModel
{
	/**
	 * Method to auto-populate the model state.
	 *
	 * This method should only be called once per instantiation and is designed
	 * to be called on the first call to the getState() method unless the model
	 * configuration flag to ignore the request is set.
	 *
	 * @return  void
	 *
	 * @note    Calling getState in this method will result in recursion.
	 * @since   12.2
	 */
	protected function populateState()
	{
		$app = JFactory::getApplication();
		$c   = $app->input->getString('c');

		$ids = $c ? explode(',', $c) : $app->getUserState('com_sellacious.compare.ids', array());

		$this->setState('compare.ids', $ids);
	}

	/**
	 * Load list of items selected for compare
	 *
	 * @return  stdClass[]
	 */
	public function getItems()
	{
		static $cache;

		if (empty($cache))
		{
			$codes = $this->getState('compare.ids');
			$valid = array();
			$items = array();

			if (is_array($codes))
			{
				foreach ($codes as $code)
				{
					if ($this->helper->product->parseCode($code, $product_id, $variant_id, $seller_uid))
					{
						try
						{
							$item                 = $this->helper->product->getProduct($product_id, $variant_id, $seller_uid);
							$item->specifications = $this->helper->product->getSpecifications($item->id, $item->variant_id, true);
							$item->shoprules      = $this->helper->shopRule->toProduct($item);
							$item->prices         = $this->helper->price->getPrices($item->id, $item->variant_id, $item->seller_uid, null);

							foreach ($item->prices as &$alt_price)
							{
								$alt_price->basic_price = $alt_price->sales_price;

								$this->helper->shopRule->toProduct($alt_price);
							}

							$this->helper->product->setReturnExchange($item);

							if (!empty($item->id))
							{
								$items[] = $item;
								$valid[] = $code;
							}
						}
						catch (Exception $e)
						{
						}
					}
					else
					{
						JLog::add(JText::sprintf('COM_SELLACIOUS_COMPARE_INVALID_PRODUCT_CODE', $code), JLog::INFO, 'jerror');
					}
				}

				// Update state coz it might contain invalid choices that have been omitted. State value is reusable later.
				$this->state->set('compare.ids', $valid);
			}

			$cache = $items;
		}

		return $cache;
	}

	/**
	 * Get all fields from the products added to comparison
	 *
	 * @return  array
	 */
	public function getAttributes()
	{
		$groups = array();
		$items  = $this->getItems();

		$specs = ArrayHelper::getColumn($items, 'specifications');
		$specs = array_reduce($specs, 'array_merge', array());
		$specs = ArrayHelper::arrayUnique($specs);
		$specs = array_values($specs);

		foreach ($specs as $field)
		{
			$field_id  = $field['id'];
			$parent_id = $field['parent_id'];

			if (isset($groups[$parent_id]))
			{
				$group = &$groups[$parent_id];
			}
			else
			{
				$group = new stdClass;

				$group->id     = $parent_id;
				$group->title  = $field['parent_title'];
				$group->fields = array();

				$groups[$parent_id] = &$group;
			}

			// If the current field is not already processed
			if (!isset($group->fields[$field_id]))
			{
				$group->fields[$field_id] = (object) $field;
			}

			// Reset reference
			unset($group);
		}

		return $groups;
	}
}
