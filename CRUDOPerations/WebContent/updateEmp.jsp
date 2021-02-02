<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 <!-- <link rel="stylesheet" href="form.css"> -->  
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateEmp.jsp' starting page</title>
    
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
  <body>
  <%@ page import="in.apcfss.service.CRUDOPerations" %>
  <%@ page import="in.apcfss.dto.Employee" %>
 <%
 String sid=request.getParameter("id"); 
int id=Integer.parseInt(sid);
Employee e=CRUDOPerations.getEmployeeById(id); 
 System.out.println("checking getname:"+e.getName());
 System.out.println("using java code in jsp"); 
%>
	<form action="updateemp" method="post" class="container col-xs-12 col-sm-8 col-md-6 col-lg-4">
	<table  class="table table-control  table-bordered table-condensed table-hover">
	<thead><tr id="head1"><td colspan="12"><h1>Edit employee details</h1><br></br></td></tr></thead>
	<tbody>
	<tr><td><input type='hidden' name='id' value='<%= e.getId()%>'></td></tr>
		<tr><td>Name:<input type="text" name="user" value='<%=e.getName() %>'
		pattern="[A-Za-z\s]{4,20}"
			title="name must be between 4 and 20 charecters length and contains only letters "
			required></td></tr>
 		<tr><td>dob:<input type="date"  value='<%= e.getDob() %>'
			name="dob" max="2000-12-31" min="1970-01-01"
			title="DOB should not be greater than 50 years of age with current date"
			required></td></tr> 
		<tr><td>Qualification:<select name="qualification"  id="qualification">
    <option  <%= (e.getQualification().equals("B.Tech")?"selected='selected'":"") %>>btech</option>
    <option  <%= (e.getQualification().equals("B.com")?"selected='selected'":"") %>>bcom</option>
     <option  <%= (e.getQualification().equals("bsc")?"selected='selected'":"") %>>bsc</option>
      <option  <%= (e.getQualification().equals("other")?"selected='selected'":"") %>>other</option>
      </select><br></br></td></tr>
			<tr><td>Gender:<%if(e.getGender().equalsIgnoreCase("male")) { %>
    <input type="radio" name="gender" value="male" checked/>Male 
    <input type="radio" name="gender" value="female"/>Female 
    <input type="radio" name="gender" value="other" />other
<% } else if(e.getGender().equalsIgnoreCase("female")) {%>
    <input type="radio" name="gender" value="male" />Male 
    <input type="radio" name="gender" value="female" checked/>Female 
    <input type="radio" name="gender" value="other" />other
 <% } else if(e.getGender().equalsIgnoreCase("other")) {%>   
     <input type="radio" name="gender" value="male" />Male 
    <input type="radio" name="gender" value="female" />Female 
    <input type="radio" name="gender" value="other" checked/>other
<% } %><br></td></tr>
		 <tr><td>Date of joining: <input
			type="date" min="1970-01-01" name="joiningdate"  value='<%=e.getDoj() %>'
			title="DOJ should not be less than 50 years of age with current date"
			required></td></tr>
		<tr><td>Pancard :<input type="text" name="pancard"  value='<%=e.getPancard() %>'
			pattern="[A-Z]{5}[0-9]{4}[A-Z]{1}" title="incorrect pan card number" required>	</td></tr>
					
	  	<tr><td>Salary :<input type="text" name="salary"  value='<%=e.getSalary() %>'
			pattern="^\d*(\.\d{0,2})?$" step="0.01" title="salary must be numeric" required></td></tr>
			<input type='hidden' name='dayspresent'  value='<%=e.getDayspresent() %>'></td></tr>
		</tbody>
		<tfoot>
		<tr><td><small id="emailHelp" class=" text-muted">We'll never share your details with anyone else.</small></td></tr>
			<tr><td><input type="submit" class="btn btn-success" value="submit"></td></tr>
		</tfoot>
		</table>
	</form>
  </body>
</html>
