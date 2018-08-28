<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Page</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />

<script type="text/javascript">
function clearText1()
{
	document.registerform.employeeId.value="";
	
}
function clearText2() 
{
	document.registerform.firstName.value="";
}
function clearText3() 
{
	document.registerform.lastName.value="";
}
function clearText4() 
{
	document.registerform.password.value="";
}
function clearText5() 
{
	document.registerform.cPassword.value="";
}
function clearText6() 
{
	document.registerform.technology.value="";
}
function clearText7() 
{
	document.registerform.contactNo.value="";
}
function clearText8() 
{
	document.registerform.emailId.value="";
}
function clearText9() 
{
	document.registerform.sQuestion.value="";
}
function clearText10() 
{
	document.registerform.sAnswer.value="";
}

function cancel() 
{
	window.navigate("LoginPage.jsp");
}

function checkValidate()
{
	var employeeId=document.registerform.employeeId.value;
	var firstName=document.registerform.firstName.value;
	var lastName=document.registerform.lastName.value;
	var password=document.registerform.password.value;
	var cPassword=document.registerform.cPassword.value;
	var technology=document.registerform.technology.value;
	var contactNo=document.registerform.contactNo.value;
	var emailId=document.registerform.emailId.value;
	var sQuestion=document.registerform.sQuestion.value;
	var sAnswer=document.registerform.sAnswer.value;

	
	if (employeeId=="") 
	{
		alert("Invalid Employee Id");
		return false;
	} 
	
	if (firstName=="") 
	{
		alert("Invalid First Name");
		return false;
	}
	if (lastName=="") 
	{
		alert("Invalid Last Name");
		return false;
	}
	if (password=="" || cPassword=="" || password.length<6 || password!=cPassword) 
	{
		alert("Invalid Password \n [Tip: Password length must be greater than 6]");
		return false;
	}
	if (technology=="") 
	{
		alert("Invalid Technology");
		return false;
	}
	if (contactNo=="") 
	{
		alert("Invalid Contact Number");
		return false;
	}
	if(isNaN(contactNo))
	{
		alert("Invalid Contact Number");
		return false;
	}
	
	if (emailId=="" || emailId.indexOf('@')<2 || emailId.indexOf('.')<3 || emailId.lastindexOf('@')<2) 
	{
		alert("Invalid Email Id");
		return false;
	}
	
	if (sQuestion=="") 
	{
		alert("Invalid Security Question");
		return false;
	}
	if (sAnswer=="") 
	{
		alert("Invalid Security Answer");
		return false;
	}
	
	else 
	{
		return true;
	}
}
</script>
</head>
<body>

<div id="wrapper">

	<div id="header">
		<div id="menu">
			<ul>
				<li class="current_page_item"><a href="index.html">Home</a></li>
				<li><a href="AboutUs.jsp">AboutUs</a></li>
				<li><a href="#">ContactUs</a></li>
			</ul>
		</div>
		<!-- end #menu -->
		<div id="search">
			<form method="get" action="">
				<fieldset>
				<input type="text" name="s" id="search-text" size="15" />
				<input type="submit" id="search-submit" value="Search" />
				</fieldset>
			</form>
		</div>
		<!-- end #search -->
	</div>
</div>
	<!-- end #header -->
	
	<div id="logo">
		<h1><a href="#">Register Here</a></h1>
		
	</div>
	<hr />
	<!-- end #logo -->
<!-- end #header-wrapper -->

<center><h2><font color="brown">Registration</font></h2></center>
<form onsubmit="return checkValidate()" action="Conform.jsp" method="post" name="registerform">
&nbsp;&nbsp;&nbsp;<table align="center" border="1">

<tr>
<td>Employee ID:<font color="red">*</font></td>
<td><input type="text" value="Enter Employee ID" name="employeeId" onclick="clearText1()"></td>
</tr>


<tr>
<td>First Name:<font color="red">*</font></td>
<td><input type="text" value="Enter First Name" name="firstName" onclick="clearText2()"></td>
</tr>


<tr>
<td>Last Name:<font color="red">*</font></td>
<td><input type="text" value="Enter Last Name" name="lastName" onclick="clearText3()"></td>
</tr>


<tr>
<td>Password:<font color="red">*</font></td>
<td><input type="password" value="Enter Password" name="password" onclick="clearText4()"></td>
</tr>


<tr>
<td>Conform Password:<font color="red">*</font></td>
<td><input type="password" value="Enter Password" name="cPassword" onclick="clearText5()"></td>
</tr>


<tr>
<td>Technology:<font color="red">*</font></td>
<td><input type="text" value="Enter Technology" name="technology" onclick="clearText6()"></td>
</tr>


<tr>
<td>Contact No.:<font color="red">*</font></td>
<td><input type="text" value="Enter Contact NO." name="contactNo" onclick="clearText7()" maxlength="11"></td>
</tr>

<tr>
<td>Email ID:<font color="red">*</font></td>
<td><input type="text" value="Enter Email ID" name="emailId" onclick="clearText8()"></td>
</tr>


<tr>
<td>Security Question:<font color="red">*</font></td>
<td><input type="text" value="Enter Security Question" name="sQuestion" onclick="clearText9()"></td>
</tr>


<tr>
<td>Security Answer:<font color="red">*</font></td>
<td><input type="text" value="Enter Security Answer" name="sAnswer" onclick="clearText10()"></td>
</tr>


<tr>
<td>&nbsp;&nbsp;&nbsp;<input type="submit" value="Register"></td>

<td>&nbsp;&nbsp;&nbsp;<input type="button" value="Cancel" onclick="cancel()"></td>
</tr>




</table>
</form>

</body>
</html>