<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Sidebar -->
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar" style="background: #e43c;">

	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="/shopadmin/home.shop?rscode=${rscode}">
		<div class="sidebar-brand-icon">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3" style="font-size: 30px;">${rsname}</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link" href="/shopadmin/hotdeal_list.shop?rscode=${rscode}">
			<i class="fas fa-fw fa-ticket-alt"></i><span
			style="font-size: 20px;">핫딜관리</span>
	</a></li>

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Nav Item - Utilities Collapse Menu -->
	<li class="nav-item"><a class="nav-link" href="/shopadmin/booking_list.shop?rscode=${rscode}"> <i
			class="far fa-calendar-check" style="width: 40px;"></i> <span
			style="font-size: 20px;">예약관리</span>
	</a></li>

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link" href="/shopadmin/review_list.shop?rscode=${rscode}">
			<i class="far fa-comment-dots" style="width: 40px;"></i> <span
			style="font-size: 20px;">리뷰관리</span>
	</a></li>

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link" href="/shopadmin/shop_list.shop?rscode=${rscode}"> <i
			class="fas fa-utensils" style="width: 40px;"></i> <span
			style="font-size: 20px;">식당관리</span>
	</a></li>
	
	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">
	
</ul>