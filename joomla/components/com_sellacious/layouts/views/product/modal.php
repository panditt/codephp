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

/** @var SellaciousViewProduct $this */
JHtml::_('jquery.framework');
JHtml::_('behavior.framework', true);
JHtml::_('bootstrap.tooltip', '.hasTooltip');

if ($this->helper->config->get('product_compare')):
	JHtml::_('script', 'com_sellacious/util.compare.js', false, true);
endif;

JHtml::_('script', 'com_sellacious/util.cart.aio.js', false, true);
JHtml::_('script', 'com_sellacious/fe.view.product.js', true, true);

// We may later decide not to use cart aio assets and separate the logic
JHtml::_('script', 'media/com_sellacious/js/plugin/select2-3.5/select2.js', false, false);
JHtml::_('stylesheet', 'media/com_sellacious/js/plugin/select2-3.5/select2.css', null, false);

JHtml::_('stylesheet', 'com_sellacious/font-awesome.min.css', null, true);
JHtml::_('stylesheet', 'com_sellacious/fe.component.css', null, true);
JHtml::_('stylesheet', 'com_sellacious/util.rating.css', null, true);
JHtml::_('stylesheet', 'com_sellacious/fe.view.cart.aio.css', null, true);
JHtml::_('stylesheet', 'com_sellacious/fe.view.product.css', null, true);

$item           = $this->item;
$allow_checkout = $this->helper->config->get('allow_checkout');
$cart_pages     = (array) $this->helper->config->get('product_add_to_cart_display');
$buynow_pages   = (array) $this->helper->config->get('product_buy_now_display');
$c_currency     = $this->helper->currency->current('code_3');
?>
<style>
	/* Suppress compare bar for now, it should not be loaded in the modal at all. Work for later */
	#compare-bar { display: none; }
</style>
<input type="hidden" name="<?php echo JSession::getFormToken() ?>" id="formToken" value="1"/>

