<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/setting.jsp" %>
<body>

<h2>회원가입 처리페이지</h2>

	<c:if test="${cnt == 0}">

		<script type="text/javascript">
		var insertError = "회원가입에 실패했습니다.\n확인 후 다시 시도하세요 .!!";
			function errorAlert(insertError){
				alert(insertError); 
				window.history.back(); // 이전페이지로 이동 
			}

		</script>		
	</c:if>
	<c:if test="${cnt != 0}">
	<c:redirect url="login_reg?cnt=${cnt}">
	</c:redirect>

</c:if>
</body>
</html>