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
										<span style="font-weight: bold; color: #e43c;">핫딜 수정
										</span>
									</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<form action="/admin/update_hotdealOk.do" method="post" id="myForm">
										<table class="table table-bordered">
											<thead>
												<tr align="center">
													<th>핫딜명</th>
													<th>식당코드</th>
													<th>유효기간</th>
													<th>발행갯수</th>
													<th>할인율</th>
													<th>내용</th>
													<!-- <th>음식사진</th> -->
												</tr>
											</thead>
											<tbody id="hotdeal_list_tbody">
												<tr align="center">
													<form id="hotdeal_add_form" method="POST" action="/admin/reg_hotdeal.action" 
													enctype="multipart/form-data">
														<input id="rscode" type="hidden" name="rscode" value="${hotdeal.rscode}" /> 
														<input id="hdcode" type="hidden" name="hdcode" value="${hotdeal.hdcode}" />
														<td><input id="hdname" type="text" size="7" name="hdname" value="${hotdeal.hdname}"></td>
														<td><input type="number" size="2" value="${hotdeal.rscode}" disabled></td> 
														<td><input id="hdstart" type="date" name="hdstart" value="${hotdeal.hdstart}"> ~ 
														<input id="hdend" type="date" name="hdend" value="${hotdeal.hdend}"></td>
														<td><input id="hdcnt" min="10" max="100" type="number" name="hdcnt" value="${hotdeal.hdcnt}"></td>
														<td><input id="hddiscount" min="1" max="100" type="number" name="hddiscount" value="${hotdeal.hddiscount}"></td>
														<td><input id="hdcomment" size="50" type="text" name="hdcomment" value="${hotdeal.hdcomment}"></td>
														<%-- <td><input type="file" name="file" required="required" value="${hotdeal.rscode}" /></td> --%>
													</form>
												</tr>
											</tbody>
										</table>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div>
					<input type="button" value="수정" class="button" style="float: right;" onclick="document.getElementById('myForm').submit();">
					</div>
				</div>
				
				<!-- Footer -->


			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->

		<!-- Scroll to Top Button-->

	<%@ include file="/WEB-INF/inc/CommonScript.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/assets/js/reg_hotdeal.js"></script>

</body>

</html>