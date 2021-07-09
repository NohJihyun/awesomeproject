<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

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
</style>

</head>

<body>

	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Sidebar -->
		<jsp:include page="../shopadmin_sidebar.jsp"></jsp:include>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper">

			<!-- Main Content -->


			<jsp:include page="../shopadmin_navbar.jsp"></jsp:include>


			<div id=content>
				<!-- Content Row -->
				<div class="row">

					<!-- Content Column -->


					<div class="card w-55">
						<div class="card-header">
							<h4>
								<span style="font-weight: bold; color: #e43c;">식당관리 수정</span> 
							</h4>
						</div>

						<form action="/shopadmin/update_shop.shop" method="POST" enctype="multipart/form-data">
						
						<div class="card-body">
							<table style="float: left;">
							<tr>
								<th>식당명:</th>
								<td>
									<input type="hidden" name="rscode" value="${shopInfo.rscode}">
									<input type="text" name="rsname" placeholder="식당명 입력"  onfocus="this.placeholder=''" onblur="this.placeholder='식당명 입력'" required="required" value="${shopInfo.rsname}">
								</td>
							</tr>
								<tr>
									<th>주소:</th>
									<td>
										<input type="text" id="sample4_postcode" placeholder="우편번호">
										<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
										<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="rsrode" value="${shopInfo.rsrode}">
										<input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="rsaddr" value="${shopInfo.rsaddr}">
										<span id="guide" style="color:#999;display:none"></span>
										<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="rsaddrdetail">
										<input type="text" id="sample4_extraAddress" placeholder="참고항목">                 	
					                </td>
								</tr>
								<tr>
									<th>전화번호:</th>
									<td><input type="text" id="phone" name="rstell"  required="required" value="${shopInfo.rstell}"></td>
								</tr>
								<tr>
									<th>음식 종목:</th>
									<td>
									<select name="rstype" required="required">
									<c:if test="${shopInfo.rstype.equals('한식')}">
										<option selected>한식</option>
									</c:if>
									<c:if test="${!shopInfo.rstype.equals('한식')}">
										<option>한식</option>
									</c:if>
									<c:if test="${shopInfo.rstype.equals('중식')}">
										<option selected>중식</option>
									</c:if>
									<c:if test="${!shopInfo.rstype.equals('중식')}">
										<option>중식</option>
									</c:if>
									<c:if test="${shopInfo.rstype.equals('양식')}">
										<option selected>양식</option>
									</c:if>
									<c:if test="${!shopInfo.rstype.equals('양식')}">
										<option>양식</option>
									</c:if>
									<c:if test="${shopInfo.rstype.equals('일식')}">
										<option selected>일식</option>
									</c:if>
									<c:if test="${!shopInfo.rstype.equals('일식')}">
										<option>일식</option>
									</c:if>
									<c:if test="${shopInfo.rstype.equals('한식')}">
										<option selected>한식</option>
									</c:if>
									<c:if test="${!shopInfo.rstype.equals('한식')}">
										<option>한식</option>
									</c:if>
									<c:if test="${shopInfo.rstype.equals('호프/통닭')}">
										<option selected>호프/통닭</option>
									</c:if>
									<c:if test="${!shopInfo.rstype.equals('호프/통닭')}">
										<option>호프/통닭</option>
									</c:if>
									</select>
									</td>
								</tr>
								<tr>
									<th>가격대:</th>
									<td>
									
									<select name="rsprice" required="required">
									<c:if test="${shopInfo.rsprice.equals('1만원대')}">
										<option selected>1만원대</option>
									</c:if>
									<c:if test="${!shopInfo.rsprice.equals('1만원대')}">
										<option>1만원대</option>
									</c:if>
									<c:if test="${shopInfo.rsprice.equals('2만원대')}">
										<option selected>2만원대</option>
									</c:if>
									<c:if test="${!shopInfo.rsprice.equals('2만원대')}">
										<option>2만원대</option>
									</c:if>
									<c:if test="${shopInfo.rsprice.equals('3만원대')}">
										<option selected>3만원대</option>
									</c:if>
									<c:if test="${!shopInfo.rsprice.equals('3만원대')}">
										<option>3만원대</option>
									</c:if>
									<c:if test="${shopInfo.rsprice.equals('4만원대')}">
										<option selected>2만원대</option>
									</c:if>
									<c:if test="${!shopInfo.rsprice.equals('4만원대')}">
										<option>4만원대</option>
									</c:if>
									<c:if test="${shopInfo.rsprice.equals('5만원대')}">
										<option selected>5만원대</option>
									</c:if>
									<c:if test="${!shopInfo.rsprice.equals('5만원대')}">
										<option>5만원대</option>
									</c:if>
									</select>
									</td>
								</tr>
								<tr>
									<th>주차공간:</th>
									<td>
									<c:if test="${shopInfo.rsparking == 0}">
										<c:set var="rsparking_no" value="checked" />
									</c:if>
									<c:if test="${shopInfo.rsparking == 1}">
										<c:set var="rsparking_yes" value="checked" />
									</c:if>
									<input type="radio" name="rsparking" value="0" ${rsparking_no} required="required">주차불가
									<input type="radio" name="rsparking" value="1" ${rsparking_yes} required="required">주차가능
									</td>
								</tr>
								<tr>
									<th>영업시간:</th>
									<td><input type="time" placeholder="00:00 ~ 00:00" name="rsopen" value="${shopInfo.rsopen}" required> ~ 
										<input type="time" placeholder="00:00 ~ 00:00" name="rsclose" value="${shopInfo.rsclose}" required>
									</td>
								</tr>
								<tr>
									<th>휴일:</th>
									<td><input type="text" placeholder="ex)월 첫째주/셋째주 화요일"  onfocus="this.placeholder=''" onblur="this.placeholder='ex)월 첫째주/셋째주 화요일'" 
									size="35px;" name="rsoffday" value="${shopInfo.rsoffday}" required="required"></td>
								</tr>
								<tr>
									<th>식당이미지</th>
									<td>
										<input type="file" name="file" multiple="multiple">
									</td>
								</tr>
								<tr>
									<th>메뉴:</th>
									<td class="menu_td">
										
					                          
					                          <c:forEach var="menu" items="${menus}">
					                          <div>
					                          
						                          <span class="Restaurant_Menu">
						                          	<input type="text" placeholder="음식명" name="mnname" value="${menu.mnname}" required="required">
						                          </span>
						                          <span class="Restaurant_MenuPrice">
						                          	<input type="text" placeholder="가격" name="mnprice" value="${menu.mnprice}" required="required">
						                          </span>
						                      
					                          </div>
					                         </c:forEach>
		                                     <div id="new_chq">
		                                     </div>
		                         
				                              <input type="button" class="add" value="추가">
					                          <input type="button" class="remove" value="삭제">
 											  <input type="hidden" value="1" id="total_chq">
											 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
											<script>
											
											$('.add').on('click', add);
											$('.remove').on('click', remove);
											
											function add() {
											  var new_chq_no = parseInt($('#total_chq').val()) + 1;
											  var new_input = "<div><input type='text' id='new_mncode" + new_chq_no + "' name='mnname'> <input type='text'  id='new_mnprice" + new_chq_no + "' name='mnprice'></div>";
											
											  $('#new_chq').append(new_input);
											
											  $('#total_chq').val(new_chq_no);
											}
											
											function remove() {
											  var last_chq_no = $('#total_chq').val();
											
											  if (last_chq_no > 1) {
											    $('#new_mncode' + last_chq_no).remove();
											    $('#new_mnprice' + last_chq_no).remove();    
											    $('#total_chq').val(last_chq_no - 1);
											  }
											}
											</script>
					                  </td>
								</tr>
								<tr>
									<th></th>
									<td align="right">
										<button class="button" type="submit">식 당 수 정</button>
									</td>
								</tr>
							</table>
						</form>
						
						</div>

						
						<div class="card-footer">
							<p>업데이트 : ${shopInfo.rsupdatedate}</p>
						</div>
						<!--  설명끝 -->
						<!-- 태그 -->

						<!--  태그끝 -->

					</div>

				</div>

			</div>


		</div>

</body>

</html>