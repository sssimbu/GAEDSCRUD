<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>register page</title>
</head>
<style>
.tablecon {
	margin-top: 4cm;
	color: red;
	margin-top: 4cm;
}
</style>
<body style="background-color: black;">
	<script type="text/javascript">  
 function validate()  
 {  
      var d=document.register;  
      var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;  
     
      if(d.id.value == '')  
      {  
           alert("Enter ID");  
           document.getElementById('id').style.borderColor = "red";

           d.id.focus();  
           return false;  
      }  
      else
          document.getElementById('id').style.borderColor = "green";

    	  
      if(d.id.value.length<=2)  
      {  
      alert("Minimum id Should be greater than two"); 
      document.getElementById('id').style.borderColor = "red";

      return false;       
      }
      
      else
          document.getElementById('id').style.borderColor = "green";
      
      if(d.name.value == '')  
      {  
           alert("Enter Name");  
           document.getElementById('name').style.borderColor = "red";

           d.name.focus();  
           return false;  
      }  
      else
          document.getElementById('name').style.borderColor = "green";
      
      if(d.name.value.length<=3)  
      {  
      alert("Minimum Name Should be greater than three");  
      document.getElementById('name').style.borderColor = "red";

      return false;       
      }  
      else
          document.getElementById('name').style.borderColor = "green";
      
      
      
      if(d.email.value == '')  
      { 
      alert("Email is is Required");  
      document.getElementById('email').style.borderColor = "red";

      d.email.focus();  
      return false;       
      }  
      
      else
          document.getElementById('email').style.borderColor = "green";
      
      if(reg.test(d.email.value) == false)  
      {  
        alert("Invalid Email");  
        document.getElementById('email').style.borderColor = "red";

      return false;       
      }  
      else
          document.getElementById('email').style.borderColor = "green";
      
      if(d.password.value == '')  
      {
      alert("Password is is Required");  
      document.getElementById('password').style.borderColor = "red";

      d.password.focus();  
      return false;       
      }  
      else
          document.getElementById('password').style.borderColor = "green";
      
      if(d.password.value != d.cpassword.value)  
      {  
      alert("Passwords Mismatch")
         document.getElementById('password').style.borderColor = "red";

      return false;      
      }  
      else
          document.getElementById('password').style.borderColor = "green";
      
 }  
 </script>
	<form action="/register" name="register" method="post" onSubmit="return validate()">
		<table class="tablecon" width="200" border="1" align="center">
			<tr>
				<td>ID<span style="color: #8B008B">*</span>:
				</td>
				<td><input type="text" name="id" id="id"></td>
			</tr>
			<tr>
				<td>Name<span style="color: #8B008B">*</span>:
				</td>
				<td><input type="text" name="name" id="name"></td>
			</tr>
			<tr>
				<td>Email<span style="color: #8B008B">*</span>:
				</td>
				<td><input type="text" name="email" id="email"></td>
			</tr>
			<tr>
				<td>Password<span style="color: #8B008B">*</span>:
				</td>
				<td><input type="password" name="password" id="password"></td>
			</tr>
			<tr>
				<td>Confirm-Password:</td>
				<td><input type="password" name="cpassword" id="cpassword"></td>
			</tr>

			<tr>
				<td colspan="2" align="center"><input type="submit"
					name="submit" id="submit" value="Register"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><a href=login.jsp>Already
						Registered!!Login</a></td>
			</tr>
		</table>
	</form>


</body>
</html>