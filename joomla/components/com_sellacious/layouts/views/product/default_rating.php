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

/** @var   SellaciousViewProduct  $this */
$form = $this->getReviewForm();

// Only proceed if it is a valid JForm
if (!($form instanceof JForm) || count($fieldset = $form->getFieldset()) == 0)
{
	return;
}
?>
<br>
<div id="reviewBox">
<h4 class="center uppercase"><?php echo JText::_('COM_SELLACIOUS_TITLE_RATINGS') ?></h4>
<form action="<?php echo JUri::getInstance()->toString(); ?>" method="post" name="ratingForm"
	  id="ratingForm" class="form-validate form-vertical" enctype="multipart/form-data">

	<fieldset>
		<button type="button" class="btn btn-default pull-right" style="margin: 2px 3px -30px auto;"
				onclick="Joomla.submitform('product.saveRating', this.form);"><i class="fa fa-edit"></i> Submit</button>

		<?php
		echo $form->getInput('product_id');
		echo $form->getInput('variant_id');
		echo $form->getInput('seller_uid');
		?>

		<table class="w100p tbl-rating">
			<tbody>
			<?php if ($field = $form->getField('author_name')): ?>
				<tr>
					<th style="width: 130px;">
						<?php echo $field->label; ?>
					</th>
					<td>
						<?php echo $field->input; ?>
					</td>
				</tr>
			<?php endif; ?>
			<?php if ($field = $form->getField('author_email')): ?>
				<tr>
					<th style="width: 130px;">
						<?php echo $field->label; ?>
					</th>
					<td>
						<?php echo $field->input; ?>
					</td>
				</tr>
			<?php endif; ?>
			<?php if ($field = $form->getField('rating', 'product')): ?>
			<tr>
				<th style="width: 130px;">
					<?php echo $field->label; ?>
				</th>
				<td>
					<?php echo $field->input; ?>
				</td>
			</tr>
			<?php endif; ?>
			<?php if ($field = $form->getField('title', 'product')): ?>
			<tr>
				<td colspan="2">
					<?php echo $field->input; ?>
				</td>
			</tr>
			<?php endif; ?>
			<?php if ($field = $form->getField('comment', 'product')): ?>
			<tr>
				<td colspan="2">
					<?php echo $field->input; ?>
				</td>
			</tr>
			<?php endif; ?>

			<?php
			$fieldSR[] = $form->getField('rating', 'seller');
			$fieldSR[] = $form->getField('rating', 'packaging');
			$fieldSR[] = $form->getField('rating', 'shipment');
			$fieldSR   = array_filter($fieldSR);

			if (count($fieldSR)): ?>
			<tr>
				<td colspan="2" class="nopadding">
					<?php foreach ($fieldSR as $field): ?>
					<table class="pull-left table-nopadding">
						<tr>
							<td class="nowrap" style="width: 134px;"><?php echo $field->label; ?></td>
							<td class="nowrap" style="width: 134px;"><?php echo $field->input; ?></td>
						</tr>
					</table>
					<?php endforeach; ?>
				</td>
			</tr>
			<?php endif; ?>

			<?php if ($field = $form->getField('title', 'seller')): ?>
			<tr>
				<td colspan="2">
					<?php echo $field->input; ?>
				</td>
			</tr>
			<?php endif; ?>
			<?php if ($field = $form->getField('comment', 'seller')): ?>
			<tr>
				<td colspan="2">
					<?php echo $field->input; ?>
				</td>
			</tr>
			<?php endif; ?>

			<?php if ($field = $form->getField('title', 'packaging')): ?>
			<tr>
				<td colspan="2">
					<?php echo $field->input; ?>
				</td>
			</tr>
			<?php endif; ?>
			<?php if ($field = $form->getField('comment', 'packaging')): ?>
			<tr>
				<td colspan="2">
					<?php echo $field->input; ?>
				</td>
			</tr>
			<?php endif; ?>

			<?php if ($field = $form->getField('title', 'shipment')): ?>
			<tr>
				<td colspan="2">
					<?php echo $field->input; ?>
				</td>
			</tr>
			<?php endif; ?>
			<?php if ($field = $form->getField('comment', 'shipment')): ?>
			<tr>
				<td colspan="2">
					<?php echo $field->input; ?>
				</td>
			</tr>
			<?php endif; ?>

			</tbody>
		</table>
	</fieldset>

	<input type="hidden" name="task" value=""/>
	<?php echo JHtml::_('form.token'); ?>
</form>
</div>
