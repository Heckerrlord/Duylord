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
			<form:form  modelAttribute="user"
			action="${pageContext.request.contextPath}" method="POST">
				<div class="form-group">
					<label for="username">USERNAME:</label>
					<form:input type="text" class="form-control" id="username"
						path="username" placeholder="Enter your username" />
					<form:errors path="username" class="text-danger" />
				</div>
				<div class="form-group">
					<label for="password">PASSWORD:</label>
					<form:password path="password" class="form-control" id="password"
						placeholder="Enter your password" />
					<%-- <form:password style="margin-top: 5px" name="password"
						class="form-control"
						placeholder="Confirm your password" /> --%>
				</div>

				<button type="submit" class="btn btn-primary">Sign up</button>
				<div class="text">
					<span>Have an account?</span> <a
						href="${pageContext.request.contextPath}/login">Login</a>
					<hr />
					<h5>OR</h5>
					<a href="">FORGOT PASSWORD</a>
				</div>
			</form:form>

		</div>
	</div>
</body>
</html>
