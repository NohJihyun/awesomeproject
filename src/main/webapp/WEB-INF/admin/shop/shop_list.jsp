<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<script src="//code.jquery.com/jquery.min.js"></script>


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
										<span style="font-weight: bold; color: #e43c;">식당관리<span style="float: right;">
										<Form action="/admin/shop_list.do" method="get">
										<input style=" width: 140px; height: 30px;" type="text" name="search" value="${search}" placeholder="식당명검색">
										<input value="검색" type="submit" class="button">
										</Form>
										
										</span></span>
										
									</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-bordered">
											<thead>
												<tr align="center">
													<th>식당명</th>
													<th>주소</th>
													<th>전화번호</th>
													<th>영업시간</th>
													<th>휴무일</th>
													<th>조회수</th>
													<th>최종업데이트</th>
													<th>식당관리</th>
													<th>인증마크</th>
												</tr>
											</thead>
											<c:forEach var="shop" items="${shoplist}">
											<tbody>
											<c:choose>
											<c:when test="${shop.rsleave eq 1}">
												<tr align="center" style="background:#d3d3d3;" >
													<td>${shop.rsname}</td>
													<td>${shop.rsaddr}</td>
													<td>${shop.rstell}</td>
													<td>${shop.rsopen} ~ ${shop.rsclose}</td>
													<td>${shop.rsoffday}</td>
													<td>${shop.rscnt}</td>
													<td>${shop.rsupdatedate.substring(0,10)}</td>
													
													<td>
													<c:choose>
														<c:when test="${shop.rsleave eq 0}">
													<a href="/admin/updateShop.do?rscode=${shop.rscode}"><button class=button style="padding: 3px 6px;"><font size="3px;">식당취소</font></button></a>
														</c:when>
														
														<c:when test="${shop.rsleave eq 1}">
													<a href="/admin/deleteShop.do?rscode=${shop.rscode}"><button class=button style="padding: 3px 6px;"><font size="3px;">식당등록</font></button></a>
														</c:when>														
													</c:choose>
													</td>
													
													<td>
													
													 <c:choose>
														<c:when test="${shop.rsmark eq 0}">
													<a href="/admin/markUpdateShop.do?rscode=${shop.rscode}"><button class=button style="padding: 3px 6px;"><font size="3px;">인증허용</font></button></a>
														</c:when>
														
														<c:when test="${shop.rsmark eq 1}">
													<a href="/admin/markdeleteShop.do?rscode=${shop.rscode}"><button class=button style="padding: 3px 6px;"><font size="3px;">인증취소</font></button></a>
														</c:when>														
													</c:choose>
													
													</td>
												</tr>
												</c:when>
												
												<c:when test="${shop.rsleave eq 0}">
												<tr align="center">
													<td>${shop.rsname}</td>
													<td>${shop.rsaddr}</td>
													<td>${shop.rstell}</td>
													<td>${shop.rsopen} ~ ${shop.rsclose}</td>
													<td>${shop.rsoffday}</td>
													<td>${shop.rscnt}</td>
													<td>${shop.rsupdatedate.substring(0,10)}</td>
													
													<td>
													<c:choose>
														<c:when test="${shop.rsleave eq 0}">
													<a href="/admin/updateShop.do?rscode=${shop.rscode}"><button class=button style="padding: 3px 6px;"><font size="3px;">식당취소</font></button></a>
														</c:when>
														
														<c:when test="${shop.rsleave eq 1}">
													<a href="/admin/deleteShop.do?rscode=${shop.rscode}"><button class=button style="padding: 3px 6px;"><font size="3px;">식당등록</font></button></a>
														</c:when>														
													</c:choose>
													</td>
													
													<td>
													
													 <c:choose>
														<c:when test="${shop.rsmark eq 0}">
													<a href="/admin/markUpdateShop.do?rscode=${shop.rscode}"><button class=button style="padding: 3px 6px;"><font size="3px;">인증허용</font></button></a>
														</c:when>
														
														<c:when test="${shop.rsmark eq 1}">
													<a href="/admin/markdeleteShop.do?rscode=${shop.rscode}"><button class=button style="padding: 3px 6px;"><font size="3px;">인증취소</font></button></a>
														</c:when>														
													</c:choose>
													
													</td>
												</tr>
												</c:when>
												
												</c:choose>
											</tbody>
											</c:forEach>
										</table>
											
										<!--  페이징처리 시작 -->
										<div align="center">
											
										    <c:if test="${pageMaker.prev }">

										        <a href='<c:url value="/admin/shop_list.do?search=${search}&page=${pageMaker.startPage-1 }"/>'>
										         <input value="이전" type="button" class="button">
										         </a>

										    </c:if>
										    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">

										        <a href='<c:url value="/admin/shop_list.do?search=${search}&page=${pageNum }"/>'>
										        <i class="fa"><input value="${pageNum}" type="button" class="button"></i></a>

										    </c:forEach>
										    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">

										        <a href='<c:url value="/admin/shop_list.do?search=${search}&page=${pageMaker.endPage+1 }"/>'>
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
					<a href="/admin/reg_shop.do"><input type="button" value="식당 등록" class="button" style="float: right;"></a>
				</div>
			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->

		<!-- Scroll to Top Button-->

		<!-- Logout Modal-->
	
	</div>
</body>

</html>