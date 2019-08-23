<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/header.jsp" %>
<meta charset="UTF-8">
<!-- 3초가 지나면 해당 ${path}를 통해 해당url로 이동 //그냘 ${path}인 경우 home으로 이동   -->
<meta http-equiv="refresh" content="3,  ${path}/main2">
<title>Insert title here</title>
</head>
<body>
	<p>${errMsg}</p>

</body>
</html>
