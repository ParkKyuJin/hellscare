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
	<c:if test="${updateCnt == 0}">
		<script type="text/javascript">
			alert("탈퇴에 실패했습니다.");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${updateCnt != 0}">
		<script type="text/javascript">
			alert("해당 동호회에서 탈퇴했습니다.");
			window.location="club";
		</script>
	</c:if>
</c:if>
</body>
</html>