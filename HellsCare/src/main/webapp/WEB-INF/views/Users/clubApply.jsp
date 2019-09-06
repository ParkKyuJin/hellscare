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
			alert("이미 가입신청한 동호회입니다.");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${insertCnt == 2}">
		<script type="text/javascript">
			alert("더이상 동호회에 가입하실수 없습니다.");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${insertCnt == 1}">
		<script type="text/javascript">
			alert("가입신청에 성공했습니다 \n대표자의 승인후 가입이 처리됩니다.");
			window.location="club";
		</script>
	</c:if>
</c:if>
</body>
</html>