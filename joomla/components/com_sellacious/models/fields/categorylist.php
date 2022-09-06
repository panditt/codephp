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

JFormHelper::loadFieldClass('List');

/**
 * Form Field class for the sellacious category list.
 *
 * @since   1.6
 */
class JFormFieldCategoryList extends JFormFieldList
{
	/**
	 * The field type.
	 *
	 * @var  string
	 */
	protected $type = 'CategoryList';

	/**
	 * Method to get the field options.
	 *
	 * @return  array  The field option objects.
	 * @since   1.6
	 */
	protected function getOptions()
	{
		// This may be called from outer context so load helpers explicitly.
		jimport('sellacious.loader');

		if (!class_exists('SellaciousHelper'))
		{
			JFactory::getApplication()->enqueueMessage('Sellacious Library was not found.', 'error');

			return parent::getOptions();
		}

		$db     = JFactory::getDbo();
		$helper = SellaciousHelper::getInstance();

		$show  = (string) $this->element['show_all'] == 'true';
		$type  = (string) $this->element['group'];
		$types = explode(';', $type);

		$filter  = array(
			'list.select' => 'a.id, a.title, a.type, a.lft, a.rgt',
			'list.where'  => array('a.state = 1', 'a.level > 0', 'a.type IN (' . implode(', ', $db->q($types)) . ')'),
		);
		$items   = $helper->category->loadObjectList($filter);
		$options = array();

		foreach ($items as $item)
		{
			// We enable only leaf nodes for selection
			$level   = ($item->level > 1) ? (str_repeat('|&mdash; ', $item->level - 1)) : '';
			$disable = $show ? false : ($item->rgt - $item->lft) > 1;

			$options[] = JHtmlSelect::option($item->id, $level . $item->title, 'value', 'text', $disable);
		}

		return array_merge(parent::getOptions(), $options);
	}
}
