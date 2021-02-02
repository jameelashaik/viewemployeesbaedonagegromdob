<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'attendence.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<style>
#day1{
width:100%;
}
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
	
	</style>
  </head>
  
  <body >

 	<form  action="dayspresent" method="post" class="container col-xs-12 col-sm-8 col-md-6 col-lg-4">
 	<table class="table table-control  table-bordered table-condensed table-hover">
 	<thead>
 		<tr id="head1"><th><h1>Employee attendence form</h1></th></tr>
 	</thead>
 	 <tbody>
		<tr><td>Emp_ID_Name : <select name="empId" id="empId">
		     <c:forEach items="${employeeList}" var="emp">
		     <p>emp=${emp}</p>
		        <option value="${emp.id}">${emp.name}</option>
		    </c:forEach>
		</select><br></br></td></tr>
		<tr><td>No of Days present: <input id="day1" type='number' name='dayspresent' placeholder="enter no of days" min="0" max="30"   /></td></tr>
	</tbody>
	<tfoot>
		<tr><td><input type='submit' class="btn btn-success" value='submit' /></td></tr>
	</tfoot>
	</table>
	</form>
  </body>
</html>
