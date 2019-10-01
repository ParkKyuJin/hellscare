<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/setting.jsp" %>
<html>
<body>
	<c:if test="${deleteCnt == 0}">
		<script type="text/javascript">
			alert("탈퇴에 실패했습니다.");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${deleteCnt != 0}">
		<script type="text/javascript">
			alert("탈퇴에 성공했습니다. \n이용해주셔서 감사합니다.");
			window.location="main";
		</script>
	</c:if>
</body>
</html>