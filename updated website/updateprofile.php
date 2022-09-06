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
<body><br><br><br>
<h1>Name <?php
 echo $_SESSION['user'];
 ?></h1>
<table align="center">

<form class="update">
<tr><td>E-mail</td><td><input type="text" name="mail"></td></tr>
</form></table>
</body>
</html> 
