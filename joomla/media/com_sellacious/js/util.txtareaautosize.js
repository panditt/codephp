/**
 * @version     1.3.3
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */


var TxtAreaAutosize = function () {
	this.options = {
		selector : ''
	}
};

(function ($) {

	TxtAreaAutosize.prototype = {

		attach : function (options) {

			$.extend(this.options, options);

			var elem = $(this.options.selector);
			var that = this;

			$.each(elem, function (i, el) {

				$(el).on('change', function () {
					that.resize(this);
				});

				$(el).on('cut paste drop keydown focus', function () {
					that.delayedResize(this);
				});

				$(el).on('blur', function () {
					that.resetSize(this);
				});

				that.resetSize(el);
			});

		},

		resetSize : function (el) {
			$(el).css('height', 'auto');
			$(el).css('height', '32px');
		},

		resize : function (el) {
			$(el).css('height', 'auto');
			$(el).css('height', Math.max(32, el.scrollHeight+2) + 'px');
		},

		delayedResize : function (el) {
			var that = this;

			window.setTimeout(function () {
				that.resize(el);
			}, 0);
		}

	}

})(jQuery);
