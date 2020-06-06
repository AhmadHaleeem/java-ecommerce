<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User</title>

<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="row mt-5">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-body px-5">
					<h3 class="text-center my-3">Sign up here !!</h3>

					<form>
						<div class="form-group">
							<label for="name">User Name</label> <input type="text"
								class="form-control" id="name" placeholder="Enter your name">
						</div>

						<div class="form-group">
							<label for="email">User Email</label> <input type="email"
								class="form-control" id="email" placeholder="Enter your email">
						</div>

						<div class="form-group">
							<label for="password">User Email</label> <input type="password"
								class="form-control" id="password"
								placeholder="Enter your password">
						</div>

						<div class="form-group">
							<label for="phone">User Phone</label> <input type="number"
								class="form-control" id="phone" placeholder="Enter your phone">
						</div>

						<div class="form-group">
							<label for="address">User Address</label>
							<textarea style="height: 200px;" class="form-control"
								id="address" placeholder="Enter your address"></textarea>
						</div>

						<div class="container text-center">
							<button class="btn btn-outline-success">Register</button>
							<button class="btn btn-outline-warning">Reset</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>