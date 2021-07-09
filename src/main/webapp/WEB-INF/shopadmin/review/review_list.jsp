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

img {
	object-fit: fill;
}

.review{ /* 리뷰 길이 조정 */
   width:300px; 
   height: 500px;
   text-overflow:ellipsis; 
   overflow: hidden; 
   display: block;
}
</style>

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<jsp:include page="../shopadmin_sidebar.jsp"></jsp:include>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<jsp:include page="../shopadmin_navbar.jsp"></jsp:include>
			<!-- Main Content -->


			<div class="container">

				<div class="card">

					<div class="card-title">
						<h4>
								<span style="font-weight: bold; color: #e43c;">리뷰관리</span><span
									style="float: right;">
									<button class="button" onclick="location.href='/shopadmin/review_list.shop?sort=rvdate&rscode=${rscode}'">최신순</button>
									<button class="button" onclick="location.href='/shopadmin/review_list.shop?sort=rvscore&rscode=${rscode}'">리뷰평점순</button>
									<button class="button" onclick="location.href='/shopadmin/review_list.shop?sort=replycount&rscode=${rscode}'">댓글순</button></span>
							</h4>
					</div>

					<div class="row row-cols-2 row-cols-sm-3 g-4">

						<!--  foreach 시작 -->
						<c:forEach var="review" items="${reviewList}">
						<div class="col">
							<div class="card">
								<div class="card text-dark bg-light">
								<div class="card-header">
									<span style="float: left;">등록일:${review.rvdate.substring(0,10)}</span>
									<span style="float: right;">조회수:${review.rvcnt} 댓글:${review.replycount}</span>
								</div>
									<img src="/resources/assets/img/review/${review.rvimg}" class="card-img-top">
									<div>/resources/assets/img/review/${review.rvimg}</div>
									<div class="card-header">리뷰평점 : ${review.rvscore}</div>
									<div class="card-body">
										<h5 class="card-title">${review.rvtitle}   rvcode: ${review.rvcode}</h5>
										<p class="card-text">
										<table>
											<tr>
												<td class="review">${review.rvcontent}</td>
											</tr>
										</table>
										</p>
									</div>
								</div>
							
							</div>
						</div>
						</c:forEach>
						<!--  foreach 끝 -->
					</div>
					<!--  페이징처리 시작 -->
					<div align="center">
						
					    <c:if test="${pageMaker.prev }">

					        <a href='<c:url value="/shopadmin/review_list.shop?rscode=${rscode}&sort=${sort}&page=${pageMaker.startPage-1 }"/>'>
					         <input value="이전" type="button" class="button">
					         </a>

					    </c:if>
					    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">

					        <a href='<c:url value="/shopadmin/review_list.shop?rscode=${rscode}&sort=${sort}&page=${pageNum }"/>'>
					        <i class="fa"><input value="${pageNum}" type="button" class="button"></i></a>

					    </c:forEach>
					    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">

					        <a href='<c:url value="/shopadmin/review_list.shop?rscode=${rscode}&sort=${sort}&page=${pageMaker.endPage+1 }"/>'>
					        <input value="다음" type="button" class="button">
					        </a>
					    </c:if>

					</div>
					<!--  페이징처리 끝 -->
				</div>

				<!-- <section id="blog" class="blog">
					<div class="container" data-aos="fade-up">
						<div class="row">
							<div class="blog-pagination">
									<a href="#" class="button" align="center">더보기</a>
							</div>
						</div>
					</div>
				</section> -->

			</div>
		</div>
	</div>









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

