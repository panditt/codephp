/**
 * @version     1.3.5
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
(function ($) {
	$(document).ready(function () {
		var dotcom = 'http://sellacious.com';

		var setRegistration = function (data, callback) {
			$.ajax({
					url: 'index.php?option=com_sellacious&task=activation.upgradeAjax',
					type: 'POST',
					dataType: 'json',
					cache: false,
					data: {data: data}
				})
				.done(function (response) {
					if (response.status == 1) {
						if (typeof callback == 'function')
							callback.apply(this, arguments);
					} else {
						console.log(response.message);
					}
				})
				.fail(function (jqXHR) {
					console.log(jqXHR.responseText);
				});
		};

		// Don't show email here
		var $license = $('#sellacious-license').data();

		var version = $license.version;
		var sitekey = $license.sitekey;
		var siteurl = $license.siteurl;
		var sitename = $license.sitename;

		if (!sitekey) {
			$('.license-verify').addClass('unregistered')
				.find('.unregistered').find('a.btn-modal').click();
		} else {
			$('.license-verify').addClass('checking');
			$.ajax({
					url: dotcom + '/index.php?option=com_jarvis&task=site.validate',
					type: 'POST',
					dataType: 'json',
					cache: false,
					data: {
						version: version,
						sitekey: sitekey,
						siteurl: siteurl,
						sitename: sitename
					}
				})
				.done(function (response) {
					var $license = $('.license-verify');
					if (response.status == 1) {
						if (response.data.registered != 1) {
							$license.addClass('unregistered')
								.find('.unregistered').find('a.btn-modal').click();
						} else if (response.data['modified'] == 1) {
							$license.addClass('void');
						} else if (response.data.active == 1) {
							setRegistration(response.data);
							$license.addClass('active');
							var vars = ['name', 'email', 'sitename', 'siteurl', 'sitekey', 'subscription', 'expiry_date'];
							$.each(vars, function (i, key) {
								if (typeof response.data[key] != 'undefined' && response.data[key]) {
									$('.license-' + key).removeClass('hidden').find('span').text(response.data[key]);
								}
							});
						} else {
							$license.addClass('inactive');
						}
					} else {
						$license.addClass('error');
					}
				})
				.fail(function (jqXHR) {
					console.log(jqXHR.responseText);
					$('.license-verify').addClass('error');
				})
				.always(function () {
					$('.license-verify').removeClass('checking');
				});
		}
	});
})(jQuery);
