<?php
/**
 * @version     1.4.4
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access
use Joomla\Registry\Registry;

defined('JPATH_PLATFORM') or die;

/**
 * This is a workaround against the php time limit which causes installation to stop abruptly.
 * This is so far observed only on windows platform, but can occur anywhere.
 *
 * We should fix the issue soon as why the simple install sql is taking so much time.
 */
set_time_limit(600);

/**
 * @package   Sellacious
 *
 * @since     1.4.4
 */
class Com_sellaciousInstallerScript
{
	/**
	 * Method to run before process start
	 *
	 * @param   string                    $route
	 * @param   JInstallerAdapterPackage  $installer
	 *
	 * @throws  Exception
	 */
	public function preflight($route, $installer)
	{
		try
		{
			/** @var  JTableExtension $extension */
			$extension = JTable::getInstance('Extension');
			$extension->load(array('element' => 'com_sellacious', 'type' => 'component', 'client_id' => 1));

			if (!$extension->get('extension_id'))
			{
				return;
			}

			$db    = JFactory::getDbo();
			$query = $db->getQuery(true);

			$query->select('version_id')->from('#__schemas')
				->where('extension_id = ' . (int) $extension->get('extension_id'));

			$version = $db->setQuery($query)->loadResult();

			if (!$version)
			{
				// Only v1.4.1 in public release has this issue.
				$query->clear()->insert('#__schemas')
					->columns('extension_id, version_id')
					->values((int) $extension->get('extension_id') . ', ' . $db->q('1.4.1'));

				$db->setQuery($query)->execute();
			}
		}
		catch (RuntimeException $e)
		{
		}
	}
}
