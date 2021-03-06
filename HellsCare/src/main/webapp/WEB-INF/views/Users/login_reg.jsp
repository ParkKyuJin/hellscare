<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<html>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
/*id 정규식  */
function idChk(){

	var idReg = /^[A-Za-z0-9]{5,19}/;

	if(!idReg.test($("input[name=username]").val())) {
        alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
        document.signupform.username.value =""; 
        return;
    }
}

/*pw 정규식  */
function checkPw(){

	var pwReg = /^[A-Za-z0-9]{6,12}/;
	
    var rs = pwReg.test(document.signupform.password.value);
    if(!rs){
        alert("비밀번호는 영문자로 시작하는 6~12자 영문자 또는 숫자이어야 합니다.");
        document.signupform.password.value =""; 
    	return;
	}

}

/* 비밀번호 정규식 이 */
/*function checkPassword(){
	
	var pwReg = /^[A-Za-z0-9]{6,12}/;  //숫자와 문자 포함 형태의 6~12자리 이내의 암호 정규식

	// input name으로 쓰면 왜 안되는거지
	if(!pwReg.test($("input[name=password]").val())){
		alert('숫자와 영문 대소문자 포함 형태의 7~13자리 이내의 비밀번호를 사용해야 합니다.');
		document.signupform.password.value ="";
		document.signupform.password.focus();
		return;
	}
	
}*/

/* 비밀번호 일치여부  */
function checkRePw(){
	
	if(document.signupform.password.value != document.signupform.repassword.value){
		alert('비밀번호가 일치하지 않습니다. 다시입력해주세요');
		document.signupform.password.focus();
		return;
	}
}  


// 중복확인 버튼 클릭여부 
var msg_confirmId="아이디 중복확인을 해주세요.";

function confirmCk(){
	if(document.signupform.hidden_id.value ==0){
		alert(msg_confirmId);
	 	document.signupform.dupChk.focus();
	 	return false;
	}
}

/*연락처 정규식  */
function contactChk(){

	var ctReg = /^\d{3}-\d{3,4}-\d{4}$/;
	
    var rs = ctReg.test(document.signupform.phone_number.value);
    if(!rs){
        alert("010-0000-0000형식으로 입력해주세요.");
        document.signupform.phone_number.value ="";
        document.signupform.phone_number.focus();
    	return;
	}

}	
/*생년월일 정규식  */
function birthChk(){

	var bthReg = /^\d{4}-\d{1,2}-\d{2}$/;
	
    var rs = bthReg.test(document.signupform.birth.value);
    if(!rs){
        alert("1900-00-00형식으로 입력해주세요.");
        document.signupform.birth.value =""; 
        document.signupform.birth.focus();
    	return;
	}

}	
//성별 null일때 
function genderChk(){
	  //아이디값  미입력 후 중복확인버튼  누른 경우
	  if(!document.signupform.gender.value){
	      alert("성별을 선택해주세요."); 
	      return; 
	  }
}
</script>
<head>




	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />

	<!-- Stylesheets
	============================================= -->
	<meta name="viewport" content="width=device-width, initial-scale=1" />

	<!-- Document Title
	============================================= -->
	<title>HealthCare</title>

