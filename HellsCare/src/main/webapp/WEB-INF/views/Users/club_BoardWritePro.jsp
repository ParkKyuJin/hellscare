<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<c:if test="${insertCnt == 0}">
	<script type="text/javascript">
		alert("등록에 실패했습니다.");
		history.back();
	</script>
</c:if>

<c:if test="${insertCnt != 0}">
	<script type="text/javascript">
		alert("게시글이 등록되었습니다.");
		window.location="details_Club?club_name=${club_name}";
	</script>
</c:if>
</body>
</html>