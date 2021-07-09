<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Sidebar -->
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar" style="background: skyblue;">

	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="/admin/home.do">
		<div class="sidebar-brand-icon">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3" style="font-size: 15px;">관리자
			페이지</div>
	</a>
	<c:choose>
		<c:when test="${sessionScope.role eq 'ADMIN'}">
			<!-- Divider -->
			<hr class="sidebar-divider my-0">
		
			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">
		
			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link" href="/admin/user_list.do">
					<i class="fas fa-users"></i><span style="font-size: 20px;">회원관리</span>
			</a></li>
			
			
			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">
		
			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link"
				href="/admin/hotdeal_list.do"> <i class="fas fa-ticket-alt"
					style="width: 40px;"></i> <span style="font-size: 20px;">핫딜관리</span>
			</a></li>
			
			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">
		
			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link" href="/admin/shop_list.do">
					<i class="fas fa-utensils" style="width: 40px;"></i> <span
					style="font-size: 20px;">식당관리</span>
			</a></li>
		</c:when>
	</c:choose>

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link"
		href="/admin/proReview_list.do"> <i class="far fa-comment-dots"
			style="width: 40px;"></i> <span style="font-size: 20px;">리뷰관리</span>
	</a></li>

	

	

</ul>