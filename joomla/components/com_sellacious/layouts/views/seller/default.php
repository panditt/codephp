<?php
/**
 * @version     1.3.3
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access
defined('_JEXEC') or die;

/** @var  $this  SellaciousViewSeller */
JHtml::_('behavior.formvalidator');
JHtml::_('stylesheet', 'com_sellacious/fe.component.css', null, true);
JHtml::_('stylesheet', 'com_sellacious/fe.view.seller.css', null, true);
?>
<script>
Joomla.submitbutton = function(task, form) {
	if (document.formvalidator.isValid(document.getElementById('seller-form'))) {
		Joomla.submitform(task, form);
	}
}
</script>
<form action="<?php echo JRoute::_('index.php?option=com_sellacious&view=seller'); ?>"
      method="post" id="seller-form" name="seller-form" class="form-horizontal">
	<fieldset>
		<div style="max-width: 410px;">
			<?php
			foreach ($this->form->getFieldsets() as $fieldset)
			{
				foreach ($this->form->getFieldset($fieldset->name) as $field)
				{
					?>
					<div class="control-group">
						<div class="control-label"><?php echo $field->label; ?></div>
						<div class="controls"><?php echo $field->input; ?></div>
					</div>
					<?php
				}
			}
			?>
			<div class="control-group">
				<div class="controls text-right">
					<button type="button" class="btn btn-default"
					        onclick="return Joomla.submitbutton('seller.save', this.form);"><?php
						echo JText::_('JSUBMIT') ?></button>
				</div>
			</div>
		</div>
	</fieldset>

	<input type="hidden" name="task"/>
	<?php echo JHtml::_('form.token'); ?>
</form>
