<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/setting.jsp" %>
<html>
<body>
	<c:if test="${updateCnt == 0}">
		<script type="text/javascript">
			alert("승인에 실패했습니다.");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${updateCnt == 2}">
		<script type="text/javascript">
			alert("해당 회원의 동호회가 최대입니다.");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${updateCnt == 1}">
		<script type="text/javascript">
			alert("승인이 완료되었습니다.");
			window.location="host_clubManage?pageNum="+${pageNum};
		</script>
	</c:if>
</body>
</html>