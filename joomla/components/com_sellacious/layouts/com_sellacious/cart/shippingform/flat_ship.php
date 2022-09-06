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

use Joomla\Utilities\ArrayHelper;

JHtml::_('behavior.framework');

/** @var  stdClass        $displayData */
/** @var  SellaciousCart  $cart */
$cart  = $displayData->cart;
$items = $cart->getItems();

if (count($items) == 0)
{
	return;
}

$helper     = SellaciousHelper::getInstance();
$g_currency = $cart->getCurrency();
$c_currency = $helper->currency->current('code_3');

$shipName = $cart->get('shipment_params.ruleTitle');
$shipping = $cart->get('shipment_params.total', 0);
$ship_tbd = $cart->get('shipment_params.tbd', false);
?>
<h3><?php echo $shipName ?>: <?php echo $helper->currency->display($shipping, $g_currency, $c_currency); ?></h3>

<a class="btn btn-small btn-default btn-next pull-right">Next <i class="fa fa-arrow-right"></i></a><?php
