/**
 * @version     1.4.4
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
Joomla = window.Joomla || {};
Joomla.submitbutton = function (task, form) {
	Joomla.submitform(task, form);
};

jQuery(function ($) {
	$(document).ready(function () {
		$('.remove-compare').click(function () {
			Joomla.submitform('compare.remove', this.form);
		});

		$('.btn-add-cart').click(function () {
			var $this = $(this);

			var code = $this.data('item');
			var checkout = $this.data('checkout');
			if (!code) return;

			var q = $('#product-quantity').val() || 1;

			$.ajax({
				url: 'index.php?option=com_sellacious&task=cart.addAjax',
				type: 'POST',
				data: {p: code, quantity: q},
				cache: false,
				dataType: 'json'
			}).done(function (response) {
				if (response.state == 1) {
					$(document).trigger('cartUpdate', ['add', {uid: response.data.uid}]);
					Joomla.renderMessages({success: [response.message]});
					if (checkout && response.data['redirect']) {
						window.location.href = response.data['redirect'];
					} else if (typeof loadModalCart == 'function') {
						// Open cart in modal
						loadModalCart.call(this, response.data['token']);
					}
				} else {
					Joomla.renderMessages({error: [response.message]});
				}
			}).fail(function (jqXHR) {
				Joomla.renderMessages({error: ['There was an error while processing your request. Please try later.']});
				console.log(jqXHR.responseText);
			});
		});
	});
});
