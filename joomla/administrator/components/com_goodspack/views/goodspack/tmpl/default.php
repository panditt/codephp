<?php
/**
* @package Price Comparison Shopping Engine - UkrSolution for Joomla! 1.6, 1.7, 2x, 3.x* @version 1.0.1
* @author UkrSolution
* @copyright (C) 2015 - UkrSolution
* @license GNU/GPLv3 http://www.gnu.org/licenses/gpl-3.0.html
**/
 defined ('_JEXEC') or die; ?>
<script tyhpe="text/javascript" src="<?php echo JURI::base()?>components/com_goodspack/js/jquery-1.11.3.js"></script>
<script tyhpe="text/javascript" src="<?php echo JURI::base()?>components/com_goodspack/js/gp_script.js"></script>
<link rel="stylesheet" type="text/css" href="<?php echo JURI::base()?>components/com_goodspack/styles/gp_style.css">


<div class="ukrsol_put_inner_dom" id="ukrsol_put_inner_dom">
	<div class="ukrsol_simple_add ukrsol_non_select ukrsol_cursor_default">
		<div class="ukrsol_settings_panel ukrsol_float_left">
			<span class="ukrsol_simple_header_img"></span>
			<h1 class="ukrsol_simple_h1"><?php echo JText::_('COM_GOODSPACK_ADDGP'); ?></h1>			
			<div class="ukrsol_div_tab_title" id="ukrsol_div_tab_title"></div>
			<div class="ukrsol_tab" id="tab"></div>			
			<div class="embedcontainer">
			<h2><?php echo JText::_('COM_GOODSPACK_EMBED'); ?></h2>
				<textarea class="ukrsol_embedcode"></textarea>
			</div>
			<div class="ukrsol_button_conteiner"><button class="ukrsol_button"><?php echo JText::_('COM_GOODSPACK_SAVE'); ?></button></div>
			<div class="ukrsol_footer"><a class="" href="https://www.ukrsolution.com/Create-Price-Comparison-System-GoodsPack" target="_blank"><span class="ukrsol_logo"></span></a></div>
		</div>
	</div>
	<div class="frame_block">
		<nav>
		    <ul class="clearfix">
		        <li id="pagetab1" class="active" onclick="pagetab('pagetab1')"><a href="<?php echo JURI::root()?>/index.php?option=com_goodspack&amp;tmpl=component" target="iframe_front"><?php echo JText::_('COM_GOODSPACK_ONLYGP'); ?></a></li>
		        <li id="pagetab2" class="inactive" onclick="pagetab('pagetab2')"><a href="<?php echo JURI::root()?>/index.php?option=com_goodspack" target="iframe_front"><?php echo JText::_('COM_GOODSPACK_SITEVIEW'); ?></a></li>		        
		    </ul>
		</nav>
		<section id="content">
			<div class="iframe_wrapper">
	    		<iframe id="iframe_front" src="<?php echo JURI::root()?>/index.php?option=com_goodspack&amp;tmpl=component" width="100%" height="100%" style="border: none" name="iframe_front"></iframe>
			</div>
		</section>
	</div>		
</div>
