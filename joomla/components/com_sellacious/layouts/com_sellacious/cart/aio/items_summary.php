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

/** @var stdClass $displayData */
/** @var SellaciousCart $cart */
$cart       = $displayData->cart;
$helper     = SellaciousHelper::getInstance();
$g_currency = $helper->currency->getGlobal('code_3');
$c_currency = $helper->currency->current('code_3');

JHtml::_('behavior.framework');

$itemisedShip = $helper->config->get('itemised_shipping', true);
?>
<a class="btn btn-small pull-right btn-refresh btn-default margin-5"><?php
	echo JText::_('COM_SELLACIOUS_CART_BTN_REFRESH_CART_LABEL') ?> <i class="fa fa-refresh"></i> </a>
<div class="clearfix"></div>
<table class="cart-items-table w100p">
	<thead>
	<tr>
		<th width="25" class="text-center"> </th>
		<th>Item </th>
		<th width="50" class="text-center">Quantity </th>
		<?php if ($itemisedShip): ?>
		<th width="70" class="text-center">Shipping </th>
		<?php endif; ?>
		<th width="70" class="text-center">Rate     </th>
		<th width="60" class="text-center">Tax      </th>
		<th width="60" class="text-center">Discount </th>
		<th width="70" class="text-center">Price    </th>
	</tr>
	</thead>
	<tbody>
	<?php
	$items  = $cart->getItems(true);
	$totals = $cart->getTotals(true);

	// Call coupons only after getTotals()
	$coupon_code = $cart->get('coupon.code');
	$coupon_msg  = $cart->get('coupon.message');

	foreach ($items as $i => $item)
	{
		$p_code = $helper->product->getCode($item->get('id'), $item->get('variant_id'), $item->get('seller_uid'));
		$link   = JRoute::_('index.php?option=com_sellacious&view=product&p=' . $p_code);

		$ship_tbd      = $item->get('price.shipping.tbd');
		$ship_free     = $item->get('price.shipping.free');
		$ship_amt      = $item->get('price.shipping.amount');
		$shoprules     = $item->get('shoprules');
		$package_items = $item->get('package_items');
		$product_title = trim($item->get('title') . ' - ' . $item->get('variant_title'), '- ');
		?>
		<tr>
			<td style="width: 42px">
				<img class="product-thumb" src="<?php
				echo $helper->product->getImage($item->get('id'), $item->get('variant_id')); ?>" alt="">
			</td>
			<td class="cart-item"><?php echo $package_items ? JText::_('COM_SELLACIOUS_CART_PACKAGE_ITEM_LABEL') : ''; ?>
				<a href="<?php echo $link ?>" style="line-height: 1.4;"><?php echo $product_title; ?></a>
				<?php if (count($shoprules)): ?>
					<a href="#" class="pull-right shoprule-info-toggle hasTooltip"
						title="<?php echo JText::_('COM_SELLACIOUS_CART_ITEM_SHOPRULE_INFO_TIP') ?>"
						data-uid="<?php echo $item->get('uid') ?>"><i class="fa fa-plus-square-o"></i> </a>
				<?php endif; ?>

				<?php if ($package_items): ?>
					<hr class="simple">
					<ol class="package-items">
					<?php
					foreach ($package_items as $pkg_item):
						$pkg_item_title = trim($pkg_item->product_title . ' - ' . $pkg_item->variant_title, '- ');
						$pkg_item_sku   = trim($pkg_item->product_sku . '-' . $pkg_item->variant_sku, '- ');
						$url = JRoute::_('index.php?option=com_sellacious&view=product&p=' . $pkg_item->code);
						?><li><a class="normal" href="<?php echo $url ?>"><?php echo $pkg_item_title ?> (<?php echo $pkg_item_sku ?>)</a></li><?php
					endforeach;
					?>
					</ol>
				<?php endif; ?>
				<br><em><small>Sold by:</small></em> <?php echo $item->get('seller_company'); ?>
			</td>
			<td class="text-center"><?php echo $item->get('quantity') ?></td>

			<?php if ($itemisedShip): ?>
			<td class="<?php echo $ship_tbd ? 'text-center tbd' : 'text-right' ?> nowrap">
				<?php
				if ($ship_free)
				{
					echo JText::_('COM_SELLACIOUS_ORDER_SHIPMENT_FREE');
				}
				elseif ($ship_tbd)
				{
					echo 'TBD';
				}
				else
				{
					echo $helper->currency->display($ship_amt, $g_currency, $c_currency, true);
				}
				?>
			</td>
			<?php endif; ?>

			<td class="text-right nowrap"><?php echo $helper->currency->display($item->get('price.basic_price'), $g_currency, $c_currency, true); ?></td>
			<td class="text-right nowrap"><?php echo $helper->currency->display($item->get('price.tax_amount'), $g_currency, $c_currency, true); ?></td>
			<td class="text-right nowrap"><?php echo $helper->currency->display($item->get('price.discount_amount'), $g_currency, $c_currency, true); ?></td>
			<td class="text-right nowrap"><?php echo $helper->currency->display($item->get('sub_total'), $g_currency, $c_currency, true); ?></td>
		</tr>
		<?php
		if (count($shoprules))
		{
			?>
			<tr class="shoprule-info <?php echo $item->get('uid') ?>-info hidden">
				<th></th>
				<th class="text-left" colspan="<?php echo $itemisedShip ? '3' : '2' ?>">Description</th>
				<th class="nowrap">Rate    </th>
				<th class="nowrap">Base    </th>
				<th class="nowrap">Change  </th>
				<th class="nowrap">Changed </th>
			</tr>
			<?php
			foreach ($shoprules as $ri => $rule)
			{
				if (abs($rule->change) >= 0.01)
				{
					?>
					<tr class="shoprule-info <?php echo $item->get('uid') ?>-info hidden">
						<th></th>
						<td colspan="<?php echo $itemisedShip ? '3' : '2' ?>">
							<?php echo str_repeat('|&mdash;', $rule->level - 1) ?>
							<?php echo $this->escape($rule->title) ?>
						</td>
						<td class="text-right nowrap">
							<?php echo $rule->percent ? sprintf('%s%%', number_format($rule->amount, 2)) :
								$helper->currency->display($rule->amount, $g_currency, $c_currency, true); ?>
						</td>
						<td class="text-right nowrap">
							<?php echo $helper->currency->display($rule->input, $g_currency, $c_currency, true) ?>
						</td>
						<td class="text-right nowrap">
							<?php echo $rule->change < 0 ? '(-) ' : '(+) '; ?>
							<?php echo $helper->currency->display(abs($rule->change), $g_currency, $c_currency, true); ?>
						</td>
						<td class="text-right nowrap">
							<?php echo $helper->currency->display($rule->output, $g_currency, $c_currency, true) ?>
						</td>
					</tr>
					<?php
				}
			}
		}
	}
	?>
	</tbody>
	<tfoot>
	<tr>
		<td colspan="<?php echo $itemisedShip ? '3' : '2' ?>" class="strong text-right">
			<?php if (!$itemisedShip): ?>
			<span style="font-weight: normal">Shipping: </span>
			<span><?php echo $helper->currency->display($totals->get('items.shipping'), $g_currency, $c_currency, true); ?></span>
			<?php endif; ?>
		</td>
		<td class="strong text-right nowrap" data-key="items.shipping">
			<?php if ($itemisedShip): ?>
			<span><?php echo $helper->currency->display($totals->get('items.shipping'), $g_currency, $c_currency, true); ?></span>
			<?php endif; ?>
		</td>
		<td></td>
		<td class="strong text-right nowrap" data-key="items.tax_amount">
			<span><?php echo $helper->currency->display($totals->get('items.tax_amount'), $g_currency, $c_currency, true); ?></span>
		</td>
		<td class="strong text-right nowrap" data-key="items.discount_amount">
			<span><?php echo $helper->currency->display($totals->get('items.discount_amount'), $g_currency, $c_currency, true); ?></span>
		</td>
		<td class="strong text-right nowrap" data-key="items.sub_total">
			<span><?php echo $helper->currency->display($totals->get('items.sub_total'), $g_currency, $c_currency, true); ?></span>
		</td>
	</tr>
	<tr>
		<td colspan="<?php echo $itemisedShip ? '5' : '4' ?>" class="strong text-right">Estimated Total <small>(Cost + Shipping)</small><?php
			echo $totals->get('items.ship_tbd') ? '<span class="red">*</span>' : '' ?> :
		</td>
		<td class="strong text-right nowrap" colspan="3">
			<span id="cart-total" data-amount="<?php echo $totals->get('items.cart_total') ?>">
				<?php echo $helper->currency->display($totals->get('items.cart_total'), $g_currency, $c_currency, true); ?></span></td>
	</tr>

	<?php $cart_rules = $totals->get('shoprules'); ?>

	<tr>
		<td colspan="<?php echo $itemisedShip ? '5' : '4' ?>" class="strong text-right">
			<?php if (count($cart_rules)): ?>
				<a href="#" class="pull-right shoprule-info-toggle"
				   data-uid="cart-rule">Other Taxes &amp; Discounts: <i class="fa fa-plus-square-o"></i> </a>
			<?php endif; ?>
		</td>
		<td class="strong text-right nowrap">
			<span><?php echo $helper->currency->display($totals->get('tax_amount'), $g_currency, $c_currency, true); ?></span>
		</td>
		<td class="strong text-right nowrap">
			<span><?php echo $helper->currency->display($totals->get('discount_amount'), $g_currency, $c_currency, true); ?></span>
		</td>
		<td></td>
	</tr>
	<?php
	if (count($cart_rules))
	{
		?>
		<tr class="shoprule-info cart-rule-info hidden">
			<th></th>
			<th class="text-left" colspan="<?php echo $itemisedShip ? '3' : '2' ?>">Description</th>
			<th class="nowrap">Rate</th>
			<th class="nowrap">Base</th>
			<th class="nowrap">Change</th>
			<th class="nowrap">Changed</th>
		</tr>
		<?php
		foreach ($cart_rules as $rule)
		{
			if (abs($rule->change) >= 0.01)
			{
				?>
				<tr class="shoprule-info cart-rule-info hidden">
					<th></th>
					<td colspan="<?php echo $itemisedShip ? '3' : '2' ?>">
						<?php echo str_repeat('|&mdash;', $rule->level - 1) ?>
						<?php echo $this->escape($rule->title) ?>
					</td>
					<td class="text-right nowrap">
						<?php echo $rule->percent ? sprintf('%s%%', number_format($rule->amount, 2)) : $helper->currency->display($rule->amount, $g_currency, $c_currency, true); ?>
					<td class="text-right nowrap">
						<?php echo $helper->currency->display($rule->input, $g_currency, $c_currency, true) ?></td>
					<td class="text-right nowrap">
						<?php echo $rule->change < 0 ? '(-) ' : '(+) '; ?>
						<?php echo $helper->currency->display(abs($rule->change), $g_currency, $c_currency, true); ?>
					</td>
					<td class="text-right nowrap">
						<?php echo $helper->currency->display($rule->output, $g_currency, $c_currency, true) ?>
					</td>
				</tr>
				<?php
			}
		}
	}
	?>
	<?php if ($coupon_code): ?>
	<tr>
		<td colspan="<?php echo $itemisedShip ? '6' : '5' ?>" class="text-right">
			<span class="pull-left coupon-message"><?php echo JText::sprintf('COM_SELLACIOUS_CART_COUPON_DISCOUNT_MESSAGE', $coupon_code); ?></span>
		</td>
		<td class="strong text-right nowrap" colspan="2">
			<span>(–) <?php echo $helper->currency->display($totals->get('coupon_discount'), $g_currency, $c_currency, true); ?></span>
		</td>
		<td></td>
	</tr>
	<?php elseif ($coupon_msg): ?>
		<tr>
			<td colspan="<?php echo $itemisedShip ? '5' : '4' ?>" class="text-right">
				<span class="pull-left coupon-message"><?php echo $coupon_msg ?></span>
			</td>
			<td class="strong text-right nowrap"></td>
			<td class="strong text-right nowrap"></td>
			<td></td>
			<td></td>
		</tr>
	<?php endif; ?>
	<tr>
		<td colspan="<?php echo $itemisedShip ? '8' : '7' ?>" class="v-top text-right">
			<?php $url = JRoute::_('index.php?option=com_sellacious&view=cart'); ?>
			<div class="pull-right"><?php echo JText::_('COM_SELLACIOUS_CART_GRAND_TOTAL_LABEL') ?>
				<?php echo $totals->get('items.ship_tbd') ? '<span class="red"> *</span>' : '' ?>:
				<span class="grand-total strong nowrap" data-amount="<?php echo $totals->get('grand_total') ?>">
					<?php echo $helper->currency->display($totals->get('grand_total'), $g_currency, $c_currency, true); ?>
				</span>
			</div>
			<div class="btn-group pull-left">
				<?php if ($coupon_code): ?>
					<input type="text" class="coupon-code readonly" title="" value="<?php echo $coupon_code ?>"
					       placeholder="<?php echo JText::_('COM_SELLACIOUS_CART_COUPON_CODE_INPUT') ?>" readonly>
					<button type="button" class="btn-apply-coupon btn btn-success btn-lg"><?php
						echo JText::_('COM_SELLACIOUS_CART_BTN_REMOVE_COUPON_LABEL') ?></button>
				<?php else: ?>
					<input type="text" class="coupon-code" title=""
					       placeholder="<?php echo JText::_('COM_SELLACIOUS_CART_COUPON_CODE_INPUT') ?>">
					<button type="button" class="btn-apply-coupon btn btn-success btn-lg"><?php
						echo JText::_('COM_SELLACIOUS_CART_BTN_APPLY_COUPON_LABEL') ?></button>
				<?php endif; ?>
			</div>
			<button type="button" class="btn-next btn btn-primary btn-lg pull-left margin-5"><?php
					echo JText::_('COM_SELLACIOUS_CART_BTN_PROCEED_PAYMENT_LABEL') ?></button>
		</td>
	</tr>
	<?php if ($totals->get('items.ship_tbd')): ?>
	<tr>
		<td colspan="<?php echo $itemisedShip ? '8' : '7' ?>">
			<div class="star-note star-1"><?php echo JText::_('COM_SELLACIOUS_CART_SHIPMENT_STATUS_TBD_DISCLAIMER') ?></div>
		</td>
	</tr>
	<?php endif; ?>
	</tfoot>
</table>
