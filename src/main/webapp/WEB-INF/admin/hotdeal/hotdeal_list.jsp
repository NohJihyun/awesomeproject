<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- 오늘날짜  formatDate => date타입을 String타입으로 변환 -->
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate" />
<c:out value="현재날짜 : ${nowDate}" />



<!doctype html>
<html>
<head>
<meta charset="UTF-8">

<style>
.resv-info {
	width: 80px;
}

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
</style>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(function () {
	//페이징 처리
	$('.pagingBtn').on('click',function(){
		var $pageNo = $(this).val();
		$('#frm').append('<input type="hidden" name="pageNo" value="'+$pageNo+'"/>');
		$('#frm').submit();
	})
});
</script>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<jsp:include page="../admin_sidebar.jsp"></jsp:include>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<jsp:include page="../admin_navbar.jsp"></jsp:include>
			<!-- Main Content -->
			<div id="content">



				<!-- Begin Page Content -->
				<div class="container-fluid">



					<!-- Content Row -->
					<div class="row">

						<div class="col-xl-12">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h4>
										<span style="font-weight: bold; color: #e43c;">실시간 핫딜상황
											<span style="float: right;">
												<form id="frm" action="/admin/hotdeal_list.do" method="get">
													<input id="search" style="width: 140px; height: 30px;"
														type="text" name="search" value="${search}"
														placeholder="식당명 검색" onfocus="this.placeholder=''" onblur="this.placeholder='식당명검색'"> 
														
														<input value="검색" type="submit" class="button">
												</form>										
										
										</span>
										</span>
									</h4>

													</div>
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-bordered">
											<thead>
												<tr align="center">
													<th>핫딜코드</th>
													<th>핫딜명</th>
													<th>식당</th>
													<th>유효 기간</th>
													<th>발행/전체</th>
													<th>할인율</th>
													<th>현재상태</th>
												</tr>
											</thead>
												<c:forEach var="hotdeal" items="${hotdeals}" varStatus="status">
												
													
													<tbody id="hotdeal_list_tbody">
													<tr align="center">
														<td>${hotdeal.hdcode}</td>
														<td><a href="/admin/detail_hotdeal.do?hdcode=${hotdeal.hdcode}">${hotdeal.hdname}</a></td>
														<td>${hotdeal.rsname}</td>
														<td>${hotdeal.hdstart}~${hotdeal.hdend}</td>
														<td>${hotdeal.offercount}/ ${hotdeal.hdcnt}</td>
														<td>${hotdeal.hddiscount}%</td>

														<td>
															<!-- 현재날짜보다 핫딜만료일자가 작으면 --> 
															<c:choose>
																<c:when test="${nowDate > hotdeal.hdend}">
                                                						기간만료
                                             					</c:when>

																<c:otherwise>
                                                						진행중
                                             					</c:otherwise>
															</c:choose>
														</td>
													</tr>
													</a>
													</tbody>
													
											  </c:forEach>
										</table>
										<!--  페이징처리 시작 -->
										<div align="center">
											
										    <c:if test="${pageMaker.prev }">

										        <a href='<c:url value="/admin/hotdeal_list.do?search=${search}&page=${pageMaker.startPage-1 }"/>'>
										         <input value="이전" type="button" class="button">
										         </a>

										    </c:if>
										    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">

										        <a href='<c:url value="/admin/hotdeal_list.do?search=${search}&page=${pageNum }"/>'>
										        <i class="fa"><input value="${pageNum}" type="button" class="button"></i></a>

										    </c:forEach>
										    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">

										        <a href='<c:url value="/admin/hotdeal_list.do?search=${search}&page=${pageMaker.endPage+1 }"/>'>
										        <input value="다음" type="button" class="button">
										        </a>
										    </c:if>

										</div>
										<!--  페이징처리 끝 -->
									
										
									</div>
								</div>
							</div>
						</div>
						</div>
					
						<div>
							<a href="/admin/reg_hotdeal.do"><input type="button" value="등록" class="button" style="float: right;"></a>
						</div>
				</div>

				<!-- Footer -->


			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->

		<!-- Scroll to Top Button-->

		

<!--  Modal 추가 -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                  <h4 class="modal-title" id="myModalLabel">Modal Title</h4>
               </div>
               <div class="modal-body"> 이곳에 출력됨 </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-default" id="closeModal" data-dismiss="modal">Close</button>
               </div>
            </div>
         </div>
      </div>
       <!--  /.Modal -->

   <!--  Modal javascript -->
   <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>       
   <script type="text/javascript">
      $(document).ready(function() {
         
         var result = '<c:out value="${result}" />';
         
         checkModal(result);
         
         history.replaceState({}, null, null);
         
         function checkModal(result) {
            if(result === '' || history.state) {
               return;   
            }
            if(result != null ) {
               $(".modal-body").html(result);
            }
            $("#myModal").modal("show");
         }
         
         $("#closeModal").on("click", function(){
            $("#myModal").modal("hide");
         });
      });
   </script>


</body>
</html>