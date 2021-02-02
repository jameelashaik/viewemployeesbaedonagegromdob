package in.apcfss.service;

import in.apcfss.dbplugin.DbPlugin;
import in.apcfss.dto.Employee;
import in.apcfss.dto.Employeslip;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CRUDOPerations {
	public static String dayspresent(HttpServletRequest req, HttpServletResponse res) throws Exception
	{
		String status=null;
		int daysnumber=0;
		Connection conn = null;
		PreparedStatement ps = null;
		int did=0;
		int dayspresentresult=0;
		try{
			conn = DbPlugin.getConnection();
			conn.setAutoCommit(false);
			daysnumber=Integer.parseInt(req.getParameter("dayspresent"));
			did=Integer.parseInt(req.getParameter("empId"));
			ps=conn.prepareStatement("INSERT INTO public.employesalary(eid, dayspresent) VALUES( ?, ?)");
			ps.setInt(1, did);
			ps.setInt(2,daysnumber);
			dayspresentresult=ps.executeUpdate(); 
			if(dayspresentresult>0){
				conn.commit();
				status="success...";
			}else{
				conn.rollback();
				status="failure...";
			}
			
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("dayspresent method error");
		}		
		finally
		{
			ps.close();
			conn.close();
		}
		return status;
	}

	public static String AddEmployee(HttpServletRequest req, HttpServletResponse res) throws Exception
	{	Employee employee = null;

		String ename=null;
		String dob1=null;
		String qualify=null;
		String gender =null;
		String joiningdate =null;
		String pancard =null;
		float salary=0;
		

	ename = req.getParameter("user");
	dob1 = req.getParameter("dob");
	Date dob=Date.valueOf(dob1);
	qualify = req.getParameter("qualification");
	gender = req.getParameter("gender");
	joiningdate = req.getParameter("joiningdate");
	pancard = req.getParameter("pancard");
	salary = Integer.parseInt(req.getParameter("salary"));
	System.out.println("add emp salary:"+salary);
		String status = null;
		Connection conn = null;
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		int empdetailsUpdateResult=0;
		ResultSet rs=null;
		Statement stmt = null;
		String sql=null;
		int eid =0;
		int employesalaryupdate = 0;
		try
		{
			employee = new Employee();
			conn = DbPlugin.getConnection();
			conn.setAutoCommit(false);
			stmt = conn.createStatement( );
			sql="select nextval('emp_seqence') as emp_id";

			rs=stmt.executeQuery(sql);
			while(rs.next())
			{
				eid = rs.getInt("emp_id");
			}	

			ps=conn.prepareStatement("INSERT INTO public.employeedetailsform(id, name, qualification, gender, dateofjoining, pancard, dob,salary) VALUES(?, ?, ?, ?, ?, ?, ?,?)");
			
			ps.setInt(1, eid);
			ps.setString(2,ename);
			ps.setString(3, qualify);
			ps.setString(4, gender);
			ps.setString(5, joiningdate);
			ps.setString(6, pancard); 
			ps.setDate(7, dob);
			ps.setFloat(8, salary);
			
			empdetailsUpdateResult=ps.executeUpdate();  
			System.out.println(empdetailsUpdateResult);
			if(empdetailsUpdateResult>0){

			
					conn.commit();
					status="success...";
			}
				else{
					conn.rollback();
					status="failure...";
				} 

		}
		catch(Exception e)
		{
			e.printStackTrace();
			throw new Exception();
		}
		finally
		{
			ps.close();
			conn.close();
		}
		return status;
	}
	
    public static Employee getEmployeeById(int id){  
    	Employee employee=new Employee();  
         String sql=null;
        try{  
            Connection con=DbPlugin.getConnection();  
            sql = "SELECT * FROM public.employeedetailsform where id=?";
            PreparedStatement ps=con.prepareStatement(sql);  
            ps.setInt(1,id);  
            ResultSet rs=ps.executeQuery();  
            if(rs.next()){  
            	employee.setId(rs.getInt(1));
				employee.setName(rs.getString(2));
				employee.setQualification(rs.getString(3));
				employee.setGender(rs.getString(4));
				employee.setDoj(rs.getString(5));
				employee.setPancard(rs.getString(6));
				employee.setDob(rs.getDate(7));
				employee.setSalary(rs.getFloat(8));
				

            }  
            con.close();  
        }catch(Exception ex){
        	ex.printStackTrace();
        	System.out.println("exception cated for getting id employyee");
        }  
          
        return employee;  
    }  

	
	public static String updateEmployee(HttpServletRequest req, HttpServletResponse res) throws Exception
	{
		String status = null;
		int updateResult=0;
		Connection conn = null;
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		String sql=null;
		String uname=null;
		String dob1=null;
		String qualify=null;
		String gender =null;
		String joiningdate =null;
		String pancard =null;
		String salary =null;
		
		int dayspresent =0;

		uname = req.getParameter("user");
		dob1 = req.getParameter("dob");
		Date dob =Date.valueOf(dob1);
		qualify = req.getParameter("qualification");
		gender = req.getParameter("gender");
		joiningdate = req.getParameter("joiningdate");
		pancard = req.getParameter("pancard");
		salary = req.getParameter("salary");
		dayspresent = Integer.parseInt(req.getParameter("dayspresent"));

		try
		{

			int id=Integer.parseInt(req.getParameter("id"));
			conn = DbPlugin.getConnection();
			conn.setAutoCommit(false);
			sql = "UPDATE public.employeedetailsform SET  name=?, qualification=?, gender=?, dateofjoining=?, pancard=?, dob=? ,salary=? WHERE id=?";
			ps = conn.prepareStatement(sql);

			ps.setString(1,uname);
			ps.setString(2, qualify);
			ps.setString(3, gender);
			ps.setString(4, joiningdate);
			ps.setString(5, pancard); 
			ps.setDate(6, dob);
			ps.setString(7, salary);
			ps.setInt(8,id);
			updateResult=ps.executeUpdate();  
			
			System.out.println(updateResult);
			if(updateResult>0){
				ps = conn.prepareStatement("UPDATE public.employesalary SET  edayspresent=?  WHERE eid=?");

				ps.setInt(1,dayspresent);
				ps.setInt(2,id);
				conn.commit();
				status="update";
				
			}
			else{
				conn.rollback();
				status="updatefail";
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("update method error..");
			throw new Exception();
		}
		finally
		{
			ps.close();
			conn.close();
		}
		return status;
	}
	
	public static String deleteEmployee(HttpServletRequest req, HttpServletResponse res) throws Exception
	{
		String status = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		String sql= null;
		int del_id=0;
		int deleteresult = 0;
		int deleteresult1 = 0;
		
		try
		{
			conn = DbPlugin.getConnection();
			conn.setAutoCommit(false);
			sql = "DELETE FROM public.employesalary form WHERE eid=?";
			del_id = Integer.parseInt(req.getParameter("id"));
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, del_id);
			
			
			deleteresult=pstmt.executeUpdate();
			if(deleteresult>0){
				pstmt1=conn.prepareStatement("DELETE FROM public.employeedetailsform WHERE id=?");
				pstmt1.setInt(1, del_id);
				deleteresult1=pstmt1.executeUpdate();
				if(deleteresult1>0){
					conn.commit();
					status="success";					
				}else{
					conn.rollback();
					status="failure..";
				}

			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			throw new Exception();
		}
		finally
		{
			pstmt.close();
			conn.close();
		}
		return status;
	}
	
	public static List<Employee> viewEmployee(HttpServletRequest req, HttpServletResponse res) throws Exception
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		List<Employee> employeeList = new ArrayList<Employee>();
		String sql = null;
		ResultSet rs = null;
		Employee employee = null;

		try
		{

			conn = DbPlugin.getConnection();
			sql="SELECT * FROM public.employeedetailsform";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();		
			while(rs.next())
			{
				employee = new Employee();
				employee.setId(rs.getInt("id"));
				employee.setName(rs.getString("name"));
				employee.setQualification(rs.getString("Qualification"));
				employee.setGender(rs.getString("gender"));
				employee.setDoj(rs.getString("dateofjoining"));
				employee.setPancard(rs.getString("pancard"));
				employee.setDob(rs.getDate("dob"));
				employee.setSalary(rs.getFloat("salary"));
				employeeList.add(employee);
			}

		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("view employee error..");
			throw new Exception();
		}
		finally
		{
			pstmt.close();
			conn.close();
		}
		return employeeList;
	}
	@SuppressWarnings("null")
	public static List<Employee> empagelist(HttpServletRequest req, HttpServletResponse res) throws Exception
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		List<Employee> ageemployeesList = new ArrayList<Employee>();
		String sql = null;
		ResultSet rs = null;
		Employee employee = new Employee();
		try
		{

			conn = DbPlugin.getConnection();
			String[] age= (req.getParameter("dob")+"").split("-");
			System.out.println("---age---------"+req.getParameter("dob"));
			sql="SELECT  * FROM public.employeedetailsform where ((EXTRACT(YEAR from AGE(dob))) between '"+age[0]+"' and '"+age[1]+"' )";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();		
			while(rs.next())
			{
				
				employee.setId(rs.getInt("id"));
				employee.setDob(rs.getDate("dob"));
				employee.setName(rs.getString("name"));
				employee.setQualification(rs.getString("Qualification"));
				employee.setGender(rs.getString("gender"));
				employee.setDoj(rs.getString("dateofjoining"));
				employee.setPancard(rs.getString("pancard"));
				employee.setSalary(rs.getFloat("salary"));
				ageemployeesList.add(employee);
			}
			System.out.println("checking age emp list..");
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("age of view employee error..");
			throw new Exception();
		}
		return ageemployeesList;
		
	}
	
	public static List<Employee> slipEmployee(HttpServletRequest req, HttpServletResponse res) throws Exception
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		List<Employee> employeeList = new ArrayList<Employee>();
		String sql = null;
		String sql1 = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		Employee employee = null;

		try
		{

			conn = DbPlugin.getConnection();
			int sid = Integer.parseInt(req.getParameter("id"));
			System.out.println("id check in slipemployee:"+sid);
			sql="select t.id,t.name,t.pancard,t.salary,ti.dayspresent from employeedetailsform as t,employesalary as ti where (t.id=ti.eid) and t.id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,sid);
			
			rs = pstmt.executeQuery();	
			System.out.println("rs checking in slipemployee:"+rs);

			while(rs.next())
			{
				employee = new Employee();
				employee.setId(sid);
				employee.setName(rs.getString("name"));
				employee.setPancard(rs.getString("pancard"));
				employee.setSalary(rs.getFloat("salary"));
				employee.setDayspresent(rs.getInt("dayspresent"));
				
				employeeList.add(employee);
			}
			System.out.println("slip employee employees list:"+employeeList);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("slip employee error..");
			throw new Exception();
		}
		finally
		{
			pstmt.close();
			conn.close();
		}
		return employeeList;
	}
	public static List<Employee> attendenceslipEmployee(HttpServletRequest req, HttpServletResponse res) throws Exception
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		List<Employee> employeeList = new ArrayList<Employee>();
		String sql = null;
		String sql1 = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		Employee employee = null;
  
		try
		{

			conn = DbPlugin.getConnection();
			sql="select t.id,t.name,t.pancard,t.salary,ti.dayspresent from employeedetailsform as t,employesalary as ti where (t.id=ti.eid)";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();		
			while(rs.next())
			{
				employee = new Employee();
				employee.setId(rs.getInt("EmpId"));
				employee.setName(rs.getString("name"));
				employee.setPancard(rs.getString("pancard"));
				employee.setSalary(rs.getFloat("salary"));
				employee.setDayspresent(rs.getInt("dayspresent"));
				employeeList.add(employee);
			}

		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("attendence slip employee error..");
			throw new Exception();
		}
		finally
		{
			pstmt.close();
			conn.close();
		}
		return employeeList;
	}
	public static List<Employeslip> getEmployeesAttendence(HttpServletRequest request, HttpServletResponse response) throws Exception
    {
    Connection con = null;
    List<Employeslip> employeesList = new ArrayList<Employeslip>();
    String sql = null;
    //String status=null;
    ResultSet rs = null;
    PreparedStatement pstmt = null;
    Employeslip emp = null;
    int id=0;
    try
    {
			con = DbPlugin.getConnection();
			sql = "SELECT id, name FROM public.employeedetailsform";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				id = (Integer) rs.getInt("id");
				String name = (String) rs.getString("name");
				emp = new Employeslip();
				emp.setId(id);
				emp.setName(name);
				employeesList.add(emp);
			}
			System.out.println("getemployeatendence runned successfully..");
		} catch (Exception e) {
			System.out.println("getemployeatendence runned fasiled..");
			e.printStackTrace();
		} finally {
			con.close();
			rs.close();
		}
		return employeesList;
   
    }

}
