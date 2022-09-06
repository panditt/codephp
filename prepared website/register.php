<?php
//connectivity
require('config.php');
include "hfiles\hfooter.php";
include "hfiles\header.php";
//captcha
$num1 = range(9,0);
	$num2 = range(9,0);
	$rnum1 = array_rand($num1);
	$rnum2 = array_rand($num2);
	$n1 = $num1[$rnum1];
	$n2 = $num2[$rnum2];
	$sum = $n1 + $n2;
	$res = $n1." + ".$n2;
if(isset($_POST['submit']))
{
if($_POST['c1']==$_POST['c2'])
{
	$n = $_POST['uname'];
	$pass = $_POST['upass'];
$p = $_POST['upass'];//encrypt pass
	$em = $_POST['umail'];
	$gen = $_POST['gender'];
	$mob = $_POST['umob'];
	$add = $_POST['address'];
	$clst=$_POST["cls"];
$pur=$_POST["purpose"];
$pswrd=$_POST["age"];
	//$img = $_FILES['file']['name'];
	
//check user if already exists
$q = "SELECT mob FROM users WHERE mobileno='$mob'";
$cq = mysqli_query($con,$q);
$ret = mysqli_num_rows($cq);
if($ret == true)
{
	echo "<center><h2 style='color:red'>User with same Mobile no. already exists</h2></center>";
}
//insert into database
else
{
	$query = "INSERT INTO MYusers(name,email,mobileno,password,age,classtime,purpose,address,gender) VALUES(,'$n','$em','$mob','$p','$pswrd','$clst','$pur','$add','$gen')";
	mysqli_query($con,$query);
	//mkdir("images/".$_POST['umail']);
	//move_uploaded_file($_FILES['file']['tmp_name'],"images/".$_POST['umail']."/".$_FILES['file']['name']);
	echo "<center><h1 styl e='color:green'>Details Saved! Come on time</h1></center>";
	echo $n,$em,$mob;
}
}
else
{
	echo '<script>alert("Wrong Verification Code, try again!")</script>';
}
}

//display details
if(isset($_POST['display']))
{
	$que = mysqli_query($con,"select * from users");
	
	echo "<div align='center'>";
	echo "<table border='1' bgcolor='transparent' width='500px'>";
	echo "<tr><th>User ID</th><th>UserName</th><th>Password<br>(Encrypted)</th><th>Email</th><th>Gender</th><th>Mobile No.</th><th>Image</th><th>Option</th></tr>";
	
	while($row= mysqli_fetch_array($que))
	{
	echo "<tr>";
	echo "<td>".$row['id']."</td>";
	echo "<td>".$row['username']."</td>";
	echo "<td>".$row['password']."</td>";
	echo "<td>".$row['email']."</td>";
	echo "<td>".$row['gender']."</td>";
	echo "<td>".$row['mob']."</td>";
	
	$e=$row['email'];
	$img=$row['image'];
	
	echo "<td><img src='images/$e/$img' width='70' height='70'/></td>";
	
	echo "<td><a href='edit.php'>Edit</a>&nbsp;&nbsp;
		<a href='delete.php?email=$e'>Delete</a>
	</td>";
	echo "</tr>";
	}
	echo "</table>";
	echo "</div>";
}
?>
<html>
<head>
<link rel="stylesheet" type="text/css" href="./css/homepage.css">
<style>
div.pr{padding:90px;}
input.fine
{font-size: 50px;
color: white;
background-color: transparent;}
</style>
<script>
	function go()
	{
		document.location='./login.php';
	}
	function refresh()
	{
		document.location='./register.php';
	}
</script>
</head>
<body style="background-color:transparent">
<div align="center" class="pr">
<form method="post" enctype="multipart/form-data">
	<fieldset style="display: inline-flex;font-size: 25px;color: white; background-color: transparent;">
	<legend><font size="+2"><strong>REGISTRATION</strong></font></legend>
	<p><b>COMPLETE NAME   : </b><input type="text" name="uname" required/>*</p>
    <p><b>PASSWORD   : </b><input type="password" name="upass" required/>*</p>
    <p><b>Email      : </b><input type="email" name="umail" required/>*</p>
    <p><b>GENDER     : </b><input type="radio" name="gender" value="m">Male&nbsp;<input type="radio" name="gender" value="f">Female</p>
    <p><b>MOBILE No. : </b><input type="text" name="umob" required/>*</p>
	<p><b>AGE        : </b><input type="number" name="age" required min_length="1" min="15" max="100"></p>
	<p><b>CLASS TIMING  :  </b><select name="cls">
<option value="5-6am">5:00am-6:00am</option>
<option value="6-7am">6:00am-7:00am</option>
<option value="7-8am">7:00am-8:00am</option>
<option value="8-9am">8:00am-9:00am</option>
<option value="9-10am">9:00am-10:00am</option>
<option value="4-5pm">4:00pm-5:00pm</option>
<option value="5-6pm">5:00pm-6:00pm</option>
<option value="6-7pm">6:00pm-7:00pm</option>
<option value="7-8pm">7:00pm-8:00pm</option>
</select></p>
<p><b>purpose for classes</b>
<select name="purpose">
<option value="loss">lose weight</option>
<option value="gain">gain weight</option>
<option value="lean">leaning</option>
<option value="training">gym training</option>
<option value="comp">competition preparation</option>
<option value="hltmnt">health maintaining</option></select></p>
    <b>ADDRESS : </b><textarea placeholder="Input Address" name="address"></textarea>
<fieldset style="display: inline-flex; background-color: transparent;color: white;"><legend><strong>VERIFICATION</strong></legend><p><?php
error_reporting(1);
echo $res." = ";
?>
<input type="hidden" name="c1" value="<?php echo $sum; ?>">
<input type="text" name="c2" placeholder="Enter Sum">*</p></fieldset><br>
    <p><input type="submit" name="submit" value="Register" class="fine">&nbsp;<input type="reset" onClick="refresh()" class="fine"></p>
</form>
</div>
</body>
</html>