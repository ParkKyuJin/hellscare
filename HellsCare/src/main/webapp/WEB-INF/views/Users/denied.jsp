<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<!-- 3초가 지나면 해당 ${path}를 통해 해당url로 이동 //그냘 ${path}인 경우 home으로 이동   -->
<meta http-equiv="refresh" content="3,  ${pageContext.request.contextPath}/main2">
<title>HealthCare</title>
</head>
<body class="stretched">

	<br>
	<div align="center">
		<img src="resources/images/403-Forbidden-HTML.gif">
		<p>${errMsg}</p>
	</div>
</body>
</html>
