<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/setting.jsp" %>
<html>
<body>
	<c:if test="${deleteCnt == 0}">
		<script type="text/javascript">
			alert("운동삭제에 실패했습니다.");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${deleteCnt != 0}">
		<script type="text/javascript">
			alert("운동이 삭제되었습니다.");
			window.location="host_exercise";
		</script>
	</c:if>
	
</body>
</html>