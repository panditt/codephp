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

class goodspackController extends JControllerLegacy
{
    public function display($cachable = false, $urlparams = false)
    {
        $jinput = JFactory::getApplication()->input;

        if ($getFields = $jinput->post->get('getFields', '', 'RAW'))
        {
            $model = $this->getModel('gp_model');
            echo json_encode($model->getFields());
            exit;
        }

        if ($options = $jinput->post->get('options', '', 'RAW'))
        {
            $block = $jinput->post->get('block', '', 'RAW');
            $model = $this->getModel('gp_model');
            echo $model->saveFields($options, urldecode($block));
            exit;
        }
        parent::display (); 
        return $this;

    	
    }
}