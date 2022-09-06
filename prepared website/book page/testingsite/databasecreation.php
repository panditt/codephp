<html>
<head>
<title>The emerging one</title>
</head>
<body>
<?php
$servername="localhost";
$username="root";
$password="";
$sql="CREATE DATABASE useDel";
$conn=mysqli_connect($servername,$username,$password);
if(!$conn){
die("connection failed".mysqli_connect_error());}
echo"connected successfully";
if(mysqli_query($conn,$sql))
{echo"done baby done";}
else{echo"tumse na ho paega".mysqli_error($conn);}
mysqli_close($conn);?>
</body>
</html>