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

/** @var  object          $displayData */
/** @var  SellaciousCart  $cart */
$cart       = $displayData->cart;
$helper     = SellaciousHelper::getInstance();
$totals     = $cart->getTotals(true);
$items      = $cart->getItems();
$g_currency = $cart->getCurrency();
?>
<table class="table">
	<?php foreach ($items as $i => $item):
		$ship_tbd     = $item->get('price.shipping.tbd');
		$ship_free    = $item->get('price.shipping.free');
		$ship_total   = $item->get('price.shipping.total');
		$productTitle = trim($item->get('title') . ' - ' . $item->get('variant_title'), '- ');
		$serviceName  = $item->get('price.shipping.serviceName');
		$ruleTitle    = $item->get('price.shipping.ruleTitle');
		?>
		<tr>
			<td class="cart-item">
				<span class="cart-item-title" style="line-height: 1.6;"><?php echo $productTitle; ?></span>
			</td>
			<td>
				<?php
				if ($ruleTitle):
					echo $serviceName ? $ruleTitle . ' - ' . $serviceName : $ruleTitle;
				else:
					echo JText::_('COM_SELLACIOUS_CART_NO_SHIPPING_METHOD_SELECTED');
				endif;
				?>
			</td>
			<td style="width: 80px; text-align: right;">
				<?php
				if ($ship_tbd):
					echo JText::_('COM_SELLACIOUS_ORDER_SHIPPING_COST_TBD');
				elseif ($ship_free):
					echo JText::_('COM_SELLACIOUS_ORDER_SHIPPING_COST_FREE');
				else:
					echo $helper->currency->display($ship_total, $g_currency, $g_currency, true);
				endif;
				?>
			</td>
		</tr>
	<?php endforeach; ?>
</table>
<?php
