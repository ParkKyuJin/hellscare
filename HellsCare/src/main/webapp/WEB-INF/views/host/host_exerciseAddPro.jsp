<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/setting.jsp" %>
<html>
<head>
</head>
<body>
	<c:if test="${insertCnt == 0}">
		<script type="text/javascript">
			alert("운동등록에 실패했습니다.");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${insertCnt != 0}">
		<script type="text/javascript">
			alert("운동이 등록되었습니다.");
			window.location="host_exercise";
		</script>
	</c:if>		
</body>
</html>