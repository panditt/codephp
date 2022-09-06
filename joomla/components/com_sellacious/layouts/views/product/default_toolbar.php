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

/** @var SellaciousViewProduct $this */
$user = JFactory::getUser();
$code = $this->state->get('product.code');

$page_id = $this->getLayout() == 'modal' ? 'product_modal' : 'product';
?>
<div class="nowrap float-right">
	<?php if ($this->helper->config->get('product_compare') && in_array($page_id, (array) $this->helper->config->get('product_compare_display'))): ?>
	<button type="button" class="btn-compare fa fa-copy"
		data-item="<?php echo $code ?>"><span>Add to<br />COMPARE</span><span>Remove from<br />COMPARE</span></button>
	<?php endif; ?>
	<?php
	if ($user->guest)
	{
		$url   = JRoute::_('index.php?option=com_sellacious&view=product&p=' . $code, false);
		$login = JRoute::_('index.php?option=com_users&view=login&return=' . base64_encode($url), false);
		?>
		<button type="button" class="btn-wishlist fa fa-heart-o" data-guest="true"
		data-href="<?php echo htmlspecialchars($login) ?>"><span>Add to<br />WISHLIST</span></button><?php
	}
	elseif ($this->helper->wishlist->check($code, null))
	{
		$url = JRoute::_('index.php?option=com_sellacious&view=wishlist', false);
		?>
		<button type="button" class="btn-wishlist fa fa-heart"
		data-href="<?php echo htmlspecialchars($url) ?>"><span>Added to<br />WISHLIST</span></button><?php
	}
	else
	{
		?>
		<button type="button" class="btn-wishlist fa fa-heart-o"
		data-item="<?php echo $code ?>"><span>Add to<br />WISHLIST</span></button><?php
	}
	?>
	<button type="button" class="btn-review fa fa-edit"
		data-item="<?php echo $code ?>"><span>Write a<br />REVIEW</span></button>
</div>
<div class="clearfix"></div>
