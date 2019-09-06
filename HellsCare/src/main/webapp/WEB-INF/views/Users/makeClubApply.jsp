<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../include/setting.jsp" %>
<html>
<body>
<c:if test="${memId == null}">
	<script type="text/javascript">
		alert("로그인을 하셔야 이용하실수 있습니다.");
		window.location="login_reg";
	</script>
</c:if>
<c:if test="${memId != null}">
	<c:if test="${insertCnt == 0}">
		<script type="text/javascript">
			alert("개설신청실패!");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${insertCnt != 0}">
		<script type="text/javascript">
			alert("개설신청이 완료되었습니다.\n관리자의 승인후 개설됩니다.");
			window.location = "main2"
		</script>
	</c:if>
</c:if>
</body>
</html>