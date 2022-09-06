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

/** @var  SellaciousViewProducts $this */
/** @var  stdClass $tplData */
$item    = $tplData;

$url_raw = 'index.php?option=com_sellacious&view=product&p=' . $item->code;
$url     = JRoute::_($url_raw);
$url_m   = JRoute::_($url_raw . '&layout=modal&tmpl=component');
$paths   = (array) $item->images;

$c_currency = $this->helper->currency->current('code_3');
$s_currency = $this->helper->currency->forSeller($item->seller_uid, 'code_3');

$params = array(
	'title'    => $this->escape($item->title),
	'url'      => $url_m,
	'height'   => '600',
	'width'    => '800',
	'keyboard' => true,
);
echo JHtml::_('bootstrap.renderModal', 'modal-' . $item->code, $params);
?>
<div class="product-wrap">
	<div class="product-box spl-cat-<?php echo (int) $item->spl_listing_catid; ?>" data-rollover="container">

		<?php $link_detail = $this->helper->config->get('product_detail_page'); ?>

		<div class="image-box">
			<?php if ($link_detail): ?><a href="<?php echo $url ?>"><?php else: ?><a><?php endif; ?>
			<img src="<?php echo reset($paths) ?>" title="<?php echo htmlspecialchars($item->title) ?>"/></a>
				</div>
		<div class="product-info-box">

		<?php if ($link_detail): ?>
			<div class="product-title"><a href="<?php echo $url ?>"><?php echo $item->title; ?>&nbsp;<?php echo $item->variant_title; ?></a></div>
		<?php else: ?>
			<div class="product-title"><a><?php echo $item->title; ?>&nbsp;<?php echo $item->variant_title; ?></a></div>
		<?php endif; ?>

		<?php $allow_rating = $this->helper->config->get('product_rating'); ?>
		<?php $rating_pages = (array) $this->helper->config->get('product_rating_display'); ?>

		<?php if ($allow_rating && in_array('categories', $rating_pages)): ?>
			<div class="product-stars pull-left"><?php echo $this->helper->core->getStars($item->rating, true, 5.0) ?></div>
		<?php endif; ?>
		<?php
		if (in_array('categories', (array) $this->helper->config->get('splcategory_badge_display')))
		{
			$badges = $this->helper->media->getImages('splcategories.badge', (int) $item->spl_listing_catid, false);

			if (count($badges))
			{
				?><img src="<?php echo reset($badges) ?>" class="pull-right spl-cat-badge"/><?php
			}
		}
		?>
		<div class="clearfix"></div>
		<?php
		// Todo: Mind the call/email/query for price setting per product
		$allowed_price_display = (array) $this->helper->config->get('allowed_price_display');
		$security              = $this->helper->config->get('contact_spam_protection');

		if ($item->price_display == 0)
		{
			$price_display = $this->helper->config->get('product_price_display');
			$price_d_pages = (array) $this->helper->config->get('product_price_display_pages');

			if ($price_display > 0 && in_array('categories', $price_d_pages))
			{
				?><hr class="isolate"><?php
				$price = round($item->price_id, 3) > 0 ? $this->helper->currency->display($item->sales_price, $s_currency, $c_currency, true) : 'N/A';

				if ($price_display == 2 && round($item->list_price, 3) > 0)
				{
					?>
					<div class="pull-left">
						<del><?php echo $this->helper->currency->display($item->list_price, $s_currency, $c_currency, true) ?></del>
						<span class="product-offer">OFFER</span>
					</div>
					<div class="product-price"><?php echo $price ?></div>
					<?php
				}
				else
				{
					?><div class="product-price pull-left"><?php echo $price ?></div><?php
				}
				?><div class="clearfix"></div><?php
			}
		}
		elseif ($item->price_display == 1 && in_array(1, $allowed_price_display))
		{
			?>
			<hr class="isolate">
			<div class="center btn-toggle">
				<button type="button" class="btn btn-mini btn-default" data-toggle="true"><?php
					echo JText::_('COM_SELLACIOUS_PRODUCT_PRICE_DISPLAY_CALL_US'); ?></button>
				<button type="button" class="btn btn-mini btn-default hidden" data-toggle="true"><?php
					$mobile = $item->seller_mobile ? $item->seller_mobile : '(NO NUMBER GIVEN)';

					if ($security)
					{
						$text = $this->helper->media->writeText($mobile, 2, true);
						?><img src="data:image/png;base64,<?php echo $text; ?>"/><?php
					}
					else
					{
						echo $mobile;
					}
				?></button>
			</div>
			<div class="clearfix"></div>
			<?php
		}
		elseif ($item->price_display == 2 && in_array(2, $allowed_price_display))
		{
			?>
			<hr class="isolate">
			<div class="center btn-toggle">
				<button type="button" class="btn btn-mini btn-default" data-toggle="true"><?php
					echo JText::_('COM_SELLACIOUS_PRODUCT_PRICE_DISPLAY_EMAIL_US') ?></button>
				<button type="button" class="btn btn-mini btn-default hidden" data-toggle="true"><?php
					$seller_email = $item->seller_email ? $item->seller_email : '(NO EMAIL GIVEN)';

					if ($security)
					{
						$text = $this->helper->media->writeText($seller_email, 2, true);
						?><img src="data:image/png;base64,<?php echo $text; ?>"/><?php
					}
					else
					{
						echo $seller_email;
					}
					?></button>
			</div>
			<div class="clearfix"></div>
			<?php
		}
		elseif ($item->price_display == 3 && in_array(3, $allowed_price_display))
		{
			$title   = JText::sprintf('COM_SELLACIOUS_PRODUCT_PRICE_DISPLAY_OPEN_QUERY_FORM_FOR', $this->escape($item->title), $this->escape($item->variant_title));
			$options = array(
				'title'    => $title,
				'backdrop' => 'static',
				'keyboard' => true,
				'url'      => "index.php?option=com_sellacious&view=product&p={$item->code}&layout=query&tmpl=component",
			);

			echo JHtml::_('bootstrap.renderModal', "query-form-{$item->code}", $options);
			?>
			<hr class="isolate">
			<div class="center"><a href="#query-form-<?php echo $item->code ?>"
					role="button" data-toggle="modal" class="btn btn-mini btn-primary"><i class="fa fa-file-text"></i>
					<?php echo JText::_('COM_SELLACIOUS_PRODUCT_PRICE_DISPLAY_OPEN_QUERY_FORM') ?></a>
			</div>
			<div class="clearfix"></div>
			<?php
		}
		?>

		<hr class="isolate">
		<?php if (isset($item->variant_count) || isset($item->seller_count)): ?>
			<div class="w100p">
				<?php if (isset($item->variant_count)): ?>
					<p class="pull-left"><?php echo JText::sprintf('%d variants', $item->variant_count) ?></p>
				<?php endif; ?>

				<?php if (isset($item->seller_count)): ?>
					<p class="pull-right"><?php echo JText::sprintf('%d sellers', $item->seller_count) ?></p>
				<?php endif; ?>
				<div class="clearfix"></div>
			</div>
		<?php endif; ?>

		<?php
		$features_pages = (array) $this->helper->config->get('product_features_list');

		if (in_array('categories', $features_pages)):
			$features = json_decode($item->variant_features, true);
			$features = array_filter((array) $features, 'trim');

			if (count($features) == 0)
			{
				$features = json_decode($item->features, true);
				$features = array_filter((array) $features, 'trim');
			}

			if (count($features)):
				?>
				<ul class="product-features">
					<?php
					foreach ($features as $feature)
					{
						echo '<li>' . htmlspecialchars($feature) . '</li>';
					}
					?>
				</ul>
				<div class="clearfix"></div>
				<hr class="isolate">
			<?php endif; ?>
		<?php endif; ?>

		<?php
		$allow_checkout = $this->helper->config->get('allow_checkout');
		$compare_allow  = $this->helper->product->isComparable($item->id);
		$compare_pages  = (array) $this->helper->config->get('product_compare_display');
		$cart_pages     = (array) $this->helper->config->get('product_add_to_cart_display');
		$buynow_pages   = (array) $this->helper->config->get('product_buy_now_display');
		$show_modal     = (array) $this->helper->config->get('product_quick_detail_pages');
		?>

		<?php if (in_array('categories', $show_modal)): ?>
			<a href="#modal-<?php echo $item->code ?>" role="button" data-toggle="modal"
			   class="btn btn-mini btn-default btn-quick-view"><i class="fa fa-search"></i> Quick View</a>
		<?php endif; ?>

		<?php if ($item->price_display == 0): ?>
			<?php if ((int) $item->stock_capacity > 0): ?>
				<?php if ($allow_checkout && in_array('categories', $buynow_pages)): ?>
					<button type="button" class="btn btn-mini btn-default btn-add-cart buy"
							data-item="<?php echo $item->code; ?>" data-checkout="true"><i
							class="fa fa-shopping-cart"></i> Buy Now</button>
				<?php endif; ?>

				<?php if ($allow_checkout && in_array('categories', $cart_pages)): ?>
					<button type="button" class="btn btn-mini btn-default btn-add-cart add"
						data-item="<?php echo $item->code; ?>">
						<i class="fa fa-shopping-cart"></i> Add to Cart (<?php echo (int) $item->stock_capacity ?>)</button>
				<?php endif; ?>
				<?php else: ?>
					<label class="btn btn-mini pull-right lbl-no-stock btn-default"><i class="fa fa-times"></i> Out of Stock</label>
				<?php endif; ?>
			<?php endif; ?>

			<?php if ($compare_allow && in_array('categories', $compare_pages)): ?>
				<label class="product-compare pull-right btn btn-mini">Compare <input
						type="checkbox" class="btn-compare" data-item="<?php echo $item->code; ?>"/></label>
			<?php endif; ?>

			<div class="clearfix"></div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
