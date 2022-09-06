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

/** @var  object          $displayData */
/** @var  SellaciousCart  $cart */
$cart   = $displayData->cart;
$helper = SellaciousHelper::getInstance();
$totals = $cart->getTotals(true);
$items  = $cart->get('items');

$shipName = $cart->get('shipment_params.ruleTitle');
$svcName  = $cart->get('shipment_params.serviceName');
$shipping = $cart->get('shipment_params.total', 0);
$ship_tbd = $cart->get('shipment_params.tbd', false);

if ($ship_tbd)
{
	echo JText::_('COM_SELLACIOUS_CART_NO_SHIPPING_METHOD_SELECTED');
}
elseif ($shipping)
{
	$g_currency = $cart->getCurrency();
	$total      = $helper->currency->display($shipping, $g_currency, $g_currency, true);

	echo '<h3 class="text-center">';
	echo JText::sprintf('COM_SELLACIOUS_CART_SHIPPING_METHOD_SELECTED_NAME_VALUE', $shipName, $svcName, $total);
	echo '</h3>';
}
else
{
	echo '<h3 class="text-center">';
	echo trim(JText::sprintf('COM_SELLACIOUS_CART_SHIPPING_METHOD_SELECTED_NAME', $shipName, $svcName), ' -');
	echo '</h3>';
}
