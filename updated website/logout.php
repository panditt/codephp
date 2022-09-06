<?php 
session_start();
require('config.php');?>
<html>
<link rel="stylesheet" type="text/css" href="http://localhost/updated%20website/css/hdft.css">
<body>
<div class="d02">
<table align="center" class="upc" name="login">
<tr><td><a href="http://localhost/updated%20website/homepage1.php">Home</a></td>
<td><a href="http://localhost/updated%20website/homepage1.php#c02">About</a></td>
<td><a href="http://localhost/updated%20website/homepage1.php#np">Instructors</a></td>
<td><a href="http://localhost/updated%20website/login - copy.php">Our Products</a></td>
<td width="200"><a href="http://localhost/updated%20website/homepage1.php#kd">Contact</a></td>
<td> <a href="profile.php"><?php
 echo $_SESSION['user'];
 ?>
 </a> <a href="session.php" style="text-decoration:none;margin-left:150px;"><input type="submit" value="Logout" name="logout"></a></td>
</tr>
</table>
</div></body>
</html>
