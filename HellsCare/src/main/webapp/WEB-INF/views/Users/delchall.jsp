<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${cnt==1}">
	<script type="text/javascript">
		alert("삭제되었습니다.");
		window.location="Mychallenge"
	</script>
</c:if>
<c:if test="${cnt!=1}">
	<script type="text/javascript">
		alert("삭제에 실패하였습니다. 잠시 후 다시 시도해주세요")
		window.location="Mychallenge"
	</script>
</c:if>
</body>
</html>