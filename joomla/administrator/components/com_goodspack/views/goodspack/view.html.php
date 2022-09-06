<?php
/**
* @package Price Comparison Shopping Engine - UkrSolution for Joomla! 1.6, 1.7, 2x, 3.x* @version 1.0.1
* @author UkrSolution
* @copyright (C) 2015 - UkrSolution
* @license GNU/GPLv3 http://www.gnu.org/licenses/gpl-3.0.html
**/



defined ('_JEXEC') or die ('Restricted access');

jimport ('joomla.application.component.controller');
jimport ('joomla.application.component.view');
jimport ('joomla.application.component.model');
jimport('joomla.application.component.helper');
class goodspackViewgoodspack extends JViewLegacy
{
    public function display ($tpl = null)
    {
    	JToolBarHelper::title (JText::_('COM_GOODSPACK_MAINTITLE'), 'logo');
        parent::display ($tpl);
    }
}