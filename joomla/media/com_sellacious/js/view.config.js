/**
 * @version     1.3.4
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
(function ($) {
	$(document).ready(function () {
		// Shipped By
		var $shipBy = $('#jform_com_sellacious_shipped_by');
		var $shipLocationBySeller = $('#jform_com_sellacious_shippable_location_by_seller').closest('div.input-row');
		var $flatShipping = $('#jform_com_sellacious_flat_shipping');
		var $flatFee = $('#jform_com_sellacious_shipping_flat_fee').closest('div.input-row');
		var $sellerShipMethods = $('#jform_com_sellacious_seller_shippable_methods').closest('div.row');
		var $shipOriginGroup = $('#jform_com_sellacious_ship_origin_group,' +
			'#jform_com_sellacious_shipping_address_line1,' +
			'#jform_com_sellacious_shipping_address_line2,' +
			'#jform_com_sellacious_shipping_address_line3,' +
			'#jform_com_sellacious_shipping_country,' +
			'#jform_com_sellacious_shipping_state,' +
			'#jform_com_sellacious_shipping_district,' +
			'#jform_com_sellacious_shipping_zip').closest('div.row');

		$('#jform_com_sellacious_shipped_by,#jform_com_sellacious_flat_shipping').change(function () {
			var by = $shipBy.find('input[type="radio"]').filter(':checked').val();
			if (by == 'seller') {
				$shipLocationBySeller.show();
				$sellerShipMethods.show();
				$flatShipping.closest('div.input-row').hide();
				$shipOriginGroup.hide();
				$flatFee.hide();
			} else {
				$shipLocationBySeller.hide();
				$sellerShipMethods.hide();
				$flatShipping.closest('div.input-row').show();
				$shipOriginGroup.show();
				var flat = $flatShipping.find('input[type="radio"]').filter(':checked').val();
				flat == 1 ? $flatFee.show() : $flatFee.hide();
			}
		}).triggerHandler('change');

		// Todo: Optimize to be called on specific clicks and not global ones
		$(':input').on('change click', function () {
			var $allowed_product_type = $('#jform_com_sellacious_allowed_product_type').find('input:checked').val();

			// E-Products
			var $eproduct_c = $('#jform_com_sellacious_e_product_expiry_days,#jform_com_sellacious_e_product_download_limit').closest('.input-row');
			$allowed_product_type == 'electronic' || $allowed_product_type == 'both' ? $eproduct_c.show() : $eproduct_c.hide();

			// Physical Products
			if ($allowed_product_type == 'physical' || $allowed_product_type == 'both') {
				$('#jform_com_sellacious_shop_fieldgroup_rma').closest('.row').show();
				// Return
				$('#jform_com_sellacious_purchase_return').closest('.input-row').show();

				if ($('#jform_com_sellacious_purchase_return1').is(':checked')) {
					$('#jform_com_sellacious_purchase_return_icon').closest('.input-row').hide();
					$('#jform_com_sellacious_purchase_return_icon_global,#jform_com_sellacious_purchase_return_tnc').closest('.input-row').show();
				} else if ($('#jform_com_sellacious_purchase_return2').is(':checked')) {
					$('#jform_com_sellacious_purchase_return_icon_global').closest('.input-row').hide();
					$('#jform_com_sellacious_purchase_return_icon,#jform_com_sellacious_purchase_return_tnc').closest('.input-row').show();
				} else {
					$(['#jform_com_sellacious_purchase_return_icon',
						'#jform_com_sellacious_purchase_return_icon_global',
						'#jform_com_sellacious_purchase_return_tnc'].join(',')).closest('.input-row').hide();
				}

				// Exchange
				$('#jform_com_sellacious_purchase_exchange').closest('.input-row').show();

				if ($('#jform_com_sellacious_purchase_exchange1').is(':checked')) {
					$('#jform_com_sellacious_purchase_exchange_icon').closest('.input-row').hide();
					$('#jform_com_sellacious_purchase_exchange_icon_global,#jform_com_sellacious_purchase_exchange_tnc').closest('.input-row').show();
				} else if ($('#jform_com_sellacious_purchase_exchange2').is(':checked')) {
					$('#jform_com_sellacious_purchase_exchange_icon_global').closest('.input-row').hide();
					$('#jform_com_sellacious_purchase_exchange_icon,#jform_com_sellacious_purchase_exchange_tnc').closest('.input-row').show();
				} else {
					$(['#jform_com_sellacious_purchase_exchange_icon',
						'#jform_com_sellacious_purchase_exchange_icon_global',
						'#jform_com_sellacious_purchase_exchange_tnc'].join(',')).closest('.input-row').hide();
				}
			} else {
				$('#jform_com_sellacious_shop_fieldgroup_rma').closest('.row').hide();
				$(['#jform_com_sellacious_purchase_return',
					'#jform_com_sellacious_purchase_return_icon',
					'#jform_com_sellacious_purchase_return_icon_global',
					'#jform_com_sellacious_purchase_return_tnc',
					'#jform_com_sellacious_purchase_exchange',
					'#jform_com_sellacious_purchase_exchange_icon',
					'#jform_com_sellacious_purchase_exchange_icon_global',
					'#jform_com_sellacious_purchase_exchange_tnc'].join(',')).closest('.input-row').hide();
			}

			// Shop >> Price display
			if ($('#jform_com_sellacious_product_price_display0').is(':checked')) {
				$('#jform_com_sellacious_product_price_display_pages').closest('.input-row').hide();
			} else {
				$('#jform_com_sellacious_product_price_display_pages').closest('.input-row').show();
			}

			// Product compare
			if ($('#jform_com_sellacious_product_compare1').is(':checked')) {
				$('#jform_com_sellacious_compare_limit').closest('.input-row').show();
			} else {
				$('#jform_com_sellacious_compare_limit').closest('.input-row').hide();
			}

			// Free Listing
			if ($('#jform_com_sellacious_free_listing1').is(':checked')) {
				$('#jform_com_sellacious_listing_fee').closest('.input-row').hide();
				$('#jform_com_sellacious_listing_fee_recurrence').closest('.input-row').hide();
			} else {
				$('#jform_com_sellacious_listing_fee').closest('.input-row').show();
				$('#jform_com_sellacious_listing_fee_recurrence').closest('.input-row').show();
			}
		})
		// This is too costly for the browser if called for each element, hence call for just the first one
			.eq(0).triggerHandler('change');
	});
})(jQuery);
