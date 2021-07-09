
	/* ==========  데이타  ============== */
	/*var restaurants = [
						['라비냐', '서울특별시 구로구 디지털로32길 82'],
						['보쌈주는족발집 본점', '서울특별시 구로구 디지털로32나길 19']
				  	 ];
	*/
	/* ==========  맵  생성  ============== */ 
	var mapContainer = document.getElementById('map');		// 맵을 넣을 div 
 	var mapOption = { 
 			center : new kakao.maps.LatLng(37.4830451900738, 126.899563285224),		// 지도의 중심좌표 설정 
 			level: 3 																// 지도의 확대 레벨
 	};

 	var map = new kakao.maps.Map(mapContainer, mapOption);	// 지도 생성
	
    /* ==========  주소-좌표 변환 (Geocoder) 객체  ============== 
     Methods:
    	 addressSearch(addr, callback, options)	-> 주소 정보에 해당하는 좌표값을 요청한다.
     Parameters:
    	 addr (String) : 변환할 주소명
    	 callback (Function) : 검색 결과를 받을 콜백함수
    	 options (Object) > analyze_type : 검색어 매칭 방식 선택 옵션. SIMILAR 일 경우 입력한 것과 유사한 검색어도 검색결과에 포함시킨다. EXACT 일 경우 입력한 주소 문자열과 정확하게 매칭되는 주소만을 찾아준다. 기본값은 SIMILAR
     Callback Arguments :
    	 result (Array) : 결과 목록   결과 상세는 로컬 REST API 주소 검색 의 응답결과 참고  https://developers.kakao.com/docs/latest/ko/local/dev-guide#address-coord
    					-  address_name	(String) :	전체 지번 주소 또는 전체 도로명 주소, 입력에 따라 결정됨
    					-  x (String)	X 좌표값, 경위도인 경우 longitude(경도)
    	 				-  y (String)	Y 좌표값, 경위도인 경우 latitude(위도)
    	 				-  road_address	도로명 주소 상세 정보, 아래 RoadAaddress 항목 구성 요소 참고
    	 status (Status) : 응답 코드 값 -> OK : 검색 결과 있음     	 ZERO_RESULT : 정상적으로 응답 받았으나 검색 결과는 없음     	 ERROR : 서버 응답에 문제가 있는 경우
    */
    var geocoder = new kakao.maps.services.Geocoder();	//	API주소에 libraries=services 추가!
    //배열변수.forEach(callback(currentvalue, index){});
    Arrshop.forEach(function(data, index) {	// 데이타 반복 실행
 	    geocoder.addressSearch(data[1], function(result, status) {
 	 		 
	         if(status === kakao.maps.services.Status.OK) {	// status결과값 OK(상수)일 경우
	          	 var coords = new kakao.maps.LatLng(result[0].y, result[0].x); // 위도,경도값 
	             var marker = new kakao.maps.Marker({		 // 결과값으로 받은 위치를 마커로 표시합니다
	     	         map: map,			//마커를 표시할 지도
	                 position: coords	//마커의 위치
	             });
	         
	             console.log("data[0]:" + data[0] + "data[1]:" + data[1] + " status:" + status + "position:" + coords);
	          	 
		         map.setCenter(coords);	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	          	 
	             var content = '<div class="wrap">' + 
		            '    <div class="info">' + 
		            '        <div class="title">' + data[0] +  
		            '        </div>' + 
		            '        <div class="body">' + 
		            '            <div class="img">' +
		            '                <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMDA0MjlfNjkg%2FMDAxNTg4MTYzNzk5Mzk3.RedqmpdoQDApwOaopSKjmF6DgQ1HymO2usaWTBz8nEwg.fV0oPbAsv9b-0jQxl5hSXQpxdIEHZlN4v3ZD7gfA7XIg.JPEG.seonok8725%2F1588163798804.jpg&type=sc960_832" width="73" height="70">' +
		            '           </div>' + 
		            '            <div class="desc">' + 
		            '                <div class="ellipsis">'+ result[0].road_address.address_name +'</div>' + 
		            '                <div class="jibun ellipsis">('+ result[0].road_address.zone_no + ')' + result[0].address.address_name +'</div>' + 
		            '                <div><a href="#" target="_blank" class="link">상세보기</a></div>' + 
		            '            </div>' + 
		            '        </div>' + 
		            '    </div>' +    
		            '</div>';
	             
	          	 
                /* ==========  커스텀오버레이(CustomOvelay) 객체  ============== 
                	Parameters:
							options Object
							clickable Boolean : true 로 설정하면 컨텐츠 영역을 클릭했을 경우 지도 이벤트를 막아준다.
							content Node | String : 엘리먼트 또는 HTML 문자열 형태의 내용
							map Map | Roadview : 커스텀 오버레이가 올라갈 지도 또는 로드뷰
							position LatLng | Viewpoint : 커스텀 오버레이의 좌표 또는 로드뷰에서의 시점
							xAnchor Number : 컨텐츠의 x축 위치. 0_1 사이의 값을 가진다. 기본값은 0.5  1에 가까울수록 왼쪽에 위치합니다.
							yAnchor Number : 컨텐츠의 y축 위치. 0_1 사이의 값을 가진다. 기본값은 0.5  1에 가까울수록 위쪽에 위치합니다.
							zIndex Number : 커스텀 오버레이의 z-index
                	
					Methods:
						draw() 	위치를 재조정할 필요가 있을 때 호출된다.	이 함수 내에서 엘리먼트의 위치를 잡아주어야 한다
						setMap(map) 지도에 사용자 오버레이를 올린다.	null 을 지정하면 오버레이를 제거한다.	
                	*/
	            // 커스텀 오버레이에 표시할 내용입니다     
				// HTML 문자열 또는 Dom Element 입니다
			 
				
				  // 마커에 표시할 인포윈도우를 생성합니다 
	             var infowindow = new kakao.maps.InfoWindow({
	            	 content: content
			     }); 

			    
	             // 커스텀 오버레이를 생성합니다
				var customOverlay = new kakao.maps.CustomOverlay({
					 content: content,
					 map: map,
  				     position: marker.getPosition()  
				});     
				
				customOverlay.setMap(null);   	 // 실행시 커스텀 오버레이를 지도에 표시 안함
				// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다   
				kakao.maps.event.addListener(marker, 'mouseover', function() {
					customOverlay.setMap(map);    // 커스텀 오버레이를 지도에 표시합니다
		  		}); 
				kakao.maps.event.addListener(marker, 'mouseout', function() {
					customOverlay.setMap(null);    // 커스텀 오버레이를 지도에서 제거한다
		  		}); 
	         }  // end if  ===============================================================
	        
	    }); // end geododer() 
 	}); // end forEach()

 
