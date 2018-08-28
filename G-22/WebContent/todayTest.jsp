<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.util.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Today Test</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />

<script type="text/javascript">
var count=0;
function previousFunction() 
{
	document.frm.cnt.value=-1;
}
function nextFunction() 
{
	document.frm.cnt.value=1;
	
}
</script>

</head>
<body>
<form action="todayTest.jsp" method="get" name="frm">

<table border="1">
<tr><td><center><font color="Red"><b>Test</b></font></center></td></tr>
<%
	HttpSession reqSession=request.getSession(false);
	
	String test=String.valueOf(reqSession.getAttribute("testId"));
	int testId=Integer.parseInt(test);

	
	PrintWriter out1=response.getWriter();
	//out1.println(testId);	

	Connection connection=null;
	PreparedStatement psSelect=null;
	ResultSet result=null;
	
 	Class.forName("oracle.jdbc.driver.OracleDriver");
	connection=DriverManager.getConnection("jdbc:oracle:thin:@172.25.12.1:1521:oracle", "user68", "user68");
	
	int count= Integer.parseInt(""+ application.getAttribute("count"));
	int noOfQuestion= Integer.parseInt(""+ application.getAttribute("noOfQuestions"));
	
	//out.println(testId);
	if(request.getParameter("cnt")!=null)
	{

	int cnt=Integer.parseInt(request.getParameter("cnt"));
	
		if(cnt==1)
		{
		
			
			count++;
			application.setAttribute("count",count);
			if(noOfQuestion==1)
			{
				//out1.println("hello");
				psSelect=connection.prepareStatement("select questiondesc,option1,option2,option3,option4 from question where questionid=? and testid=?");
				
				psSelect.setInt(1,count);
				psSelect.setInt(2,testId);
				result=psSelect.executeQuery();
				
				Vector<String> questionId = new Vector<String>();
				while(result.next())
				{
					 questionId.add( result.getString(1));
					 Iterator iter=questionId.iterator();
					 Object data=iter.next();
		%>
				<tr><td><%=data%></td></tr>
				
				<tr><td><input type="radio" name="options" value="option1"><%=result.getString(2) %></td></tr>&nbsp;&nbsp;
				<tr><td><input type="radio" name="options" value="option2"><%=result.getString(3) %></td></tr>&nbsp;&nbsp;
				<tr><td><input type="radio" name="options" value="option3"><%=result.getString(4) %></td></tr>&nbsp;&nbsp;
				<tr><td><input type="radio" name="options" value="option4"><%=result.getString(5) %></td></tr>
		<%
				}
				noOfQuestion=questionId.size();
				application.setAttribute("noOfQuestions",noOfQuestion);
				//out1.println("noOfQuestion"+noOfQuestion);
			
			}
			else
			{
				out1.println("Exam is over...!");
				response.sendRedirect("enterEmployeeFeedback.jsp");
			}
			
		}
		else if(count>1)
		{
			//out1.println("else");
			count--;
			application.setAttribute("count",count);
			
			psSelect=connection.prepareStatement("select questiondesc,option1,option2,option3,option4 from question where questionid=? and testid=?");
			
			psSelect.setInt(1,count);
			psSelect.setInt(2,testId);
			result=psSelect.executeQuery();
			
			Vector<String> questionId = new Vector<String>();
			while(result.next())
			{
				 questionId.add( result.getString(1));
				 Iterator iter=questionId.iterator();
				 Object data=iter.next();
	%>
			<tr><td><%=data%></td></tr>
			
			<tr><td><input type="radio" name="options" value="option1"><%=result.getString(2) %></td></tr>&nbsp;&nbsp;
			<tr><td><input type="radio" name="options" value="option2"><%=result.getString(3) %></td></tr>&nbsp;&nbsp;
			<tr><td><input type="radio" name="options" value="option3"><%=result.getString(4) %></td></tr>&nbsp;&nbsp;
			<tr><td><input type="radio" name="options" value="option4"><%=result.getString(5) %></td></tr>
	<%
			}
			noOfQuestion=questionId.size();
			application.setAttribute("noOfQuestions",noOfQuestion);
			//out1.println("noOfQuestion"+noOfQuestion);
			
		}
		else
		{
			out1.println("Press next to continue...?");
		}
	}
	%>
<tr><td>Question No. <%=count %> </td></tr>
<tr><td>
<input type="submit" value="Previous" name="button" id="button" onclick="previousFunction()">
<input type="submit" value="Next" name="button" id="button" onclick="nextFunction()">
<input type="hidden" name="cnt">

</td></tr>
</table>
</form>

</body>
</html>