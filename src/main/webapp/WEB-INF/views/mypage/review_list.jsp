<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>iPortfolio Bootstrap Template - Index</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="/resources/assets/img/favicon.png" rel="icon">
<link href="/resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="/resources/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="/resources/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="/resources/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="/resources/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="/resources/assets/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: iPortfolio - v3.3.0
  * Template URL: https://bootstrapmade.com/iportfolio-bootstrap-portfolio-websites-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<style>
td {
	text-align: left;
}

.review_button {
	display: inline-block;
	font-size: 25px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	outline: none;
	color: #fff;
	background-color: #e43c;
	border: none;
	border-radius: 15px;
	width: 50%;
	height: 100%;
	align-items: center;
}

.review_button:hover {
	background-color: #ef4f91;
}

.review_button:active {
	background-color: #ef4f91;
	box-shadow: 0 3px #666;
	transform: translateY(4px);
}

.row {
	padding-top: 15px;
	padding-left: 15px;
}

.shop_table {
	font-size: 1.2rem;
	padding: 5px;
}

tr {
	padding: 20px;
}
</style>
<body>


	<!-- ======= Mobile nav toggle button ======= -->
	<i class="bi bi-list mobile-nav-toggle d-xl-none"></i>

	<!-- ======= Header ======= -->
	<header id="header" style="background: #e43c;">
		<jsp:include page="mypage_sidebar.jsp" />
	</header>
	<!-- End Header -->


	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section class="breadcrumbs">
			<jsp:include page="mypage_header.jsp" />
		</section>
		<!-- End Breadcrumbs -->

		<section class="inner-page">

			<div class="container">
				<div>
					<h1>리뷰 관리</h1>
					<hr width="90%" color="red" size="5">
				</div>

				<c:if test="${empty review_list}"><jsp:include
						page="nothing.jsp" /></c:if>
				<c:forEach items="${review_list}" var="review">
					<div class="row">
						<div class="card col-xl-8">

							<div class="card-header">
								<span class="entry-title"
									style="font-weight: bold; color: blue; font-size: 1.8rem;">${review.rsname}</span>
							</div>

							<table class="shop_table">
								<tbody>
									<tr>
										<th>예약 날짜:</th>
										<td>${review.bkdate}</td>
									</tr>
									<tr>
										<th>인원수:</th>
										<td>${review.bknum}인</td>
									</tr>
									<tr>
										<th>요구 사항:</th>
										<td>${review.bkrequest}</td>
									</tr>
									<tr>
										<th>예약 코드:</th>
										<td>${review.bkcode}</td>
									</tr>
								</tbody>
							</table>


							<c:choose>
								<c:when test="${review.rvcode == 0}">
									<div class="card-footer text-center">
										<a class="btn btn-info"
											href="/mypage/reg_review?rscode=${review.rscode}&bkcode=${review.bkcode}">리뷰
											작성</a>
									</div>
								</c:when>
								<c:when test="${review.rvcode > 0}">
									<div class="card-footer text-center">
										<a class="btn btn-success" 
											href="/mypage/show_review?rvcode=${review.rvcode}">
											리뷰 보기
										</a>
									</div>
								</c:when>
							</c:choose>

						</div>
					</div>

				</c:forEach>
			</div>





			<!--  Modal 추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel"></h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body" id="myModalbody"></div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" id="closeModal"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
			<!--  /.Modal -->
		</section>
		<!-- End #main -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"
			integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
			crossorigin="anonymous"></script>
		<script type="text/javascript">
			$(document).ready(function() {
			
			/* 	 $("#showr").on('click', function(){
					$("#myModal").modal("show");	
				});
				  */
				
				var content = '<c:out value="${showReview.rvcontent}" />';
				var title = '<c:out value="${showReview.rvtitle}" />';
				var img = '<c:out value="${showReview.rvimg}" />';
				
				checkModal(content, title, img);
				
				function checkModal(content, title, img) {
					if (title === '' || history.state) {
						return;
					}
					if (title != null) {
						$(".modal-title").html(title);
						 document.getElementById("myModalbody").innerHTML =content + 
						 "<img src='/resources/assets/img/reviewpic/"+img+"'>";
						//$(".modal-footer").html(cnt);
						$("#myModal").modal("show");
					}
					$("#myModal").modal("show");
				}
 
				$("#closeModal").on("click", function() {
					$("#myModal").modal("hide");
				});
			});
		</script>

	</main>
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="/resources/assets/vendor/aos/aos.js"></script>
	<script
		src="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script
		src="/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="/resources/assets/vendor/php-email-form/validate.js"></script>
	<script src="/resources/assets/vendor/purecounter/purecounter.js"></script>
	<script src="/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="/resources/assets/vendor/typed.js/typed.min.js"></script>
	<script
		src="/resources/assets/vendor/waypoints/noframework.waypoints.js"></script>

	<!-- Template Main JS File -->
	<script src="/resources/assets/js/main.js"></script>

</body>

</html>
