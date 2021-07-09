<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<style>
.button {
	display: inline-block;
	padding: 8px 15px;
	font-size: 16px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	outline: none;
	color: #fff;
	background-color: #e43c;
	border: none;
	border-radius: 15px;
	box-shadow: 0 9px #999;
}

.button:hover {
	background-color: #ef4f91;
}

.button:active {
	background-color: #ef4f91;
	box-shadow: 0 3px #666;
	transform: translateY(4px);
}

th, tr {
	text-align: center;
}
</style>

</head>

<!-- Page Wrapper -->
<div id="wrapper">

	<!-- Sidebar -->
	<jsp:include page="admin_sidebar.jsp"></jsp:include>
	<!-- End of Sidebar -->

	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">
		<jsp:include page="admin_navbar.jsp"></jsp:include>
		<!-- Main Content -->
		<div id="content">

			<!-- Begin Page Content -->
			<div class="container-fluid">
		<c:choose>
				<c:when test="${sessionScope.role eq 'ADMIN'}">
				<!-- Content Row -->
				<div class="row">

					<div class="col-xl-7 col-lg-7">
						<div class="card shadow mb-4">
					
							<div
								class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
								<h4>
									<span style="font-weight: bold; color: #e43c;">식당관리</span>
								</h4>
								<a href="shop_list.do"><button class="button">자세히보기</button></a>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered">
										<thead>
											<tr align="center">
												<th>식당명</th>
												<th>주소</th>
												<th>전화번호</th>
											</tr>
										</thead>



											<c:forEach var="shop" items="${shoplist}">
											
											<tbody>
													<tr align="center">
														<td>${shop.rsname}</td>
														<td>${shop.rsaddr}</td>
														<td>${shop.rstell}</td>
													</tr>
												</tbody>
											</c:forEach>


									</table>
								</div>
							</div>
						</div>
					</div>

					<!-- col-xl-5 = 가로길이 -->
					<div class="col-xl-5 col-lg-7">
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h4>
									<span style="font-weight: bold; color: #e43c;">회원관리</span><a
										href="user_list.do"><button style="float: right;"
											class="button">자세히보기</button></a>
								</h4>
							</div>
							<div class="card-body" style="overflow: hidden; height: 305px;">
								<div class="table-responsive">
									<table class="table table-bordered">
										<thead>
											<tr align="center">
												<th>이름</th>
												
												<th>아이디</th>
												<th>이메일</th>
											</tr>
										</thead>
										<c:forEach var="users" items="${usersinfo}">
											<tbody>
												<tr align="center">
													<td>${users.name}</td>
													
													<td>${users.id}</td>
													<td>${users.email}</td>
												</tr>
											</tbody>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
					</div>
						</c:when>
					</c:choose>
							<!-- Illustrations -->
							<div class="card shadow mb-4">
								<div class="card-header py-3">

									<h4>
										<span style="font-weight: bold; color: #e43c;">리뷰관리</span><a
											href="/admin/proReview_list.do"><button style="float: right;"
												class="button">자세히보기</button></a>
									</h4>
								</div>
								<div class="row row-cols-2 row-cols-sm-4 g-7">
									<c:forEach var="review" items="${reviewlist}">
											<div class="col">
												<div class="card">
													<div class="card text-dark bg-light">
													<div class="card-header">
														<span style="float: left;">${review.rvdate.substring(0,10)}</span><span
														style="float: right;">조회수:${review.rvcnt}</span>
													</div>
														<img src="/resources/assets/img/reviewpic/${review.rvimg}" class="card-img-top" width="300" height="300">
														<div class="card-header">${review.rsname}</div>
														<div class="card-body">
															<h5 class="card-title">${review.nickname}</h5>
														</div>
													</div>
												</div>
											</div>
									</c:forEach>
										</div>
								</div>
							</div>

						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->


	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

</html>