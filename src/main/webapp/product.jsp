<%@page import="mycart.com.learn.entities.Product"%>
<%@page import="mycart.com.learn.dao.ProductDao"%>
<%@page import="mycart.com.learn.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="mycart.com.learn.helper.FactoryProvider"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));

	ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
	Product productById = productDao.getProductById(id);
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View product</title>
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
		<div class="row">
			<div class="col-md-5">
				<div class="product-gallery">
					<div class="product-image">
						<img style="max-height: 400px; width: 100%" class="img-fluid" src="img/products/<%= productById.getpPhoto() %>">
					</div>
				</div>
			</div>
			<div class="col-md-7">
				<h1><%= productById.getpName() %></h1>
				<h2><%= productById.getpPrice() %>&euro;</h2>
				<div class="description">
					<p><%= productById.getpDesc() %></p>
				</div>
			</div>
		</div>
	</div>

</body>
</html>