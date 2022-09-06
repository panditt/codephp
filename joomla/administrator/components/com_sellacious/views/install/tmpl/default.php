<?php
/**
 * @version     1.3.3
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
defined('_JEXEC') or die;
?>
<div class="row">
	<form action="<?php echo JRoute::_('index.php?option=com_sellacious') ?>" method="post">
		<div class="center"><button class="btn btn-primary btn-large">Download &amp; Install Now</button></div>
		<br>
		<p class="center" style="color: #f00000;"><?php echo JText::_('COM_SELLACIOUS_INSTALL_AUTO_AGREE_SELLACIOUS_TERMS_NOTE') ?></p>
		<input type="hidden" name="task" value="install">
		<?php echo JHtml::_('form.token'); ?>
	</form>
</div>
