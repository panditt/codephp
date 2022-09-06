<?php
/**
 * @version     1.3.3
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access
defined('_JEXEC') or die;

/** @var SellaciousViewProduct $this */
JHtml::_('stylesheet', 'com_sellacious/fe.component.css', null, true);
?>
<div style="text-align: center;">
	<h1 class="red">Success!</h1>
	<h3><?php echo JText::_('COM_SELLACIOUS_PRODUCT_QUERY_FORM_SUBMIT_SUCCESS') ?></h3>
</div>
