jQuery(document).ready(function () {
	jQuery.ajax({
	
	
		url: "https://www.goodspack.com/Embedded/getFields",
		// url: "https://www.dev-test.goodspack.com/Embedded/getFields",
		method: "post",
		error: function (error) {
			alert('error');
		},
		success: function (data) {
			data = jQuery.parseJSON(data);
			getFields(data);
		}

	});

	jQuery('.ukrsol_button').click(function () {		
		sending();
		jQuery('#message').addClass('success');
		setTimeout(function () {jQuery('#message').removeClass('success');}, 4000);
		
	});



});

function getFields(apiFields) {
	var pathName = jQuery(location).attr('href');
	jQuery.ajax({
		url: pathName,
		method: "POST",
		dataType: "json",
		data: {getFields:true},
		error: function (error) {
			console.log ('not valid json');
		},
		success: function (dbFields) {
			buildpage(apiFields, dbFields)
		}
	});
}

function buildpage(data, dbFields) {

	console.log(dbFields);
	console.log(data);
	var html1 = '';
	var html2 = '';
	var tab = [];
	for (var i = 0; i < data.tabsCount; ++i)
	{
		var inactive = i !== 0 ? ' ukrsol_inactive_tab_title' : '';
		var display = i !== 0 ? ' ukrsol_form_block_hide' : '';
		html1 += '<span id="tabtitle' + i + '" class="ukrsol_tab_title' + inactive + '">' + data.tabs[i].Caption + '</span>';
		html2 += '<div id="tab' + i + '" class="ukrsol_form_block' + display + '">';
		for (var j = 0; j < data.tabs[i].fieldsetCount; ++j)
		{
			if (data.tabs[i].Fieldset[j].Title !== null)
			{
				html2 += '<h2>' + data.tabs[i].Fieldset[j].Title + '</h2>';
				for (var n = 0; data.tabs[i].Fieldset[j].Title !== null, n < data.tabs[i].Fieldset[j].content.length; ++n)
				{
					if(dbFields != null) {
						for (var o = 0; o < dbFields.length; o++)
						{
							if (data.tabs[i].Fieldset[j].content[n].Id == dbFields[o].id && data.tabs[i].Fieldset[j].content[n].Default_Value != dbFields[o].val)
							{
								data.tabs[i].Fieldset[j].content[n].Default_Value = dbFields[o].val;
							}
						}
					}
					var has_parent = (data.tabs[i].Fieldset[j].content[n].Parent_Id !== null && data.tabs[i].Fieldset[j].content[n].Parent_Id !== '0') ? ' data-parent_id="' + data.tabs[i].Fieldset[j].content[n].Parent_Id+'" ' : '';					
					var is_hidden = data.tabs[i].Fieldset[j].content[n].Is_Hidden === '1' ? ' ukrsol_form_block_hide' : '';
					var is_checked = data.tabs[i].Fieldset[j].content[n].Type === 'checkbox' && data.tabs[i].Fieldset[j].content[n].Default_Value === '1' ? ' checked="checked" ' : '';
					var is_text = data.tabs[i].Fieldset[j].content[n].Type === 'text' && data.tabs[i].Fieldset[j].content[n].Default_Value !== null ? ' value="'+data.tabs[i].Fieldset[j].content[n].Default_Value+'"' : '';
					var is_textarea = data.tabs[i].Fieldset[j].content[n].Type === 'textarea' && data.tabs[i].Fieldset[j].content[n].Default_Value !== null ? data.tabs[i].Fieldset[j].content[n].Default_Value : '';
					if (data.tabs[i].Fieldset[j].content[n].Type === 'radio')
					{
						var radiobox_values = data.tabs[i].Fieldset[j].content[n].Values.split(',');
						for (var k = 0; k < radiobox_values.length; ++k)
						{
							var checked = data.tabs[i].Fieldset[j].content[n].Default_Value === radiobox_values[k] ? 'checked="checked"' : '';
							html2 += '<label ' + has_parent + '><input id="' + data.tabs[i].Fieldset[j].content[n].Id + '" '+ has_parent + ' type="radio" class="ukrsol_radio' + is_hidden + '" name="radiobox_id_' + data.tabs[i].Fieldset[j].content[n].Id + '" ' + checked + ' value="' + radiobox_values[k] + '"/>' + radiobox_values[k] + '</label>';
						}
					}
				
					else if (data.tabs[i].Fieldset[j].content[n].Type === 'select' && data.tabs[i].Fieldset[j].content[n].Multiple === '0')
					{
						var select_option = data.tabs[i].Fieldset[j].content[n].Values.split(',');
						html2 += '<select id="' + data.tabs[i].Fieldset[j].content[n].Id + '" ' + has_parent + ' class="ukrsol_select' + is_hidden + '" name="select_id_' + data.tabs[i].Fieldset[j].content[n].Id + '">';
						for (var s = 0; s < select_option.length; ++s)
						{
							var select_default = data.tabs[i].Fieldset[j].content[n].Default_Value === select_option[s] ? 'selected="selected"' : '';
							html2 += '<option ' + select_default + '>' + select_option[s] + '</option>';
						}
						html2 += '</select>';
					}
				
					else if (data.tabs[i].Fieldset[j].content[n].Type === 'select' && data.tabs[i].Fieldset[j].content[n].Multiple === '1')
					{
						var select_option = data.tabs[i].Fieldset[j].content[n].Values.split(',');
						var default_option = data.tabs[i].Fieldset[j].content[n].Default_Value.split(',');
						
						html2 += '<select multiple="multiple" size=3 id="' + data.tabs[i].Fieldset[j].content[n].Id + '" ' + has_parent + ' class="ukrsol_select' + is_hidden + '" name="select_id_' + data.tabs[i].Fieldset[j].content[n].Id + '">';
						for (var s = 0; s < select_option.length; ++s)
						{
							var select_default = (default_option.indexOf(select_option[s]) != -1) ? 'selected="selected"' : '';
							html2 += '<option ' + select_default + '>' + select_option[s] + '</option>';
						}
						html2 += '</select>';
					}
					else if (data.tabs[i].Fieldset[j].content[n].Type === 'textarea') {
						html2 += '<label '+has_parent +'><textarea id="' + data.tabs[i].Fieldset[j].content[n].Id + '" ' + has_parent +'  class="ukrsol_textarea'+is_hidden+'">'+is_textarea+'</textarea></label>';
					}
					else
					{
						html2 += '<label '+has_parent +'><input id="' + data.tabs[i].Fieldset[j].content[n].Id + '" '+ has_parent +  is_checked + is_text +' class="ukrsol_' + data.tabs[i].Fieldset[j].content[n].Type + is_hidden + '" type="' + data.tabs[i].Fieldset[j].content[n].Type + '"/>' + data.tabs[i].Fieldset[j].content[n].Caption + '</label>';
					}
				}
				
			}
			else
			{
				for (var m = 0; data.tabs[i].Fieldset[j].Title !== null, m < data.tabs[i].Fieldset[j].content.length; ++m)
				{
					if (dbFields != null)
					{
					  for (var o = 0; o < dbFields.length; o++)
					  {
						  if (data.tabs[i].Fieldset[j].content[m].Id == dbFields[o].id && data.tabs[i].Fieldset[j].content[m].Default_Value != dbFields[o].val)
						  {
							  data.tabs[i].Fieldset[j].content[m].Default_Value = dbFields[o].val;
						  }
					  }
					}
					var is_checked = (data.tabs[i].Fieldset[j].content[m].Type === 'checkbox' && data.tabs[i].Fieldset[j].content[m].Default_Value === '1') ? ' checked="checked"' : '';
					var is_text = data.tabs[i].Fieldset[j].content[m].Type === 'text' && data.tabs[i].Fieldset[j].content[m].Default_Value !== null ? ' value="'+data.tabs[i].Fieldset[j].content[m].Default_Value+'"' : '';
					var is_textarea = data.tabs[i].Fieldset[j].content[m].Type === 'textarea' && data.tabs[i].Fieldset[j].content[m].Default_Value !== null ? data.tabs[i].Fieldset[j].content[m].Default_Value : '';
					if (data.tabs[i].Fieldset[j].content[m].Parent_Id === null)
					{
						html2 += '<h2><label><input id="' + data.tabs[i].Fieldset[j].content[m].Id + '" ' + is_checked + ' type="' + data.tabs[i].Fieldset[j].content[m].Type + '"/>' + data.tabs[i].Fieldset[j].content[m].Caption + '</label></h2>';
					}
					else
					{
						var has_parent = (data.tabs[i].Fieldset[j].content[m].Parent_Id !== null && data.tabs[i].Fieldset[j].content[m].Parent_Id !== '0') ? ' data-parent_id="' + data.tabs[i].Fieldset[j].content[m].Parent_Id+'" ' : '';
						var is_hidden = data.tabs[i].Fieldset[j].content[m].Is_Hidden === '1' ? ' ukrsol_form_block_hide ' : '';
						
						if (data.tabs[i].Fieldset[j].content[m].Type === 'radio')
						{
							var radiobox_values = data.tabs[i].Fieldset[j].content[m].Values.split(',');
							for (var k = 0; k < radiobox_values.length; ++k)
							{
								var checked = data.tabs[i].Fieldset[j].content[m].Default_Value === radiobox_values[k] ? 'checked="checked"' : '';
								html2 += '<label '+has_parent +'><input id="' + data.tabs[i].Fieldset[j].content[m].Id + '" ' + has_parent +  ' type="radio" class="ukrsol_radio' + is_hidden + '" name="radiobox_id_' + data.tabs[i].Fieldset[j].content[m].Id + '" ' + checked + '  value="' + radiobox_values[k] + '"/>' + radiobox_values[k] + '</label>';
							}
						}
						else if (data.tabs[i].Fieldset[j].content[m].Type === 'select')
						{
							var select_option = data.tabs[i].Fieldset[j].content[m].Values.split(',');
							html2 += '<select id="' + data.tabs[i].Fieldset[j].content[m].Id + '" ' + has_parent + ' class="ukrsol_select' + is_hidden + '" name="select_id_' + data.tabs[i].Fieldset[j].content[m].Id + '">';
							for (var s = 0; s < select_option.length; ++s)
							{
								var select_default = data.tabs[i].Fieldset[j].content[m].Default_Value === select_option[s] ? 'selected="selected"' : '';
								html2 += '<option ' + select_default + '>' + select_option[s] + '</option>';
							}
							html2 += '</select>';
						}
					
						else if (data.tabs[i].Fieldset[j].content[m].Type === 'select' && data.tabs[i].Fieldset[j].content[m].Multiple === '1')
						{
							var select_option = data.tabs[i].Fieldset[j].content[m].Values.split(',');
							var default_option = data.tabs[i].Fieldset[j].content[m].Default_Value.split(',');
							
							html2 += '<select multiple="multiple" size=3 id="' + data.tabs[i].Fieldset[j].content[m].Id + '" ' + has_parent + ' class="ukrsol_select' + is_hidden + '" name="select_id_' + data.tabs[i].Fieldset[j].content[m].Id + '">';
							for (var s = 0; s < select_option.length; ++s)
							{
								var select_default = (default_option.indexOf(select_option[s]) != -1) ? 'selected="selected"' : '';
								html2 += '<option ' + select_default + '>' + select_option[s] + '</option>';
							}
							html2 += '</select>';
						}
						else if (data.tabs[i].Fieldset[j].content[m].Type === 'textarea') {							
							html2 += '<label '+has_parent +'><textarea id="' + data.tabs[i].Fieldset[j].content[m].Id + '" ' + has_parent +'  class="ukrsol_textarea'+is_hidden+'">'+is_textarea+'</textarea></label>';
						}
						else
						{
							html2 += '<label '+has_parent +'><input id="' + data.tabs[i].Fieldset[j].content[m].Id + '" ' + has_parent + is_checked + is_text +' class="ukrsol_' + data.tabs[i].Fieldset[j].content[m].Type + is_hidden + '" type="' + data.tabs[i].Fieldset[j].content[m].Type + '"/>' + data.tabs[i].Fieldset[j].content[m].Caption + '</label>';
						}
					}
				}
			}
		}
		html2 += '</div>';
	
		
	}
jQuery(".ukrsol_div_tab_title").html(html1);
jQuery(".ukrsol_tab").html(html2);
jQuery(".ukrsol_tab_title").click(function () {
		jQuery(".ukrsol_tab_title").addClass('ukrsol_inactive_tab_title');
		jQuery(this).removeClass('ukrsol_inactive_tab_title');
		jQuery('.ukrsol_form_block').addClass('ukrsol_form_block_hide');		
		var id = jQuery(this).attr('id').slice(8);		
		jQuery('#tab' + id).removeClass('ukrsol_form_block_hide');
	});
	jQuery("input[type='checkbox']").click(function () {
		var id = jQuery(this).attr("id");		
		if (jQuery(this).is(':checked') === true)
		{				
			jQuery("input[type='checkbox']").each(function(){
				if (jQuery(this).attr('data-parent_id') == id) jQuery(this).prop('checked', true);
			})
			jQuery("input[type='text']").each(function(){				
				if (jQuery(this).attr('data-parent_id') == id) jQuery(this).css('display', 'block');
			})
		}
		else
		{	
			jQuery("input[type='checkbox']").each(function(){
				if (jQuery(this).attr('data-parent_id') == id) jQuery(this).prop('checked', false);
			})
			jQuery("input[type='text']").each(function(){				
				if (jQuery(this).attr('data-parent_id') == id) jQuery(this).css('display', 'none');
			})
		}
	});
	jQuery("input[type='checkbox']").change(function () {
		var attr = jQuery(this).attr('data-parent_id');
		var fChecked = false;
		if (typeof attr !== typeof undefined && attr !== false) {
			var id = jQuery(this).attr("data-parent_id");			
			jQuery("input[type='checkbox']").each(function(){
				if (jQuery(this).attr('data-parent_id') == id) fChecked = fChecked | jQuery(this).prop('checked');
			})
			
			jQuery("#1").prop('checked', fChecked);
		}
	});
	console.log(html2);
	sending();
}

