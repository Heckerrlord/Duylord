<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="slideShow.jsp"%>
<div class="container">
	<div class="nTab">
		<div class="row">
			<div class="col-3">
				<h3>NEW PRODUCT</h3>
			</div>
			<div class="col-9">
				<ul class="nav justify-content-end">
					<li class="nav-item"><a class="nav-link active" href="#grass">TYPE
							1</a></li>
					<li class="nav-item"><a class="nav-link active" href="#candy">TYPE
							2</a></li>
					<li class="nav-item"><a class="nav-link active" href="#rock">TYPE
							3</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="nProduct">
		<div class="row">
			<c:forEach items="${products}" var="item">
				<div class="col-lg-3">
					<div class="card">
						<div class="image-container">
							<img src="../../static/images/${item.image}" class="card-img-top" style="  height: 171px;
        width: 304px; object-fit: cover;" />
							<div class="caption">
								<a class="nav-link"
									href="${pageContext.request.contextPath}/detail?id=${item.id}">Chi
									tiết</a>
							</div>
						</div>
						<div class="card-body">
							<div class="title">
								<h5 class="card-title">${item.name}</h5>
								<h5 class="card-price">Giá: ${item.price} VND</h5>
							</div>
							<div class="row">
								<div class="col-7">
									<p class="item-info">${item.brands.name}</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

			<div class="pageSwitch">
				<nav aria-label="Page navigation example">
					<c:set var="pageNum" value="${param.pageNum}" />
					<c:set var="nextPage" value="${pageNum != null ? pageNum + 1 : 2}" />
					<c:set var="prePage" value="${pageNum != null ? pageNum - 1 : 1}" />
					<ul class="pagination justify-content-end">
						<li class="page-item"><a class="page-link"
							href="<c:url value='${pageContext.request.contextPath}/index'>
    <c:choose>
        <c:when test="${pageNum != null}">
        <c:if test="${pageNum > 1}"><c:param name='pageNum' value='${prePage}'/> </c:if>
        </c:when>
        <c:otherwise>
            <c:param name='pageNum' value='1'/>
        </c:otherwise>
    </c:choose>
</c:url>"
							tabindex="-1" aria-disabled="true">Previous</a></li>


						<c:forEach begin="1" end="${totalPage}" varStatus="status">
							<li class="page-item"><a
								href="${pageContext.request.contextPath}/index?pageNum=${status.index}"
								class="page-link">${status.index}</a></li>
						</c:forEach>

						<li class="page-item"><a class="page-link"
							href="<c:url value='${pageContext.request.contextPath}/index'>
    <c:choose>
        <c:when test="${pageNum != null}">
            <c:param name='pageNum' value='${nextPage}'/>
        </c:when>
        <c:otherwise>
            <c:param name='pageNum' value='2'/>
        </c:otherwise>
    </c:choose>
</c:url>">Next</a>
						</li>
					</ul>
				</nav>
			</div>

		</div>
	</div>
	<%@include file="advertisement.jsp"%>
	<div class="row">
		<iframe
			src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.543365979773!2d105.73705594948436!3d21.050949492329853!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3134550cd52de961%3A0x9495e0bf9570552e!2zU-G7kSA2NiBuZ8O1IDIgTmd1ecOqbiBYw6E!5e0!3m2!1svi!2s!4v1676533030474!5m2!1svi!2s"
			width="600" height="450" style="border: 0" allowfullscreen=""
			loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
	</div>
</div>




