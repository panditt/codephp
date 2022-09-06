<?php
/**
 * @version     1.4.4
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access
defined('_JEXEC') or die;

/** @var SellaciousViewCart $this */
JHtml::_('jquery.framework');
JHtml::_('behavior.formvalidator');

JHtml::_('script', 'media/com_sellacious/js/plugin/select2-3.5/select2.js', false, false);
JHtml::_('stylesheet', 'media/com_sellacious/js/plugin/select2-3.5/select2.css', null, false);
JHtml::_('stylesheet', 'com_sellacious/font-awesome.min.css', null, true);

JHtml::_('script', 'media/com_sellacious/js/plugin/serialize-object/jquery.serialize-object.min.js', false, false);
JHtml::_('script', 'com_sellacious/util.cart.aio.js', false, true);
JHtml::_('script', 'com_sellacious/fe.view.cart.aio.js', false, true);

JHtml::_('stylesheet', 'com_sellacious/fe.component.css', null, true);
JHtml::_('stylesheet', 'com_sellacious/fe.view.cart.aio.css', null, true);
JHtml::_('stylesheet', 'com_sellacious/fe.view.cart.aio-steps.css', null, true);

JText::script('COM_SELLACIOUS_CART_CONFIRM_LOGOUT_ACTION_MESSAGE');
JText::script('COM_SELLACIOUS_USER_CONFIRM_ADDRESS_REMOVE_MESSAGE');
JText::script('COM_SELLACIOUS_CART_CONFIRM_CLEAR_CART_ACTION_MESSAGE');
JText::script('COM_SELLACIOUS_CART_ADDRESSES_EMPTY_MESSAGE');
JText::script('COM_SELLACIOUS_CART_ADDRESS_BILLING_EMPTY_MESSAGE');
JText::script('COM_SELLACIOUS_CART_ADDRESS_SHIPPING_EMPTY_MESSAGE');
JText::script('COM_SELLACIOUS_CART_GRAND_TOTAL_LABEL');

JText::script('COM_SELLACIOUS_CART_AIO_LOGIN_PROGRESS');
JText::script('COM_SELLACIOUS_CART_AIO_REGISTRATION_PROGRESS');
JText::script('COM_SELLACIOUS_CART_REDIRECT_WAIT_MESSAGE');

