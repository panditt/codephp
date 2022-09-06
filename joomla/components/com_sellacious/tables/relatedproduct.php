<?php
/**
 * @version     1.3.3
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access
defined('_JEXEC') or die;

/**
 * Coupon Table class
 */
class SellaciousTableRelatedProduct extends SellaciousTable
{
	/**
	 * Constructor
	 *
	 * @param  JDatabaseDriver  $db  A database connector object
	 */
	public function __construct(&$db)
	{
		parent::__construct('#__sellacious_relatedproducts', 'id', $db);
	}

	/**
	 * Asset that the nested set data is valid.
	 *
	 * @return  boolean  True if the instance is sane and able to be stored in the database.
	 *
	 * @link    http://docs.joomla.org/JTable/check
	 * @since   11.1
	 *
	 * @throws  Exception
	 * @throws  RuntimeException on database error.
	 * @throws  UnexpectedValueException
	 */
	public function check()
	{
		$title = $this->get('group_title');
		$alias = JFilterOutput::stringURLSafe($title);

		if (trim(str_replace('-', '', $alias)) == '')
		{
			$alias = base64_encode($title);
		}

		$this->set('group_alias', $alias);

		// If this alias is already defined, use associated title itself, ignore current
		$table = self::getInstance($this->getName());
		$k     = $this->_tbl_key;

		if ($table->load(array('group_alias' => $alias)) && ($table->$k != $this->$k || $this->$k == 0))
		{
			$this->set('group_title', $table->get('group_title'));
		}

		return parent::check();
	}
}
