<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>이미지 마커와 커스텀 오버레이</title>
<style>
.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #e43c;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}

body {
	font-family: Arial, Helvetica, sans-serif;
}

/* The Modal (background) */
.btn {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	width: 50px;
	height: 50px;
	line-height: 50px;
	border: 1px solid red;
	cursor: pointer;
	text-align: center;
}

.modal {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.1);
	z-index: 2;
}

.modal_content {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	width: 800px;
	height: 600px;
	border: 10px solid white;
	background-color: black;
	overflow: auto;
}

.btn_close {
	text-decoration: none;
	background: coral;
	width: 300px;
	color: black;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>

	$(document).ready(function() {

		$(".btn").click(function() {
			$(".modal").fadeIn();
			resizeMap();
			relayout();
		});

		$(".btn_close").click(function() {

			$(".modal").fadeOut();

		});

	});

	//지도를 표시하는 div 크기를 변경하는 함수입니다
	function resizeMap() {
		console.log("resizeMap");

		var mapContainer = document.getElementById('map2');
		//mapContainer.style.width = '200px';
		//mapContainer.style.height = '200px';
	}

	function relayout() {
		console.log("relayout");
		// 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
		// 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
		// window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
		map.relayout();
	}
</script>
</head>
<body>
	<!-- 맵 출력 DIV -->
	<div id="map" style="width: 800px; height: 600px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=269f3bdfee8403c85dd95f5cc96189e1&libraries=services,clusterer,drawing"></script>
	<script type="text/javascript" src="/resources/assets/js/kakaomap.js"></script>
	<br>
	
	<div class="modal">
		<p class="modal_content"  id="map2" style="width: 400px; height: 400px;">
		<script type="text/javascript" src="/resources/assets/js/kakaomap2.js"></script>
			<br>
			<br> <span><b>오늘하루 보지않기</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a	href="#" class="btn_close">닫기</a></span>
		</p>

	</div>
	
	
	
</body>
</html>