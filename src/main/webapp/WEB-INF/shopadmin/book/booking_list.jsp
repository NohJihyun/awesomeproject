<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<jsp:include page="../shopadmin_sidebar.jsp"></jsp:include>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<jsp:include page="../shopadmin_navbar.jsp"></jsp:include>
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
										<span style="font-weight: bold; color: #e43c;">실시간 예약상황
											<span style="float: right;">
												<form action="/shopadmin/booking_list.shop" method="get">
													<input style=" width: 140px; height: 30px;" type="text" name="search" placeholder="고객명입력" onfocus="this.placeholder=''" onblur="this.placeholder='고객명입력'">
													<input type="hidden" name="rscode" value="${rscode}">
													<input value="검색" type="submit" class="button">
												</form>
											</span> 
										</span>
									</h4>
								</div>
								<div class="card-body" style="overflow-y: scroll;">
									<div class="table-responsive">

										<table class="table table-bordered">
											<thead>
												<tr align="center">
													<th>예약코드</th>
													<th>고객명</th>
													<th>고객연락처</th>
													<th>예약날짜/시간</th>
													<th>인원수</th>
													<th>요구사항</th>
													<th>현재상태</th>
													<th>비고</th>
												</tr>
											</thead>
											
											
										<!--  foreach 문 시작 -->
										<c:forEach var="booking" items="${bookingList}">
											<tbody>
												<tr align="center">
													<td>${booking.bkcode}</td>
													<td>${booking.name}</td>
													<td>${booking.phonenum}</td>
													<td>${booking.bkdate}</td>
													<td>${booking.bknum}</td>
													<td>${booking.bkrequest}</td>
													<td>
												    <c:choose>
                              							<c:when test="${booking.bknoshow == 1}">
                              							노쇼 
                              							</c:when>
													   <c:when test="${booking.bkapprove == 0 && booking.bkcomplete==0}">
														예약 확인 대기중
														</c:when>
														 <c:when test="${booking.bkapprove == 1 && booking.bkcomplete==0}">
														예약 확인 완료
														</c:when>
													    <c:when test="${booking.bkcomplete == 1}">
													    예약 방문 완료
													    </c:when>
													</c:choose>
													</td>
													<td>
														<c:choose>
														<c:when test="${booking.bkapprove == 0 && booking.bkcomplete==0 && booking.bknoshow == 0}">
															<button class="button" onclick="location.href='/shopadmin/bookingApprove.shop?bkcode=${booking.bkcode}'">예약승인</button>
														</c:when>
														</c:choose>
														
														<c:choose>
														<c:when test="${booking.bkapprove == 1 && booking.bkcomplete==0 && booking.bknoshow == 0}">
															<button class="button" onclick="location.href='/shopadmin/bookingNoShow.shop?bkcode=${booking.bkcode}'">노쇼처리</button>
															<button class="button" onclick="location.href='/shopadmin/bookingComplete.shop?bkcode=${booking.bkcode}'">방문확인</button>
														</c:when>
														</c:choose>
													</td>
												</tr>
											</tbody>
										</c:forEach>
										<!--  foreach 문 종료 -->
										</table>
										<!--  페이징처리 시작 -->
										<div align="center">
											
										    <c:if test="${pageMaker.prev }">

										        <a href='<c:url value="/shopadmin/booking_list.shop?rscode=${rscode}&search=${search}&page=${pageMaker.startPage-1 }"/>'>
										         <input value="이전" type="button" class="button">
										         </a>

										    </c:if>
										    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">

										        <a href='<c:url value="/shopadmin/booking_list.shop?rscode=${rscode}&search=${search}&page=${pageNum }"/>'>
										        <i class="fa"><input value="${pageNum}" type="button" class="button"></i></a>

										    </c:forEach>
										    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">

										        <a href='<c:url value="/shopadmin/booking_list.shop?rscode=${rscode}&search=${search}&page=${pageMaker.endPage+1 }"/>'>
										        <input value="다음" type="button" class="button">
										        </a>
										    </c:if>

										</div>
										<!--  페이징처리 끝 -->
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
		
		<!--  Modal 추가 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">Modal Title</h4>
					</div>
					<div class="modal-body">처리가 완료되었습니다.</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" id="closeModal" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save changes</button>
					</div>
				</div>
			</div>
		</div>
	 	<!--  /.Modal -->

	<!--  Modal javascript -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>	 	
	<script type="text/javascript">
		$(document).ready(function() {
			
			var result = '<c:out value="${result}" />';
			
			checkModal(result);
			
			history.replaceState({}, null, null);
			
			function checkModal(result) {
				if(result === '' || history.state) {
					return;	
				}
				
				if(result != null) {
					$(".modal-body").html(result);
				}
				$("#myModal").modal("show");
			}
			
			$("#closeModal").on("click", function(){
				$("#myModal").modal("hide");
			});
		});
	</script>
	 	
	 		
	</div>
</body>

</html>