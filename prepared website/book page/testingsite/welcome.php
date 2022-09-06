<html>
<head>
<title>TRANSFORM- TRAIN HARD OR GO HOME</title>
</head>
<body>
<?php
$servername="localhost";
$username="root";
$password="";
$mydb="useDel";
$nme=$_POST["first"];
$sname=$_POST["last"];
$mal=$_POST["mail"];
$mob=$_POST["mob"];
$clst=$_POST["cls"];
$pur=$_POST["purpose"];
$pswrd=$_POST["age"];
$gen=$_POST["gender"];
$sql="INSERT INTO MYusers(first,last,email,mobileno,age,classtime,purpose,gender) VALUES('$nme','$sname','$mal','$mob','$pswrd','$clst','$pur','$gen');";
$conn=mysqli_connect($servername,$username,$password,$mydb);
if(!$conn){
die("connection failed".mysqli_connect_error());}
if(mysqli_query($conn,$sql)){
echo "Welcome $nme";}
else{echo"error in creation".mysqli_error($conn);}
mysqli_close($conn);?>
</body>
</html>