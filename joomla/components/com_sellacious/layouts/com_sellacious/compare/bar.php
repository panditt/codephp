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

/** @var   JLayoutFile $this */
/** @var   stdClass[] $displayData */
$items = $displayData;
$codes = Joomla\Utilities\ArrayHelper::getColumn($items, 'code');
$link  = JRoute::_('index.php?option=com_sellacious&view=compare&c=' . implode(',', $codes));

if (count($codes))
{
	?>
	<div class="w100p">
	<table class="tbl-compare">
		<tbody>
		<tr>
			<?php foreach ($items as $item): ?>
			<?php $layoutId = is_object($item) ? 'bar_item' : 'bar_noitem'; ?>
			<td style="width: <?php echo 900 / count($codes) ?>px;" class="<?php echo $layoutId ?>"><?php
				echo $this->sublayout($layoutId, $item);
			?></td>
			<?php endforeach; ?>
			<td class="compare-submit"><?php
				if (count($codes) >= 2):
					?><a class="btn btn-success" href="<?php echo $link; ?>">COMPARE</a><?php
				else:
					?><a href="#" class="btn btn-success disabled">COMPARE</a><?php
				endif;
			?></td>
		</tr>
		</tbody>
	</table>
	</div>
	<?php
}
else
{
	echo '<div class="hidden w100p"></div>';
}
