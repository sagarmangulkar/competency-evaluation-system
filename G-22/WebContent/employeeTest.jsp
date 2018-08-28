<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Online Test</title>

<script type="text/javascript">
var count1=0;

</script>

</head>
<body>

	<table border="1">
	<tr>
	<td><center><font color="Red">Test</font></center></td>
	</tr>
	<tr>
	<td>
	<%
		int count=0;
	%>
	Question No.:<script type="text/javascript">
	function count() 
	{
		count1++;
		document.write(count1);
	}
	</script>
	</td>
	</tr>
	<tr align="center">
	<td>
		<input type="button" value="Previous">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value="Next" onclick="count()">
	</td>
	</tr>
	
	</table>

</body>
</html>