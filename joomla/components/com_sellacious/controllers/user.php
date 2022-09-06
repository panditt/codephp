<?php
/**
 * @version     1.4.3
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access
defined('_JEXEC') or die;

use Joomla\Utilities\ArrayHelper;

/**
 * User controller class.
 *
 * @since  1.0
 */
class SellaciousControllerUser extends SellaciousControllerBase
{
	/**
	 * @var	 string  The prefix to use with controller messages.
	 *
	 * @since  1.6
	 */
	protected $text_prefix = 'COM_SELLACIOUS_USER';

	/**
	 * Check email to match registered user exists
	 *
	 * @return  void
	 */
	public function checkEmailAjax()
	{
		$app = JFactory::getApplication();

		try
		{
			if (!JSession::checkToken())
			{
				throw new Exception(JText::_('JINVALID_TOKEN'));
			}

			$email = $app->input->post->getString('email');
			$regex = chr(1) . '^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$' . chr(1);

			if ($email == '' || !preg_match($regex, $email))
			{
				$data = array(
					'message' => JText::_($this->text_prefix . '_INVALID_EMAIL'),
					'data'    => null,
					'status'  => 1001,
				);
			}
			else
			{
				$db    = JFactory::getDbo();
				$query = $db->getQuery(true);
				$query->select('id, username, name, email, block, activation')->from('#__users')->where('email = ' . $db->q($email));

				$db->setQuery($query);
				$user = $db->loadObject();

				if (empty($user->id))
				{
					$data = array(
						'message' => JText::_($this->text_prefix . '_EMAIL_NO_MATCH'),
						'data'    => $user,
						'status'  => 1002,
					);
				}
				elseif (!$user->block)
				{
					$data = array(
						'message' => JText::_($this->text_prefix . '_EMAIL_MATCH'),
						'data'    => $user,
						'status'  => 1003,
					);
				}
				elseif ($user->activation)
				{
					$uParams    = JComponentHelper::getParams('com_users');
					$activation = $uParams->get('useractivation');

					$data = array(
						'message' => JText::_($this->text_prefix . '_USER_NOT_ACTIVATED_' . ($activation == 1 ? 'SELF' : 'ADMIN')),
						'data'    => $user,
						'status'  => 1004,
					);
				}
				else
				{
					$data = array(
						'message' => JText::_($this->text_prefix . '_USER_BLOCKED'),
						'data'    => $user,
						'status'  => 1005,
					);
				}
			}
		}
		catch (Exception $e)
		{
			$data  = array(
				'message' => $e->getMessage(),
				'data'    => $app->input->post->getArray(),
				'result'  => 0,
			);
		}

		echo json_encode($data);

		$app->close();
	}

