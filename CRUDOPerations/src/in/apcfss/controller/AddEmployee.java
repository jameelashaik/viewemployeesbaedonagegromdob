package in.apcfss.controller;

import in.apcfss.service.CRUDOPerations;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddEmployee extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String status=null;
		PrintWriter pw = null; 
		try{
			RequestDispatcher rd = req.getRequestDispatcher("/addempresult.jsp");
			rd.forward(req, res);
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("exception cathedc for add employee");
		}

	}
	
}
