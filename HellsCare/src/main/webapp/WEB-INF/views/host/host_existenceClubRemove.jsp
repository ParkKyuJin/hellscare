<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/setting.jsp" %>
<html>
<body>
	<c:if test="${deleteCnt == 0}">
		<script type="text/javascript">
			alert("삭제에 실패했습니다.");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${deleteCnt != 0}">
		<script type="text/javascript">
			alert("선택하신 동호회가 삭제되었습니다.");
			window.location="host_clubManagement?pageNum="+${pageNum};
		</script>
	</c:if>
</body>
</html>