	/**
	 * Create a new user account with the given email
	 *
	 * @return  void
	 */
	public function registerAjax()
	{
		$app = JFactory::getApplication();

		try
		{
			if (!JSession::checkToken())
			{
				throw new Exception(JText::_('JINVALID_TOKEN'));
			}

			$email = $app->input->post->getString('email');
			$regex = chr(1) . '^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$' . chr(1);

			// If the current user is not guest, we must not logout.
			// Return warning so that the calling page may act appropriately.
			$user = JFactory::getUser();

			if (!$user->guest)
			{
				$data = array(
					'message' => JText::sprintf($this->text_prefix . '_ALREADY_LOGGED_IN', $user->email),
					'data'    => array(
						'id'       => $user->id,
						'name'     => $user->name,
						'username' => $user->username,
						'email'    => $user->email,
					),
					'status'  => 1011,
				);
			}
			elseif ($email == '' || !preg_match($regex, $email))
			{
				$data = array(
					'message' => JText::_($this->text_prefix . '_INVALID_EMAIL'),
					'data'    => array(
						'email'  => $email,
					),
					'status'  => 1001,
				);
			}
			else
			{
				$info  = new Joomla\Registry\Registry;
				$info->set('name', $email);
				$info->set('username', $email);
				$info->set('email', $email);

				$uParams = JComponentHelper::getParams('com_users');

				$r_aio = $this->helper->config->get('require_activation_cart_aio');
				$r_act = $uParams->get('useractivation');
				$auto  = $r_aio == 0 || $r_act == 0;

				$user  = $this->helper->user->autoRegister($info, $auto);

				if (empty($user->id))
				{
					$data = array(
						'message' => JText::_($this->text_prefix . '_REGISTRATION_FAILED'),
						'data'    => array(
							'email' => $email,
						),
						'status'  => 1021,
					);
				}
				else
				{
					// Auto create client record
					$this->helper->client->create($user->id);
					$this->helper->profile->create($user->id);

					if ($auto)
					{
						$credentials = array('username' => $user->username, 'password' => $user->get('password_plain'));
						$login       = $app->login($credentials, array('silent' => true));

						$user2 = JFactory::getUser();

						if ($login === true && $user2->id > 0)
						{
							$data = array(
								'message' => JText::_($this->text_prefix . '_REGISTRATION_AUTO_LOGIN_SUCCESS'),
								'data'    => array(
									'id'       => $user2->id,
									'name'     => $user2->name,
									'username' => $user2->username,
									'email'    => $user2->email,
									'token'    => JSession::getFormToken(),
								),
								'status'  => 1023,
							);
						}
						else
						{
							$data = array(
								'message' => JText::sprintf($this->text_prefix . '_REGISTRATION_AUTO_LOGIN_FAILED', $user->get('password_plain')),
								'data'    => array(
									'email'  => $user->get('email'),
									'passwd' => $user->get('password_plain'),
								),
								'status'  => 1022,
							);
						}
					}
					else
					{
						$data = array(
							'message' => JText::_($this->text_prefix . '_REGISTRATION_AUTO_LOGIN_DISABLED'),
							'data'    => array(
								'id'       => $user->id,
								'name'     => $user->name,
								'username' => $user->username,
								'email'    => $user->email,
							),
							'status'  => 1022,
						);
					}
				}
			}
		}
		catch (Exception $e)
		{
			$data = array(
				'message' => $e->getMessage(),
				'data'    => null,
				'result'  => 0,
			);
		}

		echo json_encode($data);

		$app->close();
	}

	/**
	 * Login to the site using given credentials
	 *
	 * @return  void
	 */
	public function loginAjax()
	{
		$app = JFactory::getApplication();

		try
		{
			if (!JSession::checkToken())
			{
				throw new Exception(JText::_('JINVALID_TOKEN'));
			}

			$email    = $app->input->post->getString('email');
			$password = $app->input->post->getString('passwd');
			$regex    = chr(1) . '^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$' . chr(1);

			// If the current user is not guest, we must not logout.
			// Return warning so that the calling page may act appropriately.
			$user = JFactory::getUser();

			if (!$user->guest)
			{
				$data = array(
					'message' => JText::sprintf($this->text_prefix . '_ALREADY_LOGGED_IN', $user->email),
					'data'    => array(
						'id'       => $user->id,
						'name'     => $user->name,
						'username' => $user->username,
						'email'    => $user->email,
						'token'    => JSession::getFormToken(),
					),
					'status'  => 1011,
				);
			}
			elseif ($email == '' || $password == '' || !preg_match($regex, $email))
			{
				$data = array(
					'message' => JText::_($this->text_prefix . '_INVALID_EMAIL_OR_PASSWORD'),
					'data'    => array(
						'email'  => $email,
						'passwd' => $password,
					),
					'status'  => 1012,
				);
			}
			else
			{
				$db    = JFactory::getDbo();
				$query = $db->getQuery(true);
				$query->select('id, username, email')->from('#__users')->where('email = ' . $db->q($email));

				$db->setQuery($query);
				$user = $db->loadObject();

				if (empty($user->username))
				{
					$data = array(
						'message' => JText::_($this->text_prefix . '_INVALID_EMAIL'),
						'data'    => array(
							'email' => $email,
						),
						'status'  => 1001,
					);
				}
				else
				{
					$credentials = array('username' => $user->username, 'password' => $password);
					$login       = $app->login($credentials, array('silent' => true));
					$user        = JFactory::getUser();

					if ($login === true && $user->id > 0)
					{
						$data = array(
							'message' => JText::_($this->text_prefix . '_LOGIN_SUCCESS'),
							'data'    => array(
								'id'       => $user->id,
								'name'     => $user->name,
								'username' => $user->username,
								'email'    => $user->email,
								'token'    => JSession::getFormToken(),
							),
							'status'  => 1014,
						);
					}
					else
					{
						$pieces   = $app->getMessageQueue();
						$messages = implode('<br/>', ArrayHelper::getColumn($pieces, 'message'));

						$data = array(
							'message' => JText::sprintf($this->text_prefix . '_LOGIN_FAILED', $messages),
							'data'    => array(
								'email'  => $email,
								'passwd' => $password,
							),
							'status'  => 1013,
						);
					}
				}
			}
		}
		catch (Exception $e)
		{
			$data = array(
				'message' => $e->getMessage(),
				'data'    => null,
				'result'  => 0,
			);
		}

		echo json_encode($data);

		$app->close();
	}

