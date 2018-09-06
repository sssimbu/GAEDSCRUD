package com.gae.crud;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;

public class Showpersons extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();

		/*
		 * System.out.println("Showpersons servlet"); String
		 * id=request.getParameter("id");
		 * System.out.println("the person id:"+id); Iterable<Entity>
		 * e=Test.ListPerson("person",id); request.setAttribute("entity", e);
		 * for(Entity e1:e) { System.out.println(e1.getProperty("id")); }
		 * RequestDispatcher rd =
		 * request.getRequestDispatcher("/Showpersons.jsp");
		 * 
		 * rd.forward(request, response);
		 */

		Query query = new Query("person");
		PreparedQuery pq = ds.prepare(query);

		for (Entity entity : pq.asIterable())

		{
			response.getWriter().println(entity.getProperty("name"));
			response.getWriter().println(entity.getProperty("password"));
		}

	}
}
