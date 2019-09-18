<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
				<h1>My Account</h1>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="main">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">로그인</li>
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

							<div class="tab-content clearfix" id="tab-login">
								<div class="card nobottommargin">
									<div class="card-body" style="padding: 40px;">
										<form id="login-form" name="login-form" class="nobottommargin"
											action="login_check" method="post">
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}">

											<h3>로그인을 환영합니다.</h3>

											<div class="col_full">
												<label for="login-form-username">ID:</label> <input
													type="text" id="login-form-username" name="username"
													value="" class="form-control" />
											</div>

											<div class="col_full">
												<label for="login-form-password">PW:</label> <input
													type="password" id="login-form-password" name="password"
													value="" class="form-control" />
											</div>

											<div class="col_full">
												<span style="color: red">${errMsg}</span>
											</div>
											<div class="col_full nobottommargin">
												<button type="submit"
													class="button button-3d button-black nomargin"
													id="loginbtn" name="login-form-submit" value="login">Login</button>
												<a href="forgotId" class="fright">Forgot ID?</a> <br> <a
													href="forgotPw" class="fright">Forgot Password?</a>
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