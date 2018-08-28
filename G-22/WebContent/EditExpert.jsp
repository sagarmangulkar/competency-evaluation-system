<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Edit Expert</title>

<script type="text/javascript">
	function Cancel()
	{
		window.navigate("expertMgmt.jsp");
	}
</script>

</head>
<body>
	<form action="Mediator">
	<center><h1><font color="brown">Edit Expert</font></h1></center>
<table border="1" align="center">
<%
ServletContext context=request.getServletContext();
if(context.getAttribute("firstName")==null)
{
	System.out.println("inside if...");
%>

<tr><td>Employee ID</td><td><input type="text" name="empId"></td></tr>
<tr><td><input type="submit" value="search" name="button" id="search"></td></tr>
<tr><td>First Name</td><td><input type="text" name="firstName"></td></tr>
<tr><td>Last Name</td><td><input type="text" name="lastName"></td></tr>
<tr><td>Technology</td><td><input type="text" name="techn"></td></tr>
<tr><td><input type="submit" value="Update" name="button" id="update"></td><td><input type="button" value="Cancel" onclick="Cancel()"></td></tr>

<%
}
else
{
	System.out.println("inside else...");
%>
<tr><td>Employee ID</td><td><input type="text" name="empId" value="<%=context.getAttribute("employeeId")%>"></td></tr>
<tr><td><input type="submit" value="search" onclick="window.location.href='SearchExpertFromDB'" name="search" id="search"></td></tr>
<tr><td>First Name</td><td><input type="text" name="firstName" value="<%=context.getAttribute("firstName") %>"></td></tr>
<tr><td>Last Name</td><td><input type="text" name="lastName" value="<%=context.getAttribute("lastName") %>"></td></tr>
<tr><td>Technology</td><td><input type="text" name="techn" value="<%=context.getAttribute("technology") %>"></td></tr>
<tr><td><input type="submit" value="Update" name="button" id="update"></td><td><input type="button" value="Cancel" onclick="Cancel()"></td></tr></table>
<%
}
context.setAttribute("firstName", null);
context.setAttribute("lastName", null);
context.setAttribute("technology", null);
%>
</form>	
</body>
</html>