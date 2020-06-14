<%
	User user = (User) session.getAttribute("current-user");
	if (user == null) {
		session.setAttribute("err-message", "You are unauthorized to access this page, please login first");
		response.sendRedirect("login.jsp");
		return;
	} 

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout page</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container">
		<div class="row mt-5">
			<div class="col-md-6">
				<!-- card -->
				<div class="card">
					<div class="card-body">
						<h3 class="text-center mb-3">Your selected items</h3>
						<div class="cart-body"></div>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<!-- form details  -->
				<div class="card">
					<div class="card-body">
						<h3 class="text-center mb-3">Your details for order</h3>
						<form action="">
							<div class="form-group">
							    <label for="email">Email address</label>
							    <input type="email" value="<%= user.getUserEmail() %>" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter your email">
						    </div>
						    
						    <div class="form-group">
							    <label for="name">Username</label>
							    <input type="text" value="<%= user.getUserName() %>" class="form-control" id="name" placeholder="Enter your name">
						    </div>
						    
						    <div class="form-group">
							    <label for="phone">Phone number</label>
							    <input type="text" value="<%= user.getUserPhone() %>" class="form-control" id="phone" placeholder="Enter your phone number">
						    </div>
						    
						    <div class="form-group">
							    <label for="address">Your shipping address</label>
							    <textarea class="form-control" id="address" rows="3" placeholder="Enter your address"><%= user.getUserAddress() %></textarea>
						  	</div>
						  	
						  	<div class="container text-center">
						  		<button class="btn btn-outline-success">Order now</button>
						  		<button class="btn btn-outline-primary">Continue shopping</button>
						  	</div>
						    
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@include file="components/common_modals.jsp"%>
</body>
</html>