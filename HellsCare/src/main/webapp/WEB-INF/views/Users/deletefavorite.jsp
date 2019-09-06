<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/setting.jsp" %>
<html>
<body>
<c:if test="${memId == null}">
	<script type="text/javascript">
		alert("로그인을 하셔야 이용하실수 있습니다.");
		window.location="login_reg";
	</script>
</c:if>
<c:if test="${memId != null}">
	<c:if test="${deleteCnt == 0}">
		<script type="text/javascript">
			alert("삭제에 실패했습니다.");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${deleteCnt != 0}">
		<script type="text/javascript">
			alert("즐겨찾기에서 삭제되었습니다.");
			window.location="exercise_favorite";
		</script>
	</c:if>
</c:if>
</body>
</html>