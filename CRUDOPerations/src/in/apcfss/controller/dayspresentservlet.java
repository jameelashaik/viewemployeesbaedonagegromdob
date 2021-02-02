package in.apcfss.controller;

import in.apcfss.service.CRUDOPerations;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class dayspresentservlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		PrintWriter pw = null; 
	

				RequestDispatcher rd = req.getRequestDispatcher("/attendenceresult.jsp");
				rd.forward(req, res);

			

	}
}
