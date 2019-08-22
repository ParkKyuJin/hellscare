<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/setting.jsp" %>
<html>
<body>
	<c:if test="${updateCnt == 0}">
		<script type="text/javascript">
			alert("운동정보 수정에 실패하였습니다.");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${updateCnt != 0}">
		<script type="text/javascript">
			alert("운동정보가 수정되었습니다.");
			window.location="host_exercise?pageNum=${pageNum}";
		</script>
	</c:if>
</body>
</html>