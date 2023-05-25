<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.form-group {
	margin: 5px;
}

.card {
	min-height: 550px
}

label {
	font-weight: bold;
}

.custom-width3 {
	width: 35%;
}

.custom-width2 {
	width: 1%;
}

.anh {
	height: 230px;
	width: 230px;
	border-radius: 50%;
	object-fit: cover;
	background: #dfdfdf;
}
</style>
<div class="container">
	<!-- Form section -->
	<div class="card" style="margin-top: 20px">
		<div class="card-body">
			<form:form modelAttribute="products" method="POST"
				enctype="multipart/form-data">
				<div class="row">
					<div class="col-1">
						<div class="form-group">
							<label for="name">Mã:</label> <input type="text"
								class="form-control" value="${products.id}" readonly="true"
								style="background: #C9D4CE" id="id" />
						</div>
					</div>
					<div class="col-6">
						<div class="form-group">
							<label for="name">Tên sản phẩm:</label>
							<form:input class="form-control" path="name" id="name" />
							<form:errors class="text-danger" path="name" id="name" />
						</div>
					</div>
					<div class="col-3">
						<div class="form-group">
							<label for="name">Giá:</label>
							<form:input class="form-control" path="price" id="price" />
						</div>
					</div>
				</div>


				<div class="form-group">
					<div class=row>
						<div class="col-8">
							<label for="name">Ảnh:</label> <input type="file"
								class="form-control" name="file" id="file" />

							<div class="form-group">
								<label for="name">Chi tiết:</label>
								<form:textarea rows="7" class="form-control" path="info"
									id="info" />
							</div>
						</div>
						<div class="col-4 ">
							<div style="text-align: center">
								<img id="anh" class="anh"
									src="../../static/images/${products.image}">
								<form:input path="image" class="form-control-plaintext mx-auto"
									style="width:30%;text-align: center;" />
							</div>
						</div>
					</div>

				</div>


				<%-- <div class="form-group">
					<label for="name">Ngày tạo:</label>
					<form:input type="date" class="form-control" path="createDate"
						id="image" />
				</div> --%>
				<div class="form-group">
					<label>Khả dụng:</label>
					<form:radiobutton path="available" value="true" />
					Có
					<form:radiobutton path="available" value="false" />
					Không

				</div>

				<div class="form-group">
					<label for="role">Thương hiệu:</label> <select name="thuonghieu"
						class="form-select">
						<c:forEach items="${brandsName}" var="item">
							<c:choose>
								<c:when test="${item.id eq products.brands.id}">
									<option value="${item.id}" label="${item.name}"
										selected="selected" />
								</c:when>
								<c:otherwise>
									<option value="${item.id}" label="${item.name}" />
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</div>
				<button type="submit"
					formaction="${pageContext.request.contextPath}/admin/product/create"
					class="btn btn-primary">Add</button>
				<button type="submit"
					formaction="${pageContext.request.contextPath}/admin/product/update"
					class="btn btn-primary">Update</button>
				<button type="submit"
					formaction="${pageContext.request.contextPath}/admin/product"
					class="btn btn-primary">Refresh</button>
			</form:form>
		</div>
	</div>

	<h2>Products Available</h2>
	<table class="table">
		<thead>
			<tr>
				<th>Tên sản phẩm</th>
				<!-- <th>Password</th> -->
				<th>Giá</th>
				<th>Thương hiệu</th>
				<th>Ngày tạo</th>
				<th>Ảnh</th>
				<th>Mô tả</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="item">
				<tr>
					<td>${item.name}</td>
					<%-- <td>${item.password}</td> --%>
					<td>${item.price}</td>
					<td>${item.brands.name}</td>
					<td>${item.createDate}</td>
					<td class="custom-width2"><img
						style="width: 100px; height: 100px; object-fit: cover;"
						src="../../static/images/${item.image}"></td>
					<td class="custom-width3">${item.info}</td>

					<td><a class="btn btn-info"
						href="${pageContext.request.contextPath}/admin/product/edit?id=${item.id}">Edit</a>
						<a class="btn btn-danger"
						href="${pageContext.request.contextPath}/admin/product/unavailable?id=${item.id}">Delete</a>
					</td>
				</tr>
			</c:forEach>
			<!-- Add more rows dynamically using JavaScript -->
		</tbody>
	</table>

	<h2>Products Not Available</h2>
	<table class="table">
		<thead>
			<tr>
				<th>Tên sản phẩm</th>
				<!-- <th>Password</th> -->
				<th>Giá</th>
				<th>Thương hiệu</th>
				<th>Ngày tạo</th>
				<th>Ảnh</th>
				<th>Mô tả</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list2}" var="item">
				<tr>
					<td>${item.name}</td>
					<%-- <td>${item.password}</td> --%>
					<td>${item.price}</td>
					<td>${item.brands.name}</td>
					<td>${item.createDate}</td>
					<td class="custom-width2"><img
						style="width: 100px; height: 100px; object-fit: cover;"
						src="../../static/images/${item.image}"></td>
					<td class="custom-width3">${item.info}</td>

					<td><a class="btn btn-info"
						href="${pageContext.request.contextPath}/admin/product/edit?id=${item.id}">Edit</a>
						<a class="btn btn-danger"
						href="${pageContext.request.contextPath}/admin/product/available?id=${item.id}">Undo</a>
					</td>
				</tr>
			</c:forEach>
			<!-- Add more rows dynamically using JavaScript -->
		</tbody>
	</table>
</div>