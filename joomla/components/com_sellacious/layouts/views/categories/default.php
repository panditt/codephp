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
JHtml::_('jquery.framework');
JHtml::_('script', 'com_sellacious/util.rollover.js', false, true);
JHtml::_('stylesheet', 'com_sellacious/fe.view.categories.css', null, true);

$category_id = 1;

if (!empty($this->current->id))
{
	$category_id = $this->current->id;

	echo $this->loadTemplate('head');
}

foreach ($this->items as $item)
{
	echo $this->loadTemplate('block', $item);
}

?><div class="clearfix"></div><?php

if (count($this->products))
{
	$url = JRoute::_('index.php?option=com_sellacious&view=products&filter[category]=' . $category_id);
	?>
	<br>
	<legend id="products-heading">PRODUCTS</legend>
	<a id="view-all-products" class="btn btn-mini btn-info pull-right" href="<?php echo $url ?>">VIEW ALL PRODUCTS &nbsp;
		<i class="fa fa-chevron-right"></i></a>
	<br><div class="clearfix"></div>
	<?php
	echo $this->loadTemplate('products');
}
