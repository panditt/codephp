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

/** @var  stdClass        $displayData */
/** @var  SellaciousCart  $cart */
$cart  = $displayData->cart;

$helper     = SellaciousHelper::getInstance();
$g_currency = $helper->currency->getGlobal('code_3');
$c_currency = $helper->currency->current('code_3');

JHtml::_('behavior.framework');

$itemisedShip = $helper->config->get('itemised_shipping', true);

JFactory::getDocument()->addScriptDeclaration("
	jQuery(document).ready(function ($) {
		$('.hasSelect2').select2();
	});
");

$items  = $cart->getItems(true);
$totals = $cart->getTotals(true);

// Call coupons only after getTotals()
$coupon_code = $cart->get('coupon.code');
$coupon_msg  = $cart->get('coupon.message');
?>
	<table class="cart-items-table w100p">
		<tbody>
		<tr>
			<td colspan="4">
				<button type="button" class="btn btn-small btn-refresh hasTooltip pull-right" data-placement="left"
			            title="Refresh Items"><i class="fa fa-refresh"></i></button></td>
		</tr>
		<?php
		foreach ($items as $i => $item)
		{
			$p_code = $helper->product->getCode($item->get('id'), $item->get('variant_id'), $item->get('seller_uid'));
			$link   = JRoute::_('index.php?option=com_sellacious&view=product&p=' . $p_code);

			$ship_tbd  = $item->get('price.shipping.tbd');
			$ship_free = $item->get('price.shipping.free');
			$ship_amt  = $item->get('price.shipping.amount');

			$package_items = $item->get('package_items');
			$product_title = $item->get('title') . ' - ' . $item->get('variant_title');
			?>
			<tr>
				<td style="width: 42px">
					<img class="product-thumb" src="<?php
					echo $helper->product->getImage($item->get('id'), $item->get('variant_id')); ?>" alt="">
				</td>
				<td class="cart-item">
					<?php echo $package_items ? JText::_('COM_SELLACIOUS_CART_PACKAGE_ITEM_LABEL') : ''; ?>
					<a class="cart-item-title" href="<?php echo $link ?>" style="line-height: 1.6;"><?php echo trim($product_title, '- '); ?></a>
					<?php if ($package_items): ?>
						<div><small><?php echo JText::_('COM_SELLACIOUS_CART_PACKAGE_ITEM_INCLUDES'); ?></small></div>
						<ol class="package-items">
							<?php
							foreach ($package_items as $pkg_item):
								$url = JRoute::_('index.php?option=com_sellacious&view=product&p=' . $pkg_item->code);
								?><li>
									<a class="normal" href="<?php echo $url ?>">
										<?php echo $pkg_item->product_title ?>
										<?php echo $pkg_item->variant_title ?>
										(<?php echo $pkg_item->product_sku ?>-<?php echo $pkg_item->variant_sku ?>)</a>
								</li><?php
							endforeach;
							?>
						</ol>
					<?php endif; ?>
					<div>Sold by: <span><?php echo $item->get('seller_company'); ?></span></div>
					<ul class="cart-item-prices">
						<li>Rate: <strong><?php echo $helper->currency->display($item->get('price.basic_price'), $g_currency, $c_currency, true); ?></strong></li>
						<?php if ($item->get('price.tax_amount') >= 0.01): ?>
						<li>Tax: <strong><?php echo $helper->currency->display($item->get('price.tax_amount'), $g_currency, $c_currency, true); ?></strong></li>
						<?php endif; ?>
						<?php if ($item->get('price.discount_amount') >= 0.01): ?>
						<li>Discount: <strong><?php echo $helper->currency->display($item->get('price.discount_amount'), $g_currency, $c_currency, true); ?></strong></li>
						<?php endif; ?>
						<li>Price: <strong><?php echo $helper->currency->display($item->get('price.sales_price'), $g_currency, $c_currency, true); ?></strong></li>
					</ul>
					<div class="cart-item-ship-info text-left nowrap">
					<label><?php echo JText::_('COM_SELLACIOUS_CART_ITEM_SHIPRULE_SELECT_LABEL') ?>
					<?php
					if ($ship_free)
					{
						echo JText::_('COM_SELLACIOUS_ORDER_SHIPMENT_FREE');
					}
					elseif ($ship_tbd)
					{
						echo '<span class="tbd">TBD</span>';
					}
					else
					{
						echo $helper->currency->display($ship_amt, $g_currency, $c_currency, true);
					}
					?>
					</label>
					</div>
				</td>
				<td style="width: 30px;">
					<input type="text" class="input item-quantity"
					       data-uid="<?php echo $item->get('uid') ?>"
					       data-value="<?php echo $item->get('quantity') ?>"
					       value="<?php echo $item->get('quantity') ?>" min="1" max="999" title=""/>
				</td>
				<td class="text-center nowrap" style="width: 30px;">
					<a href="#" class="btn-remove-item hasTooltip" data-uid="<?php echo $item->get('uid') ?>"
					   title="Remove"><i class="fa fa-times-circle fa-lg"></i></a></td>
			</tr>
			<?php
		}
		?>
		</tbody>
		<tfoot>
		<tr>
			<td></td>
			<td class="text-right">
				<ul class="cart-prices">
					<li>Shipping: <strong><?php echo $helper->currency->display($totals->get('items.shipping'), $g_currency, $c_currency, true); ?></strong></li>
					<li>Price: <strong><?php echo $helper->currency->display($totals->get('items.sub_total'), $g_currency, $c_currency, true); ?></strong></li>
				</ul>
			</td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<td class="strong text-right">
				Estimated Total <small>(Cost + Shipping)</small><?php
				echo $totals->get('items.ship_tbd') ? '<span class="red">*</span>' : '' ?> :
			</td>
			<td class="strong text-right nowrap" colspan="2">
			<span id="cart-total" data-amount="<?php echo $totals->get('items.cart_total') ?>">
				<?php echo $helper->currency->display($totals->get('items.cart_total'), $g_currency, $c_currency, true); ?></span>
			</td>
		</tr>
		<?php $cart_rules = $totals->get('shoprules'); ?>
		<?php if (count($cart_rules)): ?>
		<?php if ($totals->get('tax_amount') >= 0.01): ?>
		<tr>
			<td></td>
			<td class="text-right">Other Taxes:</td>
			<td class="strong text-right nowrap" colspan="2">(+) <?php
				echo $helper->currency->display($totals->get('tax_amount'), $g_currency, $c_currency, true); ?></td>
		</tr>
		<?php endif; ?>
		<?php if ($totals->get('discount_amount') >= 0.01): ?>
		<tr>
			<td></td>
			<td class="text-right">Other Discounts: </td>
			<td class="strong text-right nowrap" colspan="2"> (–) <?php
				echo $helper->currency->display($totals->get('discount_amount'), $g_currency, $c_currency, true); ?></td>
		</tr>
		<?php endif; ?>
		<?php endif; ?>
		<?php if ($coupon_code): ?>
			<tr>
				<td></td>
				<td class="text-right">
					<span class="pull-left coupon-message"><?php
							echo JText::sprintf('COM_SELLACIOUS_CART_COUPON_DISCOUNT_MESSAGE', $coupon_code) ?></span>
				</td>
				<td class="strong text-right nowrap" colspan="2">
					<span>(–) <?php echo $helper->currency->display($totals->get('coupon_discount'), $g_currency, $c_currency, true); ?></span>
				</td>
			</tr>
		<?php elseif ($coupon_msg): ?>
			<tr>
				<td colspan="4" class="text-right">
					<span class="pull-left coupon-message"><?php echo $coupon_msg ?></span>
				</td>
			</tr>
		<?php endif; ?>
		<tr>
			<td colspan="4" class="v-top text-right">
				<?php $url = JRoute::_('index.php?option=com_sellacious&view=cart'); ?>
				<div class="pull-right"><?php echo JText::_('COM_SELLACIOUS_CART_GRAND_TOTAL_LABEL') ?>
					<?php echo $totals->get('items.ship_tbd') ? '<span class="red"> *</span>' : '' ?>:
					<span class="grand-total strong nowrap" data-amount="<?php echo $totals->get('grand_total') ?>">
				<?php echo $helper->currency->display($totals->get('grand_total'), $g_currency, $c_currency, true); ?></span></div>

				<a href="<?php echo JRoute::_('index.php?option=com_sellacious&view=cart&layout=aio') ?>">
					<button type="button" class="btn btn-primary btn-lg pull-left margin-5">
						<i class="fa fa-shopping-cart"></i>
						<?php echo JText::_('COM_SELLACIOUS_CART_CHECKOUT') ?></button>
				</a>

				<button type="button" class="btn-clear-cart btn btn-warning btn-lg pull-left margin-5"><?php
					echo JText::_('COM_SELLACIOUS_CART_BTN_CLEAR_CART_LABEL') ?></button>

				<?php if ($helper->config->get('cart_shop_more_link')): ?>
				<a class="btn btn-lg pull-left btn-close btn-success margin-5" data-dismiss="modal"
				   href="<?php echo $helper->config->get('shop_more_redirect', JRoute::_('index.php')) ?>"
				   onclick="if (jQuery(this).closest('.modal').length) return false;"><?php
						echo JText::_('COM_SELLACIOUS_CART_BTN_CLOSE_CART_LABEL') ?> <i class="fa fa-chevron-right"></i> </a>
				<?php endif; ?>
			</td>
		</tr>
		<?php if ($totals->get('items.ship_tbd')): ?>
			<tr>
				<td colspan="4">
					<div class="star-note star-1"><?php echo JText::_('COM_SELLACIOUS_CART_SHIPMENT_STATUS_TBD_DISCLAIMER') ?></div>
				</td>
			</tr>
		<?php endif; ?>
		</tfoot>
	</table>


