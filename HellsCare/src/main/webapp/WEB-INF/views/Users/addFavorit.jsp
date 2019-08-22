<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/setting.jsp" %>
<html>
<body>
	<c:if test="${insertCnt == 0}">
		<script type="text/javascript">
			alert("즐겨찾기 추가 실패!");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${insertCnt != 0}">
		<script type="text/javascript">
			alert("즐겨찾기에 추가되었습니다.");
			window.location="details_exercise?exercise_code=${exercise_code}";
		</script>
	</c:if>
</body>
</html>