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

/** @var stdClass[] $displayData */
foreach ($displayData as $i => $address)
{
	?>
	<li class="address-item" id="address-item-<?php echo (int) $address->id ?>">
		<div class="input-group pull-right address-action">
			<button type="button" class="btn btn-small btn-default hasTooltip remove-address"
			        data-placement="bottom" data-id="<?php echo (int) $address->id ?>"
			        title="Delete"><i class="fa fa-trash-o"></i></button>
			<a href="#address-form-<?php echo (int) $address->id ?>"
			   role="button" data-toggle="modal" data-placement="bottom"
			   class="btn btn-small btn-default hasTooltip" title="Edit"><i class="fa fa-edit"></i></a>
		</div>
		<?php echo JLayoutHelper::render('com_sellacious.user.address.box', $address); ?>
	</li>
	<?php
}
