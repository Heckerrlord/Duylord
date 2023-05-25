<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../static/css/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="../static/css/custom/bootstrap.min.css" />
<link rel="stylesheet" href="../static/css/custom/icon/css/all.css" />
<link rel="stylesheet" type="text/css" href="../static/css/style.css">
<title>Document</title>
</head>
<body>

	<div class="container">
		<div class="breadcrumb">
			<ul>
				<li><a href="${pageContext.request.contextPath}/index">HOME
				</a></li>
				<li><a href="#shop">/ SHOP</a></li>
				<li><a href="#">/ DETAIL</a></li>
			</ul>
		</div>
		<div class="detailP">
			<div class="row">
				<div class="col-md-6">
					<img src="../../static/images/${product.image}" class="img-fluid" alt="Product Image" />
				</div>
				<div class="col-md-6">
					<h1>
						<span style="font-weight: 100">Tên :</span> ${product.name}
					</h1>
					<h2>
						<span style="font-weight: 100"> Giá :</span> <span
							style="color: #85c94f">${product.price}</span> <sup>VND</sup>
					</h2>
					<p>${product.info}</p>
					<hr />
					<!--        <h3><span style="font-weight: 100">Loại :</span> {{lsp.name}}</h3> -->


					<button type="button" class="btn btn-primary">
						<a href="#" class="nav-link"
							ng-click="addToCart($event,product.id)">Add to Cart</a>
					</button>
					<div class="contactdetail">
						<ul class="nav justify-content-left">
							<a class="nav-link"
								href="https://www.facebook.com/tenduy.hophuc.73"><i
								class="fab fa-facebook"></i></a>
							<a class="nav-link" href="https://www.instagram.com/duydz.il/"><i
								class="fab fa-instagram"></i></a>
							<a class="nav-link"
								href="https://www.youtube.com/channel/UCV5H-PmOSC73BynqSJQAH_Q"><i
								class="fab fa-youtube"></i></a>
							<a class="nav-link" href="https://github.com/Heckerrlord"><i
								class="fab fa-github"></i></a>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
