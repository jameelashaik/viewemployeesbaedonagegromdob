package in.apcfss.controller;

import in.apcfss.service.CRUDOPerations;

import in.apcfss.dto.Employee;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class agelistemp extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("null")
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html"); 
		PrintWriter pw =null;  
		try{
			pw=resp.getWriter();  
			System.out.println("checking servlet age emp list");
			String a1=req.getParameter("age1");
			
			List<Employee> ageemployeesList = CRUDOPerations.empagelist(req, resp); 
			req.setAttribute("ageemployeesList", ageemployeesList);
			RequestDispatcher rd = req.getRequestDispatcher("/viewageempresult.jsp");
			rd.forward(req, resp);

			System.out.println("checking servlet age emp list1...");
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("exception cathedc for agelist employee");
		}
	}
}
