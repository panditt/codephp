<?php
/**
 * @version     1.4.3
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access.
defined('_JEXEC') or die;

use Sellacious\Product;
use Sellacious\Seller;

/**
 * Sellacious product model
 */
class SellaciousModelProduct extends SellaciousModelItem
{
	/**
	 * Stock method to auto-populate the model state.
	 *
	 * @return  void
	 *
	 * @since   12.2
	 */
	protected function populateState()
	{
		$app   = JFactory::getApplication();
		$code  = $app->input->get('p');
		$valid = $this->helper->product->parseCode($code, $product_id, $variant_id, $seller_uid);

		if ($valid)
		{
			$app->input->set('id', $product_id);
			$app->input->set('variant_id', $variant_id);
			$app->input->set('seller_uid', $seller_uid);
		}

		parent::populateState();

		$multi_variant  = $this->helper->config->get('multi_variant', 0);
		$multi_seller   = $this->helper->config->get('multi_seller', 0);
		$default_seller = $this->helper->config->get('default_seller', -1);
		$default_seller = $default_seller ? $default_seller : -1;

		$variant_id = $app->input->getInt('variant_id', 0);
		$seller_uid = $app->input->getInt('seller_uid', 0);

		$this->state->set($this->name . '.variant_id', $multi_variant ? $variant_id : 0);
		$this->state->set($this->name . '.seller_uid', $multi_seller ? $seller_uid : (int) $default_seller);

		$product_id = $this->state->get($this->name . '.id');
		$variant_id = $this->state->get($this->name . '.variant_id');
		$seller_uid = $this->state->get($this->name . '.seller_uid');
		$code       = $this->helper->product->getCode($product_id, $variant_id, $seller_uid);

		$this->state->set($this->name . '.code', $code);
	}

	/**
	 * Return a product item
	 *
	 * @param   int  $pk  The id of the primary key.
	 *
	 * @return  stdClass
	 * @throws  Exception
	 */
	public function getItem($pk = null)
	{
		static $cache;

		$cache_key = md5(serialize($this->state));

		if (empty($cache[$cache_key]))
		{
			$product_id = $this->state->get($this->name . '.id', $pk);
			$variant_id = $this->state->get($this->name . '.variant_id');
			$seller_uid = $this->state->get($this->name . '.seller_uid');

			$product     = new Product($product_id, $variant_id);
			$seller_ids  = $product->getSellers();
			$variant_ids = $product->getVariants();

			if (count($seller_ids) == 0)
			{
				throw new Exception(JText::_('COM_SELLACIOUS_PRODUCT_NO_SELLER_SELLING'));
			}

			if ($seller_uid && !in_array($seller_uid, $seller_ids))
			{
				JLog::add(JText::_('COM_SELLACIOUS_PRODUCT_SPECIFIED_SELLER_NOT_SELLING_ITEM_SWITCHED'), JLog::NOTICE, 'jerror');

				$seller_uid = null;
			}

			if (!$seller_uid)
			{
				$seller_uid = $product->pickSeller();

				// We have selected a seller on logic update model state
				$this->state->set($this->name . '.seller_uid', $seller_uid);
				$this->state->set($this->name . '.code', $product->getCode($seller_uid));
			}

			$seller        = new Seller($seller_uid);
			$sellerProp    = $seller->getAttributes();
			$sellerAttribs = $product->getSellerAttributes($seller_uid);

			$product->bind($sellerProp, 'seller');
			$product->bind($sellerAttribs);

			$object = (object) $product->getAttributes();

			$object->code             = $product->getCode($seller_uid);
			$object->categories       = $product->getCategories(false);
			$object->specifications   = $product->getSpecifications(false);
			$object->images           = $product->getImages(true, true);
			$object->special_listings = $product->getSpecialListings($seller_uid);
			$object->seller_rating    = $this->helper->rating->getSellerRating($seller_uid);
			$object->rating           = $this->helper->rating->getProductRating($product_id);
			$object->sellers          = array();
			$object->variants         = array();

			if ($object->type == 'package')
			{
				$object->package_items = $this->helper->package->getProducts($product_id, true);
			}

			$this->helper->product->setReturnExchange($object);

			// Organize price attributes
			$me    = JFactory::getUser();
			$c_cat = $this->helper->client->loadResult(array('list.select' => 'category_id', 'user_id' => $me->id));

			foreach ($seller_ids as $seller_uid_k)
			{
				$seller_k        = new Seller($seller_uid_k);
				$sellerProp_k    = $seller_k->getAttributes();
				$sellerAttribs_k = $product->getSellerAttributes($seller_uid_k);

				// Temporary workaround
				$registry = new Joomla\Registry\Registry($sellerAttribs_k);
				$registry->set('seller', $sellerProp_k);
				$object_k = (object) $registry->flatten('_');
				unset($registry);

				// Product type and product code (not to be confused with seller_type, seller_code)
				$object_k->type = $object->type;
				$object_k->code = $product->getCode($seller_uid_k);
				// $seller_k->price  = $this->helper->price->get($product_id, $variant_id, $seller_k->seller_uid, null);
				$object_k->price         = $product->getPrice($seller_uid_k, 1, $c_cat);
				$object_k->shoprules     = $this->helper->shopRule->toProduct($object_k->price);
				$object_k->seller_rating = $this->helper->rating->getSellerRating($seller_uid_k);

				$this->helper->product->setReturnExchange($object_k, true);

				$object->sellers[] = $object_k;
			}

			foreach ($variant_ids as $v_id)
			{
				if ($variant_id == $v_id)
				{
					continue;
				}

				$vProduct = new Product($product_id, $v_id);

				$oVariant = (object) $vProduct->getAttributes();

				$oVariant->price  = $vProduct->getPrice(null, 1, $c_cat);
				$vSeller_uid      = $oVariant->price->seller_uid;

				$oVariant->code   = $vProduct->getCode($vSeller_uid);
				$oVariant->seller = $vProduct->getSellerAttributes($vSeller_uid);
				$oVariant->images = $vProduct->getImages(true, true);

				if ($oVariant->seller->stock_capacity > 0 && abs($oVariant->price->sales_price) >= 0.01)
				{
					$object->variants[] = $oVariant;
				}
			}

			$object->prices = $product->getPrices($seller_uid, null, $c_cat);
			$object->price  = (object) $product->getPrice($seller_uid, 1, $c_cat);

			// Todo: Following reference fields to be deprecated - better to create a Price class probably!!
			$object->price_id         = &$object->price->price_id;
			$object->cost_price       = &$object->price->cost_price;
			$object->margin           = &$object->price->margin;
			$object->margin_type      = &$object->price->margin_type;
			$object->list_price       = &$object->price->list_price;
			$object->calculated_price = &$object->price->calculated_price;
			$object->ovr_price        = &$object->price->ovr_price;
			$object->product_price    = &$object->price->product_price;
			$object->is_fallback      = &$object->price->is_fallback;
			$object->client_catid     = &$object->price->client_catid;
			$object->variant_price    = &$object->price->variant_price;
			$object->sales_price      = &$object->price->sales_price;
			$object->basic_price      = &$object->price->basic_price;
			$object->tax_amount       = &$object->price->tax_amount;
			$object->discount_amount  = &$object->price->discount_amount;

			$object->price->price_display = $object->price_display;

			$object->shoprules = $this->helper->shopRule->toProduct($object);

			foreach ($object->prices as &$alt_price)
			{
				$alt_price->basic_price = $alt_price->sales_price;

				$this->helper->shopRule->toProduct($alt_price);
			}

			$offers = array();
			$taxes  = array();

			foreach ($object->shoprules as $rule)
			{
				if ($rule->type == 'discount')
				{
					$offers[] = &$rule;
				}
				elseif ($rule->type == 'taxes')
				{
					$taxes[] = &$rule;
				}
			}

			$object->offers = $offers;
			$object->taxes  = $taxes;

			$cache[$cache_key] = $object;
		}

		return $cache[$cache_key];
	}

