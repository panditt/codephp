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

jQuery(document).ready(function ($) {
	// Initialize cart modal
	var $cartModal = $('#modal-cart');
	if ($cartModal.length) {
		var oo = new SellaciousViewCartAIO;
		oo.token = $('#formToken').attr('name');
		oo.initCart('#modal-cart .modal-body', true);
		$cartModal.find('.modal-body').html('<div id="cart-items"></div>');
		$cartModal.data('CartModal', oo);
	}

	$('.product-box').length || $('#empty-wishlist').removeClass('hidden');

	$('.btn-add-cart').click(function () {
		var code = $(this).data('item');
		var checkout = $(this).data('checkout');
		$.ajax({
			url: 'index.php?option=com_sellacious&task=cart.addAjax',
			type: 'POST',
			data: {p: code},
			cache: false,
			dataType: 'json'
		}).done(function (response) {
			if (response.state == 1) {
				$(document).trigger('cartUpdate', ['add', {uid: response.data.uid}]);
				Joomla.renderMessages({success: [response.message]});
				if (checkout && response.data['redirect']) {
					window.location.href = response.data['redirect'];
				} else {
					// Open cart in modal
					$cartModal.modal('show');
					var cart = $cartModal.data('CartModal');
					cart.navStep('cart');
				}
			} else {
				Joomla.renderMessages({error: [response.message]});
			}
		}).fail(function (jqXHR) {
			Joomla.renderMessages({error: ['There was an error while processing your request. Please try later.']});
			console.log(jqXHR.responseText);
		});
	});

	$('.btn-remove').click(function () {
		var $this = $(this);
		var code = $this.data('item');
		if (!code) return;

		$.ajax({
			url: 'index.php?option=com_sellacious&task=wishlist.removeAjax',
			type: 'POST',
			data: {p: code},
			cache: false,
			dataType: 'json',
			success: function (response) {
				if (response.state == 1) {
					$this.closest('.product-box').fadeOut('slow', function () {
						$(this).remove();
						$('.product-box').length || $('#empty-wishlist').removeClass('hidden');
					});
				} else {
					Joomla.renderMessages({error: [response.message]});
				}
			},
			error: function (jqXHR) {
				Joomla.renderMessages({error: ['There was an error while processing your request. Please try later.']});
				console.log(jqXHR.responseText);
			}
		});
	});
});

