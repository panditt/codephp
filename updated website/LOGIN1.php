<?php
session_start();
require('config.php');
if(isset($_POST['login']))
{
	$u = $_POST['uname'];
	$pass = $_POST['upass'];
	$_SESSION["user"]=$u;
	$_SESSION["pass"]=$pass;
//user check
$q = "SELECT * FROM myusers WHERE name='$u' AND password='$pass'";
$cq = mysqli_query($con,$q);
$ret = mysqli_num_rows($cq);
if($ret == true)
{ echo "<script>document.location='profile1.php'</script>";
	//echo "<center><h2 style='color:green'>ACCESS GRANTED</h2></center>";
}
else
{	echo '<script>alert("wrong username or password")</script>';
	//echo "<center><h2 style='color:red'>ACCESS DENIED</h2></center>";
}
}
?>
<html>
<link rel="stylesheet" type="text/css" href="http://localhost/updated%20website/css/hdft.css">
<body>
<div class="d02">
<table align="center" class="upc" name="login">
<tr><td><a href="http://localhost/updated%20website/homepage.php">Home</a></td>
<td><a href="http://localhost/updated%20website/homepage.php#c02">About</a></td>
<td><a href="http://localhost/updated%20website/homepage.php#np">Instructors</a></td>
<td><a href="registration.php">Book Online</a></td>
<td width="200"><a href="http://localhost/updated%20website/homepage.php#kd">Contact</a></td>
<form method="post"><td><input type="text" placeholder="username" name="uname" required>*</td>
<td><input type="password" name="upass" placeholder="password" required>*</td>
<td><input type="submit" value="login" name="login"></form></td>
</tr>
</table>
</div></body>
</html>