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
										<span style="font-weight: bold; color: #e43c;">회원정보</span>
										<span style="float: right;">
										<Form action="/admin/user_list.do" method="get">
										<input style=" width: 140px; height: 30px;" type="text" name="search" value="${search}" placeholder="이름검색">
										<input value="검색" type="submit" class="button">
										</Form></span>
										
									</h4>
								</div>
								
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-bordered">
											<thead>
												<tr align="center">
													<th>이름</th>
													<th>닉네임</th>
													<th>전화번호</th>
													<th>아이디</th>
													<th>이메일</th>
												</tr>
											</thead>
											<c:forEach var="users" items="${usersinfo}">
											<tbody>
												<tr align="center">
													<td>${users.name}</td>
													<td>${users.nickname}</td>
													<td>${users.phonenum}</td>
													<td>${users.id}</td>
													<td>${users.email}</td>
												</tr>
											</tbody>
											</c:forEach>
										</table>
										
										<!--  페이징처리 시작 -->
										<div align="center">
											
										    <c:if test="${pageMaker.prev }">

										        <a href='<c:url value="/admin/user_list.do?search=${search}&page=${pageMaker.startPage-1 }"/>'>
										         <input value="이전" type="button" class="button">
										         </a>

										    </c:if>
										    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">

										        <a href='<c:url value="/admin/user_list.do?search=${search}&page=${pageNum }"/>'>
										        <i class="fa"><input value="${pageNum}" type="button" class="button"></i></a>

										    </c:forEach>
										    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">

										        <a href='<c:url value="/admin/user_list.do?search=${search}&page=${pageMaker.endPage+1 }"/>'>
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
	</div>
</body>

</html>