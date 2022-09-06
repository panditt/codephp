<html>
<head>
<title>TRANSFORM- TRAIN HARD OR GO HOME</title>
<link rel="stylesheet" type="text/css" href="./hfiles/css/hdft.css">
</head>
<style>
echo{
	text-align: center;
	text-size: 25px;
}
h1.wp{
	padding-top: 90px;
	text-align: center;
	color: white;
}
div.preet{
	align:center;
	text-align:center;
}
button
{font-size: 50px;
position: center;
color: white;
background-color: transparent;}
</style>
<body style="background-color: black;">
<?php 
require ('config.php');
include "hfiles\header.php";
include "hfiles\hfooter.php";
$nme=$_POST["first"];
$sname=$_POST["last"];
$mal=$_POST["mail"];
$mob=$_POST["mob"];
$pass=$_POST["pas"];
$clst=$_POST["cls"];
$pur=$_POST["purpose"];
$pswrd=$_POST["age"];
$gen=$_POST["gender"];
$sql="INSERT INTO MYusers(first,last,email,mobileno,password,age,classtime,purpose,gender) VALUES('$nme','$sname','$mal','$mob','$pass','$pswrd','$clst','$pur','$gen');";
if(mysqli_query($con,$sql))
{echo "Welcome $nme";}
else{echo"error in creation".mysqli_error($conn);}
mysqli_close($conn);?>
<div class="preet">
<h1 class="wp">BOOKED SUCCESSFULLY<br><?php echo $nme;?><br> come tommorrow at the time of class in the gym</h1><br>
<a href="http://localhost/prepared%20website/form.php"><button>Book Another Now</button></a><br>
</div>
</body>
</html>