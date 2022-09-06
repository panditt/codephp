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

/** @var  array $displayData */
$field = (object)$displayData;
$files = $field->value ? (array)$field->value : array();
?>
<div class="jff-fileplus-wrapper" id="<?php echo $field->id ?>_wrapper">
	<div class="jff-fileplus-inactive hidden">
		<div class="alert adjusted alert-info fade in">
			<i class="fa fa-fw fa-lg fa-exclamation"></i>
			<?php echo JText::_('COM_SELLACIOUS_ADD_FILES_SAVE_ITEM_FIRST'); ?>
		</div>
	</div>
	<div class="jff-fileplus-active hidden">
		<table class="w100p jff-fileplus-add-controls">
			<tr>
				<td>
					<a class="btn btn-sm btn-primary jff-fileplus-add pull-left"><i
							class="fa fa-upload"></i>&nbsp;<?php echo JText::_('COM_SELLACIOUS_MSG_UPLOAD_MORE') ?></a>
				</td>
			</tr>
		</table>
		<?php echo $field->fileinput; ?>
		<div class="clearfix"></div>
		<ul class="list-unstyled jff-fileplus-list pull-left">
			<?php
			foreach ($files as $file)
			{
				$options = array('client' => 2, 'debug' => 0);
				echo JLayoutHelper::render('com_sellacious.formfield.fileplus.rowtemplate', (object)$file, '', $options);
			}
			?>
		</ul>
	</div>
</div>
