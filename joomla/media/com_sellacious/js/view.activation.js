/**
 * @version     1.4.2
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
var SellaciousActivation = function () {

	this.sitekey = null;
	this.data = null;
	this.activated = false;

	this.ajaxReg = null;
	this.ajaxDetect = null;
	this.intervalDetect = 0;
	this.dotcom = 'http://sellacious.com';

	return this;
};

(function ($) {

	$(document).ready(function () {

		SellaciousActivation.prototype = {

			init: function (wizard) {
				var $this = this;
				$this.wizard = $(wizard);

				$this.wizard.bootstrapWizard({
					tabClass: 'form-wizard',
					onNext: function (tab, navigation, index) {
						// If we are processing OR already activated, do not continue!
						if ($this.activated || $this.wizard.find('.no-nav').not('.hidden').length) return false;

						// Reset all messages
						$this.wizard.find('.msgbox').text('').addClass('hidden').removeClass('success').removeClass('invalid');

						switch (index) {
							case 1:
								if ($this.wizard.find('#tab1').find('.form-registration').is('.have-license')) {
									// Have license case
									var $sitekey = $this.wizard.find('#jform_sitekey');
									if ($sitekey.val().length < 42) {
										$sitekey.addClass('invalid').focus();
										return false;
									}
									$sitekey.removeClass('invalid');
									var data = {
										sitename: $this.wizard.find('#jform_sitename').val(),
										siteurl: $this.wizard.find('#jform_siteurl').val(),
										version: $this.wizard.find('#jform_version').val(),
										sitekey: $sitekey.val()
									};
									$this.verify(data);
								} else if ($this.validate()) {
									$this.data = {
										name: $this.wizard.find('#jform_name').val(),
										email: $this.wizard.find('#jform_email').val(),
										sitename: $this.wizard.find('#jform_sitename').val(),
										siteurl: $this.wizard.find('#jform_siteurl').val(),
										version: $this.wizard.find('#jform_version').val(),
										choices: $this.wizard.find('#jform_choices').find('input:checked').map(function () {
											return $(this).val();
										}).get()
									};
									$this.register(function (response) {
										// Switch tab
										$this.wizard.find('a[href="#tab2"]').tab('show');
										$this.startDetect();
									});
								}
								break;
							case 2:
								var $otp = $this.wizard.find('#jform_otp');
								var otp = $otp.val();

								if (!$this.wizard.find('#tab2').find('.wait-activation').is('.manual') || otp.length == 0) {
									$this.autodetect(false);
								} else if (/^\d{6}$/.test(otp)) {
									$otp.removeClass('invalid');
									$this.autodetect(otp);
								} else {
									$otp.addClass('invalid');
								}
								break;
							case 3:
								break;
							default:
								break;
						}

						// Stop event for now. We'll update later after ajax!
						return false;
					},
					onPrevious: function (tab, navigation, index) {
						// If we are processing OR already activated, do not continue!
						if ($this.activated || $this.wizard.find('.no-nav').not('.hidden').length) return false;

						$this.stopDetect();

						if (index == 0) $this.wizard.find('#tab2').find('.wait-activation').removeClass('manual');

						if (index == 1) $this.startDetect();
					}
				});

				$this.wizard.find('a[href^="#tab"]').click(function () {
					return false;
				});

				$this.wizard.find('.btn-have-license').click(function () {
					var on = $(this).data('on') || 0;
					var $fieldset = $this.wizard.find('#tab1').find('.form-registration');

					if (on) $fieldset.removeClass('have-license');
					else $fieldset.addClass('have-license');

					$(this).find('span').toggleClass('hidden');
					$(this).data('on', !on);
				});

				$this.wizard.find('.btn-manual-check').click(function () {
					$this.wizard.find('#tab2').find('.wait-activation').addClass('manual');
				});

				$this.wizard.find('.btn-resend').click(function () {
					$this.wizard.find('#tab2').find('.msgbox').addClass('hidden').delay(1000).text('');
					if ($this.data) {
						$this.register(function (response) {
							// Notify user
							var txt = Joomla.JText._('COM_SELLACIOUS_LICENSE_ACTIVATION_OTP_RESENT');
							$this.wizard.find('#tab2').find('.msgbox').text(txt).removeClass('hidden').removeClass('invalid');
						});
					}
				});

				$this.wizard.find('.btn-activate').click(function () {
					if ($this.activated) $this.activate();
				});

				$this.wizard.find('.btn-skip-verify').click(function () {
					$this.stopDetect();
					$this.thanks(true);
				});
			},

			validate: function () {
				var $this = this;
				var $name = $this.wizard.find('#jform_name');
				var $email = $this.wizard.find('#jform_email');
				var $choices = $this.wizard.find('#jform_choices').find('input');
				var name = $name.val();
				var email = $email.val();
				var invalid = false;

				if (name.length < 3) {
					invalid = true;
					$name.addClass('invalid');
				} else {
					$name.removeClass('invalid')
				}

				if (!/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,10})+$/.test(email)) {
					invalid = true;
					$email.addClass('invalid');
				} else {
					$email.removeClass('invalid');
				}

				if ($choices.filter(':checked').length == 0) {
					invalid = true;
					$choices.addClass('invalid').closest('label').addClass('invalid');
				} else {
					$choices.removeClass('invalid').closest('label').removeClass('invalid');
				}

				return !invalid;
			},

			register: function (callback) {
				var $this = this;

				if ($this.ajaxReg) $this.ajaxReg.abort();

				var $name = $this.wizard.find('#jform_name');
				var $email = $this.wizard.find('#jform_email');

				// Temporarily hide form and show loading spinner
				$name.removeClass('invalid').prop('disabled', true);
				$email.removeClass('invalid').prop('disabled', true);

				$this.wizard.find('#tab1').find('.fieldset').addClass('hidden');
				$this.wizard.find('#tab1').find('.load-spinner').removeClass('hidden');

				$this.ajaxReg = $.ajax({
						url: $this.dotcom + '/index.php?option=com_jarvis&task=site.register',
						type: 'POST',
						dataType: 'json',
						cache: false,
						data: $this.data
					})
					.done(function (response) {
						if (response.status == 1) {
							$this.sitekey = response.data;
							$this.setRegistration(callback);
						} else {
							$this.wizard.find('#tab1').find('.msgbox').text(response.message).addClass('invalid').removeClass('hidden');
							// This is ajax success, but an internal failure so we proceed to end loading here
							$this.wizard.find('#tab1').find('.fieldset').removeClass('hidden');
							$this.wizard.find('#tab1').find('.load-spinner').addClass('hidden');
						}
					})
					.fail(function (jqXHR) {
						console.log(jqXHR.responseText);
					})
					.always(function (data, status, xhr) {
						$name.removeClass('invalid').prop('disabled', false);
						$email.removeClass('invalid').prop('disabled', false);

						// We have more things to do on success
						if (status != 'success') {
							$this.wizard.find('#tab1').find('.fieldset').removeClass('hidden');
							$this.wizard.find('#tab1').find('.load-spinner').addClass('hidden');
						}
					});
			},

			verify: function (data) {
				var $this = this;

				if ($this.ajaxReg) $this.ajaxReg.abort();

				// Temporarily hide form and show loading spinner
				$this.wizard.find('#tab1').find('.fieldset').addClass('hidden');
				$this.wizard.find('#tab1').find('.load-spinner').removeClass('hidden');

				$this.ajaxReg = $.ajax({
						url: $this.dotcom + '/index.php?option=com_jarvis&task=site.validate',
						type: 'POST',
						dataType: 'json',
						cache: false,
						data: $.extend({}, data, {send_otp: 1})
					})
					.done(function (response) {
						if (response.status != 1) {
							$this.wizard.find('#tab1').find('.msgbox').text(response.message).addClass('invalid').removeClass('hidden');
							// This is ajax success, but an internal failure so we proceed to end loading here
							$this.wizard.find('#tab1').find('.fieldset').removeClass('hidden');
							$this.wizard.find('#tab1').find('.load-spinner').addClass('hidden');
						} else if (response.data.registered != 1 || response.data['modified'] == 1) {
							$this.wizard.find('#tab1').find('.msgbox').text('Invalid license key').addClass('invalid').removeClass('hidden');
							$this.wizard.find('#tab1').find('.fieldset').removeClass('hidden');
							$this.wizard.find('#tab1').find('.load-spinner').addClass('hidden');
						} else if (response.data.active == 1) {
							// Already activated. Thanks!
							$this.data = response.data;
							$this.sitekey = response.data.sitekey;
							$this.setRegistration(function () {
								$this.activated = true;
								$this.activate();
							});
						} else {
							// OTP sent! Switch tab
							$this.data = response.data;
							$this.sitekey = response.data.sitekey;
							$this.setRegistration(function () {
								$this.wizard.find('a[href="#tab2"]').tab('show');
								$this.startDetect();
							});
						}
					})
					.fail(function (jqXHR) {
						console.log(jqXHR.responseText);
					})
					.always(function (data, status, xhr) {
						// We have more things to do on success
						if (status != 'success') {
							$this.wizard.find('#tab1').find('.fieldset').removeClass('hidden');
							$this.wizard.find('#tab1').find('.load-spinner').addClass('hidden');
						}
					});
			},

			setRegistration: function (callback) {
				var $this = this;
				$this.data = $.extend({}, $this.data, {sitekey: $this.sitekey});

				$this.wizard.find('#tab1').find('.fieldset').addClass('hidden');
				$this.wizard.find('#tab1').find('.load-spinner').removeClass('hidden');
				$.ajax({
						url: 'index.php?option=com_sellacious&task=activation.registerAjax',
						type: 'POST',
						dataType: 'json',
						cache: false,
						data: $this.data
					})
					.done(function (response) {
						if (response.status == 1) {
							if (typeof callback == 'function')
								callback.apply(this, arguments);
						} else {
							$this.wizard.find('#tab1').find('.msgbox').text(response.message).addClass('invalid').removeClass('hidden');
						}
					})
					.fail(function (jqXHR) {
						console.log(jqXHR.responseText);
					})
					.always(function () {
						$this.wizard.find('#tab1').find('.fieldset').removeClass('hidden');
						$this.wizard.find('#tab1').find('.load-spinner').addClass('hidden');
					});
			},

			startDetect: function () {
				var $this = this;
				var i = 10;
				if ($this.intervalDetect) clearInterval($this.intervalDetect);
				$this.intervalDetect = setInterval(function () {
					var txt = Joomla.JText._('COM_SELLACIOUS_LICENSE_ACTIVATION_CHECKING_' + (i < 1 ? 'NOW' : 'IN'));
					$this.wizard.find('.timer').html(txt.replace('%d', i)).show();
					if (i >= 1) i--;
					else {
						i = 10;
						clearInterval($this.intervalDetect);
						$this.autodetect();
					}
				}, 1000);
			},

			stopDetect: function () {
				var $this = this;
				if ($this.intervalDetect) clearInterval($this.intervalDetect);
				if ($this.ajaxDetect) $this.ajaxDetect.abort();
				$this.wizard.find('.timer').html('').hide();
			},

			autodetect: function (otp) {
				var $this = this;
				$this.wizard.find('#tab2').find('.msgbox').text('').removeClass('invalid').addClass('hidden');
				if ($this.ajaxDetect) $this.ajaxDetect.abort();
				$this.ajaxDetect = $.ajax({
						url: $this.dotcom + '/index.php?option=com_jarvis&task=site.activate',
						type: 'POST',
						dataType: 'json',
						cache: false,
						data: {
							sitekey: $this.sitekey,
							otp: otp ? otp : null
						}
					})
					.done(function (response) {
						if (response.status == 1) {
							if (response.data.active == 1) {
								if (typeof response.data['license'] == 'object')
									$this.data = response.data['license'];
								$this.activated = true;
								$this.activate();
							} else {
								var txt;
								if (typeof otp == 'undefined') {
									// Triggered by timer, Do nothing, just keep waiting…
									// Move startDetect() here to not recover on communication recovery once failed.
								} else if (otp) {
									// Triggered by click with OTP
									txt = Joomla.JText._('COM_SELLACIOUS_LICENSE_ACTIVATION_OTP_INVALID');
									$this.wizard.find('#tab2').find('.msgbox').addClass('invalid').removeClass('hidden').text(txt);
								} else {
									// Triggered by click without OTP
									txt = Joomla.JText._('COM_SELLACIOUS_LICENSE_ACTIVATION_NOT_ACTIVATED');
									$this.wizard.find('#tab2').find('.msgbox').addClass('invalid').removeClass('hidden').text(txt);
								}
								$this.startDetect();
							}
						}
					})
					.fail(function (jqXHR) {
						console.log(jqXHR.responseText);

						$this.wizard.find('#tab2').find('.wait-activation').addClass('manual');
						$this.wizard.find('.timer').html('').hide();

						var txt = Joomla.JText._('COM_SELLACIOUS_LICENSE_ACTIVATION_SERVER_ERROR');
						$this.wizard.find('#tab2').find('.msgbox').html(txt).addClass('invalid').removeClass('hidden');
					});
			},

			activate: function () {
				var $this = this;

				$this.wizard.find('.form-actions').addClass('hidden');
				$this.wizard.find('#tab2').find('.fieldset').addClass('hidden');
				$this.wizard.find('#tab2').find('.retry-activation').addClass('hidden');
				$this.wizard.find('#tab2').find('.load-spinner').removeClass('hidden');

				$.ajax({
						url: 'index.php?option=com_sellacious&task=activation.activateAjax',
						type: 'POST',
						dataType: 'json',
						cache: false,
						data: {data: $this.data}
					})
					.done(function (response) {
						if (response.status == 1)
							$this.thanks();
						else
							$this.wizard.find('#tab2').find('.msgbox').text(response.message).addClass('invalid').removeClass('hidden');
					})
					.fail(function (jqXHR) {
						console.log(jqXHR.responseText);
					})
					.always(function () {
						$this.wizard.find('#tab2').find('.load-spinner').addClass('hidden');
						$this.wizard.find('#tab2').find('.retry-activation').removeClass('hidden');
					});
			},

			thanks: function (skip) {
				var $this = this;

				if (skip) {
					$this.wizard.find('#tab3').find('.skipped').removeClass('hidden');
					$this.wizard.find('#tab3').find('.finished').addClass('hidden');
				} else {
					$this.wizard.find('#tab3').find('.skipped').addClass('hidden');
					$this.wizard.find('#tab3').find('.finished').removeClass('hidden');
				}

				$this.wizard.find('a[href="#tab3"]').tab('show');

				setTimeout(function () {
					window.parent.location.reload(true);
				}, 5000);
			}
		};

		// Now assign the wizard
		var o = new SellaciousActivation;
		o.init('#activation-wizard');
	});

})(jQuery);
