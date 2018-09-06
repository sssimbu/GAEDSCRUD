<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>login</title>
</head>

<script>
	history.pushState(null, null, document.URL);
	window.addEventListener('popstate', function() {
		window.alert("Please login");
		history.pushState(null, null, document.URL);
		location.reload();
	});
</script>
<style>
.tablecon {
	margin-top: 4cm;
	color: red;
	margin-top: 4cm;
}
</style>
<body style="background-color: black;">

	<form action="login" method=post>
		<table class="tablecon" width="200" border="1" align="center">

			<tr>
				<td>UserName<span style="color: #8B008B">*</span>:
				</td>
				<td><input type=text name=name placeholder="Enter name"></td>
			</tr>
			<td>Password<span style="color: #8B008B">*</span>:
			</td>
			<td><input type=password name=password></td>
			</tr>
			<tr>
				<td><input type=submit value=submit></td>
				<td><a href=/register.jsp>Not Yet Register? SignUp</a></td>
			</tr>
		</table>
	</form>






</body>
</html>