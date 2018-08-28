<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Technology Management</title>
	<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
	<script type="text/javascript">
		function Redirect() 
		{
			window.navigate("AdminConsole.jsp");	
		}
	</script>
</head>
<body>
<div id="wrapper">
	<div id="header">
		<div id="menu">
			<ul>
				<li class="current_page_item"><a href="#">Home</a></li>
				<li><a href="#">AboutUs</a></li>
				<li><a href="#">News</a></li>
				<li><a href="#">ContactUs</a></li>
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
		<h1><a href="#">Competency Evaluation System </a></h1>
		
	</div>
	<hr />
	<!-- end #logo -->
<!-- end #header-wrapper -->
</div>
<div id="page">
	<div id="content">
		<div class="post">
			<h2 class="title">Welcome to Our Web Site</h2>
			<p class="date">07.24.13</p>
			<div class="entry">
				<h2><font color="aqua">Technology Management</font></h2>
				<table align="left" border="2">
			<tr>
				<td>Technology:</td>
				<td><input type="text" name="technology"></td>
			</tr>
			<tr>
			<td>&nbsp;&nbsp;&nbsp;
				<input type="submit" value="Add"></td>
			<td>&nbsp;&nbsp;&nbsp;
				<input type="button" value="Cancel" onclick="Redirect()">
			</td>
			</tr>
</table>
			</div>
		</div>
	</div>
	
	<h3><a href="#" style="background-color: aqua;">Add Cost Center</a></h3>	      <br/>
	<h3><a href="#" style="background-color: aqua;" >Expert Management</a></h3>	      <br/>
	<h3><a href="#" style="background-color: aqua;">Technology Management</a></h3>    <br/>
	<h3><a href="#" style="background-color: aqua;">Add Test</a></h3>	              <br/>
	<h3><a href="#" style="background-color: aqua;">Edit Enrollment</a></h3>	      <br/>
	<h3><a href="#" style="background-color: aqua;">Test Enrollment</a></h3>	      <br/>
	<h3><a href="#" style="background-color: aqua;">Report</a></h3>	              <br/>
	
</div>
</body>
</html>