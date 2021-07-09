<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<header id="header" class="fixed-top header-inner-pages">
	<div
		class="container d-flex align-items-center justify-content-between">

		<h1 class="logo">
			<a href="/">AWESOME GUIDE</a>
		</h1>
		<!-- Uncomment below if you prefer to use an image logo -->
		<!-- <a href="index.html" class="logo"><img src="resources/assets/img/logo.png" alt="" class="img-fluid"></a>-->

		<nav id="navbar" class="navbar">
			<ul>

				<c:choose>
					<c:when test="${sessionScope.id eq null}">
						<li><a class="nav-link scrollto " href="/">Home</a></li>
						<li><a class="nav-link scrollto" href="/hotdeal_list">오늘의
								핫딜</a></li>
						<li><a class="nav-link scrollto" href="/login">로그인</a></li>
					</c:when>
					<c:otherwise>
						<c:choose>

							<c:when test="${sessionScope.role eq 'USER'}">
								<li><a class="nav-link scrollto " href="/">Home</a></li>
								<li><a class="nav-link scrollto" href="/hotdeal_list">오늘의
										핫딜</a></li>
								<li><a class="nav-link scrollto" href="/mypage/mypage">마이페이지</a></li>
								<li><a> ${sessionScope.nick } 님 환영합니다! </a></li>
								<li><a class="nav-link scrollto" href="/user/logout">로그아웃</a></li>
							</c:when>

							<c:when test="${sessionScope.role eq 'MGR' }">
								<li><a class="nav-link scrollto " href="/">Home</a></li>
								<li><a class="nav-link scrollto" href="/hotdeal_list">오늘의
										핫딜</a></li>
								<li><a class="nav-link scrollto" href="/shopadmin/home.shop">업체관리자</a></li>
								<li><a>${sessionScope.nick } 님 환영합니다! </a></li>
								<li><a class="nav-link scrollto" href="/user/logout">로그아웃</a></li>
							</c:when>

							<c:when test="${sessionScope.role eq 'ADMIN' }">
								<li><a class="nav-link scrollto " href="/">Home</a></li>
								<li><a class="nav-link scrollto" href="/hotdeal_list">오늘의
										핫딜</a></li>
								<li><a class="nav-link scrollto" href="/admin/home.do">시스템관리자</a></li>
								<li><a> ${sessionScope.nick } 님 환영합니다! </a></li>
								<li><a class="nav-link scrollto" href="/user/logout">로그아웃</a></li>
							</c:when>

							<c:when test="${sessionScope.role eq 'PRO' }">
								<li><a class="nav-link scrollto " href="/">Home</a></li>
								<li><a class="nav-link scrollto" href="/hotdeal_list">오늘의
										핫딜</a></li>
								<li><a class="nav-link scrollto" href="/admin/home.do">시스템관리자</a></li>
								<li><a> ${sessionScope.nick } 님 환영합니다! </a></li>
								<li><a class="nav-link scrollto" href="/user/logout">로그아웃</a></li>
							</c:when>
						</c:choose>
					</c:otherwise>
				</c:choose>

			</ul>
			<i class="bi bi-list mobile-nav-toggle"></i>
		</nav>
		<!-- .navbar -->

	</div>
</header>