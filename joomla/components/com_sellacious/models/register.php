<?php
/**
 * @version     1.4.2
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     SPL Sellacious Private License; see http://www.sellacious.com/spl.html
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access
defined('_JEXEC') or die;

use Joomla\Registry\Registry;
use Joomla\Utilities\ArrayHelper;

/**
 * Sellacious model.
 */
class SellaciousModelRegister extends SellaciousModelAdmin
{
	/**
	 * Stock method to auto-populate the model state.
	 *
	 * @return  void
	 *
	 * @since   12.2
	 */
	protected function populateState()
	{
		parent::populateState();

		$app     = JFactory::getApplication();
		$catid   = $app->input->getInt('catid');
		$filters = array('id' => $catid, 'type' => 'client');
		$cat     = $this->helper->category->loadResult($filters) ?: $this->helper->category->getDefault('client');

		$this->state->set('register.catid', $cat->id);
	}

	/**
	 * Returns a reference to the a Table object, always creating it.
	 *
	 * @param   string  $type    Table name
	 * @param   string  $prefix  A prefix for the table class name. Optional.
	 * @param   array   $config  Configuration array for table. Optional.
	 *
	 * @return  JTable
	 */
	public function getTable($type = 'User', $prefix = 'SellaciousTable', $config = array())
	{
		return parent::getTable($type, $prefix, $config);
	}

	/**
	 * Method to get the record form.
	 *
	 * @param   array   $data     An optional array of data for the form to interrogate.
	 * @param   boolean $loadData True if the form is to load its own data (default case), false if not
	 *
	 * @return  JForm|bool  A JForm object on success, false on failure
	 */
	public function getForm($data = array(), $loadData = true)
	{
		$name = strtolower($this->option . '.' . $this->name);

		$form = $this->loadForm($name, 'profile', array('control' => 'jform', 'load_data' => $loadData));

		if (empty($form))
		{
			return false;
		}

		return $form;
	}

	/**
	 * Method to get the data that should be injected in the form.
	 *
	 * @return  mixed  The data for the form.
	 *
	 * @since   1.6
	 */
	protected function loadFormData()
	{
		// Check the session for previously entered form data.
		$app   = JFactory::getApplication();
		$data  = $app->getUserStateFromRequest("$this->option.edit.$this->name.data", 'jform', array(), 'array');
		$catid = $this->getState('register.catid');

		$data['client']['category_id'] = $catid;

		$this->preprocessData('com_sellacious.' . $this->name, $data);

		return $data;
	}

	/**
	 * Override preprocessForm to load the sellacious plugin group instead of content.
	 *
	 * @param   JForm   $form   A form object.
	 * @param   mixed   $data   The data expected for the form.
	 * @param   string  $group  Plugin group to load
	 *
	 * @return  void
	 */
	protected function preprocessForm(JForm $form, $data, $group = 'sellacious')
	{
		$obj   = is_array($data) ? ArrayHelper::toObject($data) : $data;
		$catid = $this->getState('register.catid');

		$obj->client = new stdClass;

		$obj->client->category_id = $catid;

		if (!empty($obj->client->category_id))
		{
			$form->loadFile('profile/client');

			$client_id = isset($obj->client->id) ? $obj->client->id : 0;
			$form->setFieldAttribute('org_certificate', 'record_id', $client_id, 'client');
		}

		if (!$this->helper->config->get('user_currency'))
		{
			$form->removeField('currency', 'profile');
		}

		$form->loadFile('profile/address');

		// Remove disabled fields from address form
		$category = $this->helper->category->getItem($catid);
		$params   = new Registry($category->params);

		if (!$params->get('name'))
		{
			$form->removeField('name');
		}

		if (!$params->get('params.timezone'))
		{
			$form->removeField('timezone', 'params');
		}

		if (!$params->get('client.client_type'))
		{
			$form->removeField('client_type', 'client');
		}

		if (!$params->get('client.business_name'))
		{
			$form->removeField('business_name', 'client');
		}

		if (!$params->get('client.org_reg_no'))
		{
			$form->removeField('org_reg_no', 'client');
		}

		if (!$params->get('client.org_certificate'))
		{
			$form->removeField('org_certificate', 'client');
		}

		if (!$params->get('profile.mobile'))
		{
			$form->removeField('mobile', 'profile');
		}

		if (!$params->get('profile.website'))
		{
			$form->removeField('website', 'profile');
		}

		if (!$params->get('profile.currency'))
		{
			$form->removeField('currency', 'profile');
		}

		if (!$params->get('profile.bankinfo.name'))
		{
			$form->removeField('name', 'profile.bankinfo');
		}

		if (!$params->get('profile.bankinfo.country'))
		{
			$form->removeField('country', 'profile.bankinfo');
		}

		if (!$params->get('profile.bankinfo.branch'))
		{
			$form->removeField('branch', 'profile.bankinfo');
		}

		if (!$params->get('profile.bankinfo.benificiary'))
		{
			$form->removeField('benificiary', 'profile.bankinfo');
		}

		if (!$params->get('profile.bankinfo.accountnumber'))
		{
			$form->removeField('accountnumber', 'profile.bankinfo');
		}

		if (!$params->get('profile.bankinfo.code'))
		{
			$form->removeField('code', 'profile.bankinfo');
		}

		if (!$params->get('profile.bankinfo.micr'))
		{
			$form->removeField('micr', 'profile.bankinfo');
		}

		if (!$params->get('profile.bankinfo.ifsc'))
		{
			$form->removeField('ifsc', 'profile.bankinfo');
		}

		if (!$params->get('profile.bankinfo.swift'))
		{
			$form->removeField('swift', 'profile.bankinfo');
		}

		if (!$params->get('profile.taxinfo.salestax'))
		{
			$form->removeField('salestax', 'profile.taxinfo');
		}

		if (!$params->get('profile.taxinfo.servicetax'))
		{
			$form->removeField('servicetax', 'profile.taxinfo');
		}

		if (!$params->get('profile.taxinfo.incometax'))
		{
			$form->removeField('incometax', 'profile.taxinfo');
		}

		if (!$params->get('profile.taxinfo.tax'))
		{
			$form->removeField('tax', 'profile.taxinfo');
		}

		if (!$params->get('address'))
		{
			$form->removeGroup('address');
		}

		parent::preprocessForm($form, $data, $group);
	}

	/**
	 * Method to save the form data.
	 *
	 * @param   array  $data  The form data.
	 *
	 * @return  int
	 * @throws  Exception
	 */
	public function save($data)
	{
		// Extract variables
		$profile = ArrayHelper::getValue($data, 'profile', null);
		$client  = ArrayHelper::getValue($data, 'client', null);
		$address = ArrayHelper::getValue($data, 'address', null);

		unset($data['profile'], $data['client'], $data['address']);

		$data['id']       = 0;
		$data['username'] = isset($data['username']) ? $data['username'] : $data['email'];

		try
		{
			$user = $this->helper->user->autoRegister(new Registry($data));

			if (!($user instanceof JUser))
			{
				return false;
			}

			$this->setState("$this->name.id", $user->id);
		}
		catch (Exception $e)
		{
			$this->setError($e->getMessage());

			return false;
		}

		// Set up profile and all for the user just saved
		$this->helper->user->saveProfile($profile, $user->id);

		// Save client
		if (!empty($client['category_id']))
		{
			$client['user_id'] = $user->id;

			$this->helper->user->addAccount($client, 'client');
		}

		if ($address)
		{
			$address['is_primary'] = 1;

			$this->helper->user->saveAddress($address, $user->id);
		}

		return $user->id;
	}
}
