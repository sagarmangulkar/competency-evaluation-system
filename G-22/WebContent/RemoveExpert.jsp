<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Remove Expert</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript">
function cancel() 
{
	window.location="expertMgmt.jsp";	
}
</script>

</head>
<body>
<center><h2><font color="brown">Remove Expert</font></h2></center>
<form action="SearchExpertFromDB" method="get">
<table border="1" align="center">
<tr>
<td>Employee Id:</td>
<td><input type="text" name="employeeId1"></td>
</tr>
<tr>
<td><input type="submit" value="Remove" name="remove" id="remove"></td>
<td><input type="button" value="Cancel" onclick="cancel()"></td>
</tr>
</table>
</form>
</body>
</html>