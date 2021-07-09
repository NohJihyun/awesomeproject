<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>

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

img {
	object-fit: fill;
}

.review{ /* 리뷰 길이 조정 */
	width:300px; 
	height: 90px;
	text-overflow:ellipsis; 
	overflow: hidden; 
	display: block;
}
</style>

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


			<div class="container">

				<div class="card">

					<div class="card-title">
						<h4>
								<span style="font-weight: bold; color: #e43c;">리뷰관리</span>
								<span style="float: right;">
								<Form action="/admin/proReview_list.do" method="get">
								<input style=" width: 140px; height: 30px;" type="text" name="search" value="${search}" placeholder="식당검색">
								<input value="검색" type="submit" class="button">
								</Form></span>
							</h4>
					</div>

					<div class="row row-cols-2 row-cols-sm-3 g-4">
				<c:forEach var="review" items="${reviewlist}">
						<div class="col">
							<div class="card">
								<div class="card text-dark bg-light">
								<div class="card-header">
									<span style="float: left;">${review.rvdate.substring(0,10)}</span><span
									style="float: right;">조회수:${review.rvcnt}</span>
								</div>
									<img src="/resources/assets/img/reviewpic/${review.rvimg}" class="card-img-top" width="300" height="300">
									<div class="card-header">${review.rsname}</div>
									<div class="card-body">
										<p class="card-text">
										<table>
										
											<tr>
												<td class="review">${review.rvcontent}</td>
											</tr>
											
											<tr>
												<td><font style="color: black;">by ${review.nickname}</font> </td>
											</tr>
											
										</table>
										</p>
									</div>
								</div>
							</div>
						</div>
				</c:forEach>
					</div>
				</div>
				<!--  페이징처리 시작 -->
				<div align="center">
					
				    <c:if test="${pageMaker.prev }">

				        <a href='<c:url value="/admin/proReview_list.do?search=${search}&page=${pageMaker.startPage-1 }"/>'>
				         <input value="이전" type="button" class="button">
				         </a>

				    </c:if>
				    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">

				        <a href='<c:url value="/admin/proReview_list.do?search=${search}&page=${pageNum }"/>'>
				        <i class="fa"><input value="${pageNum}" type="button" class="button"></i></a>

				    </c:forEach>
				    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">

				        <a href='<c:url value="/admin/proReview_list.do?search=${search}&page=${pageMaker.endPage+1 }"/>'>
				        <input value="다음" type="button" class="button">
				        </a>
				    </c:if>

				</div>
				<!--  페이징처리 끝 -->
				<div>
					<a href="/admin/proreview.do"><input type="button" class="button" value="리뷰 등록"></a> 
				</div>
			</div>
		</div>
	</div>
	
	<!--  Modal 추가 -->
     <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
           <div class="modal-content">
              <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                 <h4 class="modal-title" id="myModalLabel">Modal Title</h4>
              </div>
              <div class="modal-body">처리가 완료되었습니다.</div>
              <div class="modal-footer">
                 <button type="button" class="btn btn-default" id="closeModal" data-dismiss="modal">Close</button>
                 <button type="button" class="btn btn-primary">Save changes</button>
              </div>
           </div>
        </div>
     </div>
      
   <!--  /.Modal -->
   <!--  Modal javascript -->
   <script src="https://code.jquery.com/jquery-3.6.0.min.js" 
   integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
   crossorigin="anonymous"></script>       
   <script type="text/javascript">
      $(document).ready(function() {
         
         var result = '<c:out value="${result}" />';
         
         checkModal(result);
         
         history.replaceState({}, null, null);
         
         function checkModal(result) {
            if(result === '' || history.state) {
               return;   
            }
            if(parseInt(result) > 0) {
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