<div class="w100p">
	<div class="margin-center" style="max-width: 1180px;">
		<div class="pull-left">
			<?php echo $this->loadTemplate('images'); ?>
			<div class="clearfix"></div>

			<?php if ($item->get('price_display') == 0): ?>
			<div id="buy-now-box" class="pull-left">
				<?php $btnClass = $item->get('stock_capacity') > 0 ? 'btn-add-cart' : ' disabled'; ?>
				<?php if ($allow_checkout && in_array('product_modal', $cart_pages)): ?>
					<button type="button" class="btn btn-warning btn-cart <?php echo $btnClass ?>"
							data-item="<?php echo $item->get('code') ?>">ADD TO CART</button>
				<?php endif; ?>
				<?php if ($allow_checkout && in_array('product_modal', $buynow_pages)): ?>
					<button type="button" class="btn btn-success btn-cart <?php echo $btnClass ?>"
							data-item="<?php echo $item->get('code') ?>" data-checkout="true">BUY NOW</button>
				<?php endif; ?>
				<div class="w100p">
					<?php
					if ($item->get('stock_capacity') > 0)
					{
						?>
						<div class="pull-right">
							<label><?php echo JText::_('COM_SELLACIOUS_PRODUCT_BUY_QUANTITY_INPUT_LABEL'); ?>
								<input type="number" name="quantity" id="product-quantity" min="1" max="100" value="1" />
							</label>
						</div>
						<?php
					}
					else
					{
						?><div class="label pull-right strong margin-top-10"><?php
						echo JText::_('COM_SELLACIOUS_PRODUCT_OUT_OF_STOCK') ?></div><?php
					}
					?>
				</div>
			</div>
			<?php endif; ?>

			<div class="clearfix"></div>
			<div class="w100p"><?php echo $this->loadTemplate('price'); ?></div>
			<div class="clearfix"></div>
		</div>
		<div id="product-info" style="max-width: 870px; width: calc(95% - 285px);">
			<h1>
				<?php echo $item->get('title'); ?>
				<?php if ($variant_title = $item->get('variant_title')): ?>
					&nbsp;<small>(<?php echo $variant_title ?>)</small>
				<?php endif; ?>
			</h1>

			<hr class="isolate"/>

			<?php $rating_display = (array) $this->helper->config->get('product_rating_display'); ?>
			<?php if ($this->helper->config->get('product_rating') && (in_array('product_modal', $rating_display))): ?>
				<?php $stars = round($item->get('rating.rating', 0) * 2); ?>
				<div class="product-rating rating-stars star-<?php echo $stars ?>"><?php echo number_format($item->get('rating.rating', 0), 1) ?></div>
			<?php endif; ?>

			<?php echo $this->loadTemplate('toolbar'); ?>

			<hr class="isolate"/>

			<?php
			if (in_array('product_modal', (array) $this->helper->config->get('product_features_list'))):
				$features = array_filter((array) json_decode($item->get('variant_features'), true), 'trim');

				if (!$features):
					$features = array_filter((array) json_decode($item->get('features'), true), 'trim');
				endif;

				if ($features):
					?><ul class="product-features"><?php
						foreach ($features as $feature):
							echo '<li>' . htmlspecialchars($feature) . '</li>';
						endforeach;
					?></ul><?php
				endif;
			endif;
			?>

			<div>
				<?php
				if (in_array('product_modal', (array) $this->helper->config->get('splcategory_badge_display')) && is_array($item->get('special_listings')))
				{
					foreach ($item->get('special_listings') as $spl_cat)
					{
						$badges = $this->helper->media->getImages('splcategories.badge', (int) $spl_cat->catid, false);

						if (count($badges))
						{
							?><img src="<?php echo reset($badges) ?>" class="pull-right spl-cat-badge"/><?php
						}
					}
				}
				?>
			</div>
			<div class="clearfix"></div>

			<?php if (count($offers = $item->get('offers'))): ?>
				<span class="product-offer">OFFER</span>
				<div class="clearfix"></div>
			<?php endif; ?>

			<hr class="isolate"/>

			<blockquote class="introtext"><?php echo $item->get('introtext') ?></blockquote>

			<?php if ($this->helper->config->get('multi_seller', 0) && count($item->get('sellers')) > 1): ?>
				<div class="product-sellers-count">
					<a href="#also-selling">
						<i class="fa fa-location-arrow"></i>
						<?php echo JText::plural('COM_SELLACIOUS_PRODUCT_SELLER_COUNT_N_DESC', count($item->get('sellers'))); ?>
					</a>
				</div>
				<div class="clearfix"></div>
			<?php endif; ?>

			<div class="product-actions w100p">
				<div>
					<div class="seller-info">
						<h4>SOLD BY</h4>
						<a target="_top" href="<?php echo JRoute::_('index.php?option=com_sellacious&view=store&id=' . $item->get('seller_uid')); ?>">
							<?php echo $item->get('seller_company', $item->get('seller_name')); ?></a>
						<?php $rating = $item->get('seller_rating.rating'); ?>
						<span class="label <?php echo ($rating < 3) ? 'label-warning' : 'label-success' ?>"><?php echo number_format($rating, 1) ?> / 5.0</span>
						<br />
						<br />
						<div>
							<?php $allowed_listing_type = (array) $this->helper->config->get('allowed_listing_type'); ?>
							<?php if (count($allowed_listing_type) != 1): ?>
							<span class="label label-info margin-top-10">Condition:
								<?php
								$list_type = $item->get('listing_type');

								// What if this is a not allowed listing type value
								if ($list_type == 1):
									echo JText::plural('COM_SELLACIOUS_PRODUCT_FIELD_LISTING_TYPE_VALUE', $list_type);
								else:
									$list_cond = $item->get('item_condition');
									echo JText::plural('COM_SELLACIOUS_PRODUCT_FIELD_ITEM_CONDITION_VALUE', $list_type * 10 + (int) $list_cond);
								endif;
								?>
							</span>
							<?php endif; ?>
						</div>
					</div>
					<?php
					if (count($offers = $item->get('offers')))
					{
						?>
						<br />
						<div class="offer-info pull-left">
							<div class="offer-info-header"><?php echo JText::plural('COM_SELLACIOUS_PRODUCT_OFFER_COUNT_N', count($offers)) ?></div>
							<?php
							foreach ($offers as $offer)
							{
								$lang_key = 'COM_SELLACIOUS_PRODUCT_OFFER_ITEM_TEXT' . ($offer->inclusive ? '_INCLUSIVE' : '');

								echo '<div>' . JText::sprintf($lang_key, $offer->title) . '</div>';
							}
							?>
						</div>
						<div class="clearfix"></div>
						<?php
					}
					?>
					<br/>

					<?php if ($item->get('exchange_days')): ?>
						<div class="replacement-info">
							<i class="fa fa-refresh"></i>
							<strong> <?php echo (int) $item->get('exchange_days') ?> Days</strong> Replacement Guarantee
							<?php if ($item->get('exchange_tnc')): ?><span class="red">*</span><?php endif; ?>
						</div>
					<?php endif; ?>

					<?php if ($item->get('return_days')): ?>
						<div class="replacement-info">
							<i class="fa fa-refresh"></i>
							<strong> <?php echo (int) $item->get('return_days') ?> Days</strong> Easy Return
							<?php if ($item->get('return_tnc')): ?><span class="red">*</span><?php endif; ?>
						</div>
					<?php endif; ?>

				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<div class="clearfix"></div>
