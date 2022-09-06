<?php
/**
 * @version     1.4.2
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     SPL Sellacious Private License; see http://www.sellacious.com/spl.html
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access
defined('_JEXEC') or die;

/** @var SellaciousViewUser $this */

JHtml::_('jquery.framework');

JHtml::_('behavior.keepalive');
JHtml::_('bootstrap.tooltip');
JHtml::_('behavior.formvalidation');

JText::script('COM_SELLACIOUS_VALIDATION_FORM_FAILED');

JHtml::_('script', 'com_sellacious/fe.view.profile.js', false, true);
JHtml::_('stylesheet', 'com_sellacious/fe.view.profile.css', null, true);
JHtml::_('stylesheet', 'com_sellacious/fe.view.profile.css', null, true);

$fieldsets = $this->form->getFieldsets();
$accordion = array('parent' => true, 'toggle' => false, 'active' => 'profile_accordion_basic');

echo JHtml::_('bootstrap.startAccordion', 'profile_accordion', $accordion);
?>
<form action="<?php echo JUri::getInstance()->toString(); ?>"
	method="post" name="adminForm" id="adminForm" class="form-validate form-horizontal">

	<?php foreach ($fieldsets as $key => $fieldset): ?>
		<?php $fields = $this->form->getFieldset($fieldset->name); ?>
		<?php if (array_filter($fields, function ($field) { return !$field->hidden; })): ?>
		<?php echo JHtml::_('bootstrap.addSlide', 'profile_accordion', JText::_($fieldset->label), 'profile_accordion_' . $key, 'accordion'); ?>
		<fieldset class="w100p">
			<?php
			foreach ($fields as $field):
				if ($field->hidden):
					echo $field->input;
				else:
					?>
					<div class="control-group">
						<?php if ($field->label && (!isset($fieldset->width) || $fieldset->width < 12)): ?>
							<div class="control-label"><?php echo $field->label ?></div>
							<div class="controls"><?php echo $field->input ?></div>
						<?php else: ?>
							<div class="controls col-md-12"><?php echo $field->input ?></div>
						<?php endif; ?>
					</div>
					<?php
				endif;
			endforeach;
			?>
		</fieldset>
		<div class="clearfix"></div>
		<?php echo JHtml::_('bootstrap.endSlide'); ?>
		<?php endif; ?>
	<?php endforeach; ?>

	<input type="hidden" name="task" value="register.save"/>
	<?php echo JHtml::_('form.token'); ?>

	<br>
	<button type="submit" class="pull-right">SAVE</button>

</form>

<?php echo JHtml::_('bootstrap.endAccordion'); ?>
<div class="clearfix"></div>
