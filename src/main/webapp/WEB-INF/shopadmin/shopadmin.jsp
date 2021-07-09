<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

  
<html>
<head>

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

.txt_line {
	width: 70px;
	padding: 0 5px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.review{ /* 리뷰 길이 조정 */
   width:300px; 
   height: 90px;
   text-overflow:ellipsis; 
   overflow: hidden; 
   display: block;
}
</style>

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<jsp:include page="shopadmin_sidebar.jsp"></jsp:include>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<jsp:include page="shopadmin_navbar.jsp"></jsp:include>
			<!-- Main Content -->
			<div id="content">

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Content Row -->
					<div class="row">

						<div class="col-xl-5 col-lg-7">
							<div class="card shadow mb-4">

								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h4>
										<span style="font-weight: bold; color: #e43c;">실시간 예약상황</span>
									</h4>
									<a href="/shopadmin/booking_list.shop?rscode=${rscode}"><button class="button">자세히보기</button></a>
								</div>
								<div class="card-body">
									<div class="table-responsive">
									
										<!-- 실시간 예약 반복 시작 -->
										<c:forEach var="booking" items="${bookingList}">
										<div class="card mb-4">
											<span class="entry-title"
												style="text-align: left; font-weight: bold; font-size: 20px;">
												<a href="#">고객명: ${booking.name}</a> <strong class="rate_point"
												style="margin-right: 1em; float: right; color: #ddd;">
													
											</strong>
											</span>
											<table style="margin-top: 5px;">
												<tbody>

													<tr>
														<th class="resv-info">예약 시간</th>
														<td style="padding-left: 10px;"><span>${booking.bkdate}</span>
														</td>
													</tr>
													<tr>
														<th>예약 인원</th>
														<td style="padding-left: 10px;"><span>${booking.bknum}명</span></td>
													</tr>
													<tr>
														<th>요구 사항</th>
														<td style="padding-left: 10px;">${booking.bkrequest}<span></span></td>
													</tr>
													<tr>
														<th>현재 상태</th>
														<td style="padding-left: 10px;"><span>결제 대기중</span></td>
													</tr>
												</tbody>
											</table>
										</div>
										</c:forEach>
										<!-- 실시간 예약 반복 끝 -->
										

									</div>
									<div id="dataTable_wrapper"
										class="dataTables_wrapper dt-bootstrap4">

										<div class="row">
											<div class="col-sm-12 col-md-5">
												<div class="dataTables_info" id="dataTable_info"
													role="status" aria-live="polite"></div>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-7 col-lg-7">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h4>
										<span style="font-weight: bold; color: #e43c;">실시간 핫딜상황</span><a
											href="/shopadmin/hotdeal_list.shop?rscode=${rscode}"><button
												style="float: right;" onclick="#" class="button">자세히보기</button></a>
									</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-bordered">
											<thead>
												<tr align="center">
													<th>핫딜코드</th>
													<th>핫딜명</th>
													<th>유효기간</th>
													<th>발행/전체</th>
													<th>할인율</th>
													<th>현재상태</th>
												</tr>
											</thead>
											<!-- 오늘날짜  formatDate => date타입을 String타입으로 변환 -->
											<jsp:useBean id="now" class="java.util.Date" />
											<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate"/>
											<c:out value="현재날짜 : ${nowDate}"/>  
											<!-- 실시간 핫딜 상황 for문 시작 -->
											<c:forEach var="hotdeal" items="${hotdealList}">
											<tbody>
												<tr align="center">
													<td>${hotdeal.hdcode}</td>
													<td>${hotdeal.hdname}</td>
													<td>${hotdeal.hdstart}~${hotdeal.hdend}</td>
													<td>${hotdeal.offercount} / ${hotdeal.hdcnt}</td>
													<td>${hotdeal.hddiscount}%</td>
													<td>
														<!-- 현재날짜보다 핫딜만료일자가 작으면 -->
														 <c:choose>
															<c:when test="${nowDate > hotdeal.hdend}">
																기간만료
															</c:when>
															
															<c:otherwise>
																진행중
															</c:otherwise>
														</c:choose>
													</td>
												</tr>
											</tbody>
											</c:forEach>
											<!-- 실시간 핫딜 상황 for문 끝 -->
										</table>
									</div>
								</div>
							</div>
						</div>


						<!-- Content Row -->

						<div class="row">

							<!-- Area Chart -->
							<div class="col-xl-8 col-lg-7"></div>

							<!-- Pie Chart -->
							<div class="col-xl-7 col-lg-5">
								<div class="card shadow mb-4"></div>
							</div>
						</div>

						<!-- Content Row -->
						<div class="row">

							<!-- Content Column -->
							<div class="col-lg-7 mb-4"></div>

							<div class="col-lg-12 mb-4">

								<!-- Illustrations -->
								<div class="card shadow mb-4">
									<div class="card-header py-3">
										<h4>
											<span style="font-weight: bold; color: #e43c;">리뷰관리</span><a
												href="/shopadmin/review_list.shop?rscode=${rscode}"><button
													style="float: right;" onclick="#" class="button">자세히보기</button></a>
										</h4>
									</div>
									<div class="card-body" style="width: 100%; height: 100%;">

										<div class="card-deck">
										<div class="row row-cols-2 row-cols-sm-4 g-4">
										<!-- 리뷰관리 for문 시작 -->
										<c:forEach var="review" items="${reviewList}">
											<div class="col">
											<div class="card">
												<div>
													<span style="float: left;">등록일:${review.rvdate}</span>
													<span style="float: right;">조회수:${review.rvcnt} 댓글:${review.replycount}</span>
												</div>
												<img class="card-img-top"
													src="/resources/assets/img/reviewpic/${review.rvimg}"
													alt="Card image cap">
												<div class="card-body">
													<p class="review"> ${review.rvcontent} </p>
												</div>
											</div>
											</div>
										</c:forEach>
										<!-- 리뷰관리 for문 끝 -->
										</div>
										</div>

									</div>
								</div>

							</div>
						</div>

					</div>
					<!-- /.container-fluid -->

				</div>
				<!-- End of Main Content -->

				<!-- Footer -->
				<footer class="sticky-footer bg-white">
					<div class="container my-auto">
						<div class="copyright text-center my-auto">
							<span>Copyright &copy; Your Website 2021</span>
						</div>
					</div>
				</footer>
				<!-- End of Footer -->

			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->

		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>

		
	</div>
</body>

</html>