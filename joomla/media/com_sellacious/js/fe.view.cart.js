/**
 * @version     1.4.4
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
jQuery(document).ready(function ($) {
	var $cart = $('#cart-container');
	if ($cart.length) {
		var oo = new SellaciousViewCartAIO;
		oo.token = $('#formToken').attr('name');
		oo.initCart('#cart-container', true);
		$cart.data('CartModal', oo);
	}
});
