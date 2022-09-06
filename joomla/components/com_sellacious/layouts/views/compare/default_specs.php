<?php
/**
 * @version     1.4.0
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access
defined('_JEXEC') or die;

use Joomla\Utilities\ArrayHelper;

/** @var  SellaciousViewCompare $this */
JHtml::_('jquery.framework');
JHtml::_('script', 'com_sellacious/fe.view.compare.js', true, true);
JHtml::_('script', 'com_sellacious/util.readmore-text.js', true, true);
JHtml::_('stylesheet', 'com_sellacious/util.rating.css', null, true);

JHtml::_('stylesheet', 'com_sellacious/fe.component.css', null, true);
JHtml::_('stylesheet', 'com_sellacious/fe.view.compare.css', null, true);

$items      = $this->items;
$c_currency = $this->helper->currency->current('code_3');
?>
<form action="<?php echo 'index.php' ?>">
	<table class="table tbl-specifications">
		<thead>
		<tr>
			<th colspan="1">&nbsp;</th>
			<?php
			foreach ($this->items as $item)
			{
				$p_code = $this->helper->product->getCode($item->id, $item->variant_id, $item->seller_uid);
				$url    = JRoute::_('index.php?option=com_sellacious&view=product&p=' . $p_code);
				?>
				<th colspan="1" class="v-top">
					<label class="remove-compare">
						<input type="checkbox" name="cid[]" value="<?php echo $item->code ?>" class="hidden" />&times;
					</label>
					<?php
					$format = $item->variant_title ? '<a href="%s">%s - %s</a>' : '<a href="%s">%s</a>';
					echo sprintf($format, $url, $item->title, $item->variant_title); ?>
				</th>
				<?php
			}
			?>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<?php
			foreach ($this->items as $item)
			{
				echo '<td style="width:25%;" class="center"><img class="product-image" src="' . reset($item->images) . '"/></td>';
			}
			?>
		</tr>
		<tr>
			<th>Price</th>
			<?php
			foreach ($this->items as $item)
			{
				$s_currency = $this->helper->currency->forSeller($item->seller_uid, 'code_3');
				$price      = $this->helper->currency->display($item->sales_price, $s_currency, $c_currency, true);
				?>
				<th>
					<span class="item-price"><?php echo $price ?></span>
					<span><button type="button" class="btn btn-success btn-cart-sm btn-add-cart pull-right"
					              data-item="<?php echo $item->code ?>" data-checkout="true">BUY NOW</button></span>
				</th>
				<?php
			}
			?>
		</tr>
		<?php $rating_display = (array) $this->helper->config->get('product_rating_display'); ?>
		<?php if ($this->helper->config->get('product_rating') && (in_array('product', $rating_display) || in_array('product_modal', $rating_display))): ?>
		<tr>
			<td><b>Rating </b></td>
			<?php
			foreach ($this->items as $item)
			{
				$rating = $this->helper->rating->getProductRating($item->id);
				$rated  = $rating ? round($rating->rating, 0) : 0;
				?>
				<td class="center">
					<div class="product-rating rating-stars star-<?php echo $rated * 2 ?>"><?php echo number_format($rated, 1) ?></div>
				</td>
				<?php
			}
			?>
		</tr>
		<?php endif; ?>
		<tr>
			<td><b>Sold by </b></td>
			<?php
			foreach ($this->items as $item)
			{
				echo '<td class="center">' . $item->seller_company . '</td>';
			}
			?>
		</tr>
		<tr>
			<td><b>Features</b></td>
			<?php
			foreach ($this->items as $item)
			{
				echo '<td>';
				?>
				<ul class="product-features">
					<?php
					$features = array_filter((array) json_decode($item->variant_features, true), 'trim');

					if (count($features) == 0)
					{
						$features = array_filter((array) json_decode($item->features, true), 'trim');
					}

					foreach ($features as $feature)
					{
						echo '<li>' . htmlspecialchars($feature) . '</li>';
					}
					?>
				</ul>
				<?php
				echo '</td>';
			}
			?>
		</tr>
		<tr>
			<td><b>Product Summary</b></td>
			<?php
			foreach ($this->items as $item)
			{
				echo '<td><span class="readmore">' . $this->escape($item->introtext) . '</span></td>';
			}
			?>
		</tr>
		</thead>
		<tbody>
		<?php
		foreach ($this->groups as $group)
		{
			?>
			<tr class="separator">
				<td colspan="<?php echo count($this->items) + 1 ?>"></td>
			</tr>
			<tr>
				<th class="group-header" colspan="<?php echo count($this->items) + 1 ?>"><?php echo $group->title ?></th>
			</tr>
			<?php
			foreach ($group->fields as $field)
			{
				?>
				<tr>
					<th style="width:30%;">
						<?php echo $this->escape($field->title) ?>
					</th>
					<?php
					foreach ($items as $item)
					{
						$obj   = ArrayHelper::getValue($item->specifications, $field->id);
						$value = is_object($obj) ? $obj->value : '';
						$value = $this->helper->field->renderValue($field->value, $field->type, $field);

						echo '<td>' . $value . '</td>';
					}
					?>
				</tr>
				<?php
			}
		}
		?>
		<tr>
			<th>What's in Box</th>
			<?php
			foreach ($items as $item)
			{
				?><td><?php if ($item->whats_in_box): ?>
					<div class="content-text"><?php echo $item->whats_in_box ?></div><?php
				endif;
				?></td><?php
			}
			?>
		</tr>
		</tbody>
	</table>

	<input type="hidden" name="option" value="com_sellacious" />
	<input type="hidden" name="task" value="" />
</form>
<div class="clearfix"></div>