	/**
	 * Save the submitted query for the selected product item
	 *
	 * @param  array   $query
	 * @param  string  $code
	 *
	 * @return  int  Record id of the query
	 */
	public function saveQuery($query, $code)
	{
		// Todo: May be check (in controller) if query is permitted for this seller/product as of global config
		$this->helper->product->parseCode($code, $product_id, $variant_id, $seller_uid);

		$array = array(
			'query'      => $this->helper->productQuery->prepare($query),
			'product_id' => $product_id,
			'variant_id' => $variant_id,
			'seller_uid' => $seller_uid,
		);

		$table = $this->getTable('ProductQuery');
		$table->bind($array);
		$table->check();

		$dispatcher = $this->helper->core->loadPlugins('content');
		$dispatcher->trigger('onContentBeforeSave', array('com_sellacious.product.query', &$table, true));

		$table->store();

		$dispatcher->trigger('onContentAfterSave', array('com_sellacious.product.query', &$table, true));

		return $table->get('id');
	}

	/**
	 * Get the query form for the selected product/variant/seller
	 *
	 * @return  JForm|bool
	 */
	public function getQueryForm()
	{
		try
		{
			$product_id = (int) $this->getState($this->name . '.id');
			$seller_uid = (int) $this->getState($this->name . '.seller_uid');

			$field_ids = $this->getQueryFields($product_id, $seller_uid);
			$source    = $this->helper->field->createFormXml($field_ids, 'basic', 'query');

			if (empty($source))
			{
				$form = false;
			}
			else
			{
				$path = $this->helper->core->getAppPath(true) . '/components/com_sellacious/models/fields';
				JFormHelper::addFieldPath($path);

				$name    = strtolower($this->option . '.' . $this->name);
				$options = array('control' => 'jform', 'load_data' => true);
				$form    = JForm::getInstance($name, $source->asXML(), $options, false, false);
			}
		}
		catch (Exception $e)
		{
			JLog::add($e->getMessage(), JLog::WARNING, 'jerror');

			return false;
		}

		return $form;
	}

	/**
	 * Get list of fields in given categories including hierarchical parents
	 *
	 * @param   int  $product_id  Product Id
	 * @param   int  $seller_uid  Seller's User Id
	 *
	 * @return  int[]
	 */
	protected function getQueryFields($product_id, $seller_uid)
	{
		static $cache = array();

		if (empty($cache))
		{
			$seller = $this->helper->product->getSeller($product_id, $seller_uid);

			if (count($seller->query_form))
			{
				$cache = $this->helper->field->getListWithGroup($seller->query_form);
			}
		}

		return $cache;
	}
}
