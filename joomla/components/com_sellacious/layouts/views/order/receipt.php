<?php
/**
 * @version     1.4.4
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access
defined('_JEXEC') or die;

/** @var  SellaciousViewTransaction $this */

JHtml::_('stylesheet', 'com_sellacious/fe.component.css', null, true);
JHtml::_('stylesheet', 'com_sellacious/fe.view.order.receipt.css', null, true);

$app  = JFactory::getApplication();
$item = $this->item;

if (!$item->get('id'))
{
	echo "<h3>Selected Order not found&hellip;</h3>";

	return;
}
?>
<div class="clearfix"></div>
<div>
	<?php if ($app->input->get('tmpl') == 'component'): ?>
	<script>
		jQuery(document).ready(function () {
			window.print();
		});
	</script>
	<style scoped>
		.text-center { text-align: center; }
	</style>
	<?php else: ?>
	<div id="receipt-head" class="text-right">
		<?php $print = JRoute::_('index.php?option=com_sellacious&view=order&layout=receipt&tmpl=component&id=' . $item->get('id')); ?>
		<a class="btn btn-sm btn-primary" target="_blank" href="<?php echo $print ?>"><i class="fa fa-print"></i> Print</a>
	</div>
	<?php endif; ?>

	<div class="clearfix hidden-lg"></div>
	<div id="receipt-page">
		<div id="receipt-logo"><img src="<?php echo $this->helper->media->getImage('config.shop_logo', 1) ?>"/></div>
		<div class="title text-center">RECEIPT</div>
		<div class="title text-center">Order#: <?php echo $item->get('order_number') ?></div>
		<br>
		<div class="sub-title text-center">for <strong><?php
			echo $item->get('customer_name');
		?></strong></div>
		<div class="datetime text-center"><?php echo JHtml::_('date', $item->get('created'), 'F d, Y h:i A T') ?></div>
		<br>

		<div class="address text-center">
			<?php
			$address = $this->helper->config->get('shop_address');
			$country = $this->helper->config->get('shop_country');
			$phone1  = $this->helper->config->get('shop_phone1');
			$phone2  = $this->helper->config->get('shop_phone2');
			$email   = $this->helper->config->get('shop_email');
			$website = $this->helper->config->get('shop_website');

			echo nl2br($address) . ', ' . $country ?><br><?php

			if ($phone1)
			{
				?><i class="fa fa-phone"></i> <?php echo $phone1;
			}

			if ($phone2)
			{
				?>&nbsp;&nbsp;<i class="fa fa-mobile-phone"></i> <?php echo $phone2;
			}

			if ($email)
			{
				?><br><i class="fa fa-envelope-o"></i> <?php echo $email;
			}

			if ($website)
			{
				?><br><i class="fa fa-globe"></i> <?php echo $website;
			}
			?>
		</div>

		<div class="txn-amount">
			<span>Amount: </span>
			<?php echo $this->helper->currency->display($item->get('grand_total'), $item->get('currency'), null, true); ?>
			<?php echo $item->get('currency') ?>
		</div>
		<br>

		<!-- Todo: use plugin to get handler name -->
		<div class="sub-title text-center">Payment Method: <strong><?php
				echo $this->helper->paymentMethod->getFieldValue($item->get('payment_method_id'), 'title'); ?></strong></div>
		<br>

		<div class="text-center">
			<?php
			// Todo: Also add other status icon
			$status = $item->get('status');

			if (is_object($status))
			{
				if ($status->s_type == 'paid')
				{
					echo JHtml::_('image', 'com_sellacious/paid-stamp.png', 'PAID', null, true);
				}
				else
				{
					echo '<h1 class="red">' . $status->s_title . '</h1>';
				}
			}
			?>
		</div>
		<br>

		<div class="footer">Thanks for your business.
			For any kind of query or discrepancies, please contact. <?php echo $email ?></div>
	</div>
</div>
<div class="clearfix"></div>
