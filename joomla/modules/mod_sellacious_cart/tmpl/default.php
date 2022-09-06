<?php
/**
 * @version     1.3.3
 * @package     Sellacious Cart Module
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Bhavika Matariya <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access
defined('_JEXEC') or die('Restricted access');

JHtml::_('jquery.framework');

JHtml::_('script', 'mod_sellacious_cart/showcart.js', null, true);
JHtml::_('stylesheet', 'mod_sellacious_cart/style.css', null, true);
JHtml::_('stylesheet', 'com_sellacious/fe.view.cart.aio.css', null, true);

$options = array(
	'title'    => JText::_('MOD_SELLACIOUS_CART_TITLE'),
	'backdrop' => 'static',
);
?>
<script>
jQuery(document).ready(function ($) {
	if ($('#modal-cart').length == 0) {
		var $html = <?php echo json_encode(JHtml::_('bootstrap.renderModal', 'modal-cart', $options)); ?>;
		$('body').append($html);
	}
});
</script>
<div class="mod-sellacious-cart <?php echo $class_sfx; ?>" id="mod-sellacious-cart">

	<div class="mod-cart-container">
		<i class="icon-shopping-cart"></i> <span class="mod-total-products">0</span>

		<ul class="dropdown-menu mod-cart-ul pull-right">
			<li class="mod-products-list">
				<span>Please wait &hellip;</span>
			</li>
			<li class="mod-divider"></li>
			<li class="mod-total">
				<?php echo JText::_('MOD_SELLACIOUS_CART_TOTAL'); ?> &nbsp;
				<span class="mod-grand-total"></span>
			</li>
			<li class="mod-cart-show-btn">
				<button class="btn btn-mini btn-default" id="btn-modal-cart" data-token="<?php echo JSession::getFormToken(); ?>">
					<?php echo JText::_('MOD_SELLACIOUS_CART_SHOW_CART'); ?>
				</button>
			</li>
		</ul>
	</div>

	<div class="clearfix"></div>

	<noscript>
		<?php echo JText::_('MOD_SELLACIOUS_CART_JAVASCRIPT') ?>
	</noscript>
</div>
