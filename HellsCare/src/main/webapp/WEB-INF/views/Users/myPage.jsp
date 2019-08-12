<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>


<!DOCTYPE html>

<head>

	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />

	<!-- Stylesheets
	============================================= -->
	<%@ include file="../include/setting.jsp" %>
	<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- Range Slider CSS -->
	<link rel="stylesheet" href="${project}css/components/ion.rangeslider.css" type="text/css" />

	<link rel="stylesheet" href="${project}css/responsive.css" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />

	<link rel="stylesheet" href="${project}css/custom.css" type="text/css" />




	<!-- Document Title
	============================================= -->
	<title>Canvas | The Multi-Purpose HTML5 Template</title>

</head>
<body class="stretched">

<!-- Document Wrapper
============================================= -->
<%@ include file="../include/loginHeader.jsp" %>
<!-- Page Title
	============================================= -->
	<section id="page-title">

		<div class="container clearfix">
			<h1>My Page</h1>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">My Page</li>
			</ol>
		</div>

	</section><!-- #page-title end -->
	<!-- Content
	============================================= -->
	<section id="content">

		<div class="content-wrap">
			<div class="container clearfix">
				<div class="row clearfix">
					<div class="col-md-9">
						<img src="resources/images/icons/avatar.jpg" class="alignleft img-circle img-thumbnail notopmargin nobottommargin" alt="Avatar" style="max-width: 84px;">
						<div class="heading-block noborder">
							<h3>MEMBER</h3>
							<span>Your Profile</span>
						</div>
						
						
						<div class="clear"></div>
						<div class="row clearfix">
							<div class="col-lg-12">
								<div class="tabs tabs-alt clearfix" id="tabs-profile">
									<ul class="tab-nav clearfix">
										<li><a href="#tab-feeds"><i class="icon-user float-left"></i>회원정보</a></li>
										<li><a href="#tab-posts"><i class="icon-rss2"></i> 나의 건강 </a></li>
										<li><a href="#tab-replies"><i class="icon-reply"></i> 1:1문의</a></li>
									</ul>
									
									<!-- tab 내용 -->
									<div class="tab-container">
									<!-- 회원정보 클릭시 내용 -->
									<div class="tab-content clearfix" id="tab-feeds">
									<div class="row topmargin-sm">
									<div class="col-lg-12 col-md-6 bottommargin">
									<div class="promo promo-border promo-mini  promo-right">

									<div class="toggle">
										<div class="togglet"><h3 align="left"><i class="toggle-closed icon-ok-circle"></i><i class="toggle-open icon-remove-circle"></i>계정 정보 수정</h3></div>
										<div class="togglec">
									
							<div class="card-body" style="padding: 40px;">
							<div class="fancy-title title-border"></div>
									<form id="register-form" name="register-form" class="nobottommargin" action="#" method="post">
	
										<div class="col_full">
											<label for="register-form-name">Name:</label>
											<input type="text" id="register-form-name" name="register-form-name" value="" class="form-control" />
										</div>
										<div class="col_full">
											<label for="register-form-email">Email Address:</label>
											<input type="text" id="register-form-email" name="register-form-email" value="" class="form-control" />
										</div>
	
										<div class="col_full">
											<label for="register-form-username">Choose a Username:</label>
											<input type="text" id="register-form-username" name="register-form-username" value="" class="form-control" />
										</div>
	
										<div class="col_full">
											<label for="register-form-phone">Phone:</label>
											<input type="text" id="register-form-phone" name="register-form-phone" value="" class="form-control" />
										</div>
	
										<div class="col_full">
											<label for="register-form-password">Choose Password:</label>
											<input type="password" id="register-form-password" name="register-form-password" value="" class="form-control" />
										</div>
	
										<div class="col_full">
											<label for="register-form-repassword">Re-enter Password:</label>
											<input type="password" id="register-form-repassword" name="register-form-repassword" value="" class="form-control" />
										</div>
	
										<div class="col_full nobottommargin">
											<button class="button button-3d button-black nomargin" id="register-form-submit" name="register-form-submit" value="register">수정하기</button>
										</div>
	
									</form>
								</div>
							
									
											</div>
										</div>
										</div>
										</div>
										<div class="col-lg-12 col-md-6 bottommargin">
									<div class="promo promo-border promo-mini  promo-right">

									<div class="toggle">
										<div class="togglet"><h3 align="left"><i class="toggle-closed icon-ok-circle"></i><i class="toggle-open icon-remove-circle"></i>건강 정보 입력/수정</h3></div>
										<div class="togglec">
									
							<div class="card-body" style="padding: 40px;">
							<div class="fancy-title title-border"></div>
							<form class="row mb-0" id="fitness-form" action="include/form.php" method="post" enctype="multipart/form-data">
								<div class="form-process"></div>
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-sm-2 col-form-label">
											<label for="fitness-form-name">Name:</label>
										</div>
										<div class="col-sm-10">
											<input type="text" name="fitness-form-name" id="fitness-form-name" class="form-control required" value="" placeholder="Enter your Full Name">
										</div>
									</div>
								</div>
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-sm-2 col-form-label">
											<label for="fitness-form-email">Email:</label>
										</div>
										<div class="col-sm-10">
											<input type="email" name="fitness-form-email" id="fitness-form-email" class="form-control required" value="" placeholder="Enter your Email">
										</div>
									</div>
								</div>
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-sm-2 col-form-label">
											<label for="fitness-form-phone">Phone:</label>
										</div>
										<div class="col-sm-10">
											<input type="text" name="fitness-form-phone" id="fitness-form-phone" class="form-control required" value="" placeholder="Your Contact Number">
										</div>
									</div>
								</div>
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-sm-2 col-form-label">
											<label for="fitness-form-phone">You Goals:</label>
										</div>
										<div class="col-sm-10">
											<div class="btn-group btn-group-toggle d-flex" data-toggle="buttons">
												<label class="btn btn-outline-dark font-body ls0 nott">
													<input type="radio" class="required form-control" name="fitness-form-goal" id="fitness-form-weight-loss" value="Weight Loss">Weight Loss
												</label>
												<label class="btn btn-outline-dark font-body ls0 nott">
													<input type="radio" class="required form-control" name="fitness-form-goal" id="fitness-form-mass-gain" value="Mass Gain">Mass Gain
												</label>
												<label class="btn btn-outline-dark font-body ls0 nott">
													<input type="radio" class="required form-control" name="fitness-form-goal" id="fitness-form-athletic-body" value="Athletic Body">Athletic Body
												</label>
											</div>
										</div>
									</div>
								</div>
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-sm-2 col-form-label">
											<label for="fitness-form-sex">Gender:</label>
										</div>
										<div class="col-sm-6">
											<div class="btn-group btn-group-toggle d-flex" data-toggle="buttons">
												<label class="btn btn-outline-dark font-body ls0 nott">
													<input type="radio" class="required form-control" name="fitness-form-sex" id="fitness-form-male" value="Male">Male
												</label>
												<label class="btn btn-outline-dark font-body ls0 nott">
													<input type="radio" class="required form-control" name="fitness-form-sex" id="fitness-form-male" value="Female">Female
												</label>
											</div>
										</div>
									</div>
								</div>
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-sm-2 col-form-label">
											<label for="fitness-form-age">Age:</label>
										</div>
										<div class="col-sm-5">
											<input type="number" min="10" max="50" name="fitness-form-age" id="fitness-form-age" class="form-control required" value="" placeholder="Enter your Age">
										</div>
									</div>
								</div>
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-sm-2 col-form-label">
											<label for="fitness-form-weight">Weight:</label>
										</div>
										<div class="col-sm-5">
											<div class="input-group">
												<input type="number" max="140" name="fitness-form-weight" id="fitness-form-weight" class="form-control required" value="" placeholder="Enter your Weight">
												<div class="input-group-append">
													<span class="input-group-text bg-white">kgs</span>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-sm-2 col-form-label">
											<label for="fitness-form-height">Height:</label>
										</div>
										<div class="col-sm-5">
											<div class="input-group">
												<input type="number" maxlength="3" name="fitness-form-height" id="fitness-form-height" class="form-control required" value="" placeholder="Enter your height">
												<div class="input-group-append">
													<span class="input-group-text bg-white">cm</span>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-12 form-group mt-3">
									
								</div>
								<div class="col-12 hidden">
									<input type="text" id="fitness-form-botcheck" name="fitness-form-botcheck" value="" />
								</div>
								<div class="col-12 d-flex justify-content-end align-items-center">
									<button type="button" id="calories-trigger" class="btn btn-secondary">Calculate</button>
									<button type="submit" name="fitness-form-submit" class="btn btn-success ml-2">Submit Quote</button>
								</div>

								<input type="hidden" name="prefix" value="fitness-form-">
								<input type="hidden" name="subject" value="New Fitness Received">
								<input type="hidden" id="fitness-form-calories" name="fitness-form-calories" value="">
							</form>

								</div>
							
									
											</div>
										</div>
										</div>
										</div>
										
										</div>


										</div>
										
										
						<!-- 나의 건강  클릭시 내용 -->			
						<div class="tab-content clearfix" id="tab-posts">
							<div class="row topmargin-sm">
								<div class="col-lg-12 col-md-6 bottommargin">
									<div class="promo promo-border promo-mini  promo-right">

										<div class="toggle">
											<div class="togglet">
												<h3 align="left">
													<i class="toggle-closed icon-ok-circle"></i><i
														class="toggle-open icon-remove-circle"></i>생활 건강
												</h3>
											</div>
											<div class="togglec">

												<div class="card-body" style="padding: 40px;">
													<div class="fancy-title title-border"></div>
													<ul class="skills">
														<li data-percent="80"><span>심박수</span>
															<div class="progress skills-animated"
																style="width: 80%;">
																<div class="progress-percent">
																	<div
																		class="counter counter-inherit counter-instant">
																		<span data-from="0" data-to="80"
																			data-refresh-interval="30" data-speed="1100">80</span>%
																	</div>
																</div>
															</div></li>
														<li data-percent="60"><span>비만도</span>
															<div class="progress skills-animated"
																style="width: 60%;">
																<div class="progress-percent">
																	<div
																		class="counter counter-inherit counter-instant">
																		<span data-from="0" data-to="60"
																			data-refresh-interval="30" data-speed="1100">60</span>%
																	</div>
																</div>
															</div></li>
														<li data-percent="90"><span>혈당</span>
															<div class="progress skills-animated"
																style="width: 90%;">
																<div class="progress-percent">
																	<div
																		class="counter counter-inherit counter-instant">
																		<span data-from="0" data-to="90"
																			data-refresh-interval="30" data-speed="1100">90</span>%
																	</div>
																</div>
															</div></li>
														<li data-percent="70"><span>흠연량</span>
															<div class="progress skills-animated"
																style="width: 70%;">
																<div class="progress-percent">
																	<div
																		class="counter counter-inherit counter-instant">
																		<span data-from="0" data-to="70"
																			data-refresh-interval="30" data-speed="1100">70</span>%
																	</div>
																</div>
															</div></li>
														<li data-percent="30"><span>주간활동량</span>
															<div class="progress skills-animated"
																style="width: 70%;">
																<div class="progress-percent">
																	<div
																		class="counter counter-inherit counter-instant">
																		<span data-from="0" data-to="70"
																			data-refresh-interval="30" data-speed="1100">70</span>%
																	</div>
																</div>
															</div></li>
														<li data-percent="70"><span>섭취 칼로리</span>
															<div class="progress skills-animated"
																style="width: 70%;">
																<div class="progress-percent">
																	<div
																		class="counter counter-inherit counter-instant">
																		<span data-from="0" data-to="70"
																			data-refresh-interval="30" data-speed="1100">70</span>%
																	</div>
																</div>
															</div></li>
														<li data-percent="70"><span>섭취 칼로리</span>
															<div class="progress skills-animated"
																style="width: 70%;">
																<div class="progress-percent">
																	<div
																		class="counter counter-inherit counter-instant">
																		<span data-from="0" data-to="70"
																			data-refresh-interval="30" data-speed="1100">70</span>%
																	</div>
																</div>
															</div></li>
														<li data-percent="30"><span>소모 칼로리</span>
															<div class="progress skills-animated"
																style="width: 70%;">
																<div class="progress-percent">
																	<div
																		class="counter counter-inherit counter-instant">
																		<span data-from="0" data-to="70"
																			data-refresh-interval="30" data-speed="1100">70</span>%
																	</div>
																</div>
															</div></li>
													</ul>
												</div>



											</div>
										</div>
									</div>
								</div>
									<div class="col-lg-12 col-md-6 bottommargin">
									<div class="promo promo-border promo-mini  promo-right">

										<div class="toggle">
											<div class="togglet">
												<h3 align="left">
													<i class="toggle-closed icon-ok-circle"></i><i
														class="toggle-open icon-remove-circle"></i>건강 설문조사 
												</h3>
											</div>
											<div class="togglec">

												<div class="card-body" style="padding: 40px;">
													<div class="fancy-title title-border"></div>
													??
												</div>



											</div>
										</div>
									</div>
								</div>

										</div>


									</div>
										<div class="tab-content clearfix" id="tab-replies">
											<div class="clear topmargin-sm"></div>
								<form class="row mb-0" id="website-cost" action="include/form.php" method="post" enctype="multipart/form-data">
								<div class="form-process"></div>

								<div class="col-md-6 form-group mb-4">
									<label for="website-cost-name">Name:</label>
									<input type="text" name="website-cost-name" id="website-cost-name" class="form-control required" value="" placeholder="Enter your Full Name">
								</div>
								<div class="col-md-6 form-group mb-4">
									<label for="website-cost-contact">Contact:</label>
									<input type="text" name="website-cost-contact" id="website-cost-contact" class="form-control required" value="" placeholder="Enter your Contact Number">
								</div>
								<div class="col-12 form-group mb-4">
									<label for="website-cost-email">Email:</label>
									<input type="email" name="website-cost-email" id="website-cost-email" class="form-control required" value="" placeholder="Enter your Email">
								</div>

								<div class="col-12 form-group mb-4">
									<label for="website-cost-message">Additional Message (Optional):</label>
									<textarea name="website-cost-message" id="website-cost-message" class="form-control" cols="30" rows="10"></textarea>
								</div>

								<div class="col-12 hidden">
									<input type="text" id="website-cost-botcheck" name="website-cost-botcheck" value="" />
								</div>
								<div class="col-12">
									<button type="submit" name="website-cost-submit" class="btn btn-success btn-lg">Confirm</button>
								</div>

								<input type="hidden" name="prefix" value="website-cost-">
								<input type="hidden" name="subject" value="Website Cost Estimate Request">
								<input type="hidden" name="html_title" value="Website Cost Estimation">
								<input type="hidden" id="website-cost-price" name="website-cost-total-price" value="">
							</form>
										

										</div>
									</div>

								</div>

							</div>

						</div>

					</div>

					<div class="w-100 line d-block d-md-none"></div>

					<div class="col-md-3 clearfix">

						<div class="list-group">
							<a href="#" class="list-group-item list-group-item-action clearfix">탈퇴하기<i class="icon-line-trash float-right"></i></a>
							<a href="#" class="list-group-item list-group-item-action clearfix">로그아웃 <i class="icon-line2-logout float-right"></i></a>
						</div>

						<div class="fancy-title topmargin title-border">
							<h4>About Us</h4>
						</div>

						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsum laboriosam, dignissimos veniam obcaecati. Quasi eaque, odio assumenda porro explicabo laborum!</p>

						<div class="fancy-title topmargin title-border">
							<h4>Social Profiles</h4>
						</div>

						<a href="#" class="social-icon si-facebook si-small si-rounded si-light" title="Facebook">
							<i class="icon-facebook"></i>
							<i class="icon-facebook"></i>
						</a>

						<a href="#" class="social-icon si-gplus si-small si-rounded si-light" title="Google+">
							<i class="icon-gplus"></i>
							<i class="icon-gplus"></i>
						</a>

						<a href="#" class="social-icon si-dribbble si-small si-rounded si-light" title="Dribbble">
							<i class="icon-dribbble"></i>
							<i class="icon-dribbble"></i>
						</a>

						<a href="#" class="social-icon si-flickr si-small si-rounded si-light" title="Flickr">
							<i class="icon-flickr"></i>
							<i class="icon-flickr"></i>
						</a>

						<a href="#" class="social-icon si-linkedin si-small si-rounded si-light" title="LinkedIn">
							<i class="icon-linkedin"></i>
							<i class="icon-linkedin"></i>
						</a>

						<a href="#" class="social-icon si-twitter si-small si-rounded si-light" title="Twitter">
							<i class="icon-twitter"></i>
							<i class="icon-twitter"></i>
						</a>

					</div>

				</div>

			</div>

		</div>

	</section><!-- #content end -->
<!-- Footer
		============================================= -->
	<%@ include file="../include/footer.jsp" %>

</div><!-- #wrapper end -->

<!-- Go To Top
============================================= -->
<div id="gotoTop" class="icon-angle-up"></div>

<!-- External JavaScripts
============================================= -->
<script src="${project}js/jquery.js"></script>
<script src="${project}js/plugins.js"></script>


<!-- Range Slider Plugin -->
<script src="${project}js/components/rangeslider.min.js"></script>
<!-- TinyMCE Plugin -->
<script src="${project}js/components/tinymce/tinymce.min.js"></script>


<!-- Footer Scripts
============================================= -->
<%@ include file="../include/footerScript.jsp" %>

</body>
</html>