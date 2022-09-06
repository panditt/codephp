<html>
 <head> 
<title>form</title>
 <script type="text/javascript">
 function validate()
 { 
var userForm=document.forms["userDetails"];
 if(userForm["Password"].value.length< 8) 
{ alert("Password should of at least 8 characters");
 return false; }
 var regex1=/[0-9]{10}/;
 var mobileNo=userForm["MobileNo"].value;
 if(regex1.test(mobileNo)==false) 
{ alert("Wrong mobile number"); 
return false;
 }
 var regex2=/\S+\@\S+\.\S+/; 
var email=userForm["Email"].value;
 if(regex2.test(email)==false)
 
{
 alert("Wrong Email Address"); 
return false;
 }
 return true;
 }
 </script> 
</head> 
<body>
 <form name="userDetails" action="" onSubmit="return validate();" style="width:200px">
 <label>Name </label>
 <input type="text" name="Name" required/> 
<label>Password</label>
 <input type="text" name="Password" required/>
 <label>Mobile No.</label> 
<input type="text" name="MobileNo" /><BR>
 <label>E-mail</label>
 <input type="text" name="Email" /> 
<input type="submit" value="Submit"> 
</form>
 </body> 
</html>
