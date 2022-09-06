<?php
/**
 * @version     1.3.5
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access
defined('_JEXEC') or die;

/** @var  SellaciousViewProduct  $this */
/** @var  stdClass[]  $tplData */
$items = $tplData;
?>
<div class="w100p">
	<?php
	foreach ($items as $item)
	{
		$paths = $this->helper->product->getImages($item->product_id, $item->variant_id);
		$code  = $this->helper->product->getCode($item->product_id, $item->variant_id, $this->item->get('seller_uid'));
		$url   = JRoute::_('index.php?option=com_sellacious&view=product&p=' . $code);

		$link_detail = $this->helper->config->get('product_detail_page');
		?>
		<div class="product-box">
			<div class="image-box">
				<?php if ($link_detail): ?><a href="<?php echo $url ?>"><?php else: ?><a><?php endif; ?>
					<img src="<?php echo reset($paths) ?>" title="<?php echo htmlspecialchars($item->product_title) ?>"/></a>
			</div>
			<div class="product-info-box">
				<div class="product-title"><?php
					if ($link_detail): ?><a href="<?php echo $url ?>"><?php else: ?><a><?php endif;
							echo $item->product_title; ?>&nbsp;<?php echo $item->variant_title; ?></a></div>
				<div><?php echo $item->product_sku; ?>&nbsp;<?php echo $item->variant_sku; ?></div>
			</div>
			<div class="clearfix"></div>
		</div>
		<?php
	}
	?>
</div>
