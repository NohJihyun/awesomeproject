<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
    /** js확장자에서도 JSTL 경로를 사용하기 위한 전역변수 */
    var ROOT_URL = "${pageContext.request.contextPath}";
</script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/plugins/handlebars/handlebars-v4.1.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/common-helper.js"></script>