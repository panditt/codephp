/**
 * @version     1.3.3
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */


var JFormFieldEwalletBalance = function () {
	this.options = {};
	return this;
};

jQuery(function ($) {

	var Ajax = function (url, data, callback, fallback) {
		$.ajax({
			url: url,
			type: 'POST',
			dataType: 'json',
			cache: false,
			data: data,
			success: function (response) {
				if (typeof callback == 'function') callback(response);
			},
			error: function (jqXHR) {
				console.log(jqXHR.responseText);
				if (typeof fallback == 'function') fallback();
			}
		});
	};

	JFormFieldEwalletBalance.prototype = {
		setup: function (options) {
			$.extend(this.options, options);
			var that = this;
			var $id = '#' + that.options.id;
			var $wallet = $($id + '_wallet-info');

			$wallet.on('click', '.btn-wallet-convert', function () {
				var $target = $(this).is('.btn-wallet-convert') ? $(this) : $(this).closest('.btn-wallet-convert');
				that.convert($target);
			});

			$($id + '_reload').click(function () {
				that.reload();
			}).trigger('click');
		},

		convert: function ($target) {
			var that = this;
			var $id = '#' + that.options.id;
			var data = $target.data();

			if ($target.data('confirm')) {
				var url = 'index.php?option=com_sellacious&task=transaction.convertBalanceAjax';
				$target.addClass('disabled');

				Ajax(url, $.extend({}, data, {user_id: that.options.user_id}), function (response) {
					// In all cases, refresh
					$($id + '_reload').trigger('click');
					if (response.state == 1) {
						Joomla.renderMessages({success: [response.message]});
					} else {
						Joomla.renderMessages({warning: [response.message]});
					}
				}, function () {
					$target.data('confirm', false).addClass('btn-primary').removeClass('btn-danger').removeClass('disabled')
						.html('<i class="fa fa-exchange"></i> Convert');
				});
			}
			else {
				$target.data('confirm', true).removeClass('btn-primary').addClass('btn-danger')
					.html('<i class="fa fa-question-circle"></i> ' + data.amount_to + ' ' + data.currency_to + ' Sure ?');
				setTimeout(function () {
					$target.data('confirm', false).addClass('btn-primary').removeClass('btn-danger')
						.html('<i class="fa fa-exchange"></i> Convert');
				}, 5000);
			}
		},

		reload: function () {
			var that = this;
			var $id = '#' + that.options.id;
			var $wallet = $($id + '_wallet-info');

			$wallet.find('.wallet-amounts').html('&hellip;');
			var url = 'index.php?option=com_sellacious&task=transaction.getWalletBalanceAjax';

			Ajax(url, {user_id: that.options.user_id}, function (response) {
				if (response.state == 1) {
					var $table = $('<table></table>');
					var tmpl = '<tr>' +
						'<td><span class="wallet-amount"></span></td>' +
						'<td><button type="button" class="btn btn-primary btn-xs btn-mini btn-wallet-convert w100p"><i class="fa fa-exchange"></i> Convert</button></td>' +
						'</tr>';
					if (response.data.length) {
						$.each(response.data, function (i, v) {
							var $row = $(tmpl);
							// PAY button for shop currency instead of CONVERT button
							if (v.currency == v['convert_currency']) {
								$row.find('.wallet-amount').text(v.display);
								$row.find('button').remove();
							} else {
								$row.find('.wallet-amount').text(v.display).attr('title', v['convert_display']).tooltip();
								$row.find('.btn-wallet-convert').data({
									currency: v.currency,
									amount: v.amount,
									currency_to: v['convert_currency'],
									amount_to: v['convert_amount']
								});
							}
							$table.append($row);
						});
					} else {
						var $row = $(tmpl);
						$row.find('.wallet-amount').text('0.00');
						$row.find('button').remove();
						$table.append($row);
					}
					$wallet.find('.wallet-amounts').empty().append($table);
				} else {
					$wallet.find('.wallet-amounts').text('NA');
					Joomla.renderMessages({warning: [response.message]});
				}
			}, function () {
				$wallet.find('.wallet-amounts').text('NA');
				Joomla.renderMessages({warning: ['Failed to update balance please try again later.']});
			});
		}
	};
});
