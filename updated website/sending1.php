<html>
<head>
<title>TRANSFORM- TRAIN HARD OR GO HOME</title>
<link rel="stylesheet" type="text/css" href="./hfiles/css/hdft.css">
</head>
<style>
div.you{
	text-align:center;
}
button
{font-size: 30px;
color: white;
background-color: transparent;}
h1 {
	text-align: center;
	padding: 100px;
	color:white;
}</style>
<body style="background-color: black;">
<?PHP
include "hfooter.php";
include "logout.php";
$servername="localhost";
$username="root";
$password="GONE";
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
<div class="you">
<h1>THANK YOU! <?PHP ECHO $name;?> your message has been received</h1><BR>
<a href="http://localhost/updated%20website/homepage1.php"><button>GO TO HOMEPAGE</button></a><br></div>
</body>
</html>