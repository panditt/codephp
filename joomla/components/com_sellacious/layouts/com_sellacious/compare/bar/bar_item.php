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

/** @var  stdClass  $displayData */
$item = $displayData;

$url = JRoute::_('index.php?option=com_sellacious&view=product&p=' . $item->code);

?><table class="w100p">
	<tr>
		<td class="compare-item-image"><?php
			?><img src="<?php echo reset($item->images) ?>"
					   title="<?php echo htmlspecialchars($item->title) ?>"/></td>
		<td class="compare-item-title"><a href="<?php echo $url ?>"><?php
			echo $item->title ?> <?php echo $item->variant_title ?></a></td>
		<td style="width:12px;"><a class="compare-remove" data-item="<?php echo $item->code ?>"><i class="fa fa-times-circle"></i></a></td>
	</tr>
</table><?php
?><?php


