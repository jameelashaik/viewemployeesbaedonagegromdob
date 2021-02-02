<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <!-- <link rel="stylesheet" href="form.css"> --> 
    <base href="<%=basePath%>">
    
    <title>My JSP 'addemp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>

	select {
  border: 0 none;
  color: #FFFFFF;
  
  font-size: 20px;
  font-weight: bold;
  padding: 2px 10px;
  width: 430px;
  *width: 350px;
background-color:#f1f1f1;
color:grey;
}
#head1{
background-color:black;
color:white;
}
	input[type=date], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}

input[type=date]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}
	
	</style>
  </head>
  <script>

  </script>
  <body>
	<form action="addEmployee" method="post" class="container col-xs-12 col-sm-8 col-md-6 col-lg-4">
	<table  class="table table-control  table-bordered table-condensed table-hover">
		<thead>
			<tr id="head1" colspan="3"><td><h1><b>Employee Form</b></h1></td></tr>
		</thead>
		<tbody>
			<tr><td>Name:<input type="text" name="user" pattern="[A-Za-z\s]{4,20}" placeholder="enter name"
				title="name must be between 4 and 20 charecters length and contains only letters"
				required></td></tr>
			<tr><td>dob:<input type="date"
				name="dob" max="2000-12-31" min="1970-01-01"
				title="DOB should not be greater than 50 years of age with current date"
				required></td></tr>
			 <tr><td>Qualification:<select
				name="qualification" required>
				<option value="" name="qualification">Select</option>
				<option value="B.Tech" name="qualification">btech</option>
				<option value="B.com" name="qualification">bcom</option>
				<option value="bsc" name="qualification">bsc</option>
				<option value="other" name="qualification">other</option>
				</select><br> <br></td></tr>
		
	 		 <tr><td>Gender:  <input type="radio" id="male" name="gender"  
				value="male"  required>
				 <label for="male">Male</label>
			<input type="radio" id="female" name="gender" value="female"  required>
			<label for="female">Female</label>
			<input type="radio" id="other" name="gender" value="other"  required> <label  for="other">Other</label><br><br>
				</td></tr>
				
			
			<tr><td> Date of joining: <input
				type="date" min="1970-01-01" name="joiningdate"
				title="DOJ should not be less than 50 years of age with current date"
				required> </td></tr>
			<tr><td>Pancard :<input type="text" name="pancard" placeholder="enter pancard"
				pattern="[A-Z]{5}[0-9]{4}[A-Z]{1}" title="incorrect pan card number" required>
						</td></tr>
		  	<tr><td>Salary :<input type="text" name="salary" placeholder="enter salary"
				pattern="^\d*(\.\d{0,2})?$" step="0.01" title="salary must be numeric" required></td></tr>
		</tbody>
		<tfoot>
		<tr><td><small id="emailHelp" class=" text-muted">We'll never share your details with anyone else.</small></td></tr>
			<tr><td><input class="btn btn-success" type="submit" value="submit"></td></tr>
		</tfoot>
		
</table>
	</form>

  </body>
</html>
