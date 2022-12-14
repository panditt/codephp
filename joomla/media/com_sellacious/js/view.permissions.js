/**
 * @version     1.3.3
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
jQuery(document).ready(function ($) {
	$('.accordion-group.panel').sort(function (a, b) {

			var $ta = $(a).find('.accordion-heading a');
			var $tb = $(b).find('.accordion-heading a');

			// Crucial section at top always!
			if ($ta.attr('href') == '#important') {
				return -1;
			}
			if ($tb.attr('href') == '#important') {
				return 1;
			}

			var ta = $ta.text();
			var tb = $tb.text();

			return ta == tb ? 0 : ta > tb ? 1 : -1;
		})
		.appendTo('#jform_rules_accordion');

	$('.accordion-heading').click(function (e) {
		if (!$(e.target).is('a')) $(this).find('a').click();
	});

	// Sticky accordion index
	var $accordion = $('#jform_rules_accordion');

	$accordion.on('show.bs.collapse', function (e) {
		var value = $(e.target).attr('id');
		$.cookie('permissions' + '.lastPanel', value);
	});

	var lastPanel = $.cookie('permissions' + '.lastPanel');
	var $panel = $('a[href="#' + lastPanel + '"]');

	// I don't know why it requires two clicks
	lastPanel && $panel ? $panel.click().click() : null;
});
