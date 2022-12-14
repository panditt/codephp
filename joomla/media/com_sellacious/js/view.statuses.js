/**
 * @version     1.3.3
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */

jQuery(document).ready(function ($) {
	$('.row-reference').click(function () {
		var ref = $(this).data('ref');
		var $target = $('#row-' + ref);
		if ($target.length == 0) return;
		$target.toggleClass('highlight');
		$('.highlight').not($target).removeClass('highlight');
	});
});
