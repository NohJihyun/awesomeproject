<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Sidebar -->
		<jsp:include page="../admin_sidebar.jsp"></jsp:include>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper">

			<!-- Main Content -->


			<jsp:include page="../admin_navbar.jsp"></jsp:include>


			<div id=content>
				<!-- Content Row -->
				<div class="row">

					<!-- Content Column -->

					<div class="card w-55">
						<div class="card-header">
							<h4>
								<span style="font-weight: bold; color: #e43c;">리뷰등록</span> 
							</h4>
							<div>
							<form action="/admin/getShop.do" method="get">
							식당검색 <input type="text" name="search" value="${search}" onfocus="this.value=''"> <input type="submit" class="button" value="식당조회">
							</form>
							</div>
						</div>
						
						
						<form action="/admin/reg_proreview.do" method="POST" enctype="multipart/form-data">
							<div class="card-body">
								<table style="float: left;">
									<tr>
										<th>식당명:</th>
										<td>
										<input type="hidden" name="rscode" required="required" value="${rscode}">
										<input type="text" name="rsname" required="required" value="${rsname}">
										</td>
									</tr>
									<tr>
										<th>제목:</th>
										<td><input type="text" name="rvtitle" placeholder="리뷰제목"
											onfocus="this.placeholder=''" onblur="this.placeholder='리뷰제목'" required="required">
										</td>
									</tr>
									<tr>
										<th>내용:</th>
										<td><textarea name="rvcontent" rows="15" cols="80"></textarea></td>
									</tr>

									<tr>
										<th>이미지 업로드:</th>
										<td><input type="file" name="file" multiple="multiple"
											required="required">
										</td>
									</tr>
									<tr>
										<th>평점:</th>		
										<td >								
											<div class="wrapper">
												<input type="radio" name="rvscore" id="star-1" value="1" required>
												<input type="radio" name="rvscore" id="star-2" value="2" required>
												<input type="radio" name="rvscore" id="star-3" value="3" required>
												<input type="radio" name="rvscore" id="star-4" value="4" required>
												<input type="radio" name="rvscore" id="star-5" value="5" required>
												<div class="content">
													<div class="stars">
														<div class="outer" style="height:; width: 250px;">
															<label for="star-1" class="star-1 fas fa-star"></label> <label
																for="star-2" class="star-2 fas fa-star"></label> <label
																for="star-3" class="star-3 fas fa-star"></label> <label
																for="star-4" class="star-4 fas fa-star"></label> <label
																for="star-5" class="star-5 fas fa-star"></label>
														</div>
													</div>
												</div>
												<div class="footer">
													<span class="text"></span> <span class="numb"></span>
												</div>
											</div>
										</td>
									</tr>

									<tr align="center">
										<td>
											<button class="button" type="submit">리 뷰 등 록</button>
										</td>
									</tr>
								</table>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>