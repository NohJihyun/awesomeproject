<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
	<meta charset="UTF-8">

	<style>
	.resv-info {
		width: 80px;
	}

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


	</style>

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<jsp:include page="../admin_sidebar.jsp"></jsp:include>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<jsp:include page="../admin_navbar.jsp"></jsp:include>
			<!-- Main Content -->
			<div id="content">



				<!-- Begin Page Content -->
				<div class="container-fluid">



					<!-- Content Row -->
					<div class="row">

						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h4>
										<span style="font-weight: bold; color: #e43c;">핫딜 등록
											<span style="float: right;">
											<!-- 식당검색 -->
											<form action="/admin/reg_hotdeal.do" method="GET">
												<input type="text" size="10" value="${search}" name="search" placeholder="식당이름" onfocus="this.placeholder=''" />
												<input type="submit" value="식당조회" class="button" />
											</form>
											</span>
										</span>
									</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-bordered">
											<thead>
												<tr align="center">
													<th>핫딜명</th>
													<th>식당코드</th>
													<th>유효기간</th>
													<th>발행갯수</th>
													<th>할인율</th>
													<th>내용</th>
													<th>음식사진</th>
												</tr>
											</thead>
											<tbody id="hotdeal_list_tbody">
												<tr align="center">
													<form id="hotdeal_add_form" method="POST" action="/admin/reg_hotdeal.action" enctype="multipart/form-data">
														<input id="rscode" type="hidden" name="rscode" value="${rscode}" /> <%--disabled 쓰기위해서 히든으로 따로 만들어 두어야 데이터가 이동한다. --%>
														<td><input id="hdname" type="text" size="7" name="hdname"></td>
														<td><input type="number" size="5" value="${rscode}" disabled></td> <%--disabled 쓰려면 히든으로 따로 만들어 두어야 데이터가 이동한다. --%>
														<td><input id="hdstart" type="date" name="hdstart"> ~ <input id="hdend" type="date" name="hdend"><%-- ${hotdeal.hdstart}~ ${hotdeal.hdend} --%></td>
														<td><input id="hdcnt" min="10" max="100" type="number" name="hdcnt"><%-- ${hotdeal.offercount} / ${hotdeal.hdcnt} --%></td>
														<td><input id="hddiscount" min="1" max="100" type="number" name="hddiscount"><%-- ${hotdeal.hddiscount}% --%></td>
														<td><input id="hdcomment" size="50" type="text" name="hdcomment"><!-- 현재상태(오늘날짜>hdend 기준) --></td>
														<td><input type="file" name="file" required="required" /></td>
													</form>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div>
					<a href="javascript:;" id="regButton"><input type="button" value="등록" class="button" style="float: right;"></a>
					</div>
				</div>

				<!-- Footer -->


			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->

		<!-- Scroll to Top Button-->

		<!-- Logout Modal-->
		<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">로그아웃 하시게습니까?</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>

					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">취소</button>
						<a class="btn btn-primary" href="login">로그아웃</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/inc/CommonScript.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/assets/js/reg_hotdeal.js"></script>

</body>

</html>