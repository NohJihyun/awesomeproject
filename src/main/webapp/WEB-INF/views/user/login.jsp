<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>


<!-- <script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8">
</script>
 -->
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Tempo Bootstrap Template - Index</title>
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
<link href="/resources/assets/css/login.css" rel="stylesheet">

<!-- Vendor JS Files -->
<script	src="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="/resources/assets/vendor/php-email-form/validate.js"></script>
<script src="/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>

<!-- Template Main JS File -->
<script src="/resources/assets/js/main.js"></script>

<style>

.card {
	background-image:
		url("https://cdn-cajkg.nitrocdn.com/ZJzLelPaQQUYcIzKvveTxTAioLgFVwpU/assets/static/optimized/rev-cd29551/wp-content/uploads/2019/02/messy-pizza-on-a-black-table-1024x683.jpg");
	background-repeat: no-repeat, no-repeat;
	background-position: center, center; 
}

.login_title{
	padding-top: 20vh;
}

.login_title h1{
	color: #fff;
	line-height: 1em; 
	font-weight: bold;
}

</style>
</head>

<body>

	<!-- ======= Header ======= -->
	<jsp:include page="../common/main_header.jsp" />
	<!-- End Header -->

	<main id="main">
		<section id="hero">
			<div class="hero-container">
				<div align="center">
					<div class="card o-hidden border-0 shadow-lg my-5">
						<div class="card-body p-0">
						<!-- <div class="col-lg-5 d-none d-lg-block" style="background-color: white;"></div> -->
							<div class="p-5" style="background-color: white;">
								<div>
									<h1>
										<strong style="color: black;">로그인</strong>
									</h1>
								</div>
					
					<form action="/user/login" method="POST">
						<table cellpadding="10" cellspacing="1" width="465px;" height="585px;">
						
							<tr>
								<td><input type="text" name="id" class="form-control"
									placeholder="ID" required="required"></td>
							</tr>

							<tr>

								<td><input type="password" name="password"
									class="form-control"  placeholder="PASSWORD"
									required="required"></td>
							</tr>
						
							<tr>
								<td align="center">
								<input type="submit" value="로그인" style="color: white; background-color: #e43c;" class="btn-get-started scrollto">
									<a href="/user/reg_user">
									<button type="button" class="btn-get-started scrollto" style="background-color: #e43c;">
											<font color="white">회원가입</font></button></a>
								</td>
							</tr>
							<%-- <tr>
								<td align="center">
								<!-- 네이버 로그인 화면으로 이동 시키는 URL -->
								<!-- 네이버 로그인 화면에서 ID, PW를 올바르게 입력하면 callback 메소드 실행 요청 -->
								<div id="naver_id_login" style="text-align: center">
									<a href="${url}"><img width="223"
										src="${pageContext.request.contextPath}/resources/img/naver_Bn_Black.png" /></a>
								</div>
							   </td>
							</tr> --%>
							<tr>
								<td align="center">
									<a href="user/find_account"><button type="button" class="btn-get-started scrollto" style="background-color: #e43c;">
											<font color="white">계정찾기</font></button></a>
								</td>
							</tr>
							<tr>
								<td align="center">
										<font color="red"> ${resultMessage} </font>
								</td>
							</tr>
						</table>
					</form>
					</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- ======= Footer ======= -->
	<!-- <footer id="footer">

    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6 footer-contact">
            <h3>AWESOME GUIDE</h3>
            <p>
              A108 Adam Street <br>
              New York, NY 535022<br>
              United States <br><br>
              <strong>Phone:</strong> +1 5589 55488 55<br>
              <strong>Email:</strong> info@example.com<br>
            </p>
          </div>

          <div class="col-lg-2 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Services</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
            </ul>
          </div>

          <div class="col-lg-4 col-md-6 footer-newsletter">
            <h4>Join Our Newsletter</h4>
            <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
            <form action="" method="post">
              <input type="email" name="email"><input type="submit" value="Subscribe">
            </form>
          </div>

        </div>
      </div>
    </div>

    <div class="container d-md-flex py-4">

      <div class="me-md-auto text-center text-md-start">
        <div class="copyright">
          &copy; Copyright <strong><span>AWESOME GUIDE</span></strong>. All Rights Reserved
        </div>
        <div class="credits">
          Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
        </div>
      </div>
      <div class="social-links text-center text-md-right pt-3 pt-md-0">
        <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
        <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
        <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
        <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
        <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
      </div>
    </div>
  </footer> -->
	<!-- End Footer -->
	
	<!--  Modal 추가 -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="button" data-dismiss="modal" aria-hidden="true">&times;</button>
                  <h4 class="modal-title" id="myModalLabel">수정완료</h4>
               </div>
               <div class="modal-body"><c:out value="${result}" /></div>
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
            if(result != null) {
            	
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
