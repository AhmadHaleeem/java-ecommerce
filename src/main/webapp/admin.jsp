<%@page import="mycart.com.learn.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="mycart.com.learn.helper.FactoryProvider"%>
<%@page import="mycart.com.learn.dao.CategoryDao"%>
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
	<div class="container admin">
	
		<div class="container-fluid mt-3">
			<%@include file="components/message.jsp" %>
		</div>
		
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
				<div class="card" data-toggle="modal" data-target="#add-category-modal">
					<div class="card-body text-center" >
						<div class="container">
							<img style="max-width: 120px" class="img-fluid rounded-circle" src="img/keys.png" alt="user_icon">
						</div>
						<p class="mt-2">Click here to add a new category</p>
						<h1 class="text-uppercase text-muted">Add Category</h1>
						
					</div>
				</div>
			</div>
			
			<div class="col-md-6">
				<div class="card" data-toggle="modal" data-target="#add-product-modal">
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
	
	<!-- Add category modal -->
	
	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header custom-bg text-white">
	        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form action="ProductOperationServlet" method="post">
	        	<input type="hidden" name="operation" value="addCategory"> 
	        	<div class="form-group">
	        		<input class="form-control" type="text" name="catTitle" placeholder="Enter category title" required>
	        	</div>
	        	
	        	<div class="form-group">
	        		<textarea class="form-control" style="height:100px" name="catDescription" placeholder="Enter category description" required></textarea>
	        	</div>
	        	
	        	<div class="container text-center">
	        		<button class="btn btn-outline-success">Add Category</button>
        		    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        	</div>
	        	
	        </form>
	      </div>
	     
	    </div>
	  </div>
	</div>
	
	<!-- End category modal  -->
	
	
	
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
	        <form action="ProductOperationServlet" method="post">
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
	        				CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
	        				List<Category> categories = categoryDao.getCategories();
	        				
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

</body>
</html>