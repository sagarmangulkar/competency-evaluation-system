<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Feedback Report</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<center><h2><font color="brown">Feedback Report</font></h2></center>
<table border="1" align="center">
<tr><th>Employee ID</th><th>Test ID</th><th>Description</th></tr>
	
	<%
		Connection connection=null;
		PreparedStatement psSelect=null;
		ResultSet result=null;	
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		connection=DriverManager.getConnection("jdbc:oracle:thin:@172.25.12.1:1521:oracle", "user68", "user68");
		psSelect=connection.prepareStatement("select * from feedback");
		result=psSelect.executeQuery();
		while(result.next())
		{
	%>
	<tr><td><%=result.getString(3) %></td><td><%=result.getString(4) %></td><td><%=result.getString(2) %></td></tr>
	<%
		}
	%>
</table>
</body>
</html>