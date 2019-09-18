<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />

	<!-- Stylesheets
	============================================= -->
	<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- Range Slider CSS -->

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
				<h1>My Account</h1>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">아이디 찾기</li>
				</ol>
			</div>

		</section><!-- #page-title end -->
				<!-- Content
		============================================= -->
			
			
		<section id="content">
				
				<div class="content-wrap">
		
					<div class="container clearfix">
		
						<div class="tabs divcenter nobottommargin clearfix" id="tab-login-register" style="max-width: 500px;">
		
					<div class="tab-container">
		
						<div class="tab-content clearfix" id="tab-login">
							<div class="card nobottommargin">
								<div class="card-body" style="padding: 40px;">
								<form action="findId" name="findId"
								 method="get" >
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								
								<!-- 이거는 페이지마다 추가해야함 -->
										<h3>아이디 찾기</h3>
									<div class="row">
										<div class="col-sm-3 col-form-label">
										<label for="register-form-name">이름:</label>
										</div>
										<div class="col-sm-9">
										<input type="text" id="nameChk" name="name"
											placeholder="이름 입력" class="form-control" required autofocus/>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-3 col-form-label">
											<label for="register-form-email">이메일:</label>
										</div>
										<div class="col-sm-9">
										<input type="email" id="emailChk" name="email"
										class="form-control" placeholder="이메일 입력(user@naver.com)" required autofocus />
										</div>
									</div> 
									<div class="col_full">
									</div>
									<div class="row">
										<div class="col-sm-3 col-form-label">
										</div>
										 <div class="col-sm-3">
										 </div>
										
									    <div class="col-sm-6">
											<input class="button button-3d button-rounded button-white button-light" 
											type="submit" value="이메일로 아이디 찾기">	
										</div>
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
		<%@ include file="include/footer.jsp"%>

	</div><!-- #wrapper end -->

	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>


	<!-- External JavaScripts
	============================================= -->

	<%@ include file="include/footerScript.jsp"%>
</body>
</html>