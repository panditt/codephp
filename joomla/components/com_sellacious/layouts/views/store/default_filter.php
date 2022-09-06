<?php
/**
 * @version     1.4.2
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access
defined('_JEXEC') or die;

// @var  SellaciousViewProducts $this */
$app = JFactory::getApplication();

JHtml::_('script', 'com_sellacious/fe.view.products.filter.js', false, true);
?>
<div class="w100p closed-on-phone" id="sell-filter">
	<div class="filter-head">
		<span class="pull-right"><i class="fa fa-caret-right fa-lg hidden"></i>&nbsp;
			<i class="fa fa-caret-down fa-lg"></i>&nbsp;</span> Refine Search&hellip;</div>
	<form method="post" action="<?php echo JUri::getInstance()->toString(array('path', 'query', 'fragment')); ?>">
		<div class="filter-snap-in">
			<div class="search-filter pull-left">
				<input type="text" name="filter[zip]" id="filter_zip" value="<?php
					   echo $this->state->get('filter.zip'); ?>" placeholder="ZIP Code&hellip;" autocomplete="off"/></div>
			<button id="btn-filter_zip" class="btn btn-default" onclick="this.form.submit();"><i class="fa fa-search"></i></button>
		</div>
		<div class="filter-snap-in">
			<div class="filter-category">Shop By Category</div>
			<ul class="unstyled">
				<?php
				$cat_id   = $this->state->get('filter.category_id', 1);
				$store_id = $this->state->get('store.id');

				foreach ($this->categories as $category)
				{
					$link   = sprintf('index.php?option=com_sellacious&view=store&id=%d&filter[category_id]=%s', $store_id, $category->id);
					$strong = $this->state->get('filter.category_id', 1) == $category->id ? 'strong' : '';
					$prefix = str_repeat('&nbsp;&nbsp;&nbsp;', max(0, $category->level - 1) + ($category->id > 1 && $cat_id > 1));
					$title  = $category->id > 1 ? htmlspecialchars($category->title) : 'Show All';
					?>
					<li class="category-link"><?php
					echo $prefix ?><a href="<?php echo $link ?>"
					class="<?php echo $strong ?>"><small><i class="fa fa-chevron-right"></i></small> <?php echo $title ?></a></li><?php
				}
				?>
			</ul>
		</div>
		<?php
		foreach ($this->filters as $filter)
		{
			?>
			<div class="filter-snap-in">
				<div class="filter-title">
					<div title="<?php echo htmlspecialchars($filter->title) ?>">
						<span><i class="fa fa-caret-right fa-lg unfold"></i>
							<i class="fa fa-caret-down fa-lg fold"></i></span>
						<?php echo $filter->title ?>
					</div>
					<span class="pull-right clear-filter hasTooltip" title="Reset">&times;</span>
					<div class="clearfix"></div>
				</div>
				<div class="search-filter"><input type="text" title="filter" placeholder="Search&hellip;"/></div>
				<ul class="filter-choices unstyled">
					<?php
					if (count($filter->choices))
					{
						foreach ($filter->choices as $ck => $choice)
						{
							?>
							<li class="filter-choice">
							<label class="<?php echo $choice->disabled ? 'disabled' : '' ?>">
								<input type="checkbox" name="filter[fields][f<?php echo $filter->id ?>][]"
									id="filter_fields_f<?php echo $filter->id ?>_<?php echo (int) $ck ?>"
									value="<?php echo htmlspecialchars($choice->value) ?>" onclick="this.form.submit();"
									<?php echo $choice->selected ? 'checked' : '' ?>
									<?php echo $choice->disabled ? ' disabled' : '' ?>/>
								<?php echo $this->helper->field->renderValue($choice->value, $filter->type) ?>
							</label>
							</li><?php
						}
					}
					else
					{
						?><!--<li class="filter-choice"><label><input type="checkbox" checked disabled />&nbsp;All</label></li>--><?php
					}
					?>
				</ul>
			</div>
			<?php
		}
		?>
		<input type="hidden" name="option" value="com_sellacious"/>
		<input type="hidden" name="view" value="store"/>
		<input type="hidden" name="id" value="<?php echo $this->state->get('store.id') ?>"/>

		<?php // Extra checkbox emulation to allow deselect all others and still overwrite userState ?>
		<input type="hidden" name="filter[fields][f0][]" value="0"/>
		<input type="hidden" name="filter[category_id]" value="<?php echo $this->state->get('filter.category_id', 1); ?>"/>

		<input type="hidden" name="layout" value="<?php echo $app->input->get('layout'); ?>"/>
		<input type="hidden" name="tmpl" value="<?php echo $app->input->get('tmpl', 'index'); ?>"/>
		<?php echo JHtml::_('form.token'); ?>
	</form>
</div>
