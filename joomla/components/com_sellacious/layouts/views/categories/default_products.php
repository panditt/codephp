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

use Joomla\Registry\Registry;

/** @var  SellaciousViewCategories $this */
JHtml::_('behavior.framework');
JHtml::_('jquery.framework');

if ($this->helper->config->get('product_compare')):
	JHtml::_('script', 'com_sellacious/util.compare.js', false, true);
endif;

JHtml::_('script', 'media/com_sellacious/js/plugin/select2-3.5/select2.js', false, false);
JHtml::_('stylesheet', 'media/com_sellacious/js/plugin/select2-3.5/select2.css', null, false);

JHtml::_('script', 'com_sellacious/util.rollover.js', false, true);
JHtml::_('script', 'com_sellacious/isotope.pkgd.min.js', false, true);
JHtml::_('script', 'com_sellacious/util.cart.aio.js', false, true);
JHtml::_('script', 'com_sellacious/fe.view.products.js', false, true);

JHtml::_('stylesheet', 'com_sellacious/font-awesome.min.css', null, true);
JHtml::_('stylesheet', 'com_sellacious/fe.component.css', null, true);
JHtml::_('stylesheet', 'com_sellacious/fe.view.cart.aio.css', null, true);
JHtml::_('stylesheet', 'com_sellacious/fe.view.categories.products.css', null, true);

$styles = array();

$active_layout = $this->helper->config->get('list_style', 'grid');

if ($this->helper->config->get('list_style_switcher', 1)): ?>
	<div class="btn-group padding-10" data-toggle="radio">
		<button data-style="grid-layout" class="btn btn-primary switch-style <?php echo $active_layout == 'grid' ? 'active' : '' ?>"><i
				class="fa fa-th"></i> </button>
		<button data-style="list-layout" class="btn btn-primary switch-style <?php echo $active_layout == 'list' ? 'active' : '' ?>"><i
				class="fa fa-list"></i> </button>
	</div>
	<div class="clearfix"></div>
<?php else: ?>
	<button data-style="<?php echo $active_layout ?>-layout" class="hidden switch-style active"></button>
<?php endif; ?>

<?php
$options = array(
	'title'    => JText::_('COM_SELLACIOUS_CART_TITLE'),
	'backdrop' => 'static',
);
echo JHtml::_('bootstrap.renderModal', 'modal-cart', $options);
?>
<div id="products-page" class="w100p">
	<div id="products-box" class="v-top">
		<?php
		foreach ($this->get('products') as $item)
		{
			if ($cat_id = (int) $item->spl_listing_catid)
			{
				$css2 = array();
				$css  = new Registry($item->spl_listing_params);

				foreach ($css as $css_k => $css_v)
				{
					$css2[$css_k] = "$css_k: $css_v;";
				}

				$styles[$cat_id] = "\n.spl-cat-$cat_id {\n\t" . implode("\n\t", $css2) . "\n}";
			}

			echo $this->loadTemplate('product', $item);
		}

		$doc = JFactory::getDocument();
		$doc->addStyleDeclaration(implode("\n", $styles));
		?>
		<div class="clearfix"></div>
	</div>
</div>
<div class="clearfix"></div>
<input type="hidden" name="<?php echo JSession::getFormToken() ?>" value="1" id="formToken">
