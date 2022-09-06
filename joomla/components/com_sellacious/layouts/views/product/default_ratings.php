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

use Joomla\Utilities\ArrayHelper;

/** @var   SellaciousViewProduct $this */
JHtml::_('stylesheet', 'com_sellacious/util.bootstrap-progress.css', null, true);

$stats   = $this->getReviewStats();
$reviews = $this->getReviews();
?>
<table class="rating-statistics pull-left">
	<tbody>
	<tr>
		<td class="center" rowspan="6" style="width: 100px;">
			<div class="star-lg"><?php echo number_format($this->item->get('rating.rating', 0), 1); ?></div>
			<span class="avg-rating"><?php echo JText::plural('COM_SELLACIOUS_PRODUCT_RATING_AVERAGE_BASED_ON', $this->item->get('rating.count', 0)); ?></span>
		</td>
		<td></td>
	</tr>
	<?php for ($i = 1; $i <= 5; $i++): ?>
		<?php
		$stat    = ArrayHelper::getValue($stats, $i, null);
		$count   = isset($stat->count) ? $stat->count : 0;
		$percent = isset($stat) ? ($stat->count / $stat->total * 100) : 0;
		?>
		<tr>
			<td class="nowrap" style="width:90px;">
				<div class="rating-stars rating-stars-md star-<?php echo $i * 2 ?>">
					&nbsp;<?php echo number_format($i, 1); ?></div>
			</td>
			<td class="nowrap rating-progress">
				<div class="progress progress-sm">
					<div class="progress">
						<div class="progress-bar" role="progressbar"
							 style="width: <?php echo $percent ?>%"></div>
					</div>
				</div>
			</td>
			<td class="nowrap" style="width:60px;"><?php echo $count ?> ratings</td>
		</tr>
	<?php endfor; ?>
	</tbody>
</table>
<div class="clearfix"></div>
<hr class="isolate">

<table class="table-reviews w100p margin-top-10">
	<tbody>
	<?php
	foreach ($reviews as $review)
	{
		?>
		<tr>
			<td style="width: 150px;">
				<div class="rating-stars rating-stars-md star-<?php echo $review->rating * 2 ?>">
						&nbsp;<?php echo number_format($review->rating, 1); ?></div><br>
				<span class="pr-author"><?php echo $review->author_name ?></span><br>
				<span class="pr-date"><?php echo JHtml::_('date', $review->created, 'M d, Y'); ?></span><br>
				<?php if ($review->buyer == 1): ?>
				<div class="buyer-badge">Certified Buyer</div>
				<?php endif; ?>
			</td>
			<td>
				<span class="pr-title"><?php echo $review->title ?></span><br>
				<span class="pr-body"><?php echo $review->comment ?></span>
			</td>
		</tr>
		<?php
	}
	?>
	</tbody>
</table>
