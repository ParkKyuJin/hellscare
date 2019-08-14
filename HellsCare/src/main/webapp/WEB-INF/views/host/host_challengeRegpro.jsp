<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:if test="${cnt==1}">
		<script type="text/javascript">
		alert("등록되었습니다!");
		window.location="host_challenge"
		</script>
	</c:if>
	<c:if test="${cnt!=1}">
		<script type="text/javascript">
		alert("등록에 실패하였습니다. 다시 시도해주세요.");
		window.history.back();
		</script>
</c:if>