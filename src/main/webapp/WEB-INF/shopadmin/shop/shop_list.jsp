<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

td {
	text-align: left;
	padding: 10px;
}
</style>

</head>

<body>

	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Sidebar -->
		<jsp:include page="../shopadmin_sidebar.jsp"></jsp:include>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper">

			<!-- Main Content -->


			<jsp:include page="../shopadmin_navbar.jsp"></jsp:include>


			<div id=content>
				<!-- Content Row -->
				<div class="row">

					<!-- Content Column -->


					<div class="card w-50">
						<div class="card-header">
							<h4>
								<span style="font-weight: bold; color: #e43c;">식당관리</span> <a
									href="/shopadmin/update_shop.shop?rscode=${shopInfo.rscode}">
									<button style="float: right;" class="button">수정</button>
								</a>
							</h4>
						</div>

						<div class="card-body">


							<h2 class="card-title">
								<c:out value="${shopInfo.rsname}" /> <span></span>
							</h2>
							<table style="float: left;">
								<tr>
									<th>주소:</th>
									<td>도로명:<c:out value="${shopInfo.rsrode}" /><br /> <span
										class="Restaurant__InfoAddress--Rectangle">지번:</span> <span
										class="Restaurant__InfoAddress--Text"><c:out value="${shopInfo.rsaddr}"/></span>
									</td>
								</tr>
								<tr>
									<th>전화번호:</th>
									<td><c:out value="${shopInfo.rstell}"/></td>
								</tr>
								<tr>
									<th>음식 종류:</th>
									<td><span><c:out value="${shopInfo.rstype}"/></span></td>
								</tr>
								<tr>
									<th>가격대:</th>
									<td><c:out value="${shopInfo.rsprice}"/></td>
								</tr>
								<tr>
									<th>주차:</th>
									<td>
									<c:choose>
										<c:when test="${shopInfo.rsparking == 0}">
											주차불가
										</c:when>
										<c:otherwise>
											주차가능
										</c:otherwise>
									</c:choose>
									</td>
								</tr>
								<tr>
									<th>영업시간:</th>
									<td><c:out value="${shopInfo.rsopen}"/> - <c:out value="${shopInfo.rsclose}"/> </td>
								</tr>
								<tr>
									<th>휴일:</th>
									<td><c:out value="${shopInfo.rsoffday}" /></td>
								</tr>
								<tr>
									<th>메뉴:</th>
									<td class="menu_td">
										<ul class="Restaurant_MenuList">
											
											<c:forEach var="menu" items="${Menus}">
											<li class="Restaurant_MenuItem"><span
												class="Restaurant_Menu">${menu.mnname} </span> <span
												class="Restaurant_MenuPrice">${menu.mnprice}</span></li>
											</c:forEach>
										</ul>
									</td>
								</tr>
							</table>
						</div>
						<div class="card-footer">
							<p>업데이트 : <c:out value="${shopInfo.rsupdatedate}" /></p>
						</div>
				<%-- 	</c:forEach> --%>
						<!--  설명끝 -->
						<!-- 태그 -->

						<!--  태그끝 -->

					</div>

				</div>

			</div>


		</div>


	</div>


	<!-- End of Main Content -->

	<!-- Footer -->

	<!-- End of Footer -->


	<!-- End of Content Wrapper -->

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
</body>

</html>