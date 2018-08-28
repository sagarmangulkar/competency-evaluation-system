<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Expert</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<center><h2><font color="brown">Add Expert</font></h2></center>
<form action="AddExpertServlet">

<table border="1" align="center">
<tr><td>Employee ID</td><td><input type="text" name="empId"></td></tr>
<tr><td><input type="submit" value="Add" name="button"></td><td><input type="button" value="Cancel"></td></tr>
</table>
</form>
</body>
</html>