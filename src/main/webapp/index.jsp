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

	<div class="container-fluid">

		<div class="row mt-3 mx-2">
			<%
				String cat = request.getParameter("category");

				ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
				List<Product> listProducts = null;

				if (cat == null) {
					listProducts = productDao.getAllProducts();
				} else if (cat == null || cat.trim().equals("all")) {
					listProducts = productDao.getAllProducts();
				} else {
					int cId = Integer.parseInt(cat.trim());
					listProducts = productDao.getProductsByCategoryId(cId);
				}

				CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
				List<Category> categories = categoryDao.getCategories();
			%>

			<!-- Display categories  -->
			<div class="col-md-2">
				<div class="list-group mt-4">
					<a href="index.jsp?category=all"
						class="list-group-item list-group-item-action active"> All
						products </a>
					<%
						for (Category category : categories) {
					%>
					<a href="index.jsp?category=<%=category.getCategoryId()%>"
						class="list-group-item list-group-item-action"><%=category.getCategoryTitle()%></a>
					<%
						}
					%>

				</div>

			</div>


			<div class="col-md-8">
				<div class="row mt-4">
					<div class="col-md-12">
						<%
							if (listProducts.size() != 0) {
						%>
						<div class="card-columns">

							<%
								for (Product product : listProducts) {
							%>
						
							<div class="card product-card" style="overflow: hidden">
								<div class="container text-center">
									<img src="img/products/<%=product.getpPhoto()%>"
										class="card-img-top m-2"
										style="max-height: 270px; max-width: 100%; width: auto"
										alt="<%=product.getpName()%>">

								</div>
								<div class="card-body">
									<h5 class="card-title"><%=product.getpName()%></h5>
									<p class="card-text"><%=Helper.get10Words(product.getpDesc())%></p>

								</div>
								<footer class="card-footer">
									<button class="btn custom-bg text-white"
										onclick="addToCart(<%=product.getpId()%> , '<%=product.getpName()%>' , <%=product.getPriceAfterApplyingDiscount()%>)">Add
										to cart</button>
									<button class="btn btn-outline-success text-center"><%=product.getPriceAfterApplyingDiscount() + "&euro;" + "/-"%>
										<span class="text-secondary discount-label"> <%=product.getpPrice() + "&euro;"%>
											, <%=product.getpDiscount()%>% off
										</span>
									</button>
									
									<button class="btn btn-outline-info text-center" onclick='window.location = "product.jsp?id=" + <%= product.getpId() %>'>See more</button>
								</footer>
							</div>
							 

							<%
								}
							%>

						</div>
						<%
							} else {
						%>
						<div class="alert alert-warning" role="alert">No products in
							this category</div>
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