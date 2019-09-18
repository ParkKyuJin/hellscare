<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/setting.jsp"%>
<html>
<body>
	<c:if test="${username==null}">
		<script type="text/javascript">
			alert("이메일 인증에 실패하였습니다. \n이메일 또는 이름을 다시 확인해주세요.");
			history.back();
		</script>
	</c:if>

	<c:if test="${username!=null}">
		<script type="text/javascript">
			setTimeout(function() {
				alert("이메일이 전송되었습니다.");
				window.history.back();
			}, 500);
		</script>
	</c:if>
</body>
</html>