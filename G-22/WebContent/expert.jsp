<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Expert Console</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="button.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<div id="wrapper">
	<div id="header">
		<div id="menu">
			<ul>
				<li class="current_page_item"><a href="index.html"">Home</a></li>
				<li><a href="AboutUs.jsp">AboutUs</a></li>
				<li><a href="#">ContactUs</a></li>
				<li><a href="LogoutServlet">Log Out</a></li>
					<%
	HttpSession userSession =request.getSession(false);
	String userName= String.valueOf(userSession.getAttribute("userName"));
	%>
	<li><h3><font color="white">Welcome <%=userName %></font></h3></li>
			</ul>
		</div>
		<!-- end #menu -->
		<div id="search">
			<form method="get" action="">
				<fieldset>
				<input type="text" name="s" id="search-text" size="15" />
				<input type="submit" id="search-submit" value="Search" />
				</fieldset>
			</form>
		</div>
		<!-- end #search -->
	</div>
	<!-- end #header -->
	
	<div id="logo">
		<h1><font color="white">Expert Console</font></h1>
		
	</div>
	<hr />
	<!-- end #logo -->
<!-- end #header-wrapper -->
</div>

<div id="page">
	<div id="content">
		<div class="post">
			
		
			<div class="entry">
				
			<iframe name="window" width="650" height="400" frameborder="0" align="middle"></iframe>
				
			</div>
		</div>
	</div>
	
	<span class="CSSButton" onclick="window.location.href='AddQuestion.jsp'">Add Question</span><br/>
	<span class="CSSButton" onclick="window.location.href='viewQuestion.jsp'">View Question</span><br/>
	<span class="CSSButton" onclick="window.location.href='FeedbackReport.jsp'">Feedback Report</span><br/>
	<span class="CSSButton" onclick="window.location.href='QuestionBankReport.jsp'">Question Bank Report</span><br/>
	
	
</div>

<div id="footer">
	<p>Copyright (c) 2013 Group-22 All rights reserved. Design by <a href="http://www.freecsstemplates.org/">All team members</a>.</p>
</div>
<!-- end #footer -->
</div>
</body>
</html>