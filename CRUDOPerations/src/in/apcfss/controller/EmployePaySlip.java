package in.apcfss.controller;

import in.apcfss.dto.Employee;
import in.apcfss.dto.Employeslip;
import in.apcfss.service.CRUDOPerations;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EmployePaySlip extends HttpServlet{

	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
	{
		PrintWriter out = null;
		res.setContentType("text/html");  
   
		try
		{	

				RequestDispatcher rd = req.getRequestDispatcher("/payslipemp.jsp");
				rd.forward(req, res);				

   
	        
		}
		catch(Exception e)
		{
			out.print("<h5>Problem in processing your request. Please try again.</h5>");  
			e.printStackTrace();
		}

	}

}
