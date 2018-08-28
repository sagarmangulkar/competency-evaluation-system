<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function Cancel()
	{
		window.navigate("Registration.jsp");
	}
	function Confirm()
	{
		window.navigate("registerUser.jsp");
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirm</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<center><font color="red"><h3>Confirm your Information</h3></font></center><br/>
<jsp:useBean id="objEmp" class="g22.project.Employee" scope="session" >
<jsp:setProperty property="*" name="objEmp"/>
</jsp:useBean>


<table align="center">

<tr>
<td>Employee ID:</td>
<td><jsp:getProperty name="objEmp" property="employeeId"/></td>
</tr>


<tr>
<td>First Name:</td>
<td><jsp:getProperty name="objEmp" property="firstName"/></td>
</tr>


<tr>
<td>Last Name:</td>
<td><jsp:getProperty name="objEmp" property="lastName"/></td>
</tr>


<tr>
<td>Technology:</td>
<td><jsp:getProperty name="objEmp" property="technology"/></td>
</tr>


<tr>
<td>Contact No.:</td>
<td><jsp:getProperty name="objEmp" property="contactNo"/></td>
</tr>

<tr>
<td>Email ID:</td>
<td><jsp:getProperty name="objEmp" property="emailId"/></td>
</tr>


<tr>
<td>Security Question:</td>
<td><jsp:getProperty name="objEmp" property="sQuestion"/></td>
</tr>


<tr>
<td>Security Answer:</td>
<td><jsp:getProperty name="objEmp" property="sAnswer"/></td>
</tr>


<tr>
<td>&nbsp;&nbsp;&nbsp;<input type="button" value="Register" onclick="Confirm()"></td>

<td>&nbsp;&nbsp;&nbsp;<input type="button" value="Cancel" onclick="Cancel()"></td>
</tr>

</table>
<!-- <form action="InsertIntoDataBase" method="post">
<h1>Do you want to conform...?</h1>
<br>
<br>
<input type="submit" value="Confirm">
&nbsp;&nbsp;&nbsp;<input type="submit" value="Cancel" onclick="Cancel()">
</form> -->

<%
HttpSession redSession=request.getSession();
redSession.setAttribute("employeeId", request.getParameter("employeeId"));
redSession.setAttribute("firstName", request.getParameter("firstName"));
redSession.setAttribute("lastName", request.getParameter("lastName"));
redSession.setAttribute("password", request.getParameter("password"));
redSession.setAttribute("cPassword", request.getParameter("cPassword"));
redSession.setAttribute("technology", request.getParameter("technology"));
redSession.setAttribute("contactNo", request.getParameter("contactNo"));
redSession.setAttribute("emailId", request.getParameter("emailId"));
redSession.setAttribute("sQuestion", request.getParameter("sQuestion"));
redSession.setAttribute("sAnswer", request.getParameter("sAnswer"));

PrintWriter out1=response.getWriter();


%>




</body>
</html>