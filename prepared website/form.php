<?php
 include "hfiles\hfooter.php"; 
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
{$nme=$_POST["first"];
$sname=$_POST["last"];
$mal=$_POST["mail"];
$mob=$_POST["mob"];
$pass=$_POST["pas"];
$clst=$_POST["cls"];
$pur=$_POST["purpose"];
$pswrd=$_POST["age"];
$gen=$_POST["gender"];}
else
	{
	echo '<script>alert("Wrong Verification Code, try again!")</script>';
}}
include "hfiles\header.php";
?>
<html>
<head>
<title>
TRANSFORM- TRAIN HARD OR GO HOME
</title>
<script>
 function validate()
 { 
var userForm=document.forms["fashion"]; 
var regex3=/[a-z,A-Z]/;
var fname=document.forms["fashion"]["first"].value;
if(regex3.test(fname)==false) 
{ alert("Please enter your name in english alphabets only");
 return false; }
 var regex1=/[0-9]{10}/;
 var mobileNo=userForm["mob"].value;
 if(regex1.test(mobileNo)==false) 
{ alert("Wrong mobile number"); 
return false;
 }
 var regex2=/\S+\@\S+\.\S+/; 
var email=userForm["mail"].value;
 if(regex2.test(email)==false)
{
 alert("Provide valid Email Address"); 
return false;
 }
 var ver1=document.forms["fashion"]["c1"].value;
 var ver2=document.forms["fashion"]["c2"].value;
 if(ver1==ver2)
 {return true;}
 else{alert(wrong verification code);
return false;}
 return true;
 }
 </script>
<link rel="stylesheet" type="text/css" href="./css/homepage.css">
<style>
table.bk{
 font-size: 40px;
 background-color: transparent;
}
div.fr{
	padding: 90px;
color:white;
font-family: 'HelveticaRegular',Helvetica,Arial;}
div.yr{
	text-align: center;
	font-size: 50px;
color:white;
font-family: 'HelveticaRegular',Helvetica,Arial;}
input.fine
{font-size: 50px;
color: white;
background-color: transparent;}
</style> 
</head>
<div class="fr">
<div class="yr">TRAIL CLASS FOR 2 DAYS</div>
<table class="bk" align="center">
<form name="fashion" action="welcome.php" method="post">
<tr><td>first name</td><td><input type="text" name="first" autocomplete="off" required></td></tr>
<tr><td>last name</td><td><input type="text" name="last" required></td></tr>
<tr><td>email</td><td><input type="email" name="mail" required></td></tr>
<tr><td> mobile no</td><td><input type="text" name="mob" required></td></tr>
<tr><td>password</td><td><input type="password" name="pas" required min_length="8"></td></tr>
<tr><td>age</td><td><input type="number" name="age" required min_length="1" min="15" max="100"></td></tr>
<tr><td>class timings</td>
<td><select name="cls">
<option value="5-6am">5:00am-6:00am</option>
<option value="6-7am">6:00am-7:00am</option>
<option value="7-8am">7:00am-8:00am</option>
<option value="8-9am">8:00am-9:00am</option>
<option value="9-10am">9:00am-10:00am</option>
<option value="4-5pm">4:00pm-5:00pm</option>
<option value="5-6pm">5:00pm-6:00pm</option>
<option value="6-7pm">6:00pm-7:00pm</option>
<option value="7-8pm">7:00pm-8:00pm</option>
</select></td></tr>
<tr><td>purpose for classes</td>
<td><select name="purpose">
<option value="loss">lose weight</option>
<option value="gain">gain weight</option>
<option value="lean">leaning</option>
<option value="training">gym training</option>
<option value="comp">competition preparation</option>
<option value="hltmnt">health maintaining</option></select></td></tr>
<tr><td>gender</td></tr><tr><td><input type="radio" name="gender" value="male" checked>male</td>
<td><input type="radio" name="gender" value="female">female</td></tr>
<tr><td align="center" colspan="2">
<fieldset style="display: inline-flex; background-color: transparent;"><legend><strong>Verification</strong></legend><p><?php
error_reporting(1);
echo $res." = ";
?>
<input type="hidden" name="c1" value="<?php echo $sum; ?>">
<input type="text" name="c2" placeholder="Enter Sum">*</p></fieldset><br>
<input type="submit" value="BOOK" class="fine"></form></td></tr>
 </div>	
</table>
</html>	
