<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/setting.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${name == null}">
	<h1>메인페이지입니다!</h1>
</c:if>

<c:if test="${name != null}">
	<h3>이름</h3>
	<h3>${name}</h3>
	<h3>아이디</h3>
	<h3>${id}</h3>
</c:if>
</body>
</html>