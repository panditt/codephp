<?php
/**
 * @version     1.3.5
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     SPL Sellacious Private License; see http://www.sellacious.com/spl.html
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access.
defined('_JEXEC') or die;

/**
 * list controller class
 */
class SellaciousControllerDownload extends SellaciousControllerBase
{
	/**
	 * @var  string  The prefix to use with controller messages.
	 *
	 * @since  1.6
	 */
	protected $text_prefix = 'COM_SELLACIOUS_DOWNLOAD';

	/**
	 * Verify only the file existence for the file to be sent as download
	 *
	 * @return  bool
	 * @throws  Exception
	 *
	 * @see  download()
	 */
	public function check()
	{
		$app         = JFactory::getApplication();
		$file_id     = $app->input->getInt('id');
		$delivery_id = $app->input->getInt('delivery_id');

		try
		{
			// Exception is thrown internally
			$delivery = $this->helper->order->checkEProductDelivery($delivery_id, $file_id);

			if (!is_object($delivery) || !is_array($delivery->files) || !in_array($file_id, $delivery->files))
			{
				throw new Exception(JText::_('COM_SELLACIOUS_FILE_NOT_FOUND'));
			}

			$item = $this->helper->media->getItem($file_id);

			if (!is_file(JPATH_SITE . '/' . $item->path))
			{
				throw new Exception(JText::_('COM_SELLACIOUS_FILE_NOT_FOUND'));
			}

			echo json_encode(array('message' => '', 'status' => 1));
		}
		catch (Exception $e)
		{
			echo json_encode(array('message' => $e->getMessage(), 'status' => 0));
		}

		$app->close();
	}

	/**
	 * Initiate the actual file download
	 *
	 * @return  bool
	 * @throws  Exception
	 *
	 * @since  1.3.5
	 */
	public function download()
	{
		$app         = JFactory::getApplication();
		$file_id     = $app->input->getInt('id');
		$delivery_id = $app->input->getInt('delivery_id');

		try
		{
			$this->setRedirect(JRoute::_('index.php?option=com_sellacious&view=downloads'));

			// Exception is thrown internally
			$delivery = $this->helper->order->checkEProductDelivery($delivery_id, $file_id);

			if (!is_object($delivery) || !is_array($delivery->files) || !in_array($file_id, $delivery->files))
			{
				throw new Exception(JText::_('COM_SELLACIOUS_FILE_NOT_FOUND'));
			}

			$item = $this->helper->media->getItem($file_id);

			if (!is_file(JPATH_SITE . '/' . $item->path))
			{
				throw new Exception(JText::_('COM_SELLACIOUS_FILE_NOT_FOUND'));
			}

			$this->helper->order->logDownload($delivery->id, $item);

			$this->helper->media->download($file_id);
		}
		catch (Exception $e)
		{
			JLog::add($e->getMessage(), JLog::WARNING, 'jerror');

			return false;
		}

		return true;
	}
}
