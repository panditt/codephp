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

/** @var  SellaciousViewWishlist $this */
/** @var  stdClass $tplData */
$item = $tplData;

$url_raw = 'index.php?option=com_sellacious&view=product&p=' . $item->code;
$url     = JRoute::_($url_raw);
$url_m   = JRoute::_($url_raw . '&layout=modal&tmpl=component');
$paths   = (array) $item->images;
$params  = array(
	'title'    => $item->title,
	'url'      => $url_m,
	'keyboard' => true
);

$c_currency = $this->helper->currency->current('code_3');
$s_currency = $this->helper->currency->forSeller($item->seller_uid, 'code_3');

$allow_checkout = $this->helper->config->get('allow_checkout');
?>
<div class="product-box w100p" data-rollover="container">

	<?php echo JHtml::_('bootstrap.renderModal', 'modal-' . $item->code, $params); ?>

	<div class="item-hover-actions">
		<?php $show_modal = (array) $this->helper->config->get('product_quick_detail_pages'); ?>
		<?php if (in_array('products', $show_modal)): ?>
			<div class="tip-left">
				<a href="#modal-<?php echo $item->code ?>" role="button" data-toggle="modal"
					class="btn btn-mini btn-default"><i class="fa fa-search"></i> Quick View</a>
			</div>
		<?php endif; ?>

		<?php $buynow_pages = (array) $this->helper->config->get('product_buy_now_display'); ?>
		<?php if ($allow_checkout && $item->stock_capacity > 0 && $item->price_display == 0 && in_array('products', $buynow_pages)): ?>
			<div class="tip-right">
				<button type="button" data-item="<?php echo $item->code; ?>"
					class="btn btn-mini btn-default btn-add-cart strong" data-checkout="true"><i
						class="fa fa-shopping-cart"></i> Buy Now</button>
			</div>
		<?php endif; ?>
	</div>

	<?php $link_detail = $this->helper->config->get('product_detail_page'); ?>
	<?php if ($link_detail): ?>
		<div class="image-box"><a
			href="<?php echo $url ?>"><img src="<?php echo reset($paths) ?>"
			title="<?php echo htmlspecialchars($item->title) ?>"
			data-rollover="<?php echo htmlspecialchars(json_encode($paths)) ?>" /></a>
		</div>
		<div class="product-title"><a href="<?php echo $url ?>"><?php
			echo $item->title; ?>&nbsp;<?php echo $item->variant_title; ?></a></div>
	<?php else: ?>
		<div class="image-box"><a><img src="<?php echo reset($paths) ?>"
			title="<?php echo htmlspecialchars($item->title) ?>"
			data-rollover="<?php echo htmlspecialchars(json_encode($paths)) ?>" /></a></div>
		<div class="product-title"><a><?php
			echo $item->title; ?>&nbsp;<?php echo $item->variant_title; ?></a></div>
	<?php endif; ?>

	<?php $allow_rating = $this->helper->config->get('product_rating'); ?>
	<?php $rating_pages = (array) $this->helper->config->get('product_rating_display'); ?>
	<?php if ($allow_rating && in_array('products', $rating_pages)): ?>
		<div class="rating-stars star-<?php echo $item->rating * 2 ?>"><?php echo number_format($item->rating, 1) ?></div>
	<?php endif; ?>

	<span class="stock-level"><?php echo $item->stock_capacity ?
			'<span class="label label-success">IN STOCK</span>' : '<span class="label label-warning">OUT OF STOCK</span>' ?></span>

	<a href="#" class="btn-remove btn btn-info btn-mini hasTooltip" data-item="<?php echo $item->code ?>"
		title="Remove"><i class="fa fa-times-circle fa-lg"></i> Remove from Wishlist</a>
	<br>

	<div class="isolate"></div>

	<!-- // todo: Mind the call/email/query for price setting per product  -->
	<?php
	$allowed_price_display = (array) $this->helper->config->get('allowed_price_display');
	$security              = $this->helper->config->get('contact_spam_protection');

	if ($item->price_display == 0)
	{
		$price_display = $this->helper->config->get('product_price_display');
		$price_d_pages = (array) $this->helper->config->get('product_price_display_pages');

		if ($price_display > 0 && in_array('products', $price_d_pages))
		{
			$price = round($item->price_id, 3) > 0 ? $this->helper->currency->display($item->sales_price, $s_currency, $c_currency, true) : 'N/A';

			if ($price_display == 2 && round($item->list_price, 3) > 0)
			{
				?>
				<div class="pull-left">
					<del><?php echo $this->helper->currency->display($item->list_price, $s_currency, $c_currency, true) ?></del>
					<span class="product-offer">OFFER</span>
				</div>
				<div class="product-price pull-right"><?php echo $price ?></div><?php
			}
			else
			{
				?><div class="product-price pull-left"><?php echo $price ?></div><?php
			}
		}
	}
	elseif ($item->price_display == 1 && in_array(1, $allowed_price_display))
	{
		?>
		<div class="center btn-toggle">
			<button type="button"
				class="btn btn-mini btn-default" data-toggle="true"><?php
				echo JText::_('COM_SELLACIOUS_PRODUCT_PRICE_DISPLAY_CALL_US') ?></button>
			<button type="button" class="btn btn-mini btn-default hidden" data-toggle="true"><?php
				if ($security)
				{
					$text = $this->helper->media->writeText($item->mobile, 2, true);
					?><img src="data:image/png;base64,<?php echo $text; ?>"/><?php
				}
				else
				{
					echo $item->mobile;
				}
				?></button>
		</div>
		<?php
	}
	elseif ($item->price_display == 2 && in_array(2, $allowed_price_display))
	{
		?>
		<div class="center btn-toggle">
			<button type="button"
				class="btn btn-mini btn-default" data-toggle="true"><?php
				echo JText::_('COM_SELLACIOUS_PRODUCT_PRICE_DISPLAY_EMAIL_US') ?></button>
			<button type="button" class="btn btn-mini btn-default hidden"
				data-toggle="true"><?php
				if ($security)
				{
					$text = $this->helper->media->writeText($item->email, 2, true);
					?><img src="data:image/png;base64,<?php echo $text; ?>"/><?php
				}
				else
				{
					echo $item->email;
				}
				?></button>
		</div>
		<?php
	}
	elseif ($item->price_display == 3 && in_array(3, $allowed_price_display))
	{
		$options = array(
			'title'    => JText::sprintf('COM_SELLACIOUS_PRODUCT_PRICE_DISPLAY_OPEN_QUERY_FORM_FOR', $item->title, $item->variant_title),
			'backdrop' => 'static',
			'height'   => '450',
			'keyboard' => true,
			'url'      => "index.php?option=com_sellacious&view=product&p={$item->code}&layout=query&tmpl=component",
		);

		echo JHtml::_('bootstrap.renderModal', "query-form-{$item->code}", $options);
		?>
		<div class="center"><a href="#query-form-<?php echo $item->code ?>"
				role="button" data-toggle="modal" class="btn btn-mini btn-default"><i class="fa fa-file-text"></i>
				<?php echo JText::_('COM_SELLACIOUS_PRODUCT_PRICE_DISPLAY_OPEN_QUERY_FORM') ?></a>
		</div>
		<?php
	}
	?>
	<br>
	<div class="product-text"><?php echo JHtml::_('string.truncate', strip_tags($item->description), 190) ?></div>
	<div class="clearfix"></div>
	<div class="product-box-foot">
		<?php
		$allow_checkout = $this->helper->config->get('allow_checkout');
		$compare_allow  = $this->helper->product->isComparable($item->id);
		$compare_pages  = (array) $this->helper->config->get('product_compare_display');
		$cart_pages     = (array) $this->helper->config->get('product_add_to_cart_display');

		if ($compare_allow && in_array('products', $compare_pages)): ?>
			<label class="product-compare pull-right btn btn-mini btn-default">Compare <input
					type="checkbox" class="btn-compare" data-item="<?php echo $item->code; ?>" /></label>
		<?php endif; ?>

		<?php if ($allow_checkout && $item->price_display == 0 && in_array('products', $cart_pages)): ?>
			<?php if ($item->stock_capacity): ?>
				<button type="button" class="btn btn-mini btn-default pull-left btn-add-cart" style="margin: 1px 0"
					data-item="<?php echo $item->code; ?>">
					<i class="fa fa-shopping-cart"></i> Add to Cart (<?php echo (int) $item->stock_capacity ?>)
				</button>
			<?php else: ?>
				<button type="button" class="btn btn-mini btn-default pull-left disabled" style="margin: 1px 0"><i
						class="fa fa-times"></i> Out of Stock</button>
			<?php endif; ?>
		<?php endif; ?>
		<div class="clearfix"></div>
	</div>
</div>
