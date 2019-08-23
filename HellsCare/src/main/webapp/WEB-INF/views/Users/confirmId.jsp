<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />

	<!-- Stylesheets
	============================================= -->
	<%@ include file="../include/setting.jsp" %>
	<meta name="viewport" content="width=device-width, initial-scale=1" />

</head>
<body onload="confirmIdFocus();">
	<h2>중복확인 페이지</h2>

<form action="confirmId" method="post" name="confirmform" onsubmit="return confirmIdcheck();">

	<!-- id 중복  -->
	<c:if test="${selectCnt == 1}">

	<table>
		<tr>
			<td colspan="2">
			<span>${username}</span>는 사용할 수 없습니다.</td>
		</tr>
		<tr>
			<th>아이디 : </th>
			<td>
				<input class="input" type="text" name="username" maxlength="20"
				style="width: 150px">
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input class="input" type="submit" value="확인" >
				<input class="input" type="reset" value="취소" onclick="self.close();"> 
			</th>
		</tr>
	</table>
	</c:if>

	<!-- id 중복아닐때 -->
	<c:if test="${selectCnt != 1}">

		<table>
			<tr>
				<td align="center">
					<span>${username}</span>는 사용할 수 있습니다.
				</td>
			</tr>
			<tr>
				<th>
					<input class="inputButton" type="button" value="확인" onclick="setId('${username}');">
				</th>
			</tr>
		</table>
		</c:if>

</form>
</body>
</html>