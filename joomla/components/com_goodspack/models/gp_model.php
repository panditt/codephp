<?php
/**
* @package Price Comparison Shopping Engine - UkrSolution for Joomla! 1.6, 1.7, 2x, 3.x* @version 1.0.1
* @author UkrSolution
* @copyright (C) 2015 - UkrSolution
* @license GNU/GPLv3 http://www.gnu.org/licenses/gpl-3.0.html
**/




defined ('_JEXEC') or die;
jimport ('joomla.application.component.controller');
jimport ('joomla.application.component.view');
jimport ('joomla.application.component.model');
jimport('joomla.application.component.helper');
class goodspackModelgp_model extends JModelLegacy
{
	public function getFields ()
	{
		$fields = JComponentHelper::getParams('com_goodspack')->get('block');
		return $fields;
	}	
}