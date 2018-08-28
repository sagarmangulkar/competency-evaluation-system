<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.PreparedStatement" %>
    <%@ page import="java.sql.PreparedStatement" %>
    <%@ page import="java.sql.ResultSet" %>
    <%@ page import="java.sql.Statement" %>
   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
	<title>Test Enrollment</title>
	<link rel="stylesheet" href="C:\Documents and Settings\user71\Desktop\date\css\jquery.ui.all.css">
	<script src="C:\Documents and Settings\user71\Desktop\date\js\jquery-1.9.1.js"></script>
	<script src="C:\Documents and Settings\user71\Desktop\date\js\jquery.ui.core.js"></script>
	<script src="C:\Documents and Settings\user71\Desktop\date\js\jquery.ui.widget.js"></script>
	<script src="C:\Documents and Settings\user71\Desktop\date\js\jquery.ui.datepicker.js"></script>
	<link rel="stylesheet" href="C:\Documents and Settings\user71\Desktop\date\css\demos.css">
	<script>
	$(function() {
		$( "#datepicker" ).datepicker({
			altField: "#alternate",
			altFormat: "d/ M/ yy"
		});
	});
	</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
	<center><h2><font color="brown">Test Enrollment</font></h2></center>
	<form action="TestEnrollServlet" method="get" name="AddTestform">
	
<table border="1" align="center">

<tr>
<td>Test Name:</td>
<td>
 <select name="testname">
 <% 
  
	 Connection connection=null;
     PreparedStatement psSelect=null;
     ResultSet result =null;
     try
     {
             Class.forName("oracle.jdbc.driver.OracleDriver");
             connection=DriverManager.getConnection("jdbc:oracle:thin:@172.25.12.1:1521:oracle","user68","user68");
             psSelect=connection.prepareStatement("select * from test");
             /* String city=request.getParameter("testname");
             psSelect.setString(1, city); */
             result=psSelect.executeQuery();
             while(result.next())
             {
             %>
             	<option value="<%=result.getString("testname") %>"><%=result.getString("testname") %></option>
             <%
             }
             %>

     </select>
 </td>
</tr>


<tr>
<td>Technology:</td>
<td>

<select name="technology">
	<%
		psSelect=connection.prepareStatement("select * from technology");
		result=psSelect.executeQuery();
		while(result.next())
		{
	%>
		<option value="<%=result.getString("technologyname") %>"><%=result.getString("technologyname") %></option>
	<% 	
		}
     }
     finally
     {
             if(result!=null)
                     result.close();
             if(psSelect!=null)
                     psSelect.close();
     }
	%>
	</select>
<!-- <select name="technology">
	<option value="Java">Java</option>
	<option value=".Net">.Net</option>
	<option value="PHP">PHP</option>
	<option value="Oracle">Oracle</option>
</select> --></td>
</tr>

<tr>
<td>New Test Date</td>
<td><input type="text" id="datepicker" name="date"></td>
</tr>

<tr>
<td>Employees ID's:</td>
<td><input type="text" name="empId"></td>
</tr>

<tr>
<td><input type="submit" value="Add"></td>
<td><input type="button" value="Cancel" onclick="Cancel()"></td>
</tr>
</table>
</form>	
<%
HttpSession seesion=request.getSession();
session.setAttribute("date", "date");



%>
</body>
</html>