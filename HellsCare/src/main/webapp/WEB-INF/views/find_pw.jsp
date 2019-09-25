<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/setting.jsp"%>
<html>
<body>
	<c:if test="${cnt==0}">
		<script type="text/javascript">
			alert("이메일 전송에 실패하였습니다. \n 입력하신 정보를 다시 확인해주세요.");
			history.back();
		</script>
	</c:if>

	<c:if test="${cnt!=0}">
		<script type="text/javascript">
			setTimeout(function() {
				alert("이메일이 전송되었습니다.");
				window.location="login_reg";
			}, 500);
		</script>
	</c:if>
</body>
</html>