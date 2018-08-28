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
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
			<title>Add Test</title>
			<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
	</head>
<body>
<form action="AddQuestionServlet">
<center><h2><font color="brown">Add Question</font></h2></center> 
<table border="1" align="center">
<tr>
	<td >
		Select Competency:&nbsp;</td>
		<td> 
		<select name="competency">
		<% 
  
	 Connection connection=null;
     PreparedStatement psSelect=null;
     ResultSet result =null;
     try
     {
           Class.forName("oracle.jdbc.driver.OracleDriver");
             connection=DriverManager.getConnection("jdbc:oracle:thin:@172.25.12.1:1521:oracle","user68","user68");
             psSelect=connection.prepareStatement("select * from competency");
             result=psSelect.executeQuery();
             while(result.next())
             {
        %>
             <option value="<%=result.getString("competencyid") %>"><%=result.getString("competencylevel") %></option>
        <%
             }
    	%>
		</select>
	</td>
</tr>

<tr><td>Test Name</td><td><select name="testName">
	<%
		psSelect=connection.prepareStatement("select * from test");
		result=psSelect.executeQuery();
		while(result.next())
		{
	%>
		<option value="<%=result.getString("testid") %>"><%=result.getString("testname") %></option>
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
	</td>
	</tr>

<tr><td>Enter Question</td><td><textarea name="txtquestion"></textarea></td></tr>
<tr><td>Option 1</td><td><textarea name="txtoption1"></textarea></td>
<td colspan="2">Option 2</td><td><textarea name="txtoption2"></textarea></td></tr>

<tr><td>Option 3</td><td><textarea name="txtoption3"></textarea></td>
<td colspan="2">Option 4</td><td><textarea name="txtoption4"></textarea></td></tr>

<tr><td>Select Correct Answer</td><td><input type="radio" name="option" value="option1">Option1&nbsp;<input type="radio" name="option" value="option2">Option2</td><td>&nbsp;<input type="radio" name="option" value="option3">Option3&nbsp;<input type="radio" name="option" value="option2">Option4</td></tr>
<tr><td><input type="submit" value="Add"></td><td><input type="button" value="Cancel" onclick="Cancel()"></td></tr>
</table>
</form>
</body>
</html>