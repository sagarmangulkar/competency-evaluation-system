<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center><h2><font color="brown">Technology Management</font></h2></center>
<form action="AddTechnologyServlet" method="get">

<table border="1" align="center">

<tr>
<td>Technology Name:</td>
<td><input type="text" name="technologyName"></td>
</tr>
<tr>
<td><input type="submit" value="Add" name="add" id="add"></td>
<td><input type="button" value="Cancel" onclick="cancel()"></td>
</tr>
</table>
</form>
</body>
</html>