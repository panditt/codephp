/**
 * @version     1.4.4
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
jQuery(document).ready(function ($) {
	var getToken = function () {
		var token = '';
		$('input[type="hidden"][name]').each(function () {
			var name = $(this).attr('name');
			if (name.length == 32 && $(this).val() == 1) {
				token = name;
				return false;
			}
		});
		return token;
	};

	$('.btn-pay-now').on('click', function (e) {
		var form = $(this).closest('form').serializeObject();
		if (!form['jform']) return;

		var order_id = $('#order_id').val();
		var data = {
			option: 'com_sellacious',
			task: 'order.setPaymentAjax',
			jform: form['jform'],
			id: order_id
		};
		var token = getToken();
		data[token] = 1;
		$.ajax({
			url: 'index.php',
			type: 'POST',
			dataType: 'json',
			cache: false,
			data: data
		}).done(function (response) {
			if (response.status == 1) {
				console.log(response['redirect']);
				window.location.href = response['redirect'];
			} else {
				Joomla.renderMessages({warning: [response.message]});
			}
		}).fail(function (xhr) {
			console.log(xhr.responseText);
			Joomla.renderMessages({warning: ['Request failed due to unknown error.']});
		});
	});
});
