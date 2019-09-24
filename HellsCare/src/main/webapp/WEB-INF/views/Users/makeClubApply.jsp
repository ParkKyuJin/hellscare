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
			alert("동호회 개설이 정상적으로 신청되었습니다.\n개설비 지급 페이지로 이동합니다.");
			window.location = "payCreateClub?club_name=${vo.club_name}&club_master=${vo.club_master}&club_kind=${vo.club_kind}&area=${vo.area}&club_max=${vo.club_max}";
		</script>
	</c:if>
</c:if>
</body>
</html>