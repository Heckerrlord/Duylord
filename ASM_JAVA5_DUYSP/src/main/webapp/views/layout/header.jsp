<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<c:url var="url" value="/"></c:url>
<div id="main-menu">
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<div class="nav justify-content-left">
				<a class="navbar-brand" href="#home">duymoi.net</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarNav" aria-controls="navbarNav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item active"><a class="nav-link"
							href="${url}index">Trang chủ</a></li>
						<c:choose>
							<c:when test="${not empty sessionScope.currentUser}">
								<li class="nav-item"><a class="nav-link"
									href="${url}favorite/home">Yêu thích</a></li>
									<li class="nav-item"><a class="nav-link"
									href="${url}video/home">Video</a></li>
							</c:when>
							<c:otherwise>
								<li class="nav-item"><a class="nav-link" href="${url}login">Yêu
										thích</a></li><li class="nav-item"><a class="nav-link"
									href="${url}video/home">Video</a></li>
							</c:otherwise>
						</c:choose>
						<!-- <li class="nav-item">
              <a class="nav-link" href="#"></a>
            </li> -->
					</ul>
				</div>
			</div>
			<div class="nav justify-content-end">
				<form method="post">
				<div class="row">
				<div class="col-7"><input class="form-control mr-sm-2" type="search" name="search"
						placeholder="Tìm kiếm"  /></div>
				<div class="col-4"><button class="btn btn-outline-success my-2 my-sm-0" formaction="${url}find" type="submit">
						Tìm kiếm</button></div>
				</div>
					
					
				</form>
				<c:choose>
					<c:when test="${not empty sessionScope.currentUser}">
						<li class="nav-item"><a class="nav-link nav-link-1"
							style="font-weight: bold; color: #fff;" data-toggle="modal"
							data-target="#changePassModal" aria-current="page"
							href="${url}account?id=${sessionScope.currentUser.username}">Welcome ${sessionScope.currentUser.fullname}</a>
						</li>
						<c:if test="${sessionScope.currentUser.role == true}">

							<li class="nav-item"><a class="nav-link nav-link-1"
								style="font-weight: bold; color: #fff;" href="${url}admin/home">Admintools</a></li>
						</c:if>
						<li class="nav-item"><a class="nav-link nav-link-1"
							style="font-weight: bold; color: #fff;" href="logout">Log out</a></li>
					</c:when>
					<c:otherwise>
						<ul class="navbar-nav ml-auto">
							<li class="nav-item"><a class="nav-link" href="http://localhost:8080/login">Tài
									khoản</a></li>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</nav>
</div>
<script>
	window.addEventListener("scroll", function() {
		var header = document.querySelector("#main-menu");
		header.classList.toggle("active", window.scrollY > 0);
	});
</script>