<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Successfully Registered</title>
</head>
<body>

	<jsp:useBean id="objEmp" class="g22.project.Employee" scope="session"/>
	<%objEmp.save();%>You have successfully Registered..<%--with Employye Id <% 
	PrintWriter outer=response.getWriter();
	outer.println(objEmp.getEmployeeId()); %> --%>
</body>
</html>