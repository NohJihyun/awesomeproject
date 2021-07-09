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
					<h1>예약 및 방문 관리</h1>
					<hr width="90%" color="red" size="5">
				</div>
				
				<c:if test="${empty booking_list}"><jsp:include page="nothing.jsp" /></c:if>
				
				<c:forEach items="${booking_list}" var="booking">
					<div class="row">
						<div class="card col-xl-8">

							<div class="card-header">
								<span class="entry-title"
									style="font-weight: bold; color: blue; font-size: 1.8rem;">${booking.rsname}</span>
							</div>

							<table class="shop_table">
								<tbody>
									<tr>
										<th>예약 날짜:</th>
										<td>${booking.bkdate}</td>
									</tr>
									<tr>
										<th>인원수:</th>
										<td>${booking.bknum}인</td>
									</tr>
									<tr>
										<th>요구 사항:</th>
										<td>${booking.bkrequest}</td>
									</tr>

									<c:choose>
										<c:when test="${booking.bknoshow == 1}">
											<tr>
												<th>현재 상태:</th>
												<td>노쇼</td>
											</tr>
										</c:when>
										<c:when
											test="${booking.bkapprove == 0 && booking.bkcomplete==0}">
											<tr>
												<th>현재 상태:</th>
												<td>예약 확인 대기중</td>
											</tr>
										</c:when>
										<c:when
											test="${booking.bkapprove == 1 && booking.bkcomplete==0}">
											<tr>
												<th>현재 상태:</th>
												<td>예약 확인 완료</td>
											</tr>
										</c:when>
										<c:when test="${booking.bkcomplete == 1}">
											<tr>
												<th>현재 상태:</th>
												<td>예약 방문 완료</td>
											</tr>
										</c:when>
									</c:choose>

									<c:choose>
										<c:when test="${booking.bknoshow == 0}">

										</c:when>
										<c:when test="${booking.bknoshow == 1}">
											<tr>
												<th>노쇼 여부:</th>
												<td>노쇼</td>
											</tr>
										</c:when>

									</c:choose>

									<tr>
										<th>예약 코드:</th>
										<td>${booking.bkcode}</td>
									</tr>
								</tbody>
							</table>

							<c:choose>
								<c:when test="${booking.bknoshow == 1}">
									<div class="card-footer text-center">
										<a class="btn btn-danger">노쇼</a>
									</div>
								</c:when>
								<c:when
									test="${booking.bknoshow == 0 && booking.bkapprove == 0}">
									<div class="card-footer text-center">
										<button class="review_button" type="submit" formmethod="get"
											onclick="delbk(${booking.bkcode})">예약 취소</button>
									</div>
								</c:when>
								<c:when test="${booking.bkcomplete == 0}">
									<div class="card-footer text-center">
										<a class="btn btn-success">식당 예약 확인 완료</a>
									</div>
								</c:when>
								<c:when
									test="${booking.bkapprove == 1 && booking.bkcomplete == 1}">
									<div class="card-footer text-center">
										<a class="btn btn-info">식당 사용 완료</a>
									</div>
								</c:when>
							</c:choose>

						</div>
					</div>

				</c:forEach>
			</div>

		</section>


	</main>
	<!-- End #main -->

	<script>
	function delbk(bkcode) {
		var chk = confirm("정말 취소하시겠습니까?");
		if (chk) {
			location.href='/mypage/booking_cancel?bkcode='+bkcode;
		}
	}	
	</script>


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
