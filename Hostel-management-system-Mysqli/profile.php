<?php
//connectivity
require('config.php');
session_start();
if($a==true)
{
	header('location:profile.php');
}
$a=$_SESSION['user'];
$q = "SELECT * FROM users WHERE name='$a'";
$cq = mysqli_query($con,$q);
$row=$cq->fetch_assoc();
$ret = mysqli_num_rows($cq);

?>
<html>
<head>
<title>Sample School Project</title>
<link rel="stylesheet" type="text/css" href="engine/css/slideshow.css" media="screen" />
	<style type="text/css">.slideshow a#vlb{display:none}</style>
	<script type="text/javascript" src="engine/js/mootools.js"></script>
	<script type="text/javascript" src="engine/js/visualslideshow.js"></script>
    <link rel="stylesheet" type="text/css" href="engine1/style.css" />
	<script type="text/javascript" src="engine1/jquery.js"></script>
    
    <style type="text/css" media="screen">
table.tu{
font-size: 50px;
align: center;	
}
#horizontalmenu ul 
{
padding:1; margin:1; list-style:none;
}
#horizontalmenu li
{
float:left;
 position:relative;
 padding-right:89;
 display:block;
border:0px solid #CC55FF; 
border-style:inset;
margin-left:20px;
}
#horizontalmenu li ul
 {
display:none;
position:absolute;
}
#horizontalmenu li:hover ul{
    display:block;
    background:#C4C4C4;
height:auto; width:8em; 
}
#horizontalmenu li ul li
{
    clear:both;
border-style:none;}
</style>	
</head>
<table width="1050px" align="center"  border="1">
  <tbody>
    <tr>
      <th height="39" colspan="2" style="background-color:#4E4E4E"><div style="text-align:left;color:#FFFFFF"><b><font size="+3"><a href="index.php" style="text-decoration:none ; color:#FFFFFF">Hindu College Of Engineering</a></font></b><marquee direction="left" height="100%">
			college information!</marquee></div></th>
    </tr>
    <tr>
      <th height="317" colspan="2">
      <!--Slider-->
      <div id="wowslider-container1">
	<div class="ws_images"><ul>
<li><img src="data1/images/banner_01.jpg" alt="Multispeciality College Campus" title="Multispeciality College Campus" id="wows1_0"/></li>
<li><img src="data1/images/highlightnews.jpg" alt="International Accredition" title="International Accredition" id="wows1_1"/></li>
<li><img src="data1/images/img21644.jpg" alt="Best Overall Employement" title="Best Overall Employement" id="wows1_2"/></li>
<li><img src="data1/images/url.jpg" alt="Best Of Class Infrastructure" title="Best Of Class Infrastructure" id="wows1_3"/></li>
</ul></div>
<div class="ws_bullets"><div>
<a href="#" title="Multispeciality College Campus"><img src="data1/tooltips/banner_01.jpg" alt="Multispeciality College Campus"/>1</a>
<a href="#" title="International Accredition"><img src="data1/tooltips/highlightnews.jpg" alt="International Accredition"/>2</a>
<a href="#" title="Best Overall Employement"><img src="data1/tooltips/img21644.jpg" alt="Best Overall Employement"/>3</a>
<a href="#" title="Best Of Class Infrastructure"><img src="data1/tooltips/url.jpg" alt="Best Of Class Infrastructure"/>4</a>
</div></div>
<span class="wsl"></span>
	<a href="#" class="ws_frame"></a>
	</div>
	<script type="text/javascript" src="engine1/wowslider.js"></script>
	<script type="text/javascript" src="engine1/script.js"></script>
    <!--slider end-->
    
      </th>
    </tr>
    <tr>
      <td height="38" colspan="2" style="background-color:#6E68FF">
      	<div><a href="index.php" style="text-decoration:none ; color:#010101" id="horizontalmenu li"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;HOME</b></a>
        <a href="profile.php?option=about" style="text-decoration:none ; color:#010101"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ABOUT</b></a>
        <a href="profile.php?option=mfees" style="text-decoration:none ; color:#010101"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MESS FEES</b></a>
        <a href="profile.php?option=rfees" style="text-decoration:none ; color:#010101"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ROOM FEES</b></a>
  <a href="logout.php" style="text-decoration:none;margin-left:150px;"><input type="submit" value="Logout" name="logout"></a></td>
    </tr>
    <tr>
      <td width="974" height="647" bgcolor="#D9D9D9" style="vertical-align:text-top">
      	<?php
	@$opt = $_GET['option'];
	if($opt=="")
	{
	?>
    <html><br>
	<h1><center>Welcome <?php echo $_SESSION['user']; ?></center></h1><br>
	<p><center style="color:red"> By clicking on home and about tab the user will automatically logout</center></p><br>
	<table class="tu"><tr><td>email:</td><td>  <?php echo $row["email"];?></td></tr>
	     <tr><td>mob no:</td><td>  <?php echo $row["mob"];?></td></tr>
		 <tr><td>address:</td><td>  <?php echo $row["address"];?></td></tr>
		 <tr><td>gender:</td><td>  <?php echo $row["gender"];?></td></tr></table>
    </html>
	<?php
    error_reporting(1);
	}
	else{
	switch($opt)
	{
		case 'regs':
		include('registration.php')	;
		break;
		case 'login':
		include('login.php');
		break;
        case 'about':
		include('about.php');
		break;
		case 'contact':
		include('contact.php');
		break;
		case 'gallery':
		include('gallery.php');
		break;
		case 'course':
		include ('course.php');
		break;
		case 'mfees':
		include('mfees.php');
		break;
		case 'rfees':
		include('rfees.php');
		break;
		
	}}

	?>
	
      
      </td>
      <td width="343" style="background-color:#468EFF">
      <center><font size="+2"><b style="color:#191B7E"><div style="background-color:#969BFB">College Updates</div><br></b></font></center>
      	<marquee direction="up" height="100%" onMouseOver="this.stop();" onMouseOut="this.start();">
			<center><a href="" style="text-decoration:none"><font size="+1"><b>Campus Drive</b></font></a></center><br>
            <center><a href="" style="text-decoration:none"><font size="+1"><b>News</b></font></a></center><br>
            <center><a href="" style="text-decoration:none"><font size="+1"><b>Sports Fest</b></font></a></center><br>
            <center><a href="" style="text-decoration:none"><font size="+1"><b>Quiz Competition</b></font></a></center><br>
            <center><a href="" style="text-decoration:none"><font size="+1"><b>Admission 2014</b></font></a></center><br>
            <center><a href="" style="text-decoration:none"><font size="+1"><b>Placement List</b></font></a></center><br>
            <center><a href="" style="text-decoration:none"><font size="+1"><b>Weekend Events</b></font></a></center><br>
            <center><a href="" style="text-decoration:none"><font size="+1"><b>Notice Board</b></font></a></center><br>
            <center><a href="" style="text-decoration:none"><font size="+1"><b>Summer Vacation</b></font></a></center><br>
            <center><a href="" style="text-decoration:none"><font size="+1"><b>Summer Training</b></font></a></center><br>
            <center><a href="index.php?option=course" style="text-decoration:none"><font size="+1"><b>Courses Offered</b></font></a></center><br>
            <center><a href="index.php?option=gallery" style="text-decoration:none"><font size="+1"><b>Gallery</b></font></a></center><br>
		</marquee>
      </td>
    </tr>
    <tr>
      <td height="25" colspan="2" style="background-color:#B8AFFF"><center><b>&copy; 2016 by Nitesh and Praveen | Managed by Hindu college of engineering</b></center></td>
    </tr>
  </tbody>
</table>
</html>