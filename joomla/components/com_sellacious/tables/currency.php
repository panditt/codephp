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
 * Currency Table class
 */
class SellaciousTableCurrency extends SellaciousTable
{
	/**
	 * Constructor
	 *
	 * @param  JDatabaseDriver  $db  A database connector object
	 */
	public function __construct(&$db)
	{
		parent::__construct('#__sellacious_currencies', 'id', $db);
	}

	/**
	 * Returns an array of conditions to meet for the uniqueness of the row, of course other than the primary key
	 *
	 * @return  array  key-value pairs to check the table row uniqueness against the row being checked
	 */
	protected function getUniqueConditions()
	{
		$conditions = array();

		$conditions['code_3'] = array('code_3' => $this->get('code_3'));
		$conditions['title']  = array('title' => $this->get('title'));

		return $conditions;
	}

	/**
	 * Get Custom error message for each uniqueness error
	 *
	 * @param   array  $uk_index  Array index/identifier of unique keys returned by getUniqueConditions
	 * @param   JTable $table     Table object with which conflicted
	 *
	 * @return  bool|string
	 */
	protected function getUniqueError($uk_index, JTable $table)
	{
		if ($uk_index === 'code_3')
		{
			return JText::sprintf('COM_SELLACIOUS_TABLE_UNIQUE_KEY_CURRENCY_CODE3_X', $table->get('code_3'));
		}
		elseif ($uk_index === 'title')
		{
			return JText::sprintf('COM_SELLACIOUS_TABLE_UNIQUE_KEY_CURRENCY_TITLE_X', $table->get('title'));
		}

		return false;
	}
}
