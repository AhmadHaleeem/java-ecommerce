<%@page import="java.util.List"%>
<%@page import="mycart.com.learn.dao.CategoryDao"%>
<%@page import="mycart.com.learn.entities.Category"%>
<%@page import="mycart.com.learn.entities.Product"%>
<%@page import="mycart.com.learn.dao.ProductDao"%>
<%@page import="java.util.Map"%>
<%@page import="mycart.com.learn.helper.Helper"%>
<%@page import="mycart.com.learn.helper.FactoryProvider"%>
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

	ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
	Product product = productDao.getProductById(Integer.parseInt(request.getParameter("id")));
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View products</title>
<%@include file="components/common_css_js.jsp"%>
<style>
body {
	background: #e2e2e2;
}
</style>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container mt-4">
		<h1 class="text-uppercase text-muted text-center mb-2">Update <%= product.getpName() %> details</h1>
		<form action="ProductOperationServlet" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="operation" value="updateProduct">
			<input type="hidden" name="productId" value="<%= product.getpId() %>">
			<div class="form-group">
				<input id='pName' class="form-control" type="text" name="pName"
					placeholder="Enter product name" value='<%= product.getpName() %>' required>
			</div>

			<div class="form-group">
				<textarea id='pDescription' class="form-control"
					name="pDescription" rows="7"
					placeholder="Enter product description" required><%= product.getpDesc() %></textarea>
			</div>

			<div class="form-group">
				<input id='pPrice' class="form-control" type="number" name="pPrice"
					placeholder="Enter product price" value='<%= product.getpPrice() %>' required>
			</div>

			<div class="form-group">
				<input id='pDiscount' class="form-control" type="number"
					name="pDiscount" placeholder="Enter product discount" value='<%= product.getpDiscount() %>' required>
			</div>

			<div class="form-group">
				<input id='pQuantity' class="form-control" type="number"
					name="pQuantity" placeholder="Enter product quantity" value='<%= product.getpQuantity() %>' required>
			</div>

			<div class="form-group">
				<select class="form-control" name="catId">
					<%
						CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
						List<Category> categories = categoryDao.getCategories(); 
					
						for (Category category: categories) {
					%>
					 	<option value="<%= category.getCategoryId() %>" <%= category.getCategoryId() == product.getCategory().getCategoryId() ? "selected" : "" %> ><%= category.getCategoryTitle() %></option>
					<%
						}
					%>
				</select>
			</div>
			
			<div class="form-group">
				<img style="width: 150px;" src="img/products/<%= product.getpPhoto() %>" alt="<%= product.getpName() %>">
			</div>

			<div class="form-group">
				<label for="file">Select picture of product</label> <br /> 
				<input id='file' type="file" name="pPic">
			</div>

			<div class="">
				<button class="btn btn-outline-primary">Update Product</button>
				<a href='view_products.jsp' class="btn btn-outline-secondary">Go back</a>
			</div>

		</form>
	</div>


</body>
</html>