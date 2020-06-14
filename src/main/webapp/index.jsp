<%@page import="mycart.com.learn.helper.Helper"%>
<%@page import="mycart.com.learn.dao.CategoryDao"%>
<%@page import="mycart.com.learn.entities.Category"%>
<%@page import="mycart.com.learn.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="mycart.com.learn.dao.ProductDao"%>
<%@page import="mycart.com.learn.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MyCart home</title>

<%@include file="components/common_css_js.jsp"%>


</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="row mt-3 mx-2">
		<%
			ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
			CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());

			List<Product> products = productDao.getAllProducts();
			List<Category> categories = categoryDao.getCategories();
		%>

		<!-- Display categories  -->
		<div class="col-md-2">
			<div class="list-group mt-4">
				<a href="#" class="list-group-item list-group-item-action active">
					All products </a>
				<%
					for (Category category : categories) {
				%>
				<a href="#" class="list-group-item list-group-item-action"><%=category.getCategoryTitle()%></a>
				<%
					}
				%>

			</div>

		</div>


		<div class="col-md-8">
			<div class="row mt-4">
				<div class="col-md-12">
					<div class="card-columns">

						<%
							for (Product product : products) {
						%>

						<div class="card" style="overflow: hidden">
							<div class="container text-center">
							<img src="img/products/<%=product.getpPhoto()%>"
								class="card-img-top m-2" style="max-height: 270px; max-width: 100%; width: auto" alt="<%=product.getpName()%>">
							
							</div>
							<div class="card-body">
								<h5 class="card-title"><%=product.getpName()%></h5>
								<p class="card-text"><%=Helper.get10Words(product.getpDesc())%></p>

							</div>
							<footer class="card-footer">
								<button class="btn custom-bg text-white">Add to cart</button>
								<button class="btn btn-outline-primary"><%=product.getpPrice() + "&euro;"%></button>
							</footer>
						</div>

						<%
							}
						%>
					</div>
				</div>
			</div>

		</div>
	</div>

</body>
</html>