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

/** @var  stdClass $displayData */
$field = (object)$displayData;

$class     = !empty($field->class) ? ' class="btn-group ' . $field->class . '"' : ' class="btn-group"';
$required  = $field->required ? ' required aria-required="true"' : '';
$autofocus = $field->autofocus ? ' autofocus' : '';
$disabled  = $field->disabled ? ' disabled' : '';
$readonly  = $field->readonly;
$value     = $field->value;
$percent   = substr($field->value, -1) == '%';
?>
<div id="<?php echo $field->id ?>_wrap" <?php echo $class ?> data-toggle="buttons">
	<input type="hidden" name="<?php echo $field->name ?>" id="<?php echo $field->id ?>" value="<?php echo $value ?>"/>
	<input type="text" id="<?php echo $field->id ?>_ui" value="<?php echo $value ?>"
		   class="form-control w100px pull-left <?php echo $required ?>" <?php echo $required . $autofocus ?>
		   placeholder="Amount"/>
	<?php
	// sprintf: class, disabled, value, checked, required, disabled, label
	$choice = <<<HTML
	<label class="btn btn-default pull-left %s" %s>
		<input type="radio" name="{$field->id}_radio" value="%s" %s %s/>
		<span>%s</span>
	</label>
HTML;

	$value      = '%';
	$label      = '%';
	$checked    = $percent ? ' checked="checked"' : '';
	$o_class    = $percent ? ' active' : '';
	$o_disabled = $disabled || ($readonly && !$checked) ? ' disabled' : '';

	echo sprintf($choice, $o_class, $o_disabled, $value, $checked, $o_disabled, $label);

	$value      = '';
	$label      = $field->currency;
	$checked    = $percent ? '' : ' checked="checked"';
	$o_class    = $percent ? '' : ' active';
	$o_disabled = $disabled || ($readonly && !$checked) ? ' disabled' : '';

	echo sprintf($choice, $o_class, $o_disabled, $value, $checked, $o_disabled, $label);
	?>
</div>
