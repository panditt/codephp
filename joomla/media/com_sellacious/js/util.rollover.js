/**
 * @version     1.3.3
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
(function ($) {
	$.fn.extend({
		rollover: function () {
			var interval = [];
			$(this).each(function (i) {
				var $roller = $(this);
				var $img = $roller.find('img[data-rollover]');
				if ($img.length == 0) return;
				var images = $img.data('rollover');
				$img.removeAttr('data-rollover');
				interval[i] = 0;
				var count;
				if (count = images.length) {
					$roller.hover(function () {
						interval[i] = setInterval(function () {
							var ci = $img.data('rolloverIndex') || 0;
							$img.attr('src', images[ci]);
							$img.data('rolloverIndex', ci + 1 < count ? ci + 1 : 0);
						}, 1000);
					}, function () {
						interval[i] && clearInterval(interval[i]);
					});
				}
			});
		}
	});

	// Set macro for autoload
	$(document).ready(function () {
		$('[data-rollover="container"]').rollover();
	});
})(jQuery);
