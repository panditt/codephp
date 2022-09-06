<?php
/**
 * @version     1.4.0
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access
defined('_JEXEC') or die;

/** @var SellaciousViewProduct $this */
$choices = $this->getVariantChoices();

if (count($choices))
{
	?>
	<form action="<?php echo JUri::getInstance()->toString() ?>" method="post" id="varForm" name="varForm">
		<div class="variant-picker">
			<?php foreach ($choices as $choice): ?>
			<div class="variant-choice pull-left">
				<label><?php echo $choice->title ?>
					<select class="variant_spec" name="jform[variant_spec][<?php echo $choice->id ?>]">
					<?php if (count($choice->available)): ?>
						<optgroup label="Available">
							<?php
							foreach ($choice->available as $value)
							{
								$o_value  = htmlspecialchars($value);
								$o_text   = $this->helper->field->renderValue($value, $choice->type);
								$selected = $choice->selected == $value ? ' selected' : '';
								$url      = JRoute::_('index.php?option=com_sellacious&view=product&p=' . $this->state->get('product.code'));
								?>
								<option value="<?php echo $o_value ?>" <?php echo $selected ?>><?php echo $o_text ?></option><?php
							}
							?>
						</optgroup>
					<?php endif; ?>
					<?php if (count($choice->unavailable)): ?>
						<optgroup label="Unavailable">
							<?php
							foreach ($choice->unavailable as $value)
							{
								$o_value  = htmlspecialchars($value);
								$o_text   = $this->helper->field->renderValue($value, $choice->type);
								$selected = $choice->selected == $value ? ' selected' : '';
								$url      = JRoute::_('index.php?option=com_sellacious&view=product&p=' . $this->state->get('product.code'));
								?>
								<option value="<?php echo $o_value ?>" <?php echo $selected ?>><?php echo $o_text ?></option><?php
							}
							?>
						</optgroup>
					<?php endif; ?>
					</select>
				</label>
			</div>
			<?php endforeach; ?>
			<div class="clearfix"></div>
		</div>
		<input type="hidden" name="option" value="com_sellacious"/>
		<input type="hidden" name="view" value="product"/>
		<input type="hidden" name="task" value=""/>
		<input type="hidden" name="p" value="<?php echo $this->state->get('product.code') ?>"/>

		<?php echo JHtml::_('form.token'); ?>
	</form>
	<div class="clearfix"></div>
	<hr class="isolate"/>
	<?php
}

