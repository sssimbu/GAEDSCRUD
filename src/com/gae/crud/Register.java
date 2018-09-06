package com.gae.crud;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;

public class Register extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		/*
		 * response.setContentType("text/html"); PrintWriter out =
		 * response.getWriter();
		 */
		boolean checkreg;

		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println("id:" + id + "name:" + name + "email:" + email + "password:" + password);

		checkreg = Test.CreateorUpdate(id, name, email, password);
		System.out.println("The value of checkreg is:" + checkreg);

		if (checkreg) {

			System.out.println("success");

			RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");

			rd.forward(request, response);// method may be include or forward

		} else {
			System.out.println("failed");

			RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");

			rd.forward(request, response);// method may be include or forward
		}

		/*
		 * DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		 * 
		 * Entity person = new Entity("person", id); person.setProperty("name",
		 * name); person.setProperty("email", email);
		 * person.setProperty("password", password); ds.put(person);
		 */

		// retrieving data
		/*
		 * Key key = KeyFactory.createKey("person", id);
		 * System.out.println("the value of key:" + key);
		 * 
		 * Query q = new Query("person"); PreparedQuery pq = ds.prepare(q); for
		 * (Entity ul : pq.asIterable()) { String retrname =
		 * ul.getProperty("name").toString(); String retremail =
		 * ul.getProperty("email").toString(); String retrpassword =
		 * ul.getProperty("password").toString();
		 * 
		 * System.out.println("name:" + retrname + "password:" + retrpassword +
		 * "Email:" + retremail);
		 * 
		 * }
		 */
		/*
		 * response.setContentType("text/plain");
		 * response.getWriter().println("Hello, world");
		 */

	}

}
