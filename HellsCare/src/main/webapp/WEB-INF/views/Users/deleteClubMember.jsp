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
			alert("추방에 실패했습니다.");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${updateCnt != 0}">
		<script type="text/javascript">
			alert("회원이 탈퇴되었습니다.");
			window.location="details_Club?club_name=${club_name}";
		</script>
	</c:if>
</c:if>
</body>
</html>