<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update</title>
<%@ page import="com.nagarro.training.dao.RecordsDao"%>
	<%@ page import= "java.util.*"%>
	<%@ page import="com.nagarro.training.model.Records"%>
	<%@ page import="com.nagarro.training.web.*"%>
	<%@page import="org.hibernate.Session,org.hibernate.SessionFactory,org.hibernate.Transaction,org.hibernate.cfg.Configuration" %>
  
<script language="JavaScript">
  javascript:window.history.forward(1);
</script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
.navbar-nav.navbar-center {
	position: absolute;
	left: 50%;
	transform: translatex(-50%);
	td
	{
	padding:10px;
}
}

th{
text-align:center;
}

</style>
</head>
<body>
<%RecordsDao record = new RecordsDao();
List <Records> ls= record.getProducts(); 
%>
	<div>
		<div>
			<ul class="nav navbar-nav navbar-center">
				<li><h2>
						<b>Product Management Tool</b>
					</h2></li>
			</ul>
			<p align="right">
				Hi<b> ${username}</b><span style="margin-left: 10px;"><a
					href="<%=request.getContextPath()%>/logout"><button
							class="btn btn-warning">Logout</button></a></span>
			</p>
		</div>
	</div>
	<br>
	<br>
	<hr>
	<%  
	String id = request.getParameter("id");
	
    String title = request.getParameter("title");
    String quantity = request.getParameter("quantity");
    String size = request.getParameter("size");
    String image = request.getParameter("image");
    
    System.out.println(image);
   
  
%>

<div class="row">
    <div class="col-xs-6">
    
    	<div class="container m-2">
		<h5>
			<b>Please enter product details</b>
		</h5>
		<form action="<%=request.getContextPath()%>/update" method="post">
			<table>
			
			<tr>
					
					<td><input type='hidden' name='id' value=<%=request.getParameter("id")%> ></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
			
				<tr>
					<td>Title:</td>
					<td><input type='text' name='title' value=<%=request.getParameter("title")%> required></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>Quantity:</td>
					<td><input type='text' name='quantity' value=<%=request.getParameter("quantity")%> required></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>Size:</td>
					<td><input type='text' name='size' value=<%=request.getParameter("size")%> required></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>Image:</td>

					<td><input type='file' name='image' value=<%=request.getParameterValues("image")%> required></td>
				</tr>
				<tr><td></td>
				<td><h5 style="color:red;">*Image to be uploaded while updating</h5></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td align="center"><button type="submit" onClick="location.href='/update?id=<%=id%>,title=<%=title%>,quantity=<%=quantity%>,size=<%=size%>,image=<%=image%>';"
							class="btn btn-primary">Submit</button></td>
					<td align="center"><button type="reset"  onClick="location.href='update.jsp';" class="btn btn-danger" value="reset">Reset</button></td>
					<td align="center"><button type="reset"  onClick="location.href='product-management.jsp';" class="btn btn-danger" value="reset">Cancel</button></td>
				</tr>
			</table>
		</form>
	</div>
    
    </div>
    
</div>

	
	<hr>
	<table class="output-table" border="1" style="width:80%;border-collapse:collapse" align="center">
	
  <tr>
    <th align="center">S.No</th>
    <th align="center">TITLE</th> 
    <th align="center">QUANTITY</th>
    <th align="center">SIZE</th> 
    <th align="center">IMAGE</th>
    <th align="center">ACTION</th> 
    
  </tr>
  <%int count=1;
  for (Records r:ls){		
	 %>
  <tr>
    <td align="center"><%=count++%></td>
    <td align="center"><%=r.getTitle() %></td>
    <td align="center"><%=r.getSize() %></td>
    <td align="center"><%=r.getQuantity() %></td>
    <td align="center"><img src="<%=r.getImage() %>" height="100px" width="100px"></td>
    <td align="center"><button class="action" onClick="location.href='update.jsp'?id=<%r.getId();%>';">Update</button>&nbsp;&nbsp;
	 <button class="action" onClick="location.href='update.jsp'?id=<%r.getId();%>';">Delete</button></td>
  </tr>
  <%} %>
</table>
	
</body>
</html>