package com.gae.crud;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Delete extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String id = request.getParameter("id");
		// deleting the user
		Test.DeleteTest(id);
		System.out.println("the user deleted");
		/*
		 * response.setContentType("text/html"); PrintWriter out =
		 * response.getWriter(); out.println("the user deleted");
		 */
		response.sendRedirect("/Showpersons.jsp");

	}
}
