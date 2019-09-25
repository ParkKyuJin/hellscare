<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../include/setting.jsp" %>
<html>
<body>
	<c:if test="${updateCnt == 0}">
		<script type="text/javascript">
			alert("오류!! 관리자에게 문의하세요.");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${updateCnt != 0}"> 
		<script type="text/javascript">
			alert("지불이 완료되었습니다.\n관리자의 확인 및 승인 후 이용가능합니다.");
			window.location = "club";
		</script>	
	</c:if>
</body>
</html>