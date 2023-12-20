<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ page import="com.nagarro.training.dao.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nagarro.training.model.*"%>

<meta charset="ISO-8859-1">
<title>Forget Password</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>

</head>
<body>
	<%
		UserDao user = new UserDao();
		List<User> us = user.getUsers();
	%>
	<div class="container">
		<form name="form">
			<h2>Forget Password</h2>
			<table>
				<tr>
					<td>Enter Your Username:</td>
					<td><input type="text" name="username"></td>

					<td><button type="submit" class="btn btn-primary">Get
							Password</button></td>
				</tr>

				<%
					String username = request.getParameter("username");
					//System.out.println(username);
				%>
				<%
					
					for (User u : us) {
						if (u.getUsername().equalsIgnoreCase(username)) {
				%>
				<tr>
					<td>Password:</td>

					<td align="center"><%=u.getPassword()%></td>

				</tr>

				<%
					}
					}
				%>



			</table>
		</form>
	</div>
	<div align="center">
		<button type="submit" class="btn btn-primary"
			onClick="location.href='login.jsp'">Go to Login</button>
	</div>

</body>
</html>