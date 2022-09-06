/**
 * @version     1.3.3
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
(function ($) {
	$(document).ready(function () {
		var view = (function (name) {
			name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
			var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
				results = regex.exec(location.search);
			return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
		})('view');

		$('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
			$.cookie(view + '.lastTab', $(e.target).attr('href'));
		});
		var lastTab = $.cookie(view + '.lastTab');

		if (lastTab) {
			var $tab = $('a[href=' + lastTab + ']');
			if ($tab.length) {
				$tab.click();
				$tab.parent('li').addClass('active');
			} else $.cookie(view + '.lastTab', null);
		}
	});
})(jQuery);
