<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/setting.jsp" %>
<html>
<body>
	<c:if test="${updateCnt == 0}">
		<script type="text/javascript">
			alert("정보수정에 실패했습니다.");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${updateCnt != 0}">
		<script type="text/javascript">
			alert("정보수정에 성공했습니다.");
			window.location="myPage";
		</script>
	</c:if>
</body>
</html>