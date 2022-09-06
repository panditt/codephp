/**
 * @version     1.3.3
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
jQuery(function ($) {
	$(document).ready(function () {
		$(document).on('change blur', '[data-float]', function () {
			var val = $(this).val();
			var dec = $(this).data('float') || 0;

			val = parseFloat(val);
			val = isNaN(val) ? 0 : val;

			$(this).val(val.toFixed(dec));
		});
		$('[data-float]').trigger('change');
	});
});