</head>
<body class="stretched">
	<!-- Document Wrapper
	============================================= -->
	<div id="wrapper" class="clearfix">

		<!-- Header
		============================================= -->
	

	<%@ include file="../include/header.jsp"%>
	
		<!-- Page Title
		============================================= -->
		<section id="page-title">

			<div class="container clearfix">
				<h1>My Account</h1>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">로그인</li>
				</ol>
			</div>

		</section><!-- #page-title end -->
				<!-- Content
		============================================= -->
			
			
		<section id="content">
				
				<div class="content-wrap">
		
					<div class="container clearfix">
		
						<div class="tabs divcenter nobottommargin clearfix" id="tab-login-register" style="max-width: 500px;">
		
					<ul class="tab-nav2 tab-nav center clearfix">
						<li class="inline-block "><a href="#tab-login">로그인</a></li>
						<li class="inline-block"><a href="#tab-register">회원가입</a></li>
						
					</ul>
		
					<div class="tab-container">
		
						<div class="tab-content clearfix" id="tab-login">
							<div class="card nobottommargin">
								<div class="card-body" style="padding: 40px;">
									<form id="login-form" name="login-form" class="nobottommargin" action="login_check" method="post">
									<!-- 이거는 페이지마다 추가해야함 -->
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		
										<h3>로그인을 환영합니다.</h3>
		
										<div class="col_full">
											<label for="login-form-username">ID:</label>
											<input type="text" id="login-form-username" name="username" value="" class="form-control" />
										</div>
		
										<div class="col_full">
											<label for="login-form-password">PW:</label>
											<input type="password" id="login-form-password" name="password" value="" class="form-control" />
										</div>
										
										<div class="col_full">
										<span style="color:red">${errMsg}</span>
										</div>
										<div class="col_full nobottommargin">
											<button type="submit" class="button button-3d button-black nomargin" id="loginbtn" name="login-form-submit" value="login">Login</button>
											<!--<a href="#" class="fright">Forgot Password?</a> -->
										</div>
									</form>
								</div>
							</div>
						</div>
						
		
				<div class="tab-content clearfix" id="tab-register" onload="signUpFocus();">
					<div class="card nobottommargin">
						<div class="card-body" style="padding: 40px;">
						<!-- id="register-form"  class="nobottommargin"  -->
						<form action="regPro" name="signupform"
						 method="post"  onsubmit="return confirmCk();">
						<h3>회원가입을 환영합니다.</h3>
						<!-- hiddenId : 중복확인 버튼 클릭여부 체크(0:클릭 안함,1:클릭함) -->
						<input type="hidden" name="hidden_id" value="0">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<input type="hidden" name ="authority"  value="USER">
						
						<div class="row">
							<div class="col-sm-3 col-form-label">
							<label for="register-form-username">*아이디:</label>
							</div>
							<div class="col-sm-5">
							<input type="text" id="register-form-username" name="username"  placeholder="아이디 입력" class="form-control" onchange="idChk();" required autofocus/><!--  onchange="idChk();" -->
							</div> 
							 <div class="col-sm-4">
							<input class="button button-3d button-rounded button-white button-light" type="button" name="dupChk" height="20px" value="중복확인" onclick="confirmId();">
							
							</div>
						</div>
						
						<div class="row">
							<div class="col-sm-3 col-form-label">
							<label for="register-form-password">*비밀번호:</label>
							</div>
							<div class="col-sm-9">
							<input class="form-control" type="password" id="register-form-password" name="password" size="23"
							 value="" maxlength="10" placeholder="비밀번호 입력"  onchange ="checkPw();" required autofocus />
							 </div>
						</div>
		
						<div class="row">
							<div class="col-sm-3 col-form-label">
							<label for="register-form-repassword">*비밀번호 확인:</label>
							</div>
							<div class="col-sm-9">
							<input type="password" id="register-form-repassword" name="repassword" 
								placeholder="비밀번호 확인"  class="form-control" onchange = "checkRePw();" required autofocus/>
							</div>
						</div>
						
						<div class="row">
							<div class="col-sm-3 col-form-label">
							<label for="register-form-name">*이름:</label>
							</div>
							<div class="col-sm-9">
							<input type="text" id="register-form-name" name="name" value=""
								placeholder="이름 입력" class="form-control" required autofocus/>
							</div>
						</div>
						
						<div class="row">
							<div class="col-sm-3 col-form-label">
							<label for="register-form-email">*우편번호:</label>
							</div>
							<div class="col-sm-4">
							<input type="text" id="address1" name="address_1"
								placeholder="우편번호" class="form-control" required autofocus >
							</div>
							 <div class="col-sm-5">
								<input class="button button-3d button-rounded button-white button-light" 
								type="button" value="우편번호 검색" onclick="addressSearch();">	
							</div>
							
						</div>
						
						<div class="row">
							<div class="col-sm-3 col-form-label">
							<label for="register-form-email">*기본주소:</label>
							</div>
							<div class="col-sm-9">
							<input type="text" id="address2" name="address_2"
								placeholder="기본주소 입력" class="form-control" required autofocus >
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3 col-form-label">
							<label for="register-form-email">*상세주소:</label>
							</div>
							<div class="col-sm-9">
							<input type="text" id="address3" name="address_3"
								placeholder="상세주소 입력" class="form-control" required autofocus >
							</div>
						</div>
						
						
						<div class="row">
							<div class="col-sm-3 col-form-label">
							<label for="register-form-phone">*연락처:</label>
							</div>
							<div class="col-sm-9">
							<input class="form-control" id="register-form-phone" type="text" name="phone_number"
							 placeholder="010-0000-0000" onchange= "contactChk();" required autofocus />
							</div>
						</div>

						<div class="row">
							<div class="col-sm-3 col-form-label">
								<label for="fitness-form-sex">성별:</label>
							</div>
							<div class="col-sm-9">
								<div class="btn-group btn-group-toggle d-flex" data-toggle="buttons">
									<label class="btn btn-outline-dark font-body ls0 nott">
										<input type="radio" class="required form-control valid" name="gender" value="Male" >Male
									</label>
									<label class="btn btn-outline-dark font-body ls0 nott">
										<input type="radio" class="required form-control valid" name="gender" value="Female">Female
									</label>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3 col-form-label">
								<label for="register-form-email">생년월일:</label>
							</div>
							<div class="col-sm-9">
							<input type="text" id="register-form-email" name="birth" id="freelance-quote-email" 
							class="form-control" onchange= "birthChk();" placeholder="생년월일 입력(1900-01-01)" required autofocus />
							</div>
						</div> 	
						<div class="row">
							<div class="col-sm-3 col-form-label">
								<label for="register-form-email">이메일:</label>
							</div>
							<div class="col-sm-9">
							<input type="email" id="register-form-email" name="email" id="freelance-quote-email" 
							class="form-control" value="" placeholder="이메일 입력(user@naver.com)" required autofocus />
							</div>
						</div> 
						<div class="row">
							<div class="col-sm-3 col-form-label">
							</div>
							 <div class="col-sm-3">
							 </div>
							  <div class="col-sm-2">
							 </div>
						    <div class="col-sm-4">
								<input class="button button-3d button-rounded button-white button-light" 
								type="button" value="이메일 인증" onclick="findId();">	
							</div>
						</div>
						

						<div class="col_full nobottommargin">
							<button class="button button-3d button-black nomargin"  type="submit">가입하기</button>
					
						<!--  id="register-form-submit"-->
						</div>

							</form>
						</div>
					</div>
				</div>
			

			</div>

		</div>

	</div>

</div>
		
</section><!-- #content end -->
<!-- Footer
		============================================= -->
		<%@ include file="../include/footer.jsp"%>

	</div><!-- #wrapper end -->

	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>


	<!-- External JavaScripts
	============================================= -->

	<%@ include file="../include/footerScript.jsp"%>
</body>
</html>