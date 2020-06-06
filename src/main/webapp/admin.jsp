<%@page import="mycart.com.learn.entities.User"%>
<%
	User user = (User) session.getAttribute("current-user");
	if (user == null) {
		session.setAttribute("err-message", "You are unauthorized to access this page");
		response.sendRedirect("login.jsp");
		return;
	} else {
		if (user.getUserType().equals("normal")) {
			session.setAttribute("err-message", "You are not admin to access this page");
			response.sendRedirect("login.jsp");
			return;
		}
	}
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container">
		
		<div class="row mt-3">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 120px"" class="img-fluid rounded-circle" src="img/seo-and-web.png" alt="user_icon">
						</div>
						<h1>231</h1>
						<h1 class="text-uppercase text-muted">Users</h1>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 120px"" class="img-fluid rounded-circle" src="img/list.png" alt="user_icon">
						</div>
						<h1>22</h1>
						<h1 class="text-uppercase text-muted">Categories</h1>
						
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 120px"" class="img-fluid rounded-circle" src="img/product.png" alt="user_icon">
						</div>
						<h1>63</h1>
						<h1 class="text-uppercase text-muted">Products</h1>
						
					</div>
				</div>
			</div>
		</div>
		
		<div class="row mt-3">
		
			<div class="col-md-6">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 120px"" class="img-fluid rounded-circle" src="img/keys.png" alt="user_icon">
						</div>
						<p class="mt-2">Click here to add a new category</p>
						<h1 class="text-uppercase text-muted">Add Category</h1>
						
					</div>
				</div>
			</div>
			
			<div class="col-md-6">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 120px"" class="img-fluid rounded-circle" src="img/plus.png" alt="user_icon">
						</div>
						<p class="mt-2">Click here to add a new product</p>
						<h1 class="text-uppercase text-muted">Add Product</h1>
						
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>