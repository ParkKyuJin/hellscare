<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/setting.jsp" %>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />

	<!-- Stylesheets
	============================================= -->
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<script type="text/javascript">

//중복 확인창에서 id 입력 여부
function confirmIdcheck(){
	if(!document.confirmform.username.value){
		alert(msg_username);
		document.confirmform.username.focus();
		return false;
	}
}//end confirmIdcheck
</script>
</head>
<body onload="confirmIdFocus();">

<div class="col-lg-4 col-md-6 bottommargin">
<br><br>
	<div class="promo promo-border promo-mini" style="align:center">
	<div class="heading-block center">
		<h2>아이디 중복확인</h2>
	</div>	
		<form action="confirmId" method="post" name="confirmform" onsubmit="return confirmIdcheck();">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		
			<!-- id 중복  -->
			<c:if test="${selectCnt == 1}">
					<h3><span>${username}</span>는 사용할 수 없습니다.</h3>
					<h3>아이디 :
						<input class="input" type="text" name="username" maxlength="20"
						style="width: 150px"></h3>
						
						<input class="btn btn-secondary topmargin-sm" type="submit" value="확인" >
						<input class="btn btn-secondary topmargin-sm" type="reset" value="취소" onclick="self.close();"> 
			</c:if>
		
			<!-- id 중복아닐때 -->
			<c:if test="${selectCnt != 1}">
							<h3><span>${username}</span>는 사용할 수 있습니다.</h3>
							<input class="btn btn-secondary topmargin-sm" type="button" value="확인" onclick="setId('${username}');">
			</c:if>
		</form>	
	</div>
</div>

</body>
</html>