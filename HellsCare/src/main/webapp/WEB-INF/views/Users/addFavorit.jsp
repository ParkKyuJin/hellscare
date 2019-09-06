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
		<c:if test="${insertCnt == 0}">
			<script type="text/javascript">
				alert("즐겨찾기 추가 실패!");
				history.back();
			</script>
		</c:if>
		
		<c:if test="${insertCnt != 0}">
			<script type="text/javascript">
				alert("즐겨찾기에 추가되었습니다.");
				window.location="details_exercise?exercise_code=${exercise_code}";
			</script>
		</c:if>
	</c:if>
</body>
</html>