<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3">
					
					<div class="card-header custom-bg text-white text-center">
						<h3>Login here</h3>
					</div>
					
					<div class="card-body">
						<%@include file="components/message.jsp"%>
						<form action="LoginServlet" method="post">
							<div class="form-group">
								<label for="email">User Email</label> <input type="email"
									class="form-control" id="email"name="user_email"  placeholder="Enter your email">
							</div>
	
							<div class="form-group">
								<label for="password">User Password</label> <input type="password"
									class="form-control" id="password" name="user_password" 
									placeholder="Enter your password">
							</div>
							<a href="register.jsp" class="d-block mb-2">If you're not registered click here please</a>
	
							<div class="container text-center">
								<button class="btn btn-primary custom-bg border-0">Login</button>
								<button class="btn btn-primary custom-bg border-0">Reset</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
</body>
</html>