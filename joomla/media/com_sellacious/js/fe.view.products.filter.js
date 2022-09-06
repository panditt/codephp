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
		var $filter = $('#sell-filter');

		$filter.find('.search-filter').on('keyup', 'input[type="text"]', function (e) {
			var $this = $(e.target);
			var val = $this.val();
			var choices = $this.closest('.filter-snap-in').find('.filter-choice');
			var regex = new RegExp(val);

			$.each(choices, function (i, choice) {
				var input = $(choice).find('input');
				regex.test(input.val()) ? $(choice).show('fast') : $(choice).hide('fast');
			});
		});

		$filter.on('click', '.clear-filter', function (e) {
			var $this = $(e.target);
			$filter.find('.search-filter').find('input[type="text"]').val('').trigger('keyup');
			var choices = $this.closest('.filter-snap-in').find('input[type="checkbox"]');
			choices.not(':disabled').prop('checked', false);

			$(this).closest('form').submit();
		});

		$filter.find('.filter-title').click(function (e) {
			$(e.target).is('.clear-filter') ||
			$(this).closest('.filter-snap-in').toggleClass('filter-collapse');
		});

		$('.filter-head').click(function () {
			$('#sell-filter').toggleClass('closed-on-phone');
		})
	});
})(jQuery);