	/**
	 * Logout the current user
	 *
	 * @return  void
	 */
	public function logoutAjax()
	{
		$app = JFactory::getApplication();

		try
		{
			if (!JSession::checkToken())
			{
				throw new Exception(JText::_('JINVALID_TOKEN'));
			}

			// If the current user is a guest, we can not logout.
			$user = JFactory::getUser();

			if ($user->guest)
			{
				$data = array(
					'message' => JText::_($this->text_prefix . '_NOT_LOGGED_IN'),
					'data'    => null,
					'status'  => 1,
				);
			}
			else
			{
				$logout = $app->logout();

				if ($logout === true)
				{
					$data = array(
						'message' => JText::_($this->text_prefix . '_LOGOUT_SUCCESS'),
						'data'    => array(
							'token' => JSession::getFormToken(),
						),
						'status'  => 1,
					);
				}
				else
				{
					$data = array(
						'message' => JText::_($this->text_prefix . '_LOGOUT_FAILED'),
						'data'    => null,
						'status'  => 0,
					);
				}
			}
		}
		catch (Exception $e)
		{
			$data = array(
				'message' => $e->getMessage(),
				'data'    => null,
				'result'  => 0,
			);
		}

		echo json_encode($data);

		$app->close();
	}

	/**
	 * Return list of addresses of current user
	 *
	 * @return void
	 */
	public function getAddressesHtmlAjax()
	{
		$app = JFactory::getApplication();

		try
		{
			if (!JSession::checkToken())
			{
				throw new Exception(JText::_('JINVALID_TOKEN'));
			}

			$user = JFactory::getUser();

			if ($user->guest)
			{
				$data = array(
					'message' => JText::_($this->text_prefix . '_NOT_LOGGED_IN'),
					'data'    => null,
					'status'  => 1031,
				);
			}
			else
			{
				$options   = array('debug' => 0);
				$addresses = $this->helper->user->getAddresses($user->id, 1);

				foreach ($addresses as $address)
				{
					$address->bill_to = $this->helper->location->isAddressAllowed($address, 'BT');
					$address->ship_to = $this->helper->location->isAddressAllowed($address, 'ST');
				}

				$html   = JLayoutHelper::render('com_sellacious.user.addresses', $addresses, '', $options);
				$modals = JLayoutHelper::render('com_sellacious.user.modals', $addresses, '', $options);
				$data = array(
					'message' => '',
					'data'    => array(preg_replace('/\s+/', ' ', $html), preg_replace('/\s+/', ' ', $modals)),
					'status'  => 1032,
				);
			}
		}
		catch (Exception $e)
		{
			$data = array(
				'message' => $e->getMessage(),
				'data'    => null,
				'result'  => 0,
			);
		}

		echo json_encode($data);

		$app->close();
	}

