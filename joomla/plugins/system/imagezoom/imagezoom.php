<?php
/**
 * @copyright	Copyright (c) 2015 Image Zoom. All rights reserved.
 * @license		http://www.gnu.org/licenses/gpl-2.0.html GNU/GPL
 */

// no direct access
defined('_JEXEC') or die;

jimport('joomla.plugin.plugin');

/**
 * system - imagezoom Plugin
 *
 * @package		Joomla.Plugin
 * @subpakage	ImageZoom.imagezoom
 */
class plgsystemimagezoom extends JPlugin {

	/**
	 * Constructor.
	 *
	 * @param 	$subject
	 * @param	array $config
	 */
	function __construct(&$subject, $config = array()) {
		// call parent constructor
		parent::__construct($subject, $config);
	}
	
	function onBeforeRender()
	{
		$app = JFactory::getApplication()->input;

		if ($app->get('option') == "com_virtuemart" && $app->get('view') == "productdetails")
		{
			$document = JFactory::getDocument();
			$document->addScript(JUri::root()."media/plg_imagezoom/zoom.min.js");
			

			$document->addScriptDeclaration("
				jQuery(document).ready(function(){
					var imgtag = jQuery('.main-image').children().children();
					var mainImgSrc = jQuery(imgtag).attr('src');
					jQuery(imgtag).attr('id','zoom_02');
					jQuery(imgtag).attr('data-zoom-image',mainImgSrc);
					jQuery('#zoom_02').elevateZoom({ zoomWindowFadeIn: 1000, zoomWindowFadeOut: 1000, lensFadeIn: 500, lensFadeOut: 500}); 
					
				});
			");
		}
	}
}