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

// @var  SellaciousViewCategories $this */
$item   = $this->current;
$paths  = $this->helper->media->getImages('categories', $item->id, true);
$suffix = $item->parent_id > 1 ? '&parent_id=' . $item->parent_id : '';
$url    = JRoute::_('index.php?option=com_sellacious&view=categories' . $suffix);
?>
<div class="category-box-parent" data-rollover="container">
	<a href="<?php echo $url ?>" class="btn btn-mini btn-primary pull-right"><i class="fa fa-chevron-left"></i> &nbsp; BACK</a>
	<h1><?php echo $item->title; ?></h1>
	<?php if ($this->state->get('show_description')): ?>
	<div class="cat-text">
		<div class="image-wrap"><div class="image-box">
			<img src="<?php echo reset($paths) ?>"
				 title="<?php echo htmlspecialchars($item->title) ?>"
				 data-rollover="<?php echo htmlspecialchars(json_encode($paths)) ?>"/>
		</div></div>
		<?php echo $item->description ?>
	</div>
	<?php endif; ?>
</div>
