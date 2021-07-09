<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="d-flex flex-column">
	<div class="profile">
		<img src="/resources/assets/img/userpic/${sessionScope.photo}" alt=""
			class="img-fluid rounded-circle">
		<h1 class="text-light">
			<a href="/mypage/mypage">마이 페이지</a>
		</h1>
	</div>
</div>
<div>
	<p></p>
</div>

<nav id="navbar" class="nav-menu navbar">
	<ul>
		<li><a href="/mypage/mypage"><i class="bx bx-id-card"></i> <span
				class="a" style="color: white">나의 정보</span></a></li>
		<li><a href="/mypage/booking_list"><i
				class="bx bx-calendar-check"></i> <span class="a"
				style="color: white">예약 및 방문 관리</span></a></li>
		<li><a href="/mypage/review_list"><i
				class="bx bx-comment-edit"></i> <span class="a" style="color: white">리뷰
					관리</span></a></li>
		<li><a href="/mypage/favorite_list"><i class="bx bxs-star"></i>
				<span class="a" style="color: white">즐겨 찾기</span></a></li>
		<li><a href="/mypage/myhotdeal_list"><i class="bx bxs-coupon"></i>
				<span class="a" style="color: white">핫딜 쿠폰</span></a></li>
	</ul>
</nav>

</div>