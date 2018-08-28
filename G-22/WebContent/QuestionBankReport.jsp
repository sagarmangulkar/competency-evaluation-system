<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Question Bank Report</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<center><h2><font color="brown">Question Bank Report</font></h2></center>
	<form action="">
		<table border="1" align="center">
		<tr>
			<td>Select Technology:&nbsp;</td>
			<td><select name="technology">
			<% 
  
		 Connection connection=null;
    	 PreparedStatement psSelect=null;
     	 ResultSet result =null;
     	try
     	{
           	 Class.forName("oracle.jdbc.driver.OracleDriver");
             connection=DriverManager.getConnection("jdbc:oracle:thin:@172.25.12.1:1521:oracle","user68","user68");
             psSelect=connection.prepareStatement("select * from technology");
             result=psSelect.executeQuery();
             while(result.next())
             {
        	%>
             <option value="<%=result.getString("technologyid") %>"><%=result.getString("technologyname") %></option>
        	<%
             }
    		%>
			</select></td>
		</tr>

		<tr>
		<td>Test Name</td><td><select name="testName">
		<%
			psSelect=connection.prepareStatement("select * from test");
			result=psSelect.executeQuery();
			while(result.next())
			{
		%>
		<option value="<%=result.getString("testid") %>"><%=result.getString("testname") %></option>
		<% 	
			}
     	
		%>
	</select></td>
	</tr>
	
	<tr>
		<td>Employee ID</td><td><select name="employeeId">
		<%
			psSelect=connection.prepareStatement("select * from registration");
			result=psSelect.executeQuery();
			while(result.next())
			{
		%>
		<option value="<%=result.getString("employeeId") %>"><%=result.getString("employeeId")%><%=result.getString("firstname") %></option>
		<% 	
			}
     	}//end of try
    	 finally
    	 {
             if(result!=null)
                     result.close();
             if(psSelect!=null)
                     psSelect.close();
     	}
		%>
	</select></td>
	</tr>
	<tr><td>&nbsp;&nbsp;</td><td><input type="submit" value="View"></td></tr>
	</table>
	</form>
</body>
</html>