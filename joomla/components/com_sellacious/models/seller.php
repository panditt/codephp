<?php
/**
 * @version     1.4.2
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     SPL Sellacious Private License; see http://www.sellacious.com/spl.html
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access.
defined('_JEXEC') or die;

use Joomla\Registry\Registry;

/**
 * Sellacious seller model.
 */
class SellaciousModelSeller extends SellaciousModelAdmin
{
	/**
	 * Method to test whether a record can be deleted.
	 *
	 * @param   object $record A record object.
	 *
	 * @return  boolean  True if allowed to delete the record. Defaults to the permission for the component.
	 *
	 * @since   12.2
	 */
	protected function canDelete($record)
	{
		return false;
	}

	/**
	 * Method to test whether a record can be deleted.
	 *
	 * @param   object  $record  A record object.
	 *
	 * @return  boolean  True if allowed to change the state of the record. Defaults to the permission for the component.
	 *
	 * @since   12.2
	 */
	protected function canEditState($record)
	{
		return false;
	}

	/**
	 * Method to allow derived classes to preprocess the data.
	 *
	 * @param   string $context The context identifier.
	 * @param   mixed  &$data   The data to be processed. It gets altered directly.
	 *
	 * @return  void
	 *
	 * @since   3.1
	 */
	protected function preprocessData($context, &$data)
	{
		$me = JFactory::getUser();

		if (!$me->guest)
		{
			$mobile = $this->helper->profile->loadResult(array('list.select' => 'a.mobile', 'user_id' => $me->id));

			if (is_object($data))
			{
				$data->name  = $me->name;
				$data->email = $me->email;
				$data->phone = $mobile;
			}
			elseif (is_array($data))
			{
				$data['name']   = $me->name;
				$data['email']  = $me->email;
				$data['mobile'] = $mobile;
			}
		}

		parent::preprocessData($context, $data);
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
		$me = JFactory::getUser();

		if (!$me->guest)
		{
			$form->setFieldAttribute('name', 'disabled', 'true');
			$form->setFieldAttribute('email', 'disabled', 'true');
			$form->setFieldAttribute('name', 'required', 'false');
			$form->setFieldAttribute('email', 'required', 'false');
		}

		parent::preprocessForm($form, $data, $group);
	}

	/**
	 * Method to save the form data.
	 *
	 * @param   array  The form data.
	 *
	 * @return  boolean  True on success.
	 * @since   1.6
	 */
	public function save($data)
	{
		$me     = JFactory::getUser();
		$cat_id = $this->getDefaultCategory();

		if (!$cat_id)
		{
			$this->setError(JText::_('COM_SELLACIOUS_SELLER_REGISTER_NO_CATEGORY_EXISTS'));

			return false;
		}

		// Check email exists also.
		if ($me->guest)
		{
			$prop     = array(
				'name'     => $data['name'],
				'username' => $data['email'],
				'email'    => $data['email'],
			);
			$registry = new Registry($prop);
			$user     = $this->helper->user->autoRegister($registry);
		}
		else
		{
			$user = $me;
		}

		if (!($user instanceof JUser))
		{
			return false;
		}

		$profile = array('mobile' => $data['phone'], 'user_id' => $user->id, 'state' => 1);

		$this->helper->user->saveProfile($profile, $user->id);

		$seller                = array();
		$seller['user_id']     = $user->id;
		$seller['category_id'] = $cat_id;
		$seller['title']       = $data['company'];
		$seller['state']       = 1;

		$this->helper->user->addAccount($seller, 'seller');

		$address          = new stdClass;
		$address->id      = 0;
		$address->user_id = $user->id;
		$address->country = $data['country'];

		$this->helper->user->saveAddress((array) $address, $user->id);

		$object     = $this->helper->seller->loadObject(array('user_id' => $user->id));
		$dispatcher = $this->helper->core->loadPlugins();
		$dispatcher->trigger('onContentAfterSave', array('com_sellacious.seller', $object, true));

		return $user->id;
	}

	/**
	 * Get the default seller category
	 *
	 * @return  int
	 */
	protected function getDefaultCategory()
	{
		$filters     = array('list.select' => 'a.id', 'type' => 'seller', 'is_default' => 1);
		$category_id = $this->helper->category->loadResult($filters);

		if (!$category_id)
		{
			$filters     = array('list.select' => 'a.id', 'type' => 'seller');
			$category_id = $this->helper->category->loadResult($filters);
		}

		return $category_id;
	}
}
