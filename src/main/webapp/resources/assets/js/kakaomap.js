// 현재 위치값을 전달하기 위한 전역변수 초기화 
var lat = "";	//
var lon = "";

//var rsname = "어촌마을";	//식당이름
//var rsload = "서울특별시 구로구 디지털로32길 97-31"; //도로명주소
//var rsaddr = "서울특별시 구로구 구로동 1124-3";		//지번주소


/* =============   내 현재 위치 위도, 경도 가져오기 시작 ================================ */
//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
    	//지역변수
        var lat = position.coords.latitude, // 위도   
            lon = position.coords.longitude; // 경도
        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
        
        displayMarker(locPosition); // 마커 표시 함수에 현재 위치값 전달
      });
    
} else { // GeoLocation을 사용할 수 없을때 마커 표시 위치를 설정합니다
    var locPosition = new kakao.maps.LatLng(37.483782, 126.9003409);    
    displayMarker(locPosition);
}

/* =============   지도 생성   ================================ */
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(lat, lon),  // 지도의 중심좌표 설정  --> 전역변수로 현재 위치 전달
        level: 3 								  // 지도의 확대 레벨
    };  
 
// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

/* =============   식당주소로 좌표값 구하기   ================================ */
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(rsload, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

      //커스텀 오버레이에 표시할 컨텐츠 작성  ===> 변수로 식당 정보 처리하면 됨
      var content = '<div class="wrap">' + 
                '    <div class="info">' + 
                '        <div class="title">' +
                rsname + 
                '        </div>' + 
                '        <div class="body">' + 
                '            <div class="img">' +
                '                <img src="https://image.shutterstock.com/image-photo/korean-restaurants-traditional-menu-food-260nw-1681143862.jpg" width="73" height="70">' +
                '           </div>' + 
                '            <div class="desc">' + 
                '                <div class="ellipsis">'+
                rsload +
                					'</div>' + 
                '                <div class="jibun ellipsis">(지번)' +
                rsaddr + 
                '</div>' + 
                '            </div>' + 
                '        </div>' + 
                '    </div>' +    
                '</div>';
        
     // 마커 위에 커스텀오버레이를 표시합니다
     // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
     var overlay = new kakao.maps.CustomOverlay({
         content: content,
         map: map,
         position: marker.getPosition()       
     });

     // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
     kakao.maps.event.addListener(marker, 'click', function() {
         overlay.setMap(map);
     });
        
     // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
      map.setCenter(coords);
    } 
});    


//현재 현재 위치 마커표시 함수
function displayMarker(locPosition) {

	var startSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', // 출발 마커이미지 경로    
    startSize = new kakao.maps.Size(50, 45), 											 // 출발 마커이미지의 크기입니다 
    startOption = { 
        offset: new kakao.maps.Point(15, 43) 	// 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
    };
    //출발 마커 이미지를 생성합니다
    var startImage = new kakao.maps.MarkerImage(startSrc, startSize, startOption);
	
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition,
        image: startImage 
    }); 
}    
