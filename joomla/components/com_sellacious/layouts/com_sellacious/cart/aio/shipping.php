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

/** @var  object $displayData */
/** @var  SellaciousCart $cart */
$cart = $displayData->cart;

$helper       = SellaciousHelper::getInstance();
$itemisedShip = (bool) $helper->config->get('itemised_shipping', true);

if ($itemisedShip)
{
	echo $this->subLayout('itemised', $displayData);
}
else
{
	echo $this->subLayout('cart', $displayData);
}
