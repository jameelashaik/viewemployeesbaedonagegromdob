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
    
    <title>My JSP 'viewemp.jsp' starting page</title>
    
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
.head1{
	align:center;
	background-color:black;
	color:white;
</style>	
  </head>
  
  <body>
  <%@ page import="in.apcfss.service.CRUDOPerations" %>
  <%@ page import="in.apcfss.dto.Employee" %>
  <%@ page import="java.io.PrintWriter" %>
  <%
  int k=0;
  response.setContentType("text/html"); 

  %>
  

  <%List<Employee> employeesList = CRUDOPerations.viewEmployee(request, response);   %>
<div class="container col-xs-12 col-sm-12 col-md-11 col-lg-11">
<table class="table table-bordered table-striped table-control table-hover table-condensed ">
<thead class="head1">
<tr ><th colspan="12">Employees List</th></tr>

</thead>
 <tbody>
  <tr><th>Id</th><th>Name</th><th>qualification</th><th>gender</th><th>doj</th>
  <th>Pancard</th><th>dob</th><th>salary</th><th>attendenceform</th>
	   <th>Edit</th><th>Delete</th><th>payslip</th></tr>
	 <!--  
    <c:forEach items="${employeesList}" var="emp">
	 <tr><td>${emp.id}</td><td>${emp.name}<td>${emp.qualification}</td><td>${emp.gender}</td><td>${emp.doj}</td>
	  <td>${emp.pancard}</td><td>${emp.dob}</td><td>${emp.salary}</td>
	  <td><a href='addattendenceemp?id=${emp.id}'>attendenceform</a></td>
	  <td><a href='updateemp?id=${emp.id}'>edit</a></td>
	  <td><a href='deleteEmployee?id=${emp.id}'>delete</a></td>
	  <td><a href='employepayslip?id=${emp.id}'>payslip</a></td>
	  </tr>
	  </c:forEach>

	-->
	<%
			for(Employee e:employeesList)
			{
				 out.print("<tr><td>"+e.getId()+"</td><td>"+e.getName()+"</td><td>"+e.getQualification()+"</td> " +
				 		"<td>"+e.getGender()+"</td><td>"+e.getDoj()+"</td><td>"+e.getPancard()+"</td><td>"+e.getDob()+"</td><td>"+e.getSalary()+"</td><td><a href='addattendenceemp?id="+e.getId()+"'>attendence form</a></td></td><td><a href='updateemp?id="+e.getId()+"'>edit</a></td>" +
				 				"<td><a href='deleteEmployee?id="+e.getId()+"'>delete</a></td><td><a href='employepayslip?id="+e.getId()+"'>payslip</a></td></tr>");  
			}
	       
	        out.print("</table>");  
	 %>
		</tbody>
	</table>
	</div>
  </body>
</html>
