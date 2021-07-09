<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- 오늘날짜  formatDate => date타입을 String타입으로 변환 -->
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate" />

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
        <div id=content>
            <!-- Content Row -->
            <div class="row">

                <!-- Content Column -->


                <div class="card w-55">
                    <div class="card-header">
                        <h4>
                            <span style="font-weight: bold; color: #e43c;">핫딜 상세보기</span>
                        </h4>
                    </div>

                    <div class="card-body">
                            <table style="float: left;">
                                <tr>
                                    <th>핫딜명:</th>
                                    <td>
                                        ${detailhotdeal.hdname}
                                    </td>
                                </tr>
                                <tr>
                                    <th>식당:</th>
                                    <td>${detailhotdeal.rsname}</td>
                                </tr>
                                <tr>
                                    <th>유효 기간:</th>
                                    <td>${detailhotdeal.hdstart} ~ ${detailhotdeal.hdend}</td>
                                </tr>
                                <tr>
                                    <th>핫딜내용:</th>
                                    <td>${detailhotdeal.hdcomment}</td>
                                </tr>
                                <tr>
                                    <th>할인율:</th>
                                    <td>${detailhotdeal.hddiscount}</td>
                                </tr>
                                <tr>
                                    <th>발행전체수:</th>
                                    <td>${detailhotdeal.hdcnt}</td>
                                </tr>
                                <tr>
                                    <th>발행개수:</th>
                                    <td>${detailhotdeal.offercount}</td>
                                </tr>
                            </table>
                </div>
                <div align="center">
                	<a href="/admin/update_hotdeal.do?hdcode=${detailhotdeal.hdcode}"><input type="button" class="button" value="수정"></a>
                </div>
                <!--  설명끝 -->
                <!-- 태그 -->

                <!--  태그끝 -->

            </div>

        </div>

    </div>
            <!-- Footer -->


        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->

   
</body>
</html>