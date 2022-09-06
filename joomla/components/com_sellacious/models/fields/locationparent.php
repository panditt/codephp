<?php
/**
 * @version     1.3.3
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     SPL Sellacious Private License; see http://www.sellacious.com/spl.html
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access.
defined('_JEXEC') or die;

use Joomla\Utilities\ArrayHelper;

JFormHelper::loadFieldClass('Hidden');

/**
 * Form Field class for the geo location.
 *
 * @package		Joomla.Administrator
 * @subpackage	com_sellacious
 * @since		1.6
 */
class JFormFieldLocationParent extends JFormFieldHidden
{
	/**
	 * The field type.
	 *
	 * @var	 string
	 */
	protected $type = 'LocationParent';

	/**
	 * Get the input html markup
	 *
	 * @return  string
	 * @throws  Exception
	 */
	protected function getInput()
	{
		JHtml::_('jquery.framework');
		JHtml::_('script', 'com_sellacious/field.location.js', false, true);

		$app  = JFactory::getApplication();
		$type = $this->form->getValue('type');

		if (empty($type))
		{
			$type = $app->getUserState('com_sellacious.locations.filter.type');
		}

		if (empty($type))
		{
			$html = '
			<div class="alert adjusted alert-info fade in">
				<i class="fa fa-fw fa-lg fa-exclamation"></i>
				<strong>Hey hey! </strong> '. JText::_('COM_SELLACIOUS_SELECT_LOCATION_TYPE_FIRST') . '
			</div>
			';

			return $html;
		}

		$this->form->setValue('type', $type);

		$typesP = array(
			'continent' => array(),
			'country'   => array('continent'),
			'state'     => array('country'),
			'district'  => array('country', 'state'),
			'area'      => array('country', 'state', 'district'),
			'zip'       => array('country', 'state', 'district', 'area'),
		);
		$types  = ArrayHelper::getValue($typesP, $type, array(), 'array');

		if (count($types))
		{
			$args   = array(
				'id'    => $this->id,
				'name'  => $this->name,
				'types' => $types,
			);
			$args   = json_encode($args);
			$script = "
				jQuery(document).ready(function($) {
					var o = new JFormFieldLocation;
					o.setup({$args});
				});
			";

			JFactory::getDocument()->addScriptDeclaration($script);
		}

		return parent::getInput();
	}
}