	/**
	 * Saves a new address for the current user
	 *
	 * @return void
	 */
	public function saveAddressAjax()
	{
		$app  = JFactory::getApplication();

		try
		{
			if (!JSession::checkToken())
			{
				throw new Exception(JText::_('JINVALID_TOKEN'));
			}

			$user = JFactory::getUser();

			if ($user->guest)
			{
				$data = array(
					'message' => JText::_($this->text_prefix . '_NOT_LOGGED_IN'),
					'data'    => null,
					'status'  => 1031,
				);
			}
			else
			{
				$address = $app->input->post->get('address', array(), 'array');
				$data    = $this->helper->user->saveAddress($address);

				if ($address)
				{
					$data = array(
						'message' => JText::_($this->text_prefix . '_ADDRESS_SAVE_SUCCESS'),
						'data'    => $data,
						'status'  => 1035,
					);
				}
				else
				{
					$data = array(
						'message' => JText::_($this->text_prefix . '_ADDRESS_SAVE_FAILED'),
						'data'    => $data,
						'status'  => 0,
					);
				}
			}
		}
		catch (Exception $e)
		{
			$data = array(
				'message' => $e->getMessage(),
				'data'    => null,
				'result'  => 0,
			);
		}

		echo json_encode($data);

		$app->close();
	}

	/**
	 * Remove an address as specified for current user
	 *
	 * @return void
	 */
	public function removeAddressAjax()
	{
		$app = JFactory::getApplication();

		try
		{
			if (!JSession::checkToken())
			{
				throw new Exception(JText::_('JINVALID_TOKEN'));
			}

			$user = JFactory::getUser();

			if ($user->guest)
			{
				$data = array(
					'message' => JText::_($this->text_prefix . '_NOT_LOGGED_IN'),
					'data'    => null,
					'status'  => 1031,
				);
			}
			else
			{
				$cid = $app->input->post->get('id');
				$del = $this->helper->user->removeAddress($cid, $user->id);

				if ($del)
				{
					$data = array(
						'message' => JText::_($this->text_prefix . '_ADDRESS_REMOVE_SUCCESS'),
						'data'    => $cid,
						'status'  => 1033,
					);
				}
				else
				{
					$data = array(
						'message' => JText::_($this->text_prefix . '_ADDRESS_REMOVE_FAILED'),
						'data'    => $cid,
						'status'  => 0,
					);
				}
			}
		}
		catch (Exception $e)
		{
			$data = array(
				'message' => $e->getMessage(),
				'data'    => null,
				'result'  => 0,
			);
		}

		echo json_encode($data);

		$app->close();
	}

	/**
	 * Return to referrer url
	 *
	 * @return string URL to redirect
	 */
	protected function getReturnURL()
	{
		$app      = JFactory::getApplication();
		$referrer = $app->input->server->getString('HTTP_REFERER');

		if (!JUri::isInternal($referrer))
		{
			$referrer = JRoute::_('index.php?option=com_sellacious&view=products', false);
		}

		return $referrer;
	}

	/**
	 * Get redirect url taking care of all modifiers
	 *
	 * @return string
	 */
	protected function getRedirectURL()
	{
		$app    = JFactory::getApplication();
		$return = $app->input->get('return', null, 'base64');

		if ($return)
		{
			$return = base64_decode($return);

			// Should we check for isInternal here?
			return $return;
		}

		$tmpl   = $app->input->get('tmpl', null);
		$layout = $app->input->get('layout', null);

		$tmpl   = !empty($tmpl) ? '&tmpl=' . $tmpl : '';
		$layout = !empty($layout) ? '&layout=' . $layout : '';

		return JRoute::_('index.php?option=com_sellacious&view=user' . $tmpl . $layout, false);
	}
}
