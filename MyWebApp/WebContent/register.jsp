<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register the User</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>

</head>
<body>

	<div class="container col-md-4 col-md-offset-3" style="overflow: auto">
		<h2>User Register Form</h2>
		<form action="<%=request.getContextPath()%>/register" method="post">



			<div class="form-group">
				<label for="uname">Name:</label> <input type="text"
					class="form-control" id="uname" placeholder="Name" name="name"
					required>
			</div>

			<div class="form-group">
				<label for="uname">UserName:</label> <input type="text"
					class="form-control" id="username" placeholder="User Name"
					name="username" required>
			</div>

			<div class="form-group">
				<label for="uname">Password:</label> <input type="password"
					class="form-control" id="password" placeholder="Password"
					name="password" required>
			</div>

			<button type="submit" class="btn btn-primary ">Register</button>

		</form>
	</div>


</body>
</html>