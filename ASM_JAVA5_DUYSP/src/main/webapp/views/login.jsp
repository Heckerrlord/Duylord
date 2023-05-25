<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<title>WELLCOME</title>
<link rel="stylesheet" href="../static/css/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="../static/css/login.css">
</head>
<body>
	<div class="container">
		<div class="login">
			<h2>WELLCOME</h2>

			<form:form modelAttribute="user"
				action="${pageContext.request.contextPath}" method="POST">
				<div class="form-group">
					<label for="username">USERNAME:</label>
					<form:input path="username"
						placeholder="Enter your username" class="form-control"/>
					<form:errors path="username" class="text-danger" />
				</div>
				<div class="form-group">
					<label for="password">PASSWORD:</label>
					<div class="row">
						<div class="col-9">
							<form:password path="password" class="form-control"
								placeholder="Enter your password" />

						</div>
						<div class="col-3">
							<button class="show-password" type="button"
								onclick="togglePassword()">SHOW</button>
						</div>
						<form:errors path="password" class="text-danger" />
					</div>
				</div>

				<div class="form-group">
					<form:checkbox path="role" />
					<label for="password">Remember me?:</label>
					<div class="text-danger">${mes}</div>
				</div>

				<button type="submit" class="btn btn-primary">Login</button>
				<div class="text">
					<span>Don't have an account?</span> <a
						href="${pageContext.request.contextPath}/signup">Sign up</a>
					<hr />
					<h5>OR</h5>
					<a href="">FORGOT PASSWORD</a>
				</div>
			</form:form>
		</div>
	</div>
	<script>
		function togglePassword() {
			var passwordField = document.getElementById("password");
			var passwordField1 = document.getElementById("password1");
			var passwordField2 = document.getElementById("password2");
			if (passwordField.type === "password") {
				passwordField.type = "text";
				passwordField1.type = "text";
				passwordField2.type = "text";
			} else {
				passwordField.type = "password";
				passwordField1.type = "password";
				passwordField2.type = "password";
			}
		}
	</script>
</body>
</html>
