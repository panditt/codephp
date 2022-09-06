<html>
<head>
<title>TRANSFORM- TRAIN HARD OR GO HOME</title>
</head>
<body>
<?php
include "hfiles\hfooter.php";
$servername="localhost";
$username="root";
$password="";
$mydb="useDel";
$name=$_POST["cnme"];
$mail=$_POST["cmail"];
$sub=$_POST["sub"];
$masg=$_POST["msg"];
$sql="INSERT INTO feedback(name,email,subject,message) VALUES('$name','$mail','$sub','$masg');";
$conn=mysqli_connect($servername,$username,$password,$mydb);
if(!$conn){
die("connection failed".mysqli_connect_error());}
if(mysqli_query($conn,$sql)){
echo "Thank you $name your messsage is succefully received";}
else{echo"error in creation".mysqli_error($conn);}
mysqli_close($conn);?>
</body>
</html>