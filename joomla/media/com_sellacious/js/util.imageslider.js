/**
 * @version     1.3.3
 * @package     sellacious
 *
 * @copyright   Copyright (C) 2016. Bhartiy Web Technologies. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      Izhar Aazmi <info@bhartiy.com> - http://www.bhartiy.com
 */


ImageSlider = new Class({

	Implements: [Options],

	active: false,

	interval: 0,

	options: {
		mPadd: 2,
		damp: 20,
		scrollExtra: 2,
		imageFrameBox: '#small_image',
		thumbBox: '#thumb_box',
		imageThumb: '.thumbs',
		imgLargePrefix: '',
		preloadImages: true,
		previewContainerId: 'is_preview_container',
		previewImgClass: 'is-preview-img',
		PreviewMouseMargin: {
			top: 15,
			left: 15,
			right: 15,
			bottom: 15
		}
	},

	binds: {},

	initialize: function (container_id, options) {

		try {
			this.setOptions(options);

			this.container = document.id(container_id);
			this.framebox = this.container.getElement(this.options.imageFrameBox);

			// this.frame = this.framebox.getElement('img');
			this.block = this.container.getElement(this.options.thumbBox);
			this.thumbsbox = this.block.getElement(this.options.imageThumb);
			this.icons = this.block.getElements('img');

			var bSizes = this.block.getComputedSize();

			this.wDiff = (this.block.scrollWidth / bSizes.totalWidth) - 1; // widths difference ratio
			this.mmAA = bSizes.totalWidth - (this.options.mPadd * 2); // The mousemove available area
			this.mmAAr = (bSizes.totalWidth / this.mmAA); // get available mousemove fidderence ratio

			this.binds.setPosition = this.setPosition.bind(this);
			this.binds.move = this.move.bind(this);
			this.binds.changeFrame = this.changeFrame.bind(this);
			this.binds.flyOpen = this.flyOpen.bind(this);
			this.binds.flyMove = this.flyMove.bind(this);
			this.binds.flyClose = this.flyClose.bind(this);

			this.icons.setStyle('cursor', 'pointer');

			// No thumb icon if single image
			if (this.icons.length <= 1) {
				jQuery(this.block).hide().css('height', 1).css('overflow', 'hidden');
				// this.block.setStyles({'display': 'hidden', 'visibility': 'none'});
			}

			this.attach();
		}
		catch (e) {
			console.log(e);
		}
	},

	setPosition: function (event) {
		if (!this.active)
			return false;
		var pos = this.block.getCoordinates();
		var mX = event.page.x - pos.left;
		this.mX = Math.min(Math.max(-this.options.scrollExtra, mX - this.options.mPadd), this.mmAA + this.options.scrollExtra) * this.mmAAr;
	},

	move: function () {
		this.posX += (this.mX - this.posX) / this.options.damp; // zeno's paradox equation "catching delay"
		var mLeft = -this.posX * this.wDiff;
		this.thumbsbox.setStyle('margin-left', mLeft);
	},

	changeFrame: function (event) {
		var el = event.target;
		var $this = this;
		var src = el.get('src');
		jQuery($this.framebox).css('background-image', 'url(' + src + ')');
		jQuery($this.framebox).data('src', src);
	},

	flyOpen: function (event) {
		var id = this.framebox.get('id');

		var div = new Element('div', {
			id: this.options.previewContainerId,
			styles: {
				position: 'absolute',
				zIndex: '10009'
			}
		}).hide();

		var img = new Element('img', {
			id: this.options.previewContainerId,
			'class': this.options.previewImgClass,
			src: jQuery(this.framebox).data('src').replace(/(\/?)([^\/]+)$/, '$1' + this.options.imgLargePrefix + '$2')
		}).inject(div);

		this.previewBox = div;
		this.framebox.addEvent('mousemove', this.binds.flyMove);
		this.previewBox.inject(document.body);
		this.previewBox.show();
	},

	flyMove: function (event) {
		if (this.previewBox) {
			// var prv = this.previewBox.getCoordinates();
			var pos = this.framebox.getCoordinates();
			this.previewBox.setStyles({
				// top : event.page.y + this.options.PreviewMouseMargin.top,
				// left : event.page.x + this.options.PreviewMouseMargin.right // + prv.width

				// top : pos.top,
				// left : pos.left - prv.width - this.options.PreviewMouseMargin.left

				top: pos.top,
				left: pos.right + this.options.PreviewMouseMargin.left
			});
		}
	},

	flyClose: function (event) {
		this.previewBox.destroy();
		this.framebox.removeEvents({
			'mousemove': this.binds.flyMove
		});
	},

	preloadImage: function (i, img) {
		i = i || 0;
		if (this.options.preloadImages && i < this.icons.length) {
			var src = this.icons[i].get('src').replace(/(\/?)([^\/]+)$/, '$1' + this.options.imgLargePrefix + '$2');
			if (img == null) {
				img = new Element('img');
			}
			img.set('src', src);
			img.addEvent('load', function () {
				img.removeEvents();
				this.preloadImage(i + 1, img);
			}
				.bind(this));
		}
	},

	attach: function (event) {
		this.active = true;
		this.mX = 0;
		this.posX = 0;

		this.block.addEvent('mousemove', this.binds.setPosition);
		this.icons.addEvent('mouseenter', this.binds.changeFrame);

		// Comment to have flyOpen disabled
		this.framebox.addEvent('mouseenter', this.binds.flyOpen);
		this.framebox.addEvent('mouseleave', this.binds.flyClose);

		this.preloadImage();

		(this.thumbsbox.getElements('img').length > 1) || this.block.setStyle('display', 'none');

		this.interval = setInterval(this.binds.move, 10);
		return true;
	},

	detach: function (event) {
		if (!this.active)
			return false;
		this.active = false;

		clearInterval(this.interval);
		this.interval = false;
		this.block.removeEvents({
			'mousemove': this.binds.setPosition
		});
		this.icons.removeEvents({
			'mouseenter': this.binds.changeFrame
		});

		// Comment to flyOpen disabled
		this.framebox.removeEvents({
			'mouseenter': this.binds.flyOpen
		});
		this.framebox.removeEvents({
			'mouseleave': this.binds.flyClose
		});

		this.block.setStyle('display', 'block');

		return true;
	}
});
