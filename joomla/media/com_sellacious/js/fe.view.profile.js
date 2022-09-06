/**
 * @version     1.4.2
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */


var SellaciousViewUser = {
	Address: function () {
		return this;
	}
};

(function ($) {

	// Fixed version of jQuery.clone function
	(function (original) {
		$.fn.clone = function () {
			var result = original.apply(this, arguments),
				o_textarea = this.find('textarea').add(this.filter('textarea')),
				r_textarea = result.find('textarea').add(result.filter('textarea')),
				o_select = this.find('select').add(this.filter('select')),
				r_select = result.find('select').add(result.filter('select'));

			var i, l;
			for (i = 0, l = o_textarea.length; i < l; ++i) $(r_textarea[i]).val($(o_textarea[i]).val());
			for (i = 0, l = o_select.length; i < l; ++i) r_select[i].selectedIndex = o_select[i].selectedIndex;

			return result;
		};
	})($.fn.clone);

	$(document).ready(function () {
		document.formvalidator.setHandler('mobile', function (value) {
			return /^(\+\d{1,3}[- ]?)?\d{10}$/.test(value) || /NULL/.test(value);
		});
	});
})(jQuery);
