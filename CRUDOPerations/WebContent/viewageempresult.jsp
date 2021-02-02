<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'viewageempresult.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
    <%@ page import="in.apcfss.dto.Employee" %>
    <%@ page import="in.apcfss.service.CRUDOPerations" %>

    <%List<Employee> ageemployeesList = CRUDOPerations.empagelist(request, response); %>
    

    <table class="table table-bordered table-striped table-control table-hover table-condensed ">
<thead class="head1">
<tr ><th colspan="12">Employees List</th></tr>

</thead>
 <tbody>
  <tr><th>Id</th><th>Name</th><th>qualification</th><th>gender</th><th>doj</th>
  <th>Pancard</th><th>dob</th><th>salary</th></tr>
	   	<%
			for(Employee e:ageemployeesList)
			{
				out.println("<tr><td>"+e.getId()+"</td><td>"+e.getName()+"</td><td>"+e.getQualification()+"</td> " +
		 		"<td>"+e.getGender()+"</td><td>"+e.getDoj()+"</td><td>"+e.getPancard()+"</td><td>"+e.getDob()+"</td><td>"+e.getSalary()+"</td></tr>");  
}
	       
	        out.print("</table>");  
	 %>
		</tbody>
	</table>
  </body>
</html>
