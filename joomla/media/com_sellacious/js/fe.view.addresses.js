/**
 * @version     1.4.4
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
SellaciousViewAddresses = function () {
	this.token = '__INVALID_TOKEN__';
	this.hash = '';
	this.ajax = null;

	return this;
};

jQuery(function ($) {

	$.fn.hScroll = function (amount) {
		amount = amount || 120;
		$(this).bind('DOMMouseScroll mousewheel', function (event) {
			var origEvent = event.originalEvent, direction = origEvent.detail ? origEvent.detail * -amount : origEvent.wheelDelta, position = $(this).scrollLeft();
			position += direction > 0 ? -amount : amount;
			$(this).scrollLeft(position);
			event.preventDefault();
		});
	};

	// todo: Refactor all selectors to be parameters to the init() call
	SellaciousViewAddresses.prototype = {
		init: function () {
			var $this = this;

			$('#address-list').on('click', '.remove-address', function () {
				var id = $(this).data('id');
				if (id && confirm(Joomla.JText._('COM_SELLACIOUS_USER_CONFIRM_ADDRESS_REMOVE_MESSAGE')))
					$this.removeAddress(id);
			});

			$('#addresses').on('click', '.btn-save-address', function () {
				var $form = $(this).closest('.modal').find('.address-form-content');
				var fields = {
					'id': 1, 'name': 1, 'address': 1, 'mobile': 1,
					'district': 0, 'landmark': 0, 'state_loc': 0, 'zip': 0, 'country': 0
				};
				var data = {};
				var valid = true;

				$.each(fields, function (k, required) {
					var field = $form.find('.address-' + k);
					var field_input = $form.find('.address-' + k).filter(':input');
					var controls = $(field_input);
					var labels = $(field).closest('tr').find('label');

					var v = $.trim(field_input.val());

					if (required && v == '') {
						controls.addClass('invalid');
						labels.addClass('invalid');
						valid = false;
					} else {
						controls.removeClass('invalid');
						labels.removeClass('invalid');
						data[k] = v;
					}
				});

				if (valid) {
					$this.saveAddress(data);
				} else {
					console.log('Invalid form:', data);
				}
			});

			$this.loadAddresses();
		},

		loadAddresses: function () {
			var $this = this;

			if ($this.ajax) $this.ajax.abort();

			var data = {
				option: 'com_sellacious',
				task: 'user.getAddressesHtmlAjax'
			};
			data[$this.token] = 1;

			$this.ajax = $.ajax({
				url: 'index.php',
				type: 'POST',
				dataType: 'json',
				cache: false,
				data: data
			}).done(function (response) {
				if (response.status == 1031) { // Not logged in
					Joomla.renderMessages({warning: [response.message]});
				} else if (response.status == 1032) { // Dest
					$('#address-list').html(response.data[0]).find('.hasTooltip').tooltip();
					$('#address-modals').html(response.data[1]).find('.hasTooltip').tooltip();

					var ship_to = $('#address-shipping').val();
					var bill_to = $('#address-billing').val();

					if (ship_to) $this.setShipping($('#address-item-' + ship_to).find('.btn-ship-here'));
					if (bill_to) $this.setBilling($('#address-item-' + bill_to).find('.btn-bill-here'));
				} else {
					Joomla.renderMessages({warning: [response.message]});
				}
			}).fail(function (jqXHR) {
				console.log(jqXHR.responseText);
			});
		},

		saveAddress: function (address) {
			var $this = this;

			if ($this.ajax) $this.ajax.abort();

			var data = {
				option: 'com_sellacious',
				task: 'user.saveAddressAjax',
				address: address,
				id: address.id
			};
			data[$this.token] = 1;

			$this.ajax = $.ajax({
				url: 'index.php',
				type: 'POST',
				dataType: 'json',
				cache: false,
				data: data
			}).done(function (response) {
				if (response.status == 1031) { // Not logged in
					$('#address-form-' + address.id).modal('hide');
					Joomla.renderMessages({warning: [response.message]});
				} else if (response.status == 1035) { // Removed
					$('#address-form-' + address.id).modal('hide');
					Joomla.renderMessages({success: [response.message]});
					$this.loadAddresses();
					// todo: Set the new address as selected
				} else {
					alert(response.message);
				}
			}).fail(function (jqXHR) {
				console.log(jqXHR.responseText);
			});
		},

		removeAddress: function (id) {
			var $this = this;

			if ($this.ajax) $this.ajax.abort();

			var data = {
				option: 'com_sellacious',
				task: 'user.removeAddressAjax',
				id: id
			};
			data[$this.token] = 1;

			$this.ajax = $.ajax({
				url: 'index.php',
				type: 'POST',
				dataType: 'json',
				cache: false,
				data: data,
				success: function (response) {
					if (response.status == 1031) { // Not logged in
						Joomla.renderMessages({warning: [response.message]});
					} else if (response.status == 1033) { // Removed
						Joomla.renderMessages({success: [response.message]});
						$('#address-list').find('#address-item-' + id).fadeOut().remove();
					} else {
						Joomla.renderMessages({warning: [response.message]});
					}
				},
				error: function (jqXHR) {
					console.log(jqXHR.responseText);
				}
			});
		}
	};

	$(document).ready(function () {
		var o = new SellaciousViewAddresses;
		o.token = $('#formToken').attr('name');
		o.init();
		window.SellaciousCart = o;

		$('#address-list').hScroll(60);
	});
});

