<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	var msg_username = "아이디를 입력하세요.";
	var msg_pwd = "비밀번호를 입력하세요. ";
	var msg_repwd = "비밀번호를 확인하세요.";
	var msg_pwdChk = "비밀번호가 일치하지 않습니다.";
	var msg_name = "이름을 입력하세요.";
	var msg_address = "주민번호 앞자리를 입력하세요.";
	var msg_hp = "주민번호 앞자리를 입력하세요.";
	var msg_gender = "이메일을 입력하세요.";
	var msg_gender = "이메일을 입력하세요.";
	var msg_emailChk = "이메일형식에 일치하지 않습니다.";
	var msg_confirmId = "아이디 중복확인을 해주세요.";
	//회원가입_중복확인 
	function confirmId() {
		//아이디값  미입력 후 중복확인버튼  누른 경우
		if (!document.signupform.username.value) {
			alert(msg_username);
			document.signupform.username.focus();
			return false;
		}
		/*
		 * window.open("파일명", "윈도우명", "창속성");
		 * url = "주소?속성="+ 속성값;  ->  get방식
		 */
		var url = "confirmId?username=" + document.signupform.username.value; //get방식으로 아이디 값 가져옴. 
		window.open(url, "confirm", "menubar=no, width=500, height=400");
		// confirmId.do 서블릿 지정-----.do가 있으면 무조건 서블릿으로 가야됨 버튼 누르는 순간 다음페이지로 가야되니까
	}
	function confirmIdFocus() {
		document.confirmform.username.focus();
	}

	// 회원가입_주소 입력 
	function addressSearch() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('address1').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('address2').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('address3').focus();
					}
				}).open();
	}

	//opener : window 객체의 open() 메소드로 열린새창(=중복 확인창)에서, 열어준 부모창(=회원가입창)에 접근할 때 사용
	//self.close() : 메시지 없이 현재창을 닫을때 사용
	//hiddenId : 중복화면 버튼 클릭시 클릭여부 체크(0: 클릭안함, 1:클릭함)

	//회원가입_이메일입력
	function selectEmailChk() {
		//직접입력인 경우-초기화하고 focus주기  
		if (document.signupform.email3.value == 0) {
			document.signupform.email2.value = "";
			document.signupform.email2.focus();
			return false;
			// 자동입력인 경우 -selectbox의 email3을 email2에 입력 
		} else {
			document.signupform.email2.value = document.signupform.email3.value
		}

	}
	//회원가입_이메일인증 
	function findId() {
		if (!document.forgotid.name.value) {
			alert("이름을 입력해주세요.");
			document.forgotid.name.focus();
			return false;
		} else if (!document.forgotid.email.value) {
			alert("이메일을 입력해주세요.");
			document.forgotid.email.focus();
			return false;
		}

		else {
			window.location = "findId?email=" + document.forgotid.email.value;
		}
	}

	/*id 정규식  */
	function idChk() {

		var idReg = /^[A-Za-z0-9]{5,19}/;

		if (!idReg.test($("input[name=username]").val())) {
			alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
			document.signupform.username.value = "";
			return;
		}
	}

	/*pw 정규식  */
	function checkPw() {

		var pwReg = /^[A-Za-z0-9]{6,12}/;

		var rs = pwReg.test(document.signupform.password.value);
		if (!rs) {
			alert("비밀번호는 영문자로 시작하는 6~12자 영문자 또는 숫자이어야 합니다.");
			document.signupform.password.value = "";
			return;
		}

	}

	/* 비밀번호 일치여부  */
	function checkRePw() {

		if (document.signupform.password.value != document.signupform.repassword.value) {
			alert('비밀번호가 일치하지 않습니다. 다시입력해주세요');
			document.signupform.password.focus();
			return;
		}
	}

	// 중복확인 버튼 클릭여부 
	var msg_confirmId = "아이디 중복확인을 해주세요.";

	function confirmCk() {
		if (document.signupform.hidden_id.value == 0) {
			alert(msg_confirmId);
			document.signupform.dupChk.focus();
			return false;
		} else {
			
			alert("회원가입에 성공했습니다.");
		}
	}

	/*연락처 정규식  */
	function contactChk() {

		var ctReg = /^\d{3}-\d{3,4}-\d{4}$/;

		var rs = ctReg.test(document.signupform.phone_number.value);
		if (!rs) {
			alert("010-0000-0000형식으로 입력해주세요.");
			document.signupform.phone_number.value = "";
			document.signupform.phone_number.focus();
			return;
		}

	}
	/*생년월일 정규식  */
	function birthChk() {

		var bthReg = /^\d{4}-\d{1,2}-\d{2}$/;

		var rs = bthReg.test(document.signupform.birth.value);
		if (!rs) {
			alert("1900-00-00형식으로 입력해주세요.");
			document.signupform.birth.value = "";
			document.signupform.birth.focus();
			return;
		}

	}
	//성별 null일때 
	function genderChk() {
		//아이디값  미입력 후 중복확인버튼  누른 경우
		if (!document.signupform.gender.value) {
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


		<%@ include file="include/header.jsp"%>

		<!-- Page Title
		============================================= -->
		<section id="page-title">

			<div class="container clearfix">
				<h1>Sign Up</h1>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Sign Up</li>
				</ol>
			</div>

		</section>
		<!-- #page-title end -->
		<!-- Content
		============================================= -->


		<section id="content">

			<div class="content-wrap">

				<div class="container clearfix">

					<div class="tabs divcenter nobottommargin clearfix"
						id="tab-login-register" style="max-width: 500px;">


						<div class="tab-container">

							<div class="tab-content clearfix" id="tab-register"
								onload="signUpFocus();">
								<div class="card nobottommargin">
									<div class="card-body" style="padding: 40px;">
										<!-- id="register-form"  class="nobottommargin"  -->
										<form action="regPro" name="signupform" method="post"
											onsubmit="return confirmCk();">
											<h3>회원가입을 환영합니다.</h3>
											<!-- hiddenId : 중복확인 버튼 클릭여부 체크(0:클릭 안함,1:클릭함) -->
											<input type="hidden" name="hidden_id" value="0"> <input
												type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}"> <input type="hidden"
												name="authority" value="USER">

											<div class="row">
												<div class="col-sm-3 col-form-label">
													<label for="register-form-username">*아이디:</label>
												</div>
												<div class="col-sm-5">
													<input type="text" id="register-form-username"
														name="username" placeholder="아이디 입력" class="form-control"
														onchange="idChk();" required autofocus />
													<!--  onchange="idChk();" -->
												</div>
												<div class="col-sm-4">
													<input
														class="button button-3d button-rounded button-white button-light"
														type="button" name="dupChk" height="20px" value="중복확인"
														onclick="confirmId();">

												</div>
											</div>

											<div class="row">
												<div class="col-sm-3 col-form-label">
													<label for="register-form-password">*비밀번호:</label>
												</div>
												<div class="col-sm-9">
													<input class="form-control" type="password"
														id="register-form-password" name="password" size="23"
														value="" maxlength="10" placeholder="비밀번호 입력"
														onchange="checkPw();" required autofocus />
												</div>
											</div>

											<div class="row">
												<div class="col-sm-3 col-form-label">
													<label for="register-form-repassword">*비밀번호 확인:</label>
												</div>
												<div class="col-sm-9">
													<input type="password" id="register-form-repassword"
														name="repassword" placeholder="비밀번호 확인"
														class="form-control" onchange="checkRePw();" required
														autofocus />
												</div>
											</div>

											<div class="row">
												<div class="col-sm-3 col-form-label">
													<label for="register-form-name">*이름:</label>
												</div>
												<div class="col-sm-9">
													<input type="text" id="register-form-name" name="name"
														value="" placeholder="이름 입력" class="form-control" required
														autofocus />
												</div>
											</div>

											<div class="row">
												<div class="col-sm-3 col-form-label">
													<label for="register-form-email">*우편번호:</label>
												</div>
												<div class="col-sm-4">
													<input type="text" id="address1" name="address_1"
														placeholder="우편번호" class="form-control" required autofocus>
												</div>
												<div class="col-sm-5">
													<input
														class="button button-3d button-rounded button-white button-light"
														type="button" value="우편번호 검색" onclick="addressSearch();">
												</div>

											</div>

											<div class="row">
												<div class="col-sm-3 col-form-label">
													<label for="register-form-email">*기본주소:</label>
												</div>
												<div class="col-sm-9">
													<input type="text" id="address2" name="address_2"
														placeholder="기본주소 입력" class="form-control" required
														autofocus>
												</div>
											</div>
											<div class="row">
												<div class="col-sm-3 col-form-label">
													<label for="register-form-email">*상세주소:</label>
												</div>
												<div class="col-sm-9">
													<input type="text" id="address3" name="address_3"
														placeholder="상세주소 입력" class="form-control" required
														autofocus>
												</div>
											</div>


											<div class="row">
												<div class="col-sm-3 col-form-label">
													<label for="register-form-phone">*연락처:</label>
												</div>
												<div class="col-sm-9">
													<input class="form-control" id="register-form-phone"
														type="text" name="phone_number"
														placeholder="010-0000-0000" onchange="contactChk();"
														required autofocus />
												</div>
											</div>

											<div class="row">
												<div class="col-sm-3 col-form-label">
													<label for="fitness-form-sex">성별:</label>
												</div>
												<div class="col-sm-9">
													<div class="btn-group btn-group-toggle d-flex"
														data-toggle="buttons">
														<label class="btn btn-outline-dark font-body ls0 nott">
															<input type="radio" class="required form-control valid"
															name="gender" value="Male">Male
														</label> <label class="btn btn-outline-dark font-body ls0 nott">
															<input type="radio" class="required form-control valid"
															name="gender" value="Female">Female
														</label>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-sm-3 col-form-label">
													<label for="register-form-email">생년월일:</label>
												</div>
												<div class="col-sm-9">
													<input type="text" id="register-form-email" name="birth"
														id="freelance-quote-email" class="form-control"
														onchange="birthChk();" onblur="genderChk();"
														placeholder="생년월일 입력(1900-01-01)" required autofocus />
												</div>
											</div>
											<div class="row">
												<div class="col-sm-3 col-form-label">
													<label for="register-form-email">이메일:</label>
												</div>
												<div class="col-sm-9">
													<input type="email" id="register-form-email" name="email"
														id="freelance-quote-email" class="form-control" value=""
														placeholder="이메일 입력(user@naver.com)" required autofocus />
												</div>
											</div>

											<div class="col_full nobottommargin">
												<button class="button button-3d button-black nomargin"
													type="submit">가입하기</button>

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

		</section>
		<!-- #content end -->
		<!-- Footer
		============================================= -->
		<%@ include file="include/footer.jsp"%>

	</div>
	<!-- #wrapper end -->

	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>


	<!-- External JavaScripts
	============================================= -->

	<%@ include file="include/footerScript.jsp"%>
</body>
</html>