<?php
/**
 * @version     1.4.1
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
 * Form Field class for the Joomla Framework.
 *
 */
class JFormFieldProduct extends JFormFieldHidden
{
	/**
	 * The field type.
	 *
	 * @var   string
	 */
	protected $type = 'Product';

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
			JHtml::_('script', 'media/com_sellacious/js/plugin/select2/select2.min.js', false, false);
			JHtml::_('stylesheet', 'media/com_sellacious/js/plugin/select2/select2.css', null, false);
		}

		JHtml::_('script', 'com_sellacious/field.product.js', false, true);

		$class    = get_class($this);
		$rel      = (string) $this->element['rel'];
		$type     = (string) $this->element['product_type'];
		$multiple = $this->multiple ? 'true' : 'false';

		if ($rel)
		{
			$rel = $this->formControl . '_' . str_replace('.', '_', $rel);
		}

		if (is_array($this->value))
		{
			$this->value = implode(',', $this->value);
		}

		$input  = parent::getInput();
		$script = <<<JS
		jQuery(document).ready(function() {
			var o = new {$class};
			o.setup({
				id : '{$this->id}',
				name : '{$this->name}',
				multiple : $multiple,
				context : 'product-sku',
				type : '{$type}',
				rel : '{$rel}',
			});
		});
JS;

		// $doc = JFactory::getDocument();
		// $doc->addScriptDeclaration($script);

		// Fixme: This is workaround for ajax, which misses script header.
		$input.= "<script>$script</script>";

		return $input;
	}
}
