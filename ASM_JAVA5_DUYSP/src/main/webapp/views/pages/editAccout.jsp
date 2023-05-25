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
	min-height: 600px
}

.anh {
	height: 250px;
	width: 250px;
	border-radius: 50%;
	object-fit: cover;
	background: #dfdfdf;
}
</style>
<div class="container">
	<!-- Form section -->
	<div class="card">

		<div class="card-body">
			<form:form modelAttribute="users" method="POST"
				enctype="multipart/form-data">
				<div class="row">
					<div class="col-6">
						<div class="form-group">
							<label for="username">Username</label>
							<form:input type="text" class="form-control" path="username"
								id="username" />
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
					<div class=row>
						<div class="col-6">
							<input type="file" class="form-control" name="file" id="file" />
							<div class="form-group">
								<label for="email">Email</label>
								<form:input type="email" class="form-control" id="email"
									path="email" />
								<div class="form-group">
									<label for="phone">Phone</label>
									<form:input type="text" path="phone" class="form-control"
										id="phone" />
									<form:hidden path="role" class="form-control" id="phone" />
								</div>
							</div>
						</div>
						<div class="col-6">
							<div class="align-items-center" style="text-align: center">
								<img class=anh src="../../static/images/${users.photo}">
									<form:input path="photo" class="form-control-plaintext mx-auto"
										style="width:30%;text-align: center;" />
							</div>
						</div>
					</div>
				</div>


				<button type="submit"
					formaction="${pageContext.request.contextPath}/account/update"
					class="btn btn-primary">Update</button>
			</form:form>
		</div>
	</div>
</div>