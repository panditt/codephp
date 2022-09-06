<?php
/**
 * @version     1.3.3
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access.
defined('_JEXEC') or die;

JFormHelper::loadFieldClass('list');

/**
 * Form Field class for the Joomla Framework.
 *
 * @package     Joomla.Administrator
 * @subpackage  com_sellacious
 *
 * @since       1.6
 */
class JFormFieldFormFields extends JFormFieldList
{
	/**
	 * The field type.
	 *
	 * @var  string
	 */
	protected $type = 'FormFields';

	/**
	 * Method to get the field options.
	 *
	 * @return  array  The field option objects.
	 *
	 * @since   1.6
	 */
	protected function getOptions()
	{
		$db      = JFactory::getDbo();
		$query   = $db->getQuery(true);
		$options = array();

		$tags     = (string) $this->element['tags'] == 'true';
		$context  = trim((string) $this->element['context'], ' ,');
		$contexts = $context ? explode(',', $context) : array();

		$query->select($db->qn(array('a.id', 'a.title', 'a.type', 'a.filterable')))
			->from('#__sellacious_fields AS a')
			->where('a.level > 1');

		$query->select($db->qn('g.title', 'group_title'))
			->join('left', '#__sellacious_fields g ON g.id = a.parent_id')
			->group('a.id');

		if (count($contexts))
		{
			$query->where('g.context IN (' . implode(', ', $db->q($contexts)) . ')');
		}

		$query->order('g.title, a.title');

		$db->setQuery($query);

		try
		{
			$helper  = SellaciousHelper::getInstance();
			$results = $db->loadObjectList();

			foreach ($results as $result)
			{
				$option = new stdClass;
				$format = $result->filterable ? '%s / %s (%s) [Filterable]' : '%s / %s (%s)';

				$option->value = $result->id;
				$option->text  = sprintf($format, $result->group_title, $result->title, $result->type);

				if ($tags)
				{
					$tags_o = $helper->field->getTags($result->id);

					if (count($tags_o))
					{
						$titles = Joomla\Utilities\ArrayHelper::getColumn($tags_o, 'tag_title');

						$option->text = sprintf('%s : %s', implode(', ', $titles), $option->text);
					}
				}

				$options[] = $option;
			}
		}
		catch (Exception $e)
		{
			JLog::add($e->getMessage(), JLog::WARNING, 'jerror');

			$options = array();
		}

		$options = Joomla\Utilities\ArrayHelper::sortObjects($options, 'text');

		// Merge any additional options in the XML definition.
		$options = array_merge(parent::getOptions(), $options);

		return $options;
	}

}