$user = JFactory::getUser();
?>
<div id="cart-aio-container" class="cart-aio-container w100p">

	<div id="cart-aio-steps">
		<div class="widget-body fuelux">
			<div class="wizard">
				<ul class="steps"></ul>
			</div>
		</div>
	</div>

	<div id="cart-aio-account" class="cart-aio">
		<div class="legend"><?php echo JText::_('COM_SELLACIOUS_CART_CHECKOUT_USER_LABEL') ?></div>
		<table class="w100p">
			<tr id="login_email-row">
				<td style="width:140px;"><label for="login_email">Email Address</label></td>
				<td style="width:180px;">
					<input type="hidden" id="login_user_id" value="<?php echo $user->id ?>"/>
					<input type="email" id="login_email" value="<?php echo $this->escape($user->email) ?>" class="w100p"/>
				</td>
				<td>
					<button class="btn btn-primary" id="login_email_submit"><span
							class="hidden-phone">Submit </span><i class="fa fa-arrow-right"></i></button>
					<button class="btn btn-default hidden" id="login_email_change"><span
							class="hidden-phone">Change </span><i class="fa fa-edit"></i></button>
					<button class="btn btn-success hidden" id="login_email_register"><span
							class="hidden-phone">Continue </span><i class="fa fa-arrow-right"></i></button>
					<button class="btn btn-danger hidden" id="login_logout"><span
							class="hidden-phone">Log Out </span><i class="fa fa-arrow-right"></i></button>
					<button class="btn btn-primary pull-right" id="btn-cart-modal"><i class="fa fa-shopping-cart"></i> &nbsp; <?php
						echo JText::_('COM_SELLACIOUS_CART_SHOW_ITEMS_MODAL_BUTTON_LABEL'); ?></button>
				</td>
			</tr>
			<tr id="login_passwd-row" class="hidden">
				<td><label for="login_passwd">Password</label></td>
				<td><input id="login_passwd" type="password"/></td>
				<td><button class="btn btn-primary" id="login_password_submit">Login &nbsp;<i class="fa fa-lock"></i></button>
					<a class="btn btn-default btn-xs" id="login_reset" style="margin-left: 20px" href="<?php
					echo JText::_('index.php?option=com_users&view=reset'); ?>"><span class="hidden-phone">Forgot Password </span></a></td>
			</tr>
		</table>
	</div>

	<div id="cart-aio-items" class="cart-aio hidden">
		<div class="legend"><?php echo JText::_('COM_SELLACIOUS_CART_CHECKOUT_CART_ITEMS_LABEL'); ?></div>
		<div id="cart-items"></div>
		<div id="cart-items-folded" class="hidden"></div>
	</div>

	<div id="cart-aio-address" class="cart-aio hidden text-center">
		<div class="legend"><?php echo JText::_('COM_SELLACIOUS_CART_CHECKOUT_ADDRESS_LABEL') ?></div>
		<input type="hidden" id="address-billing" value="<?php echo $this->cart->get('billing'); ?>"/>
		<input type="hidden" id="address-shipping" value="<?php echo $this->cart->get('shipping'); ?>"/>

		<div id="address-editor">
			<ul id="address-items"></ul>
			<div id="address-modals"></div>
			<?php
			$body    = JLayoutHelper::render('com_sellacious.user.address.form');
			$options = array(
				'title'    => JText::_('COM_SELLACIOUS_CART_USER_ADDRESS_FORM_ADD_TITLE'),
				'backdrop' => 'static',
				'size'     => 'xs',
				'footer'   => '<button type="button" class="btn btn-primary btn-save-address"><i class="fa fa-save"></i> Save</button>'
			);

			echo JHtml::_('bootstrap.renderModal', 'address-form-0', $options, $body);
			?>
			<div class="clearfix"></div>
			<div class="margin-top-10" id="address-toolbar"><a href="#address-form-0" role="button" data-toggle="modal"
                 class="btn btn-small btn-default btn-add-address pull-left"><i class="fa fa-plus"></i> Add New Address</a>
				<a class="btn btn-small btn-default btn-next pull-right">Next <i class="fa fa-arrow-right"></i></a></div>
			<div class="clearfix"></div>
		</div>
		<div class="clearfix"></div>
		<div id="address-viewer" class="hidden">
			<div id="address-shipping-text">
				<div class="address_label">Shipping Address</div>
				<span class="address_name"></span>
				(<span class="address_mobile"><i class="fa fa-mobile-phone fa-lg"></i></span>)<br/>
				<span class="address_company has-comma"></span>
				<span class="address_address"></span><br/>
				<span class="address_landmark has-comma"></span>
				<span class="address_district has-comma"></span>
				<span class="address_state_loc has-comma"></span>
				<span class="address_zip"></span> -
				<span class="address_country"></span><br/>
			</div>
			<div class="clearfix"></div>
			<div id="address-billing-text">
				<div class="address_label">Billing Address</div>
				<span class="address_name"></span>
				(<span class="address_mobile"><i class="fa fa-mobile-phone fa-lg"></i></span>)<br/>
				<span class="address_company has-comma"></span>
				<span class="address_address"></span><br/>
				<span class="address_landmark has-comma"></span>
				<span class="address_district has-comma"></span>
				<span class="address_state_loc has-comma"></span>
				<span class="address_zip"></span> -
				<span class="address_country"></span><br/>
			</div>
			<button type="button" class="btn btn-small pull-right btn-default btn-edit"><i
					class="fa fa-edit"></i> Change</button>
		</div>
		<div class="clearfix"></div>
	</div>

	<div id="cart-aio-shippingform" class="cart-aio hidden">
		<div class="legend"><?php echo JText::_('COM_SELLACIOUS_CART_CHECKOUT_SHIPPINGFORM_LABEL') ?></div>
		<div class="clearfix"></div>
		<div id="shippingform-editor"></div>
		<div id="shippingform-folded" class="hidden">
			<div id="shippingform-response"></div>
			<button type="button" class="btn btn-small pull-right btn-default btn-edit"><i class="fa fa-edit"></i> Change</button>
		</div>
		<div class="clearfix"></div>
	</div>

	<div id="cart-aio-checkoutform" class="cart-aio hidden">
		<div class="legend"><?php echo JText::_('COM_SELLACIOUS_CART_CHECKOUT_CHECKOUTFORM_LABEL') ?></div>
		<div class="clearfix"></div>
		<div id="checkoutform-editor">
			<form id="checkoutform-container"></form>
			<a class="btn btn-small btn-default btn-next pull-right">Next <i class="fa fa-arrow-right"></i></a>
		</div>
		<div id="checkoutform-folded" class="hidden">
			<div id="checkoutform-response">
			</div>
			<button type="button" class="btn btn-small pull-right btn-default btn-edit"><i
					class="fa fa-edit"></i> Change</button>
		</div>
		<div class="clearfix"></div>
	</div>

	<div id="cart-aio-summary" class="cart-aio hidden">
		<div class="legend"><?php echo JText::_('COM_SELLACIOUS_CART_CHECKOUT_ORDER_SUMMARY_LABEL'); ?></div>
		<div id="summary-items"></div>
		<div id="summary-folded" class="hidden"></div>
	</div>

	<div id="cart-aio-payment" class="cart-aio hidden">
		<div class="legend"><?php echo JText::_('COM_SELLACIOUS_CART_CHECKOUT_PAYMENT_LABEL') ?></div>
		<div id="payment-forms"></div>
	</div>

</div>
<input type="hidden" name="<?php echo JSession::getFormToken() ?>" id="formToken" value="1"/>

<!-- We use modal in this same page, so create new instance of AIO -->
<?php
$options = array(
	'title'    => JText::_('COM_SELLACIOUS_CART_TITLE'),
	'backdrop' => 'default',
	'size'     => 'sm',
	'footer'   => ''
);

echo JHtml::_('bootstrap.renderModal', 'modal-cart', $options);
