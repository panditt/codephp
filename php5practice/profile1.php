<?php
//connectivity
require('config.php');
session_start();
if($a==true)
{
	header('location:profile.php');
}
$a=$_SESSION['user'];
$q = "SELECT * FROM myusers WHERE name='$a'";
$cq = mysqli_query($con,$q);
$row=$cq->fetch_assoc();
$ret = mysqli_num_rows($cq);

?>
<html>
<head>
<title>Sample School Project</title>
<link rel="stylesheet" type="text/css" href="engine/css/slideshow.css" media="screen" />
<style>	
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