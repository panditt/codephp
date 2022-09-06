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

/** @var  stdClass  $tplData */
$item   = $tplData;

/** @var  SellaciousViewCategories $this */
$paths = $this->helper->media->getImages('categories', $item->id, true);
$url   = JRoute::_('index.php?option=com_sellacious&view=categories&parent_id=' . $item->id);
?>
<div class="category-box" data-rollover="container">
	<a href="<?php echo $url ?>">
		<h6><?php echo $item->title; ?></h6>
		<div class="image-wrap">
			<div class="image-box">
				<img src="<?php echo reset($paths) ?>"
					 data-rollover="<?php echo htmlspecialchars(json_encode(array_filter($paths))); ?>"/>
			</div>
		</div>
	</a>
	<?php if (isset($item->product_count) || isset($item->subcat_count)): ?>
	<div class="item-counts-strip">
		<div class="tip-left"><?php
			if (isset($item->product_count))
			{
				echo JText::plural('COM_SELLACIOUS_CATEGORY_PRODUCT_COUNT_N', $item->product_count);
			}
		?></div>
		<div class="tip-right"><?php
			if (isset($item->subcat_count))
			{
				echo JText::plural('COM_SELLACIOUS_CATEGORY_SUBCATEGORIES_COUNT_N', $item->subcat_count);
			}
		?></div>
	</div>
	<?php endif; ?>
</div>
