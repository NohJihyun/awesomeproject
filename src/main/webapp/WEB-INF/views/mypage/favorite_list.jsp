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
img {
	height: 200px;
	width: 200px;
}

tr {
	font-size: 20px;
}

td {
	text-align: left;
	padding: 8px;
	width: 30vw;
}

h5 {
	font-size: 25px;
}

i {
	font-size: 40px;
	padding: 10px;
	color: #FF0000;
}

.review_button {
	display: inline-block;
	font-size: 20px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	outline: none;
	color: #fff;
	background-color: #e43c;
	border: none;
	border-radius: 15px;
	width: 80%;
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
					<h1>즐겨 찾기</h1>
					<hr width="90%" color="red" size="5">
				</div>

				<c:if test="${empty favorite_list}"><jsp:include
						page="nothing.jsp" /></c:if>

				<c:forEach items="${favorite_list}" var="favorite">

					<div class="card-group border-danger w-75">
						<img src="/resources/assets/img/portfolio/${favorite.rsimg}"
							class="rounded float-left img-thumbnail" alt="...">

						<div class="card border-light col-sm-6">
							<div class="card-body">
								<h5 class="card-title">${favorite.rsname}</h5>
								<p class="card-text">
								<table>
									<tr>
										<td>식당 정보:</td>
										<td>${favorite.rsaddr}<br /> ${favorite.rstell}
										</td>
										<td><button class="review_button" onclick='location.href="/detail_shop?rscode=${favorite.rscode}"'>상세보기</button>
											<br /> <br />
											<button class="review_button" type="submit" formmethod="get"
												onclick="delfav(${favorite.rscode})">즐겨 찾기 취소</button>
									</tr>
								</table>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</section>

	</main>
	<!-- End #main -->
	<script>
	function delfav(rscode) {
		var chk = confirm("정말 취소하시겠습니까?");
		if (chk) {
			location.href='/mypage/favorite_cancel?rscode='+rscode;
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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	
</body>

</html>
