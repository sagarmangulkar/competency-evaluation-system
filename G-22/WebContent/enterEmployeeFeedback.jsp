<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">
function cancel() 
{
	window.location.href="todayTest.jsp";	
}
</script>

</head>
<body>
<form action="#" method="get">
<table>
<tr><td><center><font color="Red">Feedback</font></center></td></tr>
<tr><td><textarea name="txtfeedback"></textarea></td></tr>
<tr><td>
<input type="submit" value="Submit"> 
<input type="button" value="Cancel" onclick="cancel()">
</td></tr>
</table>
</form>
</body>
</html>