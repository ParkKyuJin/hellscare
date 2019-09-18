<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/setting.jsp" %>
<html>
<body>
<c:if test="${memId == null}">
	<script type="text/javascript">
		alert("회원만 이용가능합니다.");
		window.location="login_reg";
	</script>
</c:if>


<c:if test="${memId != null}">
	<c:if test="${updateCnt == 0}">
		<script type="text/javascript">
			alert("승인에 실패했습니다.");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${updateCnt == 1}">
		<script type="text/javascript">
			alert("승인이 완료되었습니다.");
			window.location="details_Club?club_name=${club_name}";
		</script>
	</c:if>
	
	<c:if test="${updateCnt == 2}">
		<script type="text/javascript">
			alert("해당 회원의 동호회가 최대입니다.");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${updateCnt == 3}">
		<script type="text/javascript">
			alert("동호회가 이미 최대인원입니다.\n더이상 회원을 받을 수 없습니다.");
			history.back();
		</script>
	</c:if>
</c:if>
</body>
</html>