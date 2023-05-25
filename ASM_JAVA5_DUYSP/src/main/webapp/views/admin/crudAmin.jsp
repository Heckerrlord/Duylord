<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<style>
	.form-group{
	margin: 5px;
	}
	.card{
	min-height: 400px}
	</style>
<div class="container">
	<!-- Form section -->
	<%--  <div class="card">
		
		<div class="card-body">
			<form:form modelAttribute="users" method="POST" >
				<div class="row">
					<div class="col-6">
						<div class="form-group">
							<label for="username">Username</label>
							<form:input type="text" class="form-control" path="username"
								id="username" readonly="true"/>
						</div>
					</div>
					<div class="col-6">
						<div class="form-group">
							<label for="password">Password</label>
							<form:input type="password" class="form-control" id="password"
								path="password" />
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="fullname">Full Name</label>
					<form:input type="text" path="fullname" class="form-control"
						id="fullname" />
				</div>
				<div class="form-group">
					<label for="photo">Photo</label>
					<form:input type="text" class="form-control" path="photo"
						id="photo" />
				</div>
				<div class="row">
					<div class="col-6">
						<div class="form-group">
							<label for="email">Email</label>
							<form:input type="email" class="form-control" id="email"
								path="email" />
						</div>
					</div>
					<div class="col-6">
						<div class="form-group">
							<label for="phone">Phone</label>
							<form:input type="text" path="phone" class="form-control"
								id="phone" />
						</div>
					</div>
				</div>
				<button type="submit"
					formaction="${pageContext.request.contextPath}/admin/user/create"
					class="btn btn-primary">Add</button>
				<button type="submit"
					formaction="${pageContext.request.contextPath}/admin/user/update"
					class="btn btn-primary">Update</button>
			</form:form>
		</div>
	</div>
 --%>
<h2>Users</h2>
	<table class="table">
		<thead>
			<tr>
				<th>Username</th>
				<!-- <th>Password</th> -->
				<th>Full Name</th>
				<th>Photo</th>
				<th>Email</th>
				<th>Phone</th>
				<th>Status</th>
				<th>Role</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="item">
				<tr>
					<td>${item.username}</td>
					<%-- <td>${item.password}</td> --%>
					<td>${item.fullname}</td>
					<td>${item.photo}</td>
					<td>${item.email}</td>
					<td>${item.phone}</td>
					<td>${item.status}</td>
					<td>${item.role? "Admin" : "Staff"}</td>
					<td><a class="btn btn-info"
						href="${pageContext.request.contextPath}/admin/user/edit?id=${item.username}">Edit</a>
						<a class="btn btn-danger"
						href="${pageContext.request.contextPath}/admin/user/delete?id=${item.username}">Banned</a>
					</td>
				</tr>
			</c:forEach>
			<!-- Add more rows dynamically using JavaScript -->
		</tbody>
	</table>

<h2>Users banned</h2>
	<table class="table">
		<thead>
			<tr>
				<th>Username</th>
				<!-- <th>Password</th> -->
				<th>Full Name</th>
				<th>Photo</th>
				<th>Email</th>
				<th>Phone</th>
				<th>Status</th>
				<th>Role</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list2}" var="item">
				<tr>
					<td>${item.username}</td>
					<%-- <td>${item.password}</td> --%>
					<td>${item.fullname}</td>
					<td>${item.photo}</td>
					<td>${item.email}</td>
					<td>${item.phone}</td>
					<td>${item.status}</td>
					<td>${item.role? "Admin" : "Staff"}</td>
					<td><a class="btn btn-info"
						href="${pageContext.request.contextPath}/admin/user/edit?id=${item.username}">Edit</a>
						<a class="btn btn-danger"
						href="${pageContext.request.contextPath}/admin/user/unban?id=${item.username}">Unban</a>
					</td>
				</tr>
			</c:forEach>
			<!-- Add more rows dynamically using JavaScript -->
		</tbody>
	</table>
</div>