<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Blog - Tempo Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="/resources/assets/img/favicon.png" rel="icon">
<link href="/resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="/resources/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="/resources/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="/resources/assets/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link href="/resources/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="/resources/assets/css/find_shop.css" rel="stylesheet">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: Tempo - v4.3.0
  * Template URL: https://bootstrapmade.com/tempo-free-onepage-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  <style>
.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
.wrap * {padding: 0;margin: 0;}
.wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
.info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
.info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
.info .close:hover {cursor: pointer;}
.info .body {position: relative;overflow: hidden;}
.info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
.desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
.desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
.info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}

.info .link {color: #5085BB;}

.standard{
margin-right:8vh;
float:right;
}
ul{
list-style:none;
}
#search-outcome{
width:50%;
}
li{
float:left;
padding-left:5vh;
}

.jibun{
font-weight:bold
}

strong{
float:right;
color:#e43c;
}
.card.mb-8{
max-width: 48vw;
}
.padding{
padding-left:10px;
}
</style>
</head>
<body>

	<!-- ======= Header ======= -->

	<jsp:include page="../common/main_header.jsp" />
	<!-- End Header -->

	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section id="search-outcome" class="search-outcome">
			<div class="container" style='float:left; width:30vh;'>
				<h2 style='float:left; width:30vh;'>검색결과</h2>
				<h4 style='float:left; width:30vh;'>${keyword}(으)로 검색</h4>
			</div>
			
					<div
						class="p-3 bg-light border border-danger rounded rounded-pill shadow-sm mb-4" style="float:left;">
						<div class="input-group">
							
							<form action="/find_shop" method="GET" >
							
								<button id="button-addon2" type="submit" style="float:left;"
									class="btn btn-link text-warning">
									<i class="bx bx-search-alt"></i>
								</button>
							
							
							<input type="search" name="keyword" placeholder="지역 식당 또는 음식?"
								aria-describedby="button-addon2" style="float:left;width:80vh;"
								class="form-control border-0 rounded rounded-pill bg-light">
								<input type="hidden" name="sort" value="rvscore">
								<!-- 검색기능 활성화 @@@@@@@@@@@@@@@@@@@@@김건휘-->
								
							</form>
						</div>
					</div>
				
			<div class="standard">
				<ul>
					<li><a href="/find_shop?keyword=${keyword}&sort=rvscore">평점순</a></li>
					<li><a href="/find_shop?keyword=${keyword}&sort=rvcnt">조회순</a></li>
				</ul>
			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Blog Section ======= -->
		<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
		<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
		<script>
			AOS.init();
		</script>

		<section class="blog" id="blog">
			<div class="main-container" data-aos="fade-left"
				data-aos-duration="1500">
				<div class="row">
				
				<c:if test="${empty shopSearchList}">
				<div><font color="blue">조회한 결과가 없습니다.</font></div>
				</c:if>
				<c:forEach var="searchinfo" items="${shopSearchList}">
					<div class="card mb-8">
						<div class="row g-0">
							<div class="col-md-4">
								<!-- shoppic DB에서 실제 rsimg 데이타 가져와서 연결해야 함 -->
								<img src="/resources/assets/img/shoppic/"
									class="rounded float-left img-thumbnail" alt="...">
							</div>
							<div class="col-md-8">
								<div class="card-body">
									<h3 class="card-title">${searchinfo.rsname}<strong>${searchinfo.rvscore}</strong> </h3>									
										 <table>
							              	<tbody>
							              		<tr>
									              	<th>주소</th>
								              			<td>${searchinfo.rsrode}<br/>
											              	<span class="jibun">지번:</span>
											              	<span>${searchinfo.rsaddr}</span>
								              			</td>
								              	</tr>
									            <tr>
									              	<th>전화번호</th>
							                  		<td class="padding">${searchinfo.rstell}</td>
												</tr>
							                  	<tr>
							                  		<th>음식 종류</th>
								                  	<td class="padding">
								                   		<span>${searchinfo.rstype}</span>
								                 	</td>
							              		</tr>
							              	</tbody>
							              </table> 
									<div class="read-more">
										<a href="/upcnt?rscode=${searchinfo.rscode}">더 보기</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>

				

				</div>
				<div class="blog-pagination">
					<ul class="justify-content-center">
					
				    <c:if test="${pageMaker.prev }">
				    <li>
				        <a href='<c:url value="/find_shop?keyword=${keyword}&sort=${sort}&page=${pageMaker.startPage-1 }"/>'>
				         <!-- <input value="이전" type="button" class="button"> -->
				         이전
				         </a>
					</li>
				    </c:if>
				    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
					<li>
				        <a href='<c:url value="/find_shop?keyword=${keyword}&sort=${sort}&page=${pageNum }"/>'>
				        ${pageNum}
				        <%-- <i class="fa">
				        	<input value="${pageNum}" type="button" class="button">
				        </i> --%>
				        </a>
					</li>
				    </c:forEach>
				    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
					<li>
				        <a href='<c:url value="/find_shop?keyword=${keyword}&sort=${sort}&page=${pageMaker.endPage+1 }"/>'>
				        <!-- <input value="다음" type="button" class="button"> -->
				        다음
				        </a>
				    </li>
				    </c:if>
						
					</ul>
				</div>
				<!-- End blog entries list -->
			</div>

			<!-- End blog 사이드바 -->
			<div class="col-mb-8" id="map" style="max-width: 45vw;">
				<!-- 맵 출력 DIV -->
				<script>
           
				/* 
            	var Arrshop = [
               						['라비냐', '서울특별시 구로구 디지털로32길 82'],
               						['보쌈주는족발집 본점', '서울특별시 구로구 디지털로32나길 19']
               					];
             	*/
            var arrcount = '<c:out value="${shopSearchList.size()}"/>';	// 전체 데이타수
            
            //	2차 배열 	Arrshop[전체데이타수][2]
            var Arrshop = new Array(arrcount);
            for(var i = 0; i < arrcount; i++) {
               Arrshop[i] = new Array(2);
            } 
            
            <c:forEach var="shop" items="${shopSearchList}" varStatus="status">
               Arrshop[${status.index}][0] = '<c:out value="${shop.rsname}"/>'       
               Arrshop[${status.index}][1] = '<c:out value="${shop.rsrode}"/>';
            </c:forEach>
            
            </script>
				<!-- 카카오 API 삽입부 절대 지우지 말것! -->
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=269f3bdfee8403c85dd95f5cc96189e1&libraries=services"></script>
				<script type="text/javascript"
					src="/resources/assets/js/kakaomarkers.js"></script>
			</div>

		</section>
		<!-- End Blog Section -->

	</main>
	<!-- End #main -->


	<!-- ======= Footer ======= -->

	<jsp:include page="../common/footer.jsp" />


	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script
		src="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script
		src="/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="/resources/assets/vendor/php-email-form/validate.js"></script>
	<script src="/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>

	<!-- Template Main JS File -->
	<script src="/resources/assets/js/main.js"></script>

</body>

</html>