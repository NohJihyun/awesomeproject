<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- reply.js 사용 -->
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script>
	$(document).ready(function() {
		
		var rvcodeValue = '<c:out value="${review.rvcode}" />';
		var replyUL = $(".reply");
				showList(1);
		
		function showList(page) {
			replyService.getList({rvcode:rvcodeValue, page:page||1}, function(list) {
				
				var str = "";
				if(list == null || list.length == 0) {
					replyUL.html("");
					return;
				}
				
				for(var i = 0; len = list.length || 0; i < len; i++) {
					str += "<li data-rno="+ list[i].rpcode+"'>";
					str += "   <div><div class='header'><strong class='primary-font'>" + list[i].id + "</strong>";
					str += "     <small class='pull-right text-muted'>" + list[i].rpdate + "</small></div>";
					str += "		"	
					
				}
				
			})
		}
		
		console.log(replyService);
	});
</script>
<!-- JavaScript Bundle with Popper -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js">​</script>

</head>
<body>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">등록</h1>
	</div>
</div>

<div class="row">
	<div class="panel panel-default">
	
		<div class="panel-body">
			<form id="form" action="/register" method="post">
				<div class="form-group">
					<label>rvcode</label> <input class="form-control" name="rvcode">
				</div>
				<div class="form-group">
					<label>id</label> <input class="form-control" name="id">
				</div>
				<div class="form-group">
					<label>rpcontent</label> <input class="form-control" name="rpcontent">
				</div>
				<div class="form-group">
					<label>rpdate</label> <input class="form-control" name="rpdate" value="2021-06-17 14:00:00">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>		
		</div>
	</div>
</div>
<div class="panel-body">
<!-- reply -->
<ul class="reply">
<li class="left clearfix" data-rno='12'>
<div>
	<div class="header">
		<strong class="primary-font">test</strong>
		<small class="pull-right text-muted">2021-06-17 13:13</small>
	</div>
	<p>맛집입니다</p>
</div>
</li>
</ul>
</body>
</html>