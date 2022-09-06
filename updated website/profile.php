<?php
require('config.php');
session_start();
$a=$_SESSION['user'];
$q = "SELECT * FROM myusers WHERE name='$a'";
$cq = mysqli_query($con,$q);
$rows=$cq->fetch_assoc();
$ret = mysqli_num_rows($cq);
include "logout.php";
include "hfooter.php";
?>
<html>
<link rel="stylesheet" type="text/css" href="http://localhost/updated%20website/css/mainpage.css">
<link rel="stylesheet" type="text/css" href="http://localhost/updated%20website/css/tupule.css">
<body>
<br><br><br><br><div align="center" class="un">
<fieldset style="display: inline-flex;font-size: 25px;color: white; background-color: transparent;">
	<legend><font size="+2"><strong>PROFILE</strong></font></legend>
<h1><?php echo $_SESSION['user']?></h1>
<table class="tu"><tr><td>email:</td><td><?php echo $rows["email"];?></td></tr>
<tr><td>mobile no:</td><td><?php echo $rows["mobileno"]; ?></td></tr>
<tr><td>gender:</td><td><?php echo $rows["gender"];?></td></tr>
<tr><td>age:</td><td><?php echo $rows["age"];?></td></tr>
<tr><td>purpose:</td><td><?php echo $rows["purpose"];?></td></tr>
<tr><td>class time:</td><td><?php echo $rows["classtime"];?></td></tr>
<tr><td>address:</td><td><?php echo $rows["address"];?>	</td></tr></table>
<button>Edit Profile</button>
</div></fieldset></body>
</html>
