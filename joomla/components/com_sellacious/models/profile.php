<?php
/**
 * @version     1.4.3
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
class SellaciousModelProfile extends SellaciousModelAdmin
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

		$app = JFactory::getApplication();
		$me  = JFactory::getUser();

		// This form view is for user's own profile only with restricted access.
		$app->setUserState('com_sellacious.edit.profile.id', $me->id);
		$this->state->set('profile.id', $me->id);
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
	 * Method to get the data that should be injected in the form.
	 *
	 * @return  mixed  The data for the form.
	 *
	 * @since   1.6
	 */
	protected function loadFormData()
	{
		// Check the session for previously entered form data.
		$app  = JFactory::getApplication();
		$data = $app->getUserStateFromRequest("$this->option.edit.$this->name.data", 'jform', array(), 'array');

		if (empty($data))
		{
			// Load user info
			$data = $this->getItem();

			// Remove password
			unset($data->password);

			// Add profile info
			$profile = $this->helper->profile->getItem(array('user_id' => $data->get('id')));
			$client  = $this->helper->client->getItem(array('user_id' => $data->get('id')));
			$address = $this->helper->user->getPrimaryAddress($data->get('id'));

			$data->set('profile', $profile);
			$data->set('client', $client);
			$data->set('address', $address);
		}

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
		$obj     = is_array($data) ? ArrayHelper::toObject($data) : $data;
		$user_id = $this->getState('profile.id');
		$me      = JFactory::getUser();

		$canEdit = $this->helper->access->check('user.edit.own') && $user_id == $me->id && !$me->guest;

		if ($canEdit)
		{
			if (empty($obj->client->category_id))
			{
				$client_cat = $this->helper->category->getDefault('client');

				$obj->client->category_id = $client_cat->id;
			}

			if ($obj->client->category_id)
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

			$defaults = array('country', 'state_loc', 'district', 'zip', 'landmark');
			$allowed  = (array) $this->helper->config->get('geolocation_levels', $defaults);

			foreach ($defaults as $key)
			{
				if (!in_array($key, $allowed))
				{
					$form->removeField($key, 'address');
				}
			}
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

		$data['id']       = $this->getState('profile.id');
		$data['username'] = isset($data['username']) ? $data['username'] : $data['email'];

		$user = $this->saveUser($data);

		if (!($user instanceof JUser))
		{
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

	/**
	 * @param   array  $data  The data to save for related Joomla user account.
	 *
	 * @return  JUser|bool  The user id of the user account on success, false otherwise
	 * @throws  Exception
	 */
	protected function saveUser($data)
	{
		$user = new JUser($data['id']);

		$dispatcher = JEventDispatcher::getInstance();
		JPluginHelper::importPlugin('sellacious');

		// Bind the data.
		if (!$user->bind($data))
		{
			$this->setError($user->getError());

			return false;
		}

		// Trigger the onAfterSave event.
		$dispatcher->trigger('onBeforeSaveUser', array($this->option . '.' . $this->name, &$user, false));

		// Store the data.
		if (!$user->save())
		{
			$this->setError($user->getError());

			return false;
		}

		// Trigger the onAfterSave event.
		$dispatcher->trigger('onAfterSaveUser', array($this->option . '.' . $this->name, &$user, false));

		return $user;
	}
}
