<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:if test="${updateCnt==1}">
		<script type="text/javascript">
			alert("수정되었습니다!");
			window.location="host_foodList?pageNum=${pageNum}"
		</script>
	</c:if>
	<c:if test="${updateCnt!=1}">
		<script type="text/javascript">
			alert("수정에 실패하였습니다. 다시 시도해주세요.");
			window.history.back();
		</script>
</c:if>