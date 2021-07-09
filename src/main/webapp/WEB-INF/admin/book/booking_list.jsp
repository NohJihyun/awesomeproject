<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

.resv-info {
	width: 80px;
}

th {
	font-size: 15px;
}

td {
	font-size: 15px;
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
							<div class="card shadow ">
								<div class="card-header py-3">
									<h4 class="m-0 font-weight-bold text-primary">실시간 예약상황</h4>
								</div>
								<div class="card-body" style="overflow-y: scroll;">
									<div class="table-responsive">

										<table class="table table-bordered">
											<thead>
												<tr align="center">
													<th>예약날짜</th>
													<th>예약시간</th>
													<th>인원수</th>
													<th>요구 사항</th>
													<th>현재상태</th>
													<th>식당이름</th>
												</tr>
											</thead>
											<tbody>
												<tr align="center">
													<td>20210617</td>
													<td>1300</td>
													<td>4</td>
													<td>창가쪽으로 잡아주세요</td>
													<td>대기중</td>
													<td>아무개식당</td>
												</tr>

												<tr align="center">
													<td>20210617</td>
													<td>1300</td>
													<td>4</td>
													<td>커플실로해주세요</td>
													<td>예약취소</td>
													<td>가나다</td>
												</tr>

												<tr align="center">
													<td>20210617</td>
													<td>1300</td>
													<td>4</td>
													<td>옥상으로 잡아주세요</td>
													<td>예약시간초과</td>
													<td>으앙ㅋㅇ</td>
												</tr>

												
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>



						<!-- Content Row -->


						<!-- Content Row -->

					</div>
				</div>

				<!-- Footer -->

				<!-- End of Footer -->

			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->

		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>

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
</body>

</html>