function sending() {
	var texts = jQuery("input[type='text']").toArray();
	var data = {};
	var f = 0;
    for (f = 0; f < texts.length; ++f)
	{
		data[f] = {};
		data[f].id = texts[f].id;
		data[f].val = texts[f].value !== '' ? texts[f].value : false;
	}
	var checks = jQuery("input[type='checkbox']").toArray();
	for (var c = 0; c < checks.length; ++c, ++f)
	{
		data[f] = {};
		data[f].id = checks[c].id;
		data[f].val = checks[c].checked ? 1 : 0;
	}
	var radio = jQuery("input[type='radio']").toArray();
	for (var r = 0; r < radio.length; ++r)
	{
		if (radio[r].checked == true)
		{
			data[f] = {};
			data[f].id = radio[r].id;
			data[f].val = radio[r].value;
			++f;
		}
	}
	var select = jQuery("select").toArray();
	console.log(select);
	
	for (var s = 0; s < select.length; ++s, ++f)		
	{
		data[f] = {};
		data[f].id = select[s].id;
		var fFirstVal = true;
		for (var o = 0; o < select[s].length; ++o) {			
			if (select[s][o].selected) 
				if (fFirstVal) {
					fFirstVal = false;
					data[f].val = select[s][o].value;
				}
				else data[f].val += ','+select[s][o].value;			
		}
	}


	console.log(data);
	jQuery.ajax({
	
	
		url: "https://www.goodspack.com/Embedded/getString",
		// url: "https://www.dev-test.goodspack.com/Embedded/getString",
		method: "post",
		dataType: "json",
		data: {fields: data},
		error: function (error) {
			alert('error');
		},
		success: function (requestdata) {
			if (requestdata.status)
			{
				saving(data,requestdata.string);				
			}
			console.log(requestdata);			
		}

	});
}

function saving(data,block) {

	var decoded = jQuery('<div/>').html(block).text();	
	jQuery('textarea.ukrsol_embedcode').val(decoded);

	var pathName = jQuery(location).attr('href');
	console.log(pathName);
	jQuery.ajax({
		url: pathName,
		method: "post",
		dataType: "json",
		data: {options: data, block: encodeURIComponent(block)},
		error: function (error) {
			console.log('error');
		},
		success: function (flag) {
			console.log(flag);
			if (fFirstLoad) fFirstLoad = false;
			else document.getElementById('iframe_front').contentDocument.location.reload(true);
		}
	});
}
var fFirstLoad = true;

function pagetab(pagetab) {
	jQuery('#pagetab1').attr('class', 'inactive');
	jQuery('#pagetab2').attr('class', 'inactive');
	jQuery('#'+pagetab).attr('class', 'active');
}