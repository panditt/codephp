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
JHtml::_('bootstrap.tooltip', '.hasTooltip');

JHtml::_('script', 'com_sellacious/util.imageslider.js', true, true);
JHtml::_('stylesheet', 'com_sellacious/util.imageslider.css', null, true);

$imH = (int) $this->helper->config->get('image_slider_height', 270);
$imW = (int) $this->helper->config->get('image_slider_width', 270);
$imA = (int) $this->helper->config->get('image_slider_size_adjust') ?: 'contain';

$images = $this->item->get('images');
?>
<style>
div#product-image {
	height: <?php echo $imH ?>px;
	width: <?php echo $imW ?>px;
	background-size: <?php echo $imA ?>;
}
</style>
<div id="product-images-container" class="pull-left">
	<div id="product-images">
		<?php $image = reset($images) ?>
		<div id="product-image" class="thin-border"
			style="background-image: url(<?php echo $image ?>);"
			data-src="<?php echo htmlspecialchars($image) ?>">
		</div>
		<div id="product-thumbs">
			<div><?php
				foreach ($images as $i => $image)
				{
					?><img src="<?php echo $image ?>" class="thin-border hasTooltip"/><?php
				}
			?></div>
		</div>
	</div>
</div>
