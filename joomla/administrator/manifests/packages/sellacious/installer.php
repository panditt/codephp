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
defined('JPATH_PLATFORM') or die;

/**
 * Class pkg_sellaciousInstallerScript
 */
class pkg_sellaciousInstallerScript
{
	/**
	 * method to run before package uninstall
	 *
	 * @param   JInstallerAdapterPackage  $installer
	 *
	 * @throws  Exception
	 */
	public function uninstall($installer)
	{
		$table = JTable::getInstance('Extension');
		$files = $table->load(array('type' => 'file', 'element' => 'sellacious'));

		$table = JTable::getInstance('Extension');
		$lib   = $table->load(array('type' => 'library', 'element' => 'sellacious'));

		if ($files || $lib)
		{
			JLog::add('You need to uninstall "Sellacious Extended Package" first. The list has been filtered for your convenience.', JLog::WARNING, 'jerror');

			JFactory::getApplication()->redirect('index.php?option=com_installer&view=manage&filter[search]=Sellacious&filter[type]=package');
		}
	}
}
