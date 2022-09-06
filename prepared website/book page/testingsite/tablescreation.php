<html>
<head>
<title>The emerging one</title>
</head>
<body>
<?php
$servername="localhost";
$username="root";
$password="";
$mydb="useDel";
$sql="CREATE TABLE MYusers(first VARCHAR(30) NOT NULL,last VARCHAR(30) NOT NULL,email VARCHAR(50) NOT NULL PRIMARY KEY,mobileno` VARCHAR( 12 ) ,`age` VARCHAR( 3 ) ,  `classtime` VARCHAR( 12 ) , `purpose` VARCHAR( 18 ) NULL ,gender VARCHAR(6) NOT NULL)";
$conn=mysqli_connect($servername,$username,$password,$mydb);
if(!$conn){
die("connection failed".mysqli_connect_error());}
if(mysqli_query($conn,$sql)){
echo"table created";}
else{echo"error in creation".mysqli_error($conn);}
mysqli_close($conn);?>
</body>
</html>