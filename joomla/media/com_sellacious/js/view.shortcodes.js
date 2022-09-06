/**
 * @version     1.3.3
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */


var SellaciousViewShortcodes = function () {
	this.options = {
		id : 'jform',
		rowTemplate : {
			html : '',
			replacement : ''
		},
		rowIndex : 0
	};
};

(function ($) {
	SellaciousViewShortcodes.prototype = {
		setup : function (options) {
			$.extend(this.options, options);

			var $id = '#' + this.options.id;
			var that = this;

			$($id).on('click', '.svshortcodesrow-add', function () {
				that.addRow();
			});

			$($id).on('click', '.svshortcodesrow-remove', function () {
				var index = this.id.match(/\d+$/);
				that.removeRow(index);
			});
		},

		addRow : function () {
			var $id = '#' + this.options.id;
			var index = ++this.options.rowIndex;
			var template = this.options.rowTemplate.html;
			var replacement = this.options.rowTemplate.replacement;
			var html = template.replace(new RegExp(replacement, "ig"), index);

			var $html = $(html);
			$html.find('.hasTooltip').tooltip({"html": true,"container": "body"});
			$html.insertBefore($($id).find('.svshortcodes-blankrow'));

			var o = new TxtAreaAutosize;
			o.attach({
				selector : 'textarea[id="jform_query_' + index + '"],textarea[id="jform_description_' + index + '"]'
			});

			var bc = $('#adminForm').find('[name="boxchecked"]');
			bc.val(parseInt(bc.val()) + 1);
		},

		removeRow : function (index) {
			var $id = '#' + this.options.id;

			$($id).find('#shortcode_remove_' + index).closest('tr').remove();

			var bc = $('#adminForm').find('[name="boxchecked"]');
			bc.val(parseInt(bc.val()) - 1);
		}
	}
})(jQuery);
