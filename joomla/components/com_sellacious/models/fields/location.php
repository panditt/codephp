<?php
/**
 * @version     1.4.0
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     SPL Sellacious Private License; see http://www.sellacious.com/spl.html
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */
// no direct access.
defined('_JEXEC') or die;

JFormHelper::loadFieldClass('Hidden');

/**
 * Form Field class for the geo location.
 *
 */
class  JFormFieldLocation extends JFormFieldHidden
{
	/**
	 * The field type.
	 *
	 * @var   string
	 */
	protected $type = 'Location';

	/**
	 * The field type.
	 *
	 * @var   string
	 */
	protected $address_type;

	/**
	 * The field type.
	 *
	 * @var   string
	 */
	protected $gl_type;

	/**
	 * The field type.
	 *
	 * @var   string
	 */
	protected $rel;

	/**
	 * Method to attach a JForm object to the field.
	 *
	 * @param   SimpleXMLElement  $element  The SimpleXMLElement object representing the `<field>` tag for the form field object.
	 * @param   mixed             $value    The form field value to validate.
	 * @param   string            $group    The field name group control value. This acts as as an array container for the field.
	 *                                      For example if the field has name="foo" and the group value is set to "bar" then the
	 *                                      full field name would end up being "bar[foo]".
	 *
	 * @return  boolean  True on success.
	 *
	 * @since   11.1
	 */
	public function setup(SimpleXMLElement $element, $value, $group = null)
	{
		if (parent::setup($element, $value, $group))
		{
			$this->address_type = (string) $this->element['address_type'];
			$this->gl_type      = (string) $this->element['gl_type'] ?: 'continent|country|state|district|area|zip';
			$this->rel          = explode('|', str_replace('.', '_', (string) $this->element['rel'])) ?: '';

			// Force default only if not multiple-select
			if (!$this->multiple && $this->gl_type == 'country' && $this->default == 'shop_country')
			{
				$helper        = SellaciousHelper::getInstance();
				$this->default = $helper->config->get('shop_country');
			}

			return true;
		}

		return false;
	}

	/**
	 * Method to get the field input markup.
	 *
	 * @return   string  The field input markup.
	 * @since    1.6
	 */
	protected function getInput()
	{
		JHtml::_('jquery.framework');

		if (JFactory::getApplication()->isSite())
		{
			JHtml::_('script', 'media/com_sellacious/js/plugin/select2-3.5/select2.js', false, false);
			JHtml::_('stylesheet', 'media/com_sellacious/js/plugin/select2-3.5/select2.css', null, false);
		}

		JHtml::_('script', 'com_sellacious/field.location.js', false, true);

		$add_type = htmlspecialchars($this->address_type);
		$type     = htmlspecialchars($this->gl_type);
		$types    = explode('|', $type);

		// Fixme: This should not be needed
		if (!$this->value)
		{
			$this->value = $this->default;
		}

		if (is_array($this->value))
		{
			$this->value = implode(',', $this->value);
		}

		$class  = get_class($this);
		$args   = json_encode(array(
			'id'           => $this->id,
			'name'         => $this->name,
			'multiple'     => $this->multiple,
			'types'        => $types,
			'fieldset'     => $this->formControl,
			'rel'          => $this->rel ?: null,
			'address_type' => $add_type,
		));
		$script = "
		jQuery(document).ready(function($) {
			var o = new {$class};
			o.setup({$args});
		});
		";

		// Fixme: This is workaround for ajax, which misses script header.
		$input = parent::getInput();
		$input = $input . '<script>' . $script . '</script>';

		return $input;
	}

	/**
	 * Get input field name
	 *
	 * @param   string  $fieldName
	 *
	 * @return  string
	 */
	protected function getName($fieldName)
	{
		// Prevent names from appending [] for multiple
		$old = $this->multiple;

		$this->multiple = false;

		$name = parent::getName($fieldName);

		$this->multiple = $old;

		return $name;
	}
}
