package com.gae.crud;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		boolean checklog;

		String name = request.getParameter("name");
		String password = request.getParameter("password");
		System.out.println("name:" + name + "password:" + password);

		checklog = Test.LoginTest(name, password);
		System.out.println("The value of checklog is:" + checklog);

		if (checklog) {

			HttpSession session = request.getSession();
			session.setAttribute("name", name);
			System.out.println("success");
			RequestDispatcher rd = request.getRequestDispatcher("/Home.jsp");
			rd.forward(request, response);// method may be include or forward

		} else {
			System.out.println("failed");

			out.println("<script type=\"text/javascript\">");
			out.println("alert('Username or password incorrect');");
			out.println("location='login.jsp';");
			out.println("</script>");

			/*
			 * RequestDispatcher rd =
			 * request.getRequestDispatcher("/login.jsp");
			 * 
			 * rd.forward(request, response);// method may be include or forward
			 */ }

	}
}
