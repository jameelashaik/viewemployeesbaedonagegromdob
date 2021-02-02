package in.apcfss.controller;

import in.apcfss.service.CRUDOPerations;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteEmployee extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String status=null;
		PrintWriter out = null;
		res.setContentType("text/html");  
		try{
			RequestDispatcher rd = req.getRequestDispatcher("/delete.jsp");
			rd.forward(req, res);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
