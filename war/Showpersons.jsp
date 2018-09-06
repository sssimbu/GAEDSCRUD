<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreService"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory"%>
<%@ page import="com.google.appengine.api.datastore.Entity"%>
<%@ page import="com.google.appengine.api.datastore.PreparedQuery"%>
<%@ page import="com.google.appengine.api.datastore.Query"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show persons</title>


<script>
function editRecord(id){
    var f=document.form;
    f.method="post";
    f.action='edit.jsp?id='+id;
    f.submit();
}
function deleteRecord(id)
{  console.log(id);
    var f=document.form;
    f.method="post";
    f.action='/Delete?id='+id;	
    f.submit();
}
</script>

</head>



<body>

	<a align=right href="Logout">Logout</a>


	<form method="post" name="form" action="">
		<table width="100%" cellpadding="0" cellspacing="0" border="1">
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Password</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>


			<%
				DatastoreService ds = DatastoreServiceFactory.getDatastoreService();

				Query query = new Query("person");
				PreparedQuery pq = ds.prepare(query);

				for (Entity entity : pq.asIterable())

				{
			%>

			<tr>
				<td><%=entity.getProperty("id")%></td>
				<td><%=entity.getProperty("name")%></td>
				<td><%=entity.getProperty("email")%></td>
				<td><%=entity.getProperty("password")%></td>
				<td><input type="button" name="edit" value="Edit"
					style="background-color: #49743D; font-weight: bold; color: #ffffff;"
					onclick="editRecord(<%=entity.getProperty("id")%>);"></td>
				<td><input type="button" name="delete" value="Delete"
					style="background-color: #ff0000; font-weight: bold; color: #ffffff;"
					onclick="deleteRecord(<%=entity.getProperty("id")%>);"></td>

			</tr>




			<%
				}
			%>
		</table>
	</form>
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
 $(function(){
	 
 });
 function getname(name){
	var data= $(name).closest('tr').find('td');
	 console.log($(data[0]).text());
 }
</script> -->
</body>
</html>