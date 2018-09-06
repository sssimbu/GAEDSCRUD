<%@page import="com.google.appengine.api.datastore.Query.FilterOperator"%>
<%@page import="com.google.appengine.repackaged.org.codehaus.jackson.map.ser.FilterProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreService"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory"%>
<%@ page import="com.google.appengine.api.datastore.Entity"%>
<%@ page import="com.google.appengine.api.datastore.PreparedQuery"%>
<%@ page import="com.google.appengine.api.datastore.Query"%>
<%@ page import="com.google.appengine.api.datastore.Key"%>
<%@ page import="com.google.appengine.api.datastore.KeyFactory"%>
<%@ page import="com.google.appengine.api.datastore.EntityNotFoundException"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
	<form method="post" action="Update">

		<table width="100%" cellpadding="0" cellspacing="0" border="1">
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Password</th>
				<th>Submit</th>
			</tr>


			<%
				DatastoreService ds = DatastoreServiceFactory.getDatastoreService();

				String id = request.getParameter("id");
				/* Entity person = new Entity("person",id); 
				 */

				/*  Key editkey = KeyFactory.createKey("person",id);
				ds.get(editkey);
				System.out.println("the key value is:"+editkey);  */
				/* 
				Key keyedit = KeyFactory.createKey("person", id);
				
				try {
					Entity e5=ds.get(keyedit);
					System.out.println("The entity value e5:"+e5);
					
				} catch (EntityNotFoundException e5) {
					// TODO Auto-generated catch block
					e5.printStackTrace();
				} */

				/* @SuppressWarnings("deprecation")
				@RequestMapping(value = "/update", method = RequestMethod.GET)
				public String updatePage(HttpServletRequest request, ModelMap model) {
				
				DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
				Query query = new Query("Student");
				query.addFilter("regno", FilterOperator.EQUAL, request.getParameter("regno"));
				PreparedQuery pq = datastore.prepare(query);
				
				Entity e = pq.asSingleEntity();
				model.addAttribute("student", e);
				
				return "update";
				
				} */
				@SuppressWarnings("deprecation")
				Query query = new Query("person");
				query.addFilter("id", FilterOperator.EQUAL, request.getParameter("id"));

				PreparedQuery pq = ds.prepare(query);
				/* Entity result = pq.asSingleEntity();
				
				System.out.println("The result is"+result); */
				for (Entity e : pq.asIterable()) {
			%>

			<tr>
				<td><input type=text value="<%=e.getProperty("id")%>" name=id
					readonly=""></td>
				<td><input type=text value="<%=e.getProperty("name")%>"
					name=name></td>
				<td><input type=text value="<%=e.getProperty("email")%>"
					name=email></td>
				<td><input type=text value="<%=e.getProperty("password")%>"
					name=password></td>
				<td><input type=submit value="Update"></td>
			</tr>

			<%
				}
			%>
		</table>
	</form>

	<%--  Query query = new Query("person");
PreparedQuery pq = ds.prepare(query); 

for (Entity entity :e5.asIterable())

{ %>

<tr>
<td>
<%=entity.getProperty("id")%></td>
<td>
<%=entity.getProperty("name")%></td>
<td>
<%=entity.getProperty("email")%></td>
<td>
<%=entity.getProperty("password")%></td>
<%
}
 %>  
</table> 
</form>
--%>
</body>
</html>