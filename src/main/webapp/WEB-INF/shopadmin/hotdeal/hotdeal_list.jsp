<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
										<span style="font-weight: bold; color: #e43c;">실시간 핫딜상황
											<span style="float: right;">
												<form action="/shopadmin/hotdeal_list.shop" method="get">
													<input style=" width: 140px; height: 30px;" type="text" name="search" value="${search}" placeholder="핫딜명검색" onfocus="this.placeholder=''" onblur="this.placeholder='핫딜명검색'">
													<input type="hidden" name="rscode" value="${rscode}">
													<input value="검색" type="submit" class="button">
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
											
											<c:if test="${empty hotdealList}">
											<tbody>
											<tr align="center"><td colspan="6"><font color="blue">조회한 결과가 없습니다.</font></td>
											</tr>
											</tbody>
											</c:if>
											
											<c:forEach var="hotdeal" items="${hotdealList}">
											<tbody>
												<tr align="center">
													<td>${hotdeal.hdcode}</td>
													<td>${hotdeal.hdname}</td>
													<td>${hotdeal.hdstart} ~ ${hotdeal.hdend}</td>
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
										</table>
										<!--  페이징처리 시작 -->
										<div align="center">
											
										    <c:if test="${pageMaker.prev }">

										        <a href='<c:url value="/shopadmin/hotdeal_list.shop?rscode=${rscode}&search=${search}&page=${pageMaker.startPage-1 }"/>'>
										         <input value="이전" type="button" class="button">
										         </a>

										    </c:if>
										    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">

										        <a href='<c:url value="/shopadmin/hotdeal_list.shop?rscode=${rscode}&search=${search}&page=${pageNum }"/>'>
										        <i class="fa"><input value="${pageNum}" type="button" class="button"></i></a>

										    </c:forEach>
										    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">

										        <a href='<c:url value="/shopadmin/hotdeal_list.shop?rscode=${rscode}&search=${search}&page=${pageMaker.endPage+1 }"/>'>
										        <input value="다음" type="button" class="button">
										        </a>
										    </c:if>

										</div>
										<!--  페이징처리 끝 -->
									</div>
								</div>
							</div>
						</div>



					</div>
				</div>

				<!-- Footer -->


			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->

		<!-- Scroll to Top Button-->

		
	</div>
</body>

</html>