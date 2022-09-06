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

use Joomla\Registry\Registry;

/** @var  SellaciousViewStore  $this */
JHtml::_('behavior.framework');
JHtml::_('jquery.framework');

// We may later decide not to use cart aio assets and separate the logic
JHtml::_('script', 'media/com_sellacious/js/plugin/select2-3.5/select2.js', false, false);
JHtml::_('stylesheet', 'media/com_sellacious/js/plugin/select2-3.5/select2.css', null, false);

if ($this->helper->config->get('product_compare')):
	JHtml::_('script', 'com_sellacious/util.compare.js', false, true);
endif;

JHtml::_('script', 'com_sellacious/isotope.pkgd.min.js', false, true);
JHtml::_('script', 'com_sellacious/util.rollover.js', false, true);
JHtml::_('script', 'com_sellacious/util.cart.aio.js', false, true);
JHtml::_('script', 'com_sellacious/fe.view.products.js', false, true);

JHtml::_('stylesheet', 'com_sellacious/font-awesome.min.css', null, true);
JHtml::_('stylesheet', 'com_sellacious/fe.component.css', null, true);
JHtml::_('stylesheet', 'com_sellacious/util.rating.css', null, true);
JHtml::_('stylesheet', 'com_sellacious/fe.view.products.css', null, true);
JHtml::_('stylesheet', 'com_sellacious/fe.view.products.list.css', null, true);
JHtml::_('stylesheet', 'com_sellacious/fe.view.store.css', null, true);

$styles   = array();
$seller   = new Joomla\Registry\Registry($this->seller);
$logo     = $this->helper->media->getImage('sellers.logo', $seller->get('id'));
$rateable = (array) $this->helper->config->get('allow_ratings_for');
?>
<div id="seller-info">
	<div class="pull-right"><img
		class="seller-logo" src="<?php echo $logo ?>"
		alt="<?php echo htmlspecialchars($seller->get('title'), ENT_COMPAT, 'UTF-8'); ?>"></div>
	<h2><?php echo $seller->get('store_name') ?: $seller->get('title') ?></h2>
	<div class="store-address"><?php echo nl2br($seller->get('store_address')) ?></div>
	<?php if (in_array('seller', $rateable)): ?>
		<?php $stars = round($seller->get('rating.rating', 0) * 2); ?>
		<div class="product-rating rating-stars star-<?php echo $stars ?>"><?php
			echo number_format($seller->get('rating.rating', 0), 1) ?></div><?php
		echo '<span> &nbsp;–&nbsp; </span>';
		echo JText::plural('COM_SELLACIOUS_RATINGS_COUNT_N', $seller->get('rating.count'));
	endif;
	?>
	<div class="clearfix"></div>
</div>
<div class="w100p">
	<?php
	foreach ($this->filters as $filter)
	{
		$selected = array();

		foreach ($filter->choices as $ck => $choice)
		{
			if ($choice->selected)
			{
				$selected[$ck] = $choice;
			}
		}

		if (count($selected))
		{
			?><div class="btn-group">
				<label class="btn btn-small active btn-info cursor-normal"><?php echo $filter->title ?>:</label>
			<?php
			foreach ($selected as $ck => $choice)
			{
				?>
				<label for="filter_fields_f<?php echo $filter->id ?>_<?php echo (int) $ck ?>"
					class="btn btn-small btn-default"><?php
						echo $this->helper->field->renderValue($choice->value, $filter->type); ?>
							<i class="fa fa-times cursor-pointer"></i></label><?php
			}
			?></div><?php
		}
	}
	?>
</div>
<div class="clearfix"></div>
<?php
$filter_position = $this->helper->config->get('product_filter_position');

$options = array(
	'title'    => JText::_('COM_SELLACIOUS_CART_TITLE'),
	'backdrop' => 'static',
);
echo JHtml::_('bootstrap.renderModal', 'modal-cart', $options);

$active_layout = $this->helper->config->get('list_style', 'grid');

if ($this->helper->config->get('list_style_switcher', 1)): ?>
<div class="btn-group padding-10" data-toggle="radio">
	<button data-style="grid-layout" class="btn btn-primary switch-style <?php echo $active_layout == 'grid' ? 'active' : '' ?>"><i
			class="fa fa-th"></i> </button>
	<button data-style="list-layout" class="btn btn-primary switch-style <?php echo $active_layout == 'list' ? 'active' : '' ?>"><i
			class="fa fa-list"></i> </button>
</div>
<div class="clearfix"></div>
<?php else: ?>
	<button data-style="<?php echo $active_layout ?>-layout" class="hidden switch-style active"></button>
<?php endif; ?>

<div id="products-page" class="w100p">
	<?php $class = $filter_position == 'left' ? 'pull-left' : 'pull-right'; ?>
	<div id="filter-box" class="<?php echo $class ?>"><span class="text-left"><?php
		echo $this->loadTemplate('filter'); ?></span>
	</div>
	<div id="products-box" class="left">
		<?php
		foreach ($this->items as $item)
		{
			$cat_id = (int) $item->spl_listing_catid;

			if (!isset($styles[$cat_id]))
			{
				$style = '';
				$css   = new Registry($item->spl_listing_params);

				foreach ($css as $css_k => $css_v)
				{
					$style .= "$css_k: $css_v;";
				}

				$styles[$cat_id] = ".grid-layout .spl-cat-$cat_id { $style }" . ".list-layout .spl-cat-$cat_id { $style }";
			}

			echo $this->loadTemplate('block', $item);
		}

		$doc = JFactory::getDocument();
		$doc->addStyleDeclaration(implode("\n", $styles));
		?>
		<div class="clearfix"></div>
	</div>
</div>
<div class="clearfix"></div>
<input type="hidden" name="<?php echo JSession::getFormToken() ?>" id="formToken" value="1"/>
