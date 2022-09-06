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
defined('_JEXEC') or die;

/**
 * Unit Table class
 */
class SellaciousTableTransaction extends SellaciousTable
{
	/**
	 * Constructor
	 *
	 * @param   JDatabaseDriver  $db  A database connector object
	 */
	public function __construct(&$db)
	{
		$this->_array_fields = array('payment_params', 'params');

		parent::__construct('#__sellacious_transactions', 'id', $db);
	}

	/**
	 * Method to store a row in the database from the JTable instance properties.
	 *
	 * If a primary key value is set the row with that primary key value will be updated with the instance property values.
	 * If no primary key value is set a new row will be inserted into the database with the properties from the JTable instance.
	 *
	 * @param   boolean  $updateNulls  True to update fields even if they are null.
	 *
	 * @return  boolean  True on success.
	 *
	 * @since   11.1
	 */
	public function store($updateNulls = false)
	{
		$saved = parent::store($updateNulls);

		if ($saved && empty($this->txn_number))
		{
			$o = new stdClass;

			$o->id         = $this->get('id');
			$o->txn_number = $this->getNumber();

			if ($this->_db->updateObject($this->getTableName(), $o, 'id', false))
			{
				$this->set('txn_number', $o->txn_number);
			}
		}

		return $saved;
	}

	/**
	 * Build a transaction number as a super key for this table
	 *
	 * @return  string
	 *
	 * @since   1.4.1
	 */
	public function getNumber()
	{
		$value = null;

		if (!empty($this->id) && !empty($this->txn_date))
		{
			$date = JFactory::getDate($this->txn_date);

			$d1 = base_convert($date->day, 10, 36);
			$m1 = base_convert($date->month, 10, 16);
			$y2 = str_pad($date->year - 2000, 2, '0', STR_PAD_LEFT);
			$o5 = str_pad($this->id, 5, '0', STR_PAD_LEFT);

			$value = strtoupper('ST' . $y2 . $m1 . $d1 . $o5);
		}

		return $value;
	}
}
