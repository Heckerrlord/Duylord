<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../../static/css/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="../../static/css/custom/icon/css/all.css" />
<link rel="stylesheet" type="text/css" href="../../static/css/style.css">
<title>Document</title>
</head>
<body>
	<header>
		<div id="main-menu">
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
				<div class="container">
					<div class="nav justify-content-left">
						<a class="navbar-brand" href="#home">duymoi.net</a>
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarNav"
							aria-controls="navbarNav" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarNav">
							<ul class="navbar-nav mr-auto">
								<li class="nav-item active"><a class="nav-link"
									href="${pageContext.request.contextPath}/admin/home">Trang chủ</a></li>
								<li class="nav-item"><a class="nav-link"
									href="${pageContext.request.contextPath}/admin/product">Product</a></li>

								<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/user">Users</a></li>

								<li class="nav-item"><a class="nav-link"
									href="${url}/report">Report</a></li>

								<!-- <li class="nav-item">
              <a class="nav-link" href="#"></a>
            </li> -->
							</ul>
						</div>
					</div>
					<div class="nav justify-content-end">
						<form method="post">
							<div class="row">
								<div class="col-7">
									<input class="form-control mr-sm-2" type="search" name="search"
										placeholder="Tìm kiếm" />
								</div>
								<div class="col-4">
									<button class="btn btn-outline-success my-2 my-sm-0"
										formaction="${url}find" type="submit">Tìm kiếm</button>
								</div>
							</div>


						</form>
						<c:choose>
							<c:when test="${not empty sessionScope.currentUser}">
								<li class="nav-item"><a class="nav-link nav-link-1"
									style="font-weight: bold; color: #fff;" data-toggle="modal"
									data-target="#changePassModal" aria-current="page"
									href="${url}user">Welcome
										${sessionScope.currentUser.fullname}</a></li>
								<c:if test="${sessionScope.currentUser.role == true}">

									<li class="nav-item"><a class="nav-link nav-link-1"
										style="font-weight: bold; color: #fff;"
										href="http://localhost:8080/index">Customer view</a></li>
								</c:if>
								<li class="nav-item"><a class="nav-link nav-link-1"
									style="font-weight: bold; color: #fff;" href="logout">Log
										out</a></li>
							</c:when>
							<c:otherwise>
								<ul class="navbar-nav ml-auto">
									<li class="nav-item"><a class="nav-link"
										href="http://localhost:8080/login">Tài khoản</a></li>
								</ul>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</nav>
		</div>
	</header>

	<section><jsp:include page="admin/${pageCurrent2}" /></section>

	<footer>
		<div class="container" id="fter">
			<h3>Footer:Duyspph21810</h3>
		</div>
	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
		integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
		integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
		crossorigin="anonymous"></script>
</body>
</html>
