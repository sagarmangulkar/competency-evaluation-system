<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="org.hibernate.*"%>
    <%@page import="org.hibernate.cfg.*"%>
    <%@page import="org.hibernate.service.*"%>
    <%@page import="javax.servlet.*"%>
    <%@page import="java.util.Iterator"%>
    <%@page import="java.util.Date"%>
    <%@page import="java.text.*"%>
   	<%@page import="g22.project.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Main Window</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>

	<form action="todayTest.jsp">
	<font color="brown"><b>Todays Test</b></font>
	<table border="1" cellpadding="3">
		<tr>
			<th>Test Id</th><th>Test Name</th><th>Test Date</th><th>Test Duration</th><th>Total Question</th></tr>
	<%
		HttpSession reqSession=request.getSession();
	
		SessionFactory factory = null;
		Configuration config1 = null;
		Session hiberSession = null;
	
		config1 = new Configuration();
		
		config1.configure("test.cfg.xml");
		
		ServiceRegistryBuilder builder = new ServiceRegistryBuilder();
		
		builder.applySettings(config1.getProperties());
		
		ServiceRegistry registry = builder.buildServiceRegistry();
		
		factory = config1.buildSessionFactory(registry);
		
		hiberSession = factory.openSession();
		Query query=hiberSession.createQuery("from Test");
		Iterator<Test> iter=(Iterator<Test>)query.iterate();
		Iterator<Test> iter1=(Iterator<Test>)query.iterate();
		
		while(iter.hasNext())
		{
			Test objTest=iter.next();
			
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			
			String testDate=dateFormat.format(date);
			String [] arrDate=objTest.getDate().split(" ");
			
			System.out.println(arrDate[0]);
			System.out.println(testDate);
			
			reqSession.setAttribute("testId", objTest.getTestId());
			
			if(arrDate[0].equals(testDate))
			{ 
				
	%>
		<tr align="center">
		<td><%=objTest.getTestId()%></td>
		<td><%=objTest.getTestName()%></td>
		<td><%=arrDate[0]%></td>
		<td><%=objTest.getDuration()%></td>
		<td><%=objTest.getNoOfQuestion()%></td>
		<td><input type="submit" value="Start" ></td>
		</tr>
		
	<%
			}
		}
	%>
	</table>
	<br/><br/><br/><br/><br/>
	<font color="brown"><b>Schedule Tests</b></font>
	<table border="1">
	<tr><th>Test Name</th><th>Test Date</th><th>Test Duration</th><th>Total Question</th></tr>
	<%
		while(iter1.hasNext())
		{
			Test objTest=iter1.next();
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			
			String testDate=dateFormat.format(date);
			String [] arrDate=objTest.getDate().split(" ");
	%>
	<tr align="center">
		<td><%=objTest.getTestName()%></td>
		<td><%=arrDate[0]%></td>
		<td><%=objTest.getDuration()%></td>
		<td><%=objTest.getNoOfQuestion()%></td>
	</tr>
	<%
		}
	%>
	</table>
	</form>

</body>
</html>