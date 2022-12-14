<?php
/**
 * @version     1.4.1
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access
defined('_JEXEC') or die;

/** @var  SellaciousViewProduct  $this */
$prices     = $this->item->get('prices');
$c_currency = $this->helper->currency->current('code_3');
$s_currency = $this->helper->currency->forSeller($this->item->get('seller_uid'), 'code_3');

if (is_array($prices) && count($prices) > 1)
{
	?>
	<table class="w100p price-list table-striped">
		<?php
		foreach ($prices as $price)
		{
			if ($price->qty_min && $price->qty_max)
			{
				$label = "$price->qty_min to $price->qty_max";
			}
			elseif ($price->qty_min && !$price->qty_max)
			{
				$label = "Above $price->qty_min";
			}
			elseif (!$price->qty_min && $price->qty_max)
			{
				$label = "Below $price->qty_max";
			}
			elseif ($price->is_fallback == 0)
			{
				$label = 'Offer Price';
			}
			elseif ($price->is_fallback)
			{
				$label = 'Default Price';
			}
			else
			{
				$label = 'Standard Price';
			}

			if ($price->client_category)
			{
				$label .= '<br/><small style="color: #666;">' . $price->client_category . '<span class="red">*</span></small>';
			}
			else
			{
				// $label .= '<br/><small style="color: #666;">' . JText::_('COM_SELLACIOUS_PRODUCT_PRICE_ALL_CUSTOMER') . '</small>';
			}
			?>
			<tr>
				<td style="line-height: 1.1;"><?php echo $label; ?></td>
				<td class="nowrap"><?php echo $this->helper->currency->display($price->sales_price, $s_currency, $c_currency, true); ?></td>
			</tr>
			<?php
		}
		?>
	</table>
	<?php
}
?><div class="clearfix"></div>
