<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 오늘날짜  formatDate => date타입을 String타입으로 변환 -->
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate" />

<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Tempo Bootstrap Template - Index</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="resources/assets/img/favicon.png" rel="icon">
<link href="resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="resources/assets/vendor/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<link href="resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="resources/assets/vendor/boxicons/css/boxicons.css"
	rel="stylesheet">
<link href="resources/assets/vendor/glightbox/css/glightbox.css"
	rel="stylesheet">
<link href="resources/assets/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link href="resources/assets/vendor/swiper/swiper-bundle.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="resources/assets/css/style_sub_page.css" rel="stylesheet">

<!-- Vendor JS Files -->
<script src="resources/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<script src="resources/assets/vendor/glightbox/js/glightbox.js"></script>
<script src="resources/assets/vendor/isotope-layout/isotope.pkgd.js"></script>
<script src="resources/assets/vendor/php-email-form/validate.js"></script>


<!-- Template Main JS File -->
<script src="resources/assets/js/main.js"></script>

</head>
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

.section-title {
	padding-top: 5%;
}

.card-group {
	display: flex;
}

.content {
	position: absolute;
	bottom: 450px;
	z-index: 7;
}

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

.content p a {
	display: inline-block;
	background: #e43c5c;
	font-size: 15px;
	border-radius: 30px;
	font-weight: 400;
	padding: 0px 10px;
	height: 30px;
	width: 150px;
	text-align: center;
	line-height: 25px;
	color: #fff;
	margin-left: 5px;
	-webkit-transition: 0.3s;
	-moz-transition: 0.3s;
	-o-transition: 0.3s;
	transition: 0.3s;
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
	font-size: 20px;
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
</style>
<body>


	<!-- ======= Header ======= -->

	<jsp:include page="../common/main_header.jsp" />

	<!-- End Header -->


	<main id="main">

		<section id="portfolio" class="portfolio">
			<div class="container">
				<div class="section-title">
					<h2>핫딜 쿠폰</h2>
				</div>

				<div class="row">
					<div class="column">
						<h3>정렬</h3>
						<a style="border-style: solid; padding: 5px;"
							href="/hotdeal_list?hdorderby=hdstart">등록일</a> <a
							style="border-style: solid; padding: 5px;"
							href="/hotdeal_list?hdorderby=hdend">만료일</a> <a
							style="border-style: solid; padding: 5px;"
							href="/hotdeal_list?hdorderby=hddiscount">할인률</a> <a
							style="border-style: solid; padding: 5px;"
							href="/hotdeal_list?hdorderby=hdcnt">남은 핫딜 겟수</a>
					</div>
				</div>
				<h1></h1>
				<div class="row row-cols-2 row-cols-sm-3 g-4">

					<c:forEach items="${hotdeal_List}" var="hotdeal">
						<div class="col">
							<div class="card">
								<div class="card text-dark bg-light">
									<img src="resources/assets/img/hotdeal/${hotdeal.hdimg}"
										class="card-img-top">
									<div class="card-header">지금 ${hotdeal.hddiscount}% 할인</div>
									<div class="card-body">
										<h5 class="card-title">${hotdeal.hdname}
											${hotdeal.hdcode}</h5>
										<p class="card-text">
										<table>
											<tr>
												<th>설명:</th>
												<td>${hotdeal.hdcomment}</td>
											</tr>
											<tr>
												<th>만료일:</th>
												<td>${hotdeal.hdend}</td>
											</tr>
											<tr>
												<th>발행된 쿠폰 갯수:</th>
												<td>${hotdeal.hdcount}/${hotdeal.hdcnt}</td>
											</tr>
										</table>
										</p>
									</div>
								</div>
								<div class="card-body text-center bg-light">
									<c:choose>
										<c:when test="${nowDate > hotdeal.hdend}">
											<button class="review_button">기간만료</button>
										</c:when>
										<c:otherwise>

											<button class="review_button"
												onclick="location.href='/hotdeal/hotdeal_get?hdcode=${hotdeal.hdcode}&id=test'">
												쿠폰 다운 받기</button>

										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<p></p>
				<!--  페이징처리 시작 -->
				<div align="center">

					<c:if test="${pageMaker.prev}">

						<a
							href='<c:url value="/hotdeal_list?hdorderby=${hdorderby}&page=${pageMaker.startPage-1}"/>'>
							<input value="이전" type="button" class="button">
						</a>

					</c:if>
					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="pageNum">
						<a
							href='<c:url value="/hotdeal_list?hdorderby=${hdorderby}&page=${pageNum}"/>'>
							<i class="fa"><input value="${pageNum}" type="button"
								class="button"></i>
						</a>
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage >0}">

						<a
							href='<c:url value="/hotdeal_list?hdorderby=${hdorderby}&page=${pageMaker.endPage+1}"/>'>
							<input value="다음" type="button" class="button">
						</a>
					</c:if>

				</div>
				<!--  페이징처리 끝 -->
			</div>
		</section>

		<!--  Modal 추가 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel"></h4>
					</div>
					<div class="modal-body"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" id="closeModal"
							data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<!--  /.Modal -->

		<!--  Modal javascript -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"
			integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
			crossorigin="anonymous"></script>
		<script type="text/javascript">
			$(document).ready(function() {

				var result = '<c:out value="${result}" />';

				checkModal(result);

				history.replaceState({}, null, null);

				function checkModal(result) {
					if (result === '' || history.state) {
						return;
					}
					if (result != null) {
						$(".modal-body").html(result);
					}
					$("#myModal").modal("show");
				}

				$("#closeModal").on("click", function() {
					$("#myModal").modal("hide");
				});
			});
		</script>


	</main>
	<!-- End #main -->


	<!-- ======= Footer ======= -->
	<jsp:include page="../common/footer.jsp" />
	<!-- End Footer -->


</body>
</html>
