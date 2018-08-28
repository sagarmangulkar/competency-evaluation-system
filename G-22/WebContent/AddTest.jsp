<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
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
<title>Add Test</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<center><h2><font color="brown">Add Test</font></h2></center>
<form action="AddTestServlet" method="get" name="AddTestform">
<table border="1" align="center">
<tr>
<td>Test Name:</td>
<td><input type="text" name="testName"></td>
</tr>
<tr>
<td>Technology:</td>
<td><select>
	<option>Java</option>
	<option>.Net</option>
	<option>PHP</option>
	<option>Oracle</option>
</select></td>
</tr>
<tr>
<td>Test Duration:</td>
<td><input type="text"  name="duration" ></td>
</tr>
<tr>
<td>Date:</td>
<td><input type="text" id="datepicker" name="date"></td>
</tr>
<tr>
<td>Number of Questions:</td>
<td><input type="text" name="noofquestion" ></td>
</tr>
<tr>
<td><input type="submit" value="Add"></td>
<td><input type="button" value="Cancel" onclick="Cancel()"></td>
</tr>
</table>
</form>	

</body>
</html>