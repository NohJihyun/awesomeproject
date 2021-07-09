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
.content {
	position: absolute;
	bottom: 80px;
	z-index: 7;
}

/* line 40, ../../Arafath/CL/December/231. Travel-02/HTML/scss/_destination.scss */
.content p {
	margin-bottom: 0;
	font-size: 22px;
	color: #fff;
	font-weight: 400;
	font-family: "Rubik", sans-serif;
	-webkit-transition: 0.3s;
	-moz-transition: 0.3s;
	-o-transition: 0.3s;
	transition: 0.3s;
}

/* line 47, ../../Arafath/CL/December/231. Travel-02/HTML/scss/_destination.scss */
.content p a {
	display: inline-block;
	background: #e43c5c;
	font-size: 15px;
	border-radius: 30px;
	font-weight: 400;
	padding: 0px 20px;
	height: 30px;
	width: 150px;
	text-align: center;
	line-height: 30px;
	color: #fff;
	margin-left: 5px;
	-webkit-transition: 0.3s;
	-moz-transition: 0.3s;
	-o-transition: 0.3s;
	transition: 0.3s;
}

/* line 62, ../../Arafath/CL/December/231. Travel-02/HTML/scss/_destination.scss */
.content:hover {
	-webkit-transform: translateY(-10px);
	-moz-transform: translateY(-10px);
	-ms-transform: translateY(-10px);
	transform: translateY(-10px);
}

td {
	text-align: left;
	padding: 8px;
}

td h3 {
	text-decoration: line-through
}

.review_button {
	display: inline-block;
	font-size: 16px;
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
	display: flex;
}

/* Create two equal columns that sits next to each other */
.column {
	flex: 50%;
	padding: 10px;
}
/* line 65, ../../Arafath/CL/December/231. Travel-02/HTML/scss/_destination.scss */
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
					<h1>핫딜 쿠폰</h1>
					<hr width="90%" color="red" size="5">
				</div>
				<div class="row">
					<div class="column">
						<h3>정렬</h3>
						<a style="border-style: solid; padding: 5px;"
							href="/mypage/myhotdeal_sort?orderby=hdend">만료일</a> <a
							style="border-style: solid; padding: 5px;"
							href="/mypage/myhotdeal_sort?orderby=hddiscount">할인률</a> <a
							style="border-style: solid; padding: 5px;"
							href="/mypage/myhotdeal_sort?orderby=rsname">식당이름</a>
					</div>
					<div class="column">
						<h3>쿠폰 보기</h3>
						<a style="border-style: solid; padding: 5px;"
							href="/mypage/myhotdeal_sort?orderby=expired">사용한 쿠폰 보기</a>
					</div>
				</div>
				
				<c:if test="${empty hotdeal_list}"><jsp:include page="nothing.jsp" /></c:if>

				<c:forEach items="${hotdeal_list}" var="hotdeal">

					<c:if test="${hotdeal.hdsusedate == null}">
						<div class="card mb-2 w-75 border-danger">
					</c:if>
					<c:if test="${hotdeal.hdsusedate != null}">
						<div class="card mb-s2 w-75 border-danger"
							style="pointer-events: none; opacity: 0.5; background: #CCC;">
					</c:if>

					<div class="row g-0">
						<div class="col-md-5">
							<img src="/resources/assets/img/portfolio/${hotdeal.hdimg}"
								class="img-thumbnail" alt="">
							<div class="content">
								<p class="d-flex align-items-center">
									<span class="col-md-8"><a>지금 ${hotdeal.hddiscount} %
											할인</a> </span>
								</p>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card-body">
								<h5 class="card-title">${hotdeal.rsname}</h5>
								<p class="card-text">
								<table>
									<tr>
										<td>식당 정보:</td>
										<td>${hotdeal.rsaddr}<br /> ${hotdeal.rstell}
										</td>
									</tr>
									<tr>
										<td>메뉴:</td>
										<td>${hotdeal.hdname}</td>
									</tr>
									<tr>
										<td>설명:</td>
										<td>${hotdeal.hdcomment}</td>
									</tr>
									<c:if test="${hotdeal.hdsusedate != null}">
										<tr>
											<td>사용일:</td>
											<td>${hotdeal.hdsusedate}</td>
										</tr>
									</c:if>
									<tr>
										<td>만료일:</td>
										<td>${hotdeal.hdend}</td>
									</tr>

								</table>
								</p>

							</div>
						</div>
						<div class="card-body col-sm-3">
							<button class="review_button" type="submit" formmethod="get"
								onclick="use(${hotdeal.hdsseq})">쿠폰 사용 하기</button>

						</div>
						<div class="card-body col-sm-3">
							<button class="review_button" type="submit" formmethod="get"
								onclick="del(${hotdeal.hdsseq})">쿠폰 취소</button>
						</div>
					</div>
			</div>

			</c:forEach>
			</div>
		</section>

	</main>
	<!-- End #main -->
	<script>
	function del(hdsseq) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='/mypage/myhotdeal_cancel?hdsseq='+hdsseq;
		}
	}	
	function use(hdsseq) {
		var chk = confirm("쿠폰을 사용 하시겠습니까?");
		if (chk) {
			location.href='/mypage/myhotdeal_use?hdsseq='+hdsseq;
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
