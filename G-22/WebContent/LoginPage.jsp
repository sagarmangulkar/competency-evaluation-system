<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page...!</title>

<link href="style.css" rel="stylesheet" type="text/css" media="screen" />

<script type="text/javascript">
function clearText1() 
{
	document.loginform.userName.value="";
}
function clearText2() 
{
	document.loginform.password.value="";
}
function checkValidate() 
{
	var userName=document.loginform.userName.value;
	var password=document.loginform.password.value;	
	if (userName=="") 
	{
		alert("Invalid Uesr Name");
		return false;
	}
	if (password=="") 
	{
		alert("Invalid Password");
		return false;
	} 
	else 
	{
		return true;
	}
}
function register() 
{
	window.navigate("Registration.jsp");	
}
</script>



</head>
<body>
<form onsubmit="return checkValidate()" action="Authentication" method="post" name="loginform">
<table align="center" border="2">


<tr>
<td>Select Roll:</td>
<td><select name="selectRoll">
<option value="admin">Admin</option>
<option value="expert">Expert</option>
<option selected value="employee">Employee</option>
</select>
</td>
</tr>

<tr>

<td>User Name:</td>
<td><input type="text" value="Enter UserName" name="userName" onclick="clearText1()"></td>
</tr>

<tr>
<td>Password:</td>
<td><input type="password" value="Enter Password" name="password" onclick="clearText2()"></td>
</tr>

<tr>
<td>&nbsp;&nbsp;&nbsp;
<input type="submit" value="Login"></td>
<td>&nbsp;&nbsp;&nbsp;
<input type="button" value="Register" onclick="register()">
</td>
</tr>

</table>
</form>
</body>
</html>