<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<!-- 3초가 지나면 해당 ${path}를 통해 해당url로 이동 //그냘 ${path}인 경우 home으로 이동   -->
<meta http-equiv="refresh" content="3,  ${pageContext.request.contextPath}/main">
<title>HealthCare</title>
</head>
<body class="stretched">

	<br>
	<div align="center">
		<img src="resources/images/404-planet.gif">
		<p style="font-size:24">페이지를 찾을 수가 없습니다. <br> 관리자에게 문의해주세요.</p>
	</div>
</body>
</html>
