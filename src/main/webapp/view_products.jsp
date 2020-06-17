<%@page import="mycart.com.learn.dao.CategoryDao"%>
<%@page import="mycart.com.learn.entities.Category"%>
<%@page import="mycart.com.learn.entities.Product"%>
<%@page import="mycart.com.learn.dao.ProductDao"%>
<%@page import="java.util.Map"%>
<%@page import="mycart.com.learn.helper.Helper"%>
<%@page import="java.util.List"%>
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
	List<Product> products = productDao.getAllProducts();
	
	CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
	List<Category> categories = categoryDao.getCategories();
			
	
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
		<div class="container-fluid mt-3">
			<%@include file="components/message.jsp" %>
		</div>
	
		<h1 class="text-uppercase text-muted text-center">All products</h1>
		
		<button class="btn btn-success btn-sm float-right" data-toggle="modal" data-target="#add-product-modal">Add new product</button>
		<table class="table table-striped">
		  <thead>
		    <tr>
		      <th scope="col">#ID</th>
		      <th scope="col">Name</th>
		      <th scope="col">Description</th>
		      <th scope="col">Price</th>
		      <th scope="col">Discount</th>
		      <th scope="col">Quantity</th>
		      <th scope="col">Photo</th>
		      <th scope="col">Category</th>
		      <th scope="col">Action</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<%
			  	for(Product product: products) {
		  	%>
		    <tr>
		      <td><%= product.getpId() %></td>
		      <td><%= product.getpName() %></td>
		      <td><%= Helper.get10Words(product.getpDesc()) %></td>
		      <td><%= product.getpPrice() %></td>
		      <td><%= product.getpDiscount() %></td>
		      <td><%= product.getpQuantity() %></td>
		      <td>
		      	<img style="width: 75px;height: 85px;" src="img/products/<%= product.getpPhoto() %>" alt=""/>
		      </td>
		      <td><%= product.getCategory().getCategoryTitle() %></td>
		 	  <td>
		 	  	<form action="ProductOperationServlet" method="post">
		 	  		<input type="hidden" name="operation" value="deleteProduct">
		 	  		<input type="hidden" name="deletedProduct" value="<%= product.getpId() %>" >
		 	  		<button type="submit" class="btn btn-outline-danger btn-sm mb-1">Delete</button>
		 	  	</form>
		 	  	<button onclick="window.location = 'edit_product.jsp?id=<%= product.getpId() %>'" class="btn btn-outline-primary btn-sm">Edit</button>
		 	  </td>
		    </tr>
		    <% } %>
		  </tbody>
		</table>
		
		
		<!-- Add product modal -->
	
	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header custom-bg text-white">
	        <h5 class="modal-title" id="exampleModalLabel">Fill product details</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
	        	<input type="hidden" name="operation" value="addProduct"> 
	        	<div class="form-group">
	        		<input class="form-control" type="text" name="pName" placeholder="Enter product name" required>
	        	</div>
	        	
	        	<div class="form-group">
	        		<textarea class="form-control" style="height:100px" name="pDescription" placeholder="Enter product description" required></textarea>
	        	</div>
	        	
	        	<div class="form-group">
	        		<input class="form-control" type="number" name="pPrice" placeholder="Enter product price" required>
	        	</div>
	        	
	        	<div class="form-group">
	        		<input class="form-control" type="number" name="pDiscount" placeholder="Enter product discount" required>
	        	</div>
	        	
	        	<div class="form-group">
	        		<input class="form-control" type="number" name="pQuantity" placeholder="Enter product quantity" required>
	        	</div>
	        	
	        	<div class="form-group">
	        		<select class="form-control" name="catId">
	        			<option disabled selected>Select category</option>
	        			<%
	        				for (Category category: categories) {
	        			%>
	        				<option value="<%= category.getCategoryId() %>"><%= category.getCategoryTitle() %></option>
	        			<%
	        				}
	        			%>
	        		</select>
	        	</div>
	        	
	        	<div class="form-group">
	        		<label for="">Select picture of product</label> <br/>
	        		<input type="file" name="pPic" required>
	        	</div>
	        	
	        	<div class="container text-center">
	        		<button class="btn btn-outline-success">Add Product</button>
        		    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        	</div>
	        	
	        </form>
	      </div>
	     
	    </div>
	  </div>
	</div>
	
	<!-- End product modal  -->
		
	</div>
	

</body>
</html>