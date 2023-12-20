<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script language="JavaScript">
  javascript:window.history.forward(1);
</script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<title>Delete</title>
</head>
<body>

<%  
	String id = request.getParameter("id");
	%>



	<div>
	<form action="<%=request.getContextPath()%>/delete" method="post">
			<table>
			
			<tr>
					
					<td><input type='hidden' name='id' value=<%=request.getParameter("id")%>></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
			
				<tr>
					<td>Title:</td>
					<td><input type='text' name='title' value=<%=request.getParameter("title")%>></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>Quantity:</td>
					<td><input type='text' name='quantity' value=<%=request.getParameter("quantity")%>></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>Size:</td>
					<td><input type='text' name='size' value=<%=request.getParameter("size")%>></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>Image:</td>

					<td><input type='file' name='image' value=<%=request.getParameter("image")%>></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td align="center"><button type="submit" onClick="location.href='/delete?id=<%=id%>';"
							class="btn btn-primary">Delete</button></td>
					<td align="center"><button type="reset" class="btn btn-danger" onClick="location.href='product-management.jsp';">Cancel</button></td>
				</tr>
			</table>
		</form>
</div>
</body>

</html>