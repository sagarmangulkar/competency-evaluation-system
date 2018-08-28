<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Individual Report</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<center><h2><font color="brown">Individual Report</font></h2></center>
<table border="1" align="center">
<tr><th>Test Id</th><th>Employee Id</th><th>Score</th><th>Date of Test</th></tr>
<%
			Connection connection=null;
			PreparedStatement psSelect=null;
			ResultSet result=null;
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection=DriverManager.getConnection("jdbc:oracle:thin:@172.25.12.1:1521:oracle", "user68", "user68");

			psSelect=connection.prepareStatement("select * from test_detail where employeeid=102");
			result=psSelect.executeQuery();
		
			while(result.next())
			{
	%>
			<tr><td><%=result.getInt(3)%></td>
			<td><%=result.getInt(2)%></td>
			<td><%=result.getInt(4)%></td>
			<td><%=result.getString(5)%></td></tr>
			
	<%
			}
		
	

%>
</table>
</body>
</html>