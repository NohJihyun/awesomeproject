<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!--
 AJAX 샘플 페이지  

-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AJAX 테스트 페이지</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
/* private int hdcode;
private int rscode;
private String hdname;
private int hdcnt;
private String hdstart;
private String hdend;
private String hddiscount;
private String hdcomment;
 */
 $(document).ready(function() {
	$("#search_btn").on('click', function() {
		
		console.log("click event");
		
		$.ajax({
			url: "/hotdeal/get",
			type: "POST",
			data: {
					search:$("#search").val()
			},
			success: function(data) {
				if(data.Code == 0) {
					for(i = 0; i < data.data.length; i++) {
						var tag = "<tr>" +
									"<td>" + data.data[i].hdcode + "</td>" +
									"<td>" + data.data[i].rscode + "</td>" +
									"<td>" + data.data[i].hdname + "</td>" +
									"<td>" + data.data[i].hdcnt + "</td>" +
									"<td>" + data.data[i].hdstart + "</td>" +
									"<td>" + data.data[i].hdend + "</td>" +
									"<td>" + data.data[i].hddiscount + "</td>" +
									"<td>" + data.data[i].hdcomment + "</td>" +
								   "</tr>"
						$("#table").append(tag);
					}
				} else {
					alert(data.Msg);
				}
			},
			error: function() {
				alert("err");	
			}
		}); 
	});
 });
</script>

</head>
<body>
<div align="center">핫딜목록</div>

<div align="right">
<input type="text" name="search" id="search"> <input type="submit" value="검색" id="search_btn">
<br>
</div>

<table class="table">
  <thead>
    <tr>
      <th scope="col">hdcode</th>
      <th scope="col">rscode</th>
      <th scope="col">hdname</th>
      <th scope="col">hdcnt</th>
      <th scope="col">hdstart</th>
      <th scope="col">hdend</th>
      <th scope="col">hddiscount</th>
      <th scope="col">hdcomment</th>
    </tr>
  </thead>
  <tbody id="table">
  	<c:forEach var="hotdeal" items="${hotdeals}">
    <tr>
      <th scope="row">${hotdeal.hdcode}</th>
      <td>${hotdeal.rscode}</td>
      <td>${hotdeal.hdname}</td>
      <td>${hotdeal.hdcnt}</td>
      <td>${hotdeal.hdstart}</td>
      <td>${hotdeal.hdend}</td>
      <td>${hotdeal.hddiscount}</td>
      <td>${hotdeal.hdcomment}</td>
    </tr>
    </c:forEach>
  </tbody>
</table>




</body>
</html>