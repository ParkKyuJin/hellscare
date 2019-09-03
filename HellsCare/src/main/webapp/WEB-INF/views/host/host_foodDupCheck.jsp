<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식 중복 확인</title>
</head>
<body>
	<c:if test="${selectCnt == 0}">
		<table>
			<tr>
				<th>
					<center>
						<span style="color:blue;">${food_name}</span>은 사용할 수 있습니다.<br>
					</center>
				</th>
			</tr>
			
			<tr>
				<td>
					<input type="hidden" id="food_name" name="food_name" value="${food_name}">
					<input type="button" id="accept_name" name="accept_name" value="사용하기" onclick="use_foodName('${food_name}');">
				</td>
			</tr>
		</table>
		
		<script type="text/javascript">
			function use_foodName(foodName) {
				opener.document.getElementById("food_name").value = foodName;
				opener.document.getElementById("food_name_chk").value = 1;
				self.close();
			}
		</script>
	</c:if>
	
	<c:if test="${selectCnt != 0}">
		<form action="host_foodDupCheck" method="post" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<table>
				<tr>
					<th colspan="2">
						<center>
							<span style="color:red;">${food_name}</span>은 사용할 수 없습니다.<br>
							다른 음식명을 입력하여주십시오.
						</center>
					</th>
				</tr>
				
				<tr>
					<td>
						음식명 :
					</td>
					
					<td>
						<input type="text" id="food_name" name="food_name">
						<input type="submit" id="check_foodDup" name="check_foodDup" value="중복확인">
					</td>
				</tr>
			</table>
		</form>
	</c:if>
	
</body>
</html>