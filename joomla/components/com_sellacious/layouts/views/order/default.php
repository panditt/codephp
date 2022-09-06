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

use Joomla\Registry\Registry;
use Joomla\Utilities\ArrayHelper;

/** @var SellaciousViewOrder $this */
JHtml::_('jquery.framework');
JHtml::_('behavior.framework', true);

JHtml::_('script', 'com_sellacious/fe.view.order.js', true, true);

JHtml::_('stylesheet', 'com_sellacious/font-awesome.min.css', null, true);
JHtml::_('stylesheet', 'com_sellacious/fe.component.css', null, true);
JHtml::_('stylesheet', 'com_sellacious/fe.view.order.css', null, true);

$order = new Registry($this->item);
$items = $order->get('items');

$c_currency = $this->helper->currency->current('code_3');
$o_currency = $order->get('currency');
?>
<form action="<?php echo JUri::getInstance()->toString() ?>" method="post" id="orderForm" name="orderForm">
	<h2><?php echo JText::_('COM_SELLACIOUS_ORDER_HEADING_DETAILS') ?></h2>
	<div class="fieldset">
		<table class="w100p">
			<tr>
				<td class="w40p v-top">
					<table class="w100p order-info">
						<tr>
							<td><?php echo JText::_('COM_SELLACIOUS_ORDER_HEADING_ID'); ?></td>
							<td><strong><?php echo $order->get('order_number') ?> </strong>
								<small>(<?php echo JText::plural('COM_SELLACIOUS_ORDER_PREFIX_TOTAL_ITEMS_N', count($items)); ?>)</small>
							</td>
						</tr>
						<tr>
							<td><?php echo JText::_('COM_SELLACIOUS_ORDER_HEADING_SELLER'); ?></td>
							<td><?php
								$sellers = ArrayHelper::getColumn($items, 'seller_company');
								echo implode('<br>', array_unique($sellers));
							?></td>
						</tr>
						<tr>
							<td><?php echo JText::_('COM_SELLACIOUS_ORDER_HEADING_DATE'); ?></td>
							<td><?php echo JHtml::_('date', $order->get('created'), 'D, F d, Y h:i A'); ?></td>
						</tr>
						<tr>
							<td><?php echo JText::_('COM_SELLACIOUS_ORDER_HEADING_PAYMENT_TOTAL'); ?></td>
							<td class="order-total"><span><?php
									$amount = $order->get('payment.id') ? $order->get('payment.amount_payable') : $order->get('grand_total');
									echo $this->helper->currency->display($amount, $o_currency, $c_currency, true) ?></span>
							</td>
						</tr>
					</table>
				</td>
				<td class="w60p v-top">
					<div id="address-viewer">
						<div id="address-shipping-text">
							<div class="address_label">Shipping Address</div>
							<span class="address_name"><?php echo $order->get('st_name') ?></span>
							<span class="address_mobile"><i class="fa fa-mobile-phone fa-lg"></i>
								<?php echo $order->get('st_mobile') ?></span><br />
							<span class="address_address has-comma"><?php echo $order->get('st_address') ?></span>
							<span class="address_landmark"><?php echo $order->get('st_landmark') ?></span><br>
							<span class="address_district has-comma"><?php echo $order->get('st_district') ?></span>
							<span class="address_state_loc has-comma"><?php echo $order->get('st_state') ?></span>
							<span class="address_zip"><?php echo $order->get('st_zip') ?></span> -
							<span class="address_country"><?php echo $order->get('st_country') ?></span><br />
						</div>
						<div class="clearfix"></div>
						<div id="address-billing-text">
							<div class="address_label">Billing Address</div>
							<span class="address_name"><?php echo $order->get('bt_name') ?></span>
							<span class="address_mobile"><i class="fa fa-mobile-phone fa-lg"></i>
								<?php echo $order->get('bt_mobile') ?></span><br />
							<span class="address_address has-comma"><?php echo $order->get('bt_address') ?></span>
							<span class="address_landmark"><?php echo $order->get('bt_landmark') ?></span><br>
							<span class="address_district has-comma"><?php echo $order->get('bt_district') ?></span>
							<span class="address_state_loc has-comma"><?php echo $order->get('bt_state') ?></span>
							<span class="address_zip"><?php echo $order->get('bt_zip') ?></span> -
							<span class="address_country"><?php echo $order->get('bt_country') ?></span><br />
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div class="fieldset order-actions">
		<table class="w100p">
			<tr class="text-center">
				<td>
					<?php $url = JRoute::_('index.php?option=com_sellacious&view=order&layout=print&tmpl=component&id=' . $order->get('id')); ?>
					<a target="_blank" href="<?php echo $url ?>">
						<button type="button"
							class="btn-action btn-print fa fa-print"><span>PRINT<br/>ORDER</span></button>
					</a>
				</td>
				<td>
					<?php $url = JRoute::_('index.php?option=com_sellacious&view=order&layout=invoice&tmpl=component&id=' . $order->get('id')); ?>
					<a target="_blank" href="<?php echo $url ?>">
						<button type="button"
							class="btn-action btn-invoice fa fa-file"><span>VIEW<br/>INVOICE</span></button>
					</a>
				</td>
				<td>
					<?php $url = JRoute::_('index.php?option=com_sellacious&view=order&layout=receipt&id=' . $order->get('id')); ?>
					<a target="_blank" href="<?php echo $url ?>">
						<button type="button"
							class="btn-action btn-invoice fa fa-file-text"><span>VIEW<br/>RECEIPT</span></button>
					</a>
				</td>
				<td>
					<button type="button" class="btn-action btn-contact fa fa-phone"><span>CONTACT<br/>US</span></button>
				</td>
			</tr>
		</table>
	</div>

	<?php if (!empty($items)): ?>

		<table class="order-items w100p">
			<thead>
			<tr>
				<th colspan="4"><?php echo JText::_('COM_SELLACIOUS_ORDER_HEADING_PRODUCT_DETAILS') ?></th>
			</tr>
			</thead>
			<tbody>
			<?php
			foreach ($items as $oi)
			{
				$code     = $this->helper->product->getCode($oi->product_id, $oi->variant_id, $oi->seller_uid);
				$p_url    = JRoute::_('index.php?option=com_sellacious&view=product&p=' . $code);
				$title    = trim(sprintf('%s - %s', $oi->product_title, $oi->variant_title), '- ');
				$images   = $this->helper->product->getImages($oi->product_id, $oi->variant_id);
				$statuses = $this->helper->order->getStatusLog($oi->order_id, $oi->item_uid);
				?>
				<tr>
					<td style="width:100px;" class="v-top">
						<a href="<?php echo $p_url ?>">
							<img style="width:100px;" src="<?php echo reset($images) ?>" alt="<?php echo $title ?>"></a>
					</td>

					<td class="v-top">
						<?php echo $oi->package_items ? JText::_('COM_SELLACIOUS_CART_PACKAGE_ITEM_LABEL') : ''; ?>
						<a href="<?php echo $p_url ?>"><?php echo $this->escape($title) ?></a><br />
						<?php echo JText::plural('COM_SELLACIOUS_ORDER_PREFIX_ITEM_QUANTITY_N', $oi->quantity) ?>
						<br />

						<?php if ($oi->package_items): ?>
							<hr class="simple">
							<ol class="package-items">
								<?php
								foreach ($oi->package_items as $pkg_item):
									$url = JRoute::_('index.php?option=com_sellacious&view=product&p=' . $pkg_item->code);
									?><li><a class="dark-link-off" href="<?php echo $url ?>"><?php
										echo $pkg_item->product_title ?> <?php echo $pkg_item->variant_title ?>
										(<?php echo $pkg_item->product_sku ?>-<?php echo $pkg_item->variant_sku ?>)</a></li><?php
								endforeach;
								?>
							</ol>
						<?php endif; ?>

						<?php echo JText::sprintf('COM_SELLACIOUS_ORDER_PREFIX_ITEM_SELLER', $oi->seller_company) ?>
					</td>

					<td class="text-left w30p v-top toggle-box">
						<table class="oi-status w100p">
						<?php foreach ($statuses as $si => $status): ?>
							<tr class="<?php echo $si > 2 ? 'hidden toggle-element' : ''; ?>">
								<td class="nowrap" style="width:90px;"><?php
									echo JHtml::_('date', $status->created, 'M d, Y h:i A'); ?></td>
								<td class="text-right">
									<abbr class="hasTooltip" data-placement="top" title="<?php
									echo $status->customer_notes ?>"><?php echo $status->s_title ?></abbr>
								</td>
							</tr>
						<?php endforeach; ?>
						</table>

						<?php if (count($statuses) > 3): ?>
							<div class="w100p text-center bg-color-dark thin-line btn-toggle">
								<a class="dark-link btn-micro toggle-element"><i class="fa fa-caret-down fa-lg"></i></a>
								<a class="dark-link btn-micro toggle-element hidden"><i class="fa fa-caret-up fa-lg"></i></a>
							</div>
						<?php endif; ?>
					</td>

					<td class="text-right nowrap v-top item-total">
						<?php echo $this->helper->currency->display($oi->sub_total, $o_currency, $c_currency, true); ?><br />
						<?php if (abs($oi->shipping_amount) >= 0.01): ?>
						<small><?php echo JText::_('COM_SELLACIOUS_ORDER_ITEM_SHIPPING_AMOUNT_LABEL') ?>
						<?php echo $this->helper->currency->display($oi->shipping_amount, $o_currency, $c_currency, true); ?></small><br />
						<?php endif; ?>
						<button class="btn btn-default btn-mini nowrap btn-review-item"><?php
							echo JText::_('COM_SELLACIOUS_ORDER_REVIEW_ITEM_BUTTON'); ?></button>
					</td>
				</tr>
				<?php
				if (count($oi->shoprules))
				{
					?>
					<tr>
						<td colspan="4" style="padding: 0">
							<table class="w100p shoprule-info">
								<?php
								foreach ($oi->shoprules as $ri => $rule)
								{
									settype($rule, 'object');

									if ($rule->change != 0)
									{
										?>
										<tr>
											<td>
												<?php echo str_repeat('|&mdash;', $rule->level - 1) ?>
												<?php echo $this->escape($rule->title); ?>
											</td>
											<td class="text-right nowrap" style="width:150px;">
												<em>
													<?php
													$rule_base = $this->helper->currency->display($rule->input, $o_currency, $c_currency, true);

													if ($rule->percent)
													{
														$change_value = number_format($rule->amount, 2);
														echo sprintf('@%s%% on %s', $change_value, $rule_base);
													}
													else
													{
														$change_value = $this->helper->currency->display($rule->amount, $o_currency, $c_currency, true);
														echo sprintf('%s over %s', $change_value, $rule_base);
													}
													?>
												</em>
											</td>
											<td class="text-right nowrap" style="width:90px;">
												<small><?php echo JText::_('COM_SELLACIOUS_ORDER_SHOPRULE_INCLUSIVE_LABEL'); ?></small>
												<?php // echo $this->helper->currency->display($rule->output, $order->get('currency'), $c_currency, true) ?></td>
											<td class="text-right nowrap" style="width:90px;">
												<?php
												$value = $this->helper->currency->display(abs($rule->change), $o_currency, $c_currency, true);
												echo $rule->change >= 0 ? '(+) ' . $value : '(-) ' . $value;
												?>
											</td>
										</tr>
										<?php
									}
								}
								?>
							</table>
						</td>
					</tr>
					<?php
				}
			}
			?>
			</tbody>
		</table>
		<br>
		<table class="w100p shoprule-info">
			<?php
			$cart_shoprules = (array) $order->get('shoprules');

			if (count($cart_shoprules)):
				?>
				<thead>
				<tr>
					<th colspan="4">
						<?php echo JText::_('COM_SELLACIOUS_ORDER_HEADING_SHOPRULE_DETAILS') ?>
					</th>
				</tr>
				</thead>
				<?php
				foreach ($cart_shoprules as $rule):
					if ($rule->change != 0): ?>
						<tr>
							<td>
								<?php echo str_repeat('|&mdash;', $rule->level - 1) ?>
								<?php echo $this->escape($rule->title); ?>
							</td>
							<td class="text-right nowrap" style="width:150px;">
								<em>
									<?php
									$rule_base = $this->helper->currency->display($rule->input, $o_currency, $c_currency, true);

									if ($rule->percent)
									{
										$change_value = number_format($rule->amount, 2);
										echo sprintf('@%s%% on %s', $change_value, $rule_base);
									}
									else
									{
										$change_value = $this->helper->currency->display($rule->amount, $o_currency, $c_currency, true);
										echo sprintf('%s over %s', $change_value, $rule_base);
									}
									?>
								</em>
							</td>
							<td class="text-right nowrap" style="width:90px;">
								<?php
								$value = $this->helper->currency->display(abs($rule->change), $o_currency, $c_currency, true);
								echo $rule->change >= 0 ? '(+) ' . $value : '(-) ' . $value;
								?>
							</td>
							<td class="text-right nowrap" style="width:90px;">
								<?php echo $this->helper->currency->display($rule->output, $o_currency, $c_currency, true) ?></td>
						</tr>
						<?php
					endif;
				endforeach;

				if (abs($order->get('cart_taxes')) >= 0.01):
					?>
					<tr>
						<th class="text-right" colspan="3">Cart Taxes:</th>
						<th class="text-right" style="width:90px;"><?php
							echo $this->helper->currency->display($order->get('cart_taxes'), $o_currency, $c_currency, true) ?></th>
					</tr>
					<?php
				endif;

				if (abs($order->get('cart_discounts')) >= 0.01):
					?>
					<tr>
						<th class="text-right" colspan="3">Cart Discount:</th>
						<th class="text-right" style="width:90px;"><?php
							echo $this->helper->currency->display($order->get('cart_discounts'), $o_currency, $c_currency, true) ?></th>
					</tr>
					<?php
				endif;

			endif;
			?>

			<?php if (abs($order->get('product_shipping')) >= 0.01): ?>
				<tr>
					<th class="text-right" colspan="3"><span class="pull-left"><?php
							echo $order->get('shipping_rule') ? JText::sprintf('COM_SELLACIOUS_ORDER_PREFIX_ITEM_SHIPPING_RULE', $order->get('shipping_rule')) : ''; ?></span>Total Shipping:</th>
					<th class="text-right"><?php echo $this->helper->currency->display($order->get('product_shipping'), $o_currency, $c_currency, true) ?></th>
				</tr>
			<?php endif; ?>

			<?php if ($coupon = $order->get('coupon')): ?>
				<tr>
					<th class="text-left" colspan="3">
						Coupon: <span class="text-normal"><?php echo $this->escape($coupon->code) ?></span>
					</th>
					<th class="text-right">
						(-) <?php echo $this->helper->currency->display($coupon->amount, $o_currency, $c_currency, true) ?>
					</th>
				</tr>
			<?php endif; ?>

			<tr>
				<td colspan="3" class="text-right nowrap"><?php echo JText::_('COM_SELLACIOUS_ORDER_HEADING_GRAND_TOTAL'); ?></td>
				<td class="text-right nowrap" style="width:90px;"><?php
					echo $this->helper->currency->display($order->get('grand_total'), $o_currency, $c_currency, true) ?>
				</td>
			</tr>

			<?php if ($order->get('payment.fee_amount')): ?>
				<tr>
					<td colspan="3" class="text-right nowrap"><?php
						echo JText::sprintf('COM_SELLACIOUS_ORDER_HEADING_PAYMENT_FEE_METHOD', $order->get('payment.method_name')); ?></td>
					<td class="text-right nowrap" style="width:90px;"><?php
						echo $this->helper->currency->display($order->get('payment.fee_amount'), $o_currency, $c_currency, true) ?>
					</td>
				</tr>
			<?php endif; ?>

			<tr>
				<td colspan="4"> </td>
			</tr>
		</table>

		<?php $values = json_decode($order->get('checkout_forms')); ?>
		<?php if ($values): ?>
			<table class="w100p shoprule-info">
				<thead>
				<tr>
					<th colspan="4">
						<?php echo JText::_('COM_SELLACIOUS_ORDER_HEADING_CHECKOUT_FORM_VALUES') ?>
					</th>
				</tr>
				</thead>
				<tbody>
				<?php foreach ($values as $record): ?>
					<tr>
						<td style="width: 180px;" class="nowrap"><?php echo $record->label ?></td>
						<td><?php echo $record->html  ?></td>
					</tr>
				<?php endforeach; ?>
				</tbody>
			</table>
		<?php endif; ?>

	<?php else: ?>

		<h5><em><?php echo JText::_('COM_SELLACIOUS_ORDER_NO_ITEM_MESSAGE'); ?></em></h5>

	<?php endif; ?>

	<input type="hidden" name="option" value="com_sellacious" />
	<input type="hidden" name="view" value="order" />
	<input type="hidden" name="task" value="" />
	<?php echo JHtml::_('form.token'); ?>
	<div class="clearfix"></div>
</form>
<div class="clearfix"></div>
