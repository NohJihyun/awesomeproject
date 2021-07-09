<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

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
<!-- bar-rating -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link rel="stylesheet" href="/[경로]/fontawesome-stars.css">
<script type="text/javascript" src="/[경로]/jquery.barrating.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<!-- =======================================================
      * Template Name: iPortfolio - v3.3.0
      * Template URL: https://bootstrapmade.com/iportfolio-bootstrap-portfolio-websites-template/
      * Author: BootstrapMade.com
      * License: https://bootstrapmade.com/license/
      ======================================================== -->
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

.stars label {
	font-size: 30px;
	margin: 0 3px;
	color: #ccc;
}

#star-1:checked ~ .footer .text::before {
	content: "싫어요";
	font-weight: bold;
}

#star-1:checked ~ .footer .numb::before {
	content: "5점 만점에 1점";
}

#star-2:checked ~ .footer .text::before {
	content: "별로에요";
	font-weight: bold;
}

#star-2:checked ~ .footer .numb::before {
	content: "5점 만점에 2점";
}

#star-3:checked ~ .footer .text::before {
	content: "평범해요";
	font-weight: bold;
}

#star-3:checked ~ .footer .numb::before {
	content: "5점 만점에 3점";
}

#star-4:checked ~ .footer .text::before {
	content: "좋아해요♡";
	font-weight: bold;
}

#star-4:checked ~ .footer .numb::before {
	content: "5점 만점에 4점";
}

#star-5:checked ~ .footer .text::before {
	content: "Awesome해요!";
	font-weight: bold;
}

#star-5:checked ~ .footer .numb::before {
	content: "5점 만점에 5점";
}

#star-2:checked ~ .content .emojis .slideImg {
	margin-top: -200px;
}

#star-3:checked ~ .content .emojis .slideImg {
	margin-top: -400px;
}

#star-4:checked ~ .content .emojis .slideImg {
	margin-top: -600px;
}

#star-5:checked ~ .content .emojis .slideImg {
	margin-top: -800px;
}

.stars label {
	font-size: 30px;
	margin: 0 3px;
	color: #ccc;
}

#star-1:hover ~ .content .stars .star-1, #star-1:checked ~ .content .stars .star-1,
	#star-2:hover ~ .content .stars .star-1, #star-2:hover ~ .content .stars .star-2,
	#star-2:checked ~ .content .stars .star-1, #star-2:checked ~ .content .stars .star-2,
	#star-3:hover ~ .content .stars .star-1, #star-3:hover ~ .content .stars .star-2,
	#star-3:hover ~ .content .stars .star-3, #star-3:checked ~ .content .stars .star-1,
	#star-3:checked ~ .content .stars .star-2, #star-3:checked ~ .content .stars .star-3,
	#star-4:hover ~ .content .stars .star-1, #star-4:hover ~ .content .stars .star-2,
	#star-4:hover ~ .content .stars .star-3, #star-4:hover ~ .content .stars .star-4,
	#star-4:checked ~ .content .stars .star-1, #star-4:checked ~ .content .stars .star-2,
	#star-4:checked ~ .content .stars .star-3, #star-4:checked ~ .content .stars .star-4,
	#star-5:hover ~ .content .stars .star-1, #star-5:hover ~ .content .stars .star-2,
	#star-5:hover ~ .content .stars .star-3, #star-5:hover ~ .content .stars .star-4,
	#star-5:hover ~ .content .stars .star-5, #star-5:checked ~ .content .stars .star-1,
	#star-5:checked ~ .content .stars .star-2, #star-5:checked ~ .content .stars .star-3,
	#star-5:checked ~ .content .stars .star-4, #star-5:checked ~ .content .stars .star-5
	{
	color: #fd4;
}

input[type="radio"] {
	display: none;
}
</style>
</head>

<body>
	<!-- ======= Mobile nav toggle button ======= -->
	<i class="bi bi-list mobile-nav-toggle d-xl-none"></i>
	<!-- ======= Header ======= -->
	<header id="header" style="background: #e43c;">
		<jsp:include page="mypage_sidebar.jsp" />
	</header>
	<!-- End Header -->
	<!-- ======= Breadcrumbs ======= -->

	<!-- End Breadcrumbs -->
	<main id="main">

		<section class="breadcrumbs">
			<jsp:include page="mypage_header.jsp" />
		</section>

		<section class="inner-page">
			<div class="container">
				<div class="row">

					<!-- Content Column -->

					<div class="card w-100 g-4">
						<div class="card-header">
							<h1>리뷰 작성</h1>
							<hr width="90%" color="red" size="5">
						</div>

						<div class="card-body">
							<form action="/mypage/submit_review" method="POST"
								enctype="multipart/form-data">
								<input type="hidden" name="rscode" value="${rscode}" /> <input
									type="hidden" name="bkcode" value="${bkcode}" /> <input
									type="hidden" name="id" value="${sessionScope.id }" />
								<div class="card-body">
									<table>
										<tr>
											<th>제목:</th>
											<td><input type="text" name="rvtitle" placeholder="제목"
												onfocus="this.placeholder=''"
												onblur="this.placeholder='리뷰 제목'" required="required"></td>
										</tr>

										<tr>
											<th>내용:</th>
											<td><textarea name="rvcontent" placeholder="내용" rows=15
													cols=80 wrap="hard" required="required"></textarea></td>
										</tr>
										<tr>
											<th>이미지 업로드</th>
											<td><input type="file" name="file" multiple="multiple"
												required="required"></td>
										</tr>
										<tr>
											<th>평점:</th>
											<td>
												<div class="wrapper">
													<input type="radio" name="rvscore" id="star-1" value="1"
														required> <input type="radio" name="rvscore"
														id="star-2" value="2" required> <input
														type="radio" name="rvscore" id="star-3" value="3" required>
													<input type="radio" name="rvscore" id="star-4" value="4"
														required> <input type="radio" name="rvscore"
														id="star-5" value="5" required>
													<div class="content">
														<div class="stars">
															<div class="outer" style="height: 50px; width: 250px;">
																<label for="star-1" class="star-1 fas fa-star"></label>
																<label for="star-2" class="star-2 fas fa-star"></label>
																<label for="star-3" class="star-3 fas fa-star"></label>
																<label for="star-4" class="star-4 fas fa-star"></label>
																<label for="star-5" class="star-5 fas fa-star"></label>
															</div>
														</div>
													</div>
													<div class="footer">
														<span class="text"></span> <span class="numb"></span>
													</div>
												</div>
											</td>
										</tr>

										<tr>
											<td>
												<button type="submit">리 뷰 등 록</button>
											</td>
										</tr>
									</table>
								</div>

							</form>

						</div>
					</div>
				</div>
			</div>
		</section>
	</main>

	<!-- End #main -->




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