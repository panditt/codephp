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

use Joomla\Utilities\ArrayHelper;

JHtml::_('behavior.framework');

/** @var  stdClass        $displayData */
/** @var  SellaciousCart  $cart */
/** @var  array           $forms */
$forms = $displayData->forms;
$cart  = $displayData->cart;
$items = $cart->getItems();

if (count($items) == 0)
{
	return;
}
?>
<form id="shipment-form" action="index.php" method="post" onsubmit="return false;">
<?php
	$helper     = SellaciousHelper::getInstance();
	$g_currency = $cart->getCurrency();
	$c_currency = $helper->currency->current('code_3');
	?>
	<table class="table">
		<?php
		$row = 'even';

		foreach ($items as $item):

			$row = $row == 'even' ? 'odd' : 'even';

			$uid        = $item->get('uid');
			$quantity   = $item->get('quantity');
			$title      = trim($item->get('title') . ' - ' . $item->get('variant_title'), '- ');

			/** @var  JForm[]  $itemForms */
			$itemForms  = ArrayHelper::getValue($forms, $uid);
			$shipQuotes = $cart->get('items.' . $uid . '.ship_quotes', array());
			$cQid       = $cart->get('items.' . $uid . '.ship_quote_id');
			$ship_note  = '';
			?>
			<tr class="cart-item <?php echo $row ?>">
				<td style="width: 42px">
					<img class="product-thumb" src="<?php echo $helper->product->getImage($item->get('product_id'), $item->get('variant_id')); ?>" alt="">
				</td>
				<td style="width: 65%;">
					<a href="<?php echo JRoute::_('index.php?option=com_sellacious&view=product&p=' . $item->get('code')); ?>"><?php
						?> <?php echo $title ?></a><br>
					<span><?php echo JText::sprintf('COM_SELLACIOUS_ORDER_PREFIX_ITEM_QUANTITY_N', $item->get('quantity')) ?></span>
				</td>
				<td class="center">

					<?php if ($shipQuotes): ?>

						<select name="shipment[<?php echo $uid ?>]" class="text-left select-shipment hasSelect2 nowrap w100p" data-uid="<?php echo $uid ?>" title="">
							<option value=""><?php echo JText::_('COM_SELLACIOUS_CART_ITEM_SHIPRULE_SELECT_OPTION') ?></option>
							<?php
							foreach ($shipQuotes as $quote):

								$ship_sel   = $quote->id == $cQid ? 'selected' : '';
								$ship_total = $helper->currency->display($quote->total, $g_currency, $c_currency, true);
								$ship_amt   = $helper->currency->display($quote->amount, $g_currency, $c_currency, true);
								$ship_amt2  = $helper->currency->display($quote->amount2, $g_currency, $c_currency, true);
								$ship_label = $quote->serviceName . ' (' . $ship_total . ')';

								if ($ship_sel):

									if (empty($quote->note) && $quantity > 1):
										$note_format = $quote->amount2 ? '@ %s + %s x %d' : '@ %s';
										$quote->note = sprintf($note_format, $ship_amt, $ship_amt2, $quantity - 1);
									endif;

									$ship_note = isset($quote->note) ? $quote->note : '';

								endif;

								?><option value="<?php echo $quote->id ?>" <?php echo $ship_sel ?>><?php echo $ship_label ?></option><?php

							endforeach;
							?>
						</select>

						<div class="center"><span class="label"><?php echo $ship_note; ?></span></div>

					<?php elseif (!$item->get('price.shipping.tbd')):

						$serviceName = $item->get('price.shipping.serviceName');
						$ruleTitle   = $item->get('price.shipping.ruleTitle');
						$shipTotal   = $item->get('price.shipping.total');

						if ($ruleTitle):
							echo $serviceName ? $ruleTitle . ' - ' . $serviceName . ':' : $ruleTitle . ':';
						endif;

						echo ' <span> ' . $helper->currency->display($shipTotal, $g_currency, $g_currency, true) . '</span>';

					else:

						echo '<span class="tbd">TBD</span>';

					endif;
					?>

				</td>
			</tr>

			<?php
			if (count($itemForms)):

				foreach ($itemForms as $qId => $form):

					$active = $qId == $cQid ? 'active' : '';
					?>
					<tr class="shipment-method-form shipment_form_<?php echo $uid ?> <?php echo $active ?> <?php echo $row ?>"
					    id="shipment_form_<?php echo $uid ?>_<?php echo $qId ?>">

						<td colspan="3">
						<?php
						if ($form):

							$fieldsets = $form->getFieldsets();

							foreach ($fieldsets as $fs_key => $fieldset):

								$fields = $form->getFieldset($fieldset->name);
								?>
								<table class="shipment-table">
									<tbody>
									<?php
									foreach ($fields as $field):

										if ($field->hidden):
											echo $field->input;
										else:
											?>
											<tr>
												<td style="width: 160px;" class="v-top"><?php echo $field->label; ?></td>
												<td><?php echo $field->input; ?></td>
											</tr>
											<?php
										endif;

									endforeach;
									?>
									</tbody>
								</table>
								<?php

							endforeach;

						endif;
						?>
						</td>

					</tr>
					<?php

				endforeach;

			endif;

		endforeach;
		?>
	</table>
</form>
<a class="btn btn-small btn-default btn-next pull-right">Next <i class="fa fa-arrow-right"></i></a>
<?php
