<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />

	<!-- Stylesheets
	============================================= -->
	<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- Range Slider CSS -->
	<link rel="stylesheet" href="${project}css/components/ion.rangeslider.css" type="text/css" />

	<link rel="stylesheet" href="${project}css/responsive.css" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />

	<link rel="stylesheet" href="${project}css/custom.css" type="text/css" />


	<!-- Document Title
	============================================= -->
	<title>Canvas | The Multi-Purpose HTML5 Template</title>
	<script src="/hellscare/resources/ajax/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#modiinfobtn").click(function() {
				var pwCheck = $('#pwCheck').val();
				var username = $('#username').val();
				$.ajax({
					url : '${pageContext.request.contextPath}/pwCheckCnt?password='+pwCheck+'&username='+username,
					type : 'get',
					success : function(selectCnt) {
						if (selectCnt == 1) {
							$("#pwinput").css("display", "none"); 
							$("#Infoform").css("display", "");
						} else {
							$("#pw_check").css("display", "");
							$("#pw_check").text("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
							$("#pw_check").css("color","red");
							return false; 
						}
					},
					error : function() {
						alert("오류");
					}
				});
			});
		});

	</script>

</head>
<body class="stretched">

<!-- Document Wrapper
============================================= -->
<%@ include file="../include/header.jsp" %>
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
							
							<div id ="pwinput">
							
							
							<form name="passwdform"
								onsubmit="return passwdCheck();">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								
								<div class="row">
									<div class="col-sm-3 col-form-label">
										<label for="passwdform">비밀번호:</label>
									</div>
									<div class="col-sm-6">
									<input type="password" name="password" id="pwCheck" 
									class="form-control"  placeholder="비밀번호 입력" required autofocus />
									<div class="form-control" id = "pw_check" style="display: none;"> </div>
									</div>
									<div class="col-sm-3">
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
										<button  id="modiinfobtn" class="button button-3d button-rounded button-white button-light" 
										type="button"> 수정하기 </button>	
									</div>
								</div>
							</form>
					</div>
								<div id = "Infoform" style="display:none;">							
									<form id="modiform" name="modiform" class="nobottommargin" action="modifyPro" method="post" onsubmit="return modiChk();">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
									<input type="hidden" id="username" value="${memId}">
										<div class="col_full">
											<label for="na_me">이름</label>
											<input type="text" id="na_me" name="name" value="${vo.name}" class="form-control" required/>
										</div>
										<div class="col_full">
											<label for="pwd">비밀번호</label>
											<input type="password" id="pwd" name="scrit" class="form-control" required/>
										</div>
	
										<div class="col_full">
											<label for="repwd">비밀번호 확인</label>
											<input type="password" id="repwd" name="repassword" class="form-control" required/>
										</div>
	
										<div class="col_full">
											<label for="phone">연락처</label>
											<input type="text" id="phone" name="phone_number" value="${vo.phone_number}" class="form-control" required/>
										</div>
										
										<div class="col_full">
											<label for="ads">주소</label>
											<input type="text" id="ads" name="address" value="${vo.address}" class="form-control" required/>
										</div>
										
										<div class="col_full">
											<label for="gen_der">성별</label>
											<input type="text" id="gen_der" name="gender" value="${vo.gender}" class="form-control" readonly/>
										</div>
	
										<div class="col_full">
											<label for="bir_th">생년월일</label>
											<input type="text" id="bir_th" name="birth" value="${vo.birth}" class="form-control" readonly/>
										</div>
										<div class="col_full">
											<label for="e_mail">이메일</label>
											<input type="email" id="e_mail" name="email" value="${vo.email}" class="form-control" readonly/>
										</div>
	
										<div class="col_full">
											<label> 가입일 :</label>
											<fmt:formatDate value="${vo.reg_date}" pattern="yyyy.MM.dd"/>
										</div>
	
										<div class="col_full nobottommargin">
											<button class="button button-3d button-black nomargin">수정하기</button>
										</div>
	
									</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
<!-- 건강정보 시작 : 재관 -->									
						<div class="col-lg-12 col-md-6 bottommargin">
							<div class="promo promo-border promo-mini  promo-right">
								<div class="toggle">
									<div class="togglet"><h3 align="left"><i class="toggle-closed icon-ok-circle"></i><i class="toggle-open icon-remove-circle"></i>건강 정보 입력/수정</h3></div>
										<div class="togglec">
									
							<div class="card-body" style="padding: 40px;">
							<div class="fancy-title title-border"></div>
							<form class="row mb-0" id="userinfoform" method="post">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								<input type="hidden" name="username" value="${sessionScope.memId}">
								<div class="form-process"></div>
								
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-sm-2 col-form-label">
											<label for="height">신장(Height):</label>
										</div>
										<div class="col-sm-5">
											<div class="input-group">
												<input type="number" min="0" max="250" step="0.1" maxlength="3" name="height" id="height" class="form-control" required value="${ivo.height }" placeholder="키를 입력하세요">
												<div class="input-group-append">
													<span class="input-group-text bg-white">cm</span>
												</div>
											</div>
										</div>
									</div>
								</div>
								
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-sm-2 col-form-label">
											<label for="weight">체중(Weight):</label>
										</div>
										<div class="col-sm-5">
											<div class="input-group">
												<input type="number" min="0" max="140" step="0.1" name="weight" id="weight" class="form-control" required value="${ivo.weight }" placeholder="몸무게를 입력하세요">
												<div class="input-group-append">
													<span class="input-group-text bg-white">kgs</span>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- bmi:몸무게(kg) / 신장(m) x 신장(m) -->
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-sm-2 col-form-label">
											<label for="bmi">BMI지수:</label>
										</div>
										<div class="col-sm-5">
											<input type="text" name="bmi" id="bmi" class="form-control required" readonly value="${ivo.bmi }" >
										</div>
										<div class="col-sm-2">
											<button type="button" id="calories-trigger" class="btn btn-secondary" onclick="calbmi();">계산</button>
										</div>
									</div>
								</div> 
								
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-sm-2 col-form-label">
											<label for="sightL">시력(좌):</label>
										</div>
										<div class="col-sm-4">
											<input type="text" name="sightL" id="sightL" class="form-control" value="${ivo.sightL }" placeholder="왼쪽 시력을 입력하세요">
										</div>	
									
										<div class="col-sm-2 col-form-label">
											<label for="sightR">시력(우):</label>
										</div>
										<div class="col-sm-4">
											<input type="text" name="sightR" id="sightR" class="form-control" value="${ivo.sightR }" placeholder="오른쪽 시력을 입력하세요">
										</div>
									</div>
								</div>
								
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-sm-2 col-form-label">
											<label for="glucose">혈당:</label>
										</div>
										<div class="col-sm-10">
											<input type="text" name="glucose" id="glucose" class="form-control" value="${ivo.glucose }" placeholder="평균 혈당을 입력하세요">
										</div>
									</div>
								</div>
								
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-sm-2 col-form-label">
											<label for="pressure">혈압(수축기):</label>
										</div>
										<div class="col-sm-10">
											<input type="text" name="pressure" id="pressure" class="form-control" value="${ivo.pressure }" placeholder="수축기 혈압을 입력하세요">
										</div>
									</div>
								</div>
								
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-sm-2 col-form-label">
											<label for="pressure2">혈압(이완기):</label>
										</div>
										<div class="col-sm-10">
											<input type="text" name="pressure2" id="pressure2" class="form-control" value="${ivo.pressure2 }" placeholder="이완기 혈압을 입력하세요">
										</div>
									</div>
								</div>
								
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-sm-2 col-form-label">
											<label for="smokeAmount">흡연량(하루):</label>
										</div>
										<div class="col-sm-5">
											<div class="input-group">
												<input type="text" maxlength="3" name="smokeAmount" id="smokeAmount" class="form-control" value="${ivo.smokeAmount }" placeholder="흡연량을 입력하세요">
												<div class="input-group-append">
													<span class="input-group-text bg-white">개비</span>
												</div>
											</div>
										</div>
									</div>
								</div>
								
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-sm-2 col-form-label">
											<label for="drinkAmount">음주량(소주/일주일):</label>
										</div>
										<div class="col-sm-5">
											<div class="input-group">
												<input type="text" maxlength="3" name="drinkAmount" id="drinkAmount" class="form-control" value="${ivo.drinkAmount }" placeholder="음주량을 입력하세요">
												<div class="input-group-append">
													<span class="input-group-text bg-white">&nbsp;&nbsp;&nbsp;잔</span>
												</div>
											</div>
										</div>
									</div>
								</div>
								
								
								
							<!-- <div class="col-12 form-group">
									<div class="row">
										<div class="col-sm-2 col-form-label">
											<label for="fitness-form-sex">성별:</label>
										</div>
										<div class="col-sm-6">
											<div class="btn-group btn-group-toggle d-flex" data-toggle="buttons">
												<label class="btn btn-outline-dark font-body ls0 nott">
													<input type="radio" class="required form-control" name="gender" id="male" value="Male">Male
												</label>
												<label class="btn btn-outline-dark font-body ls0 nott">
													<input type="radio" class="required form-control" name="gender" id="female" value="Female">Female
												</label>
											</div>
										</div>
									</div>
								</div> -->
								
								
								<div class="col-12 form-group mt-3">
									
								</div>
								<div class="col-12 hidden">
									<input type="text" id="fitness-form-botcheck" name="fitness-form-botcheck" value="" />
								</div>
								<div class="col-12 d-flex justify-content-end align-items-center">
									<button type="button" name="refresh" class="btn btn-secondary ml-2" onclick="refreshInfo();">재작성</button>
									<c:if test="${selectCnt==0 }">
									<button type="submit" name="btninforeg" class="btn btn-success ml-2" onclick="javascript: form.action='userInfoRegPro';">등록하기</button>
									</c:if>
									<c:if test="${selectCnt!=0 }">
									<button type="submit" name="btninfomodify" class="btn btn-success ml-2" onclick="javascript: form.action='userInfoModifyPro';">수정하기</button>
									</c:if>
								</div>

								<input type="hidden" name="prefix" value="fitness-form-">
								<input type="hidden" name="subject" value="New Fitness Received">
								<input type="hidden" id="calories" name="calories" value="">
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
														<li data-percent="${ivo.heart_rate}"><span>심박수</span>
															<div class="progress skills-animated"
																style="width: 80%;">
																<div class="progress-percent">
																	<div
																		class="counter counter-inherit counter-instant">
																		<span data-from="0" data-to="${ivo.heart_rate}"
																			data-refresh-interval="30" data-speed="1100">${ivo.heart_rate}</span>
																	</div>
																</div>
															</div></li>
														<li data-percent="50"><span>비만도</span>
															<div class="progress skills-animated"
																style="width: 60%;">
																<div class="progress-percent">
																	<div
																		class="counter counter-inherit counter-instant">
																		<span data-from="0" data-to="${ivo.bmi}"
																			data-refresh-interval="30" data-speed="1100">${ivo.bmi}</span>
																	</div>
																</div>
															</div></li>
														<li data-percent="50"><span>혈당</span>
															<div class="progress skills-animated"
																style="width: 90%;">
																<div class="progress-percent">
																	<div
																		class="counter counter-inherit counter-instant">
																		<span data-from="0" data-to="${ivo.glucose }"
																			data-refresh-interval="30" data-speed="1100">${ivo.glucose }</span>
																	</div>
																</div>
															</div></li>
														<li data-percent="0"><span>흡연량(하루)</span>
															<div class="progress skills-animated"
																style="width: 100%;">
																<div class="progress-percent">
																	<div
																		class="counter counter-inherit counter-instant">
																		<span data-from="0" data-to="${ivo.smokeAmount }"
																			data-refresh-interval="30" data-speed="1100">${ivo.smokeAmount}</span>개비
																	</div>
																</div>
															</div></li>
														<li data-percent="20"><span>음주량(소주/일주일)</span>
															<div class="progress skills-animated"
																style="width: 70%;">
																<div class="progress-percent">
																	<div
																		class="counter counter-inherit counter-instant">
																		<span data-from="0" data-to="${ivo.drinkAmount }"
																			data-refresh-interval="30" data-speed="1100">${ivo.drinkAmount }</span>잔
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
																			data-refresh-interval="30" data-speed="1100">20</span>%
																	</div>
																</div>
															</div></li>
														
														<li data-percent="30"><span>섭취 칼로리</span>
															<div class="progress skills-animated"
																style="width: 70%;">
																<div class="progress-percent">
																	<div
																		class="counter counter-inherit counter-instant">
																		<span data-from="0" data-to="3000"
																			data-refresh-interval="30" data-speed="1100">3000</span>kcal
																	</div>
																</div>
															</div></li>
														<li data-percent="25"><span>소모 칼로리</span>
															<div class="progress skills-animated"
																style="width: 70%;">
																<div class="progress-percent">
																	<div
																		class="counter counter-inherit counter-instant">
																		<span data-from="0" data-to="2500"
																			data-refresh-interval="30" data-speed="1100">2500</span>kcal
																	</div>
																</div>
															</div></li>
													</ul>
												</div>



											</div>
										</div>
									</div>
								</div>

							
							</div>
					</div>
		<!-- 건강정보 끝 : 재관 -->
									
									<!-- 1:1문의 사항은 QnA에서 내가 질문한거 모음 으로 알고있기 떄문에 바꾸겠음 -->
										<div class="tab-content clearfix" id="tab-replies">

											<div id="myQnaListt">
												<!-- 결과 출력위치 -->
												<%@ include file="../Users/myQnaList.jsp"%>		
											</div>
											<!-- <a href="qnaWriteForm" class="button button-black tright noleftmargin" style="text-align: center;">문의하기<i class="icon-angle-right"></i></a>					 -->

											<table style="width: 1000px; text-align: center;">
												<tr>
													<th>
														<!-- 게시글이 있는 경우 --> <c:if test="${cnt > 0}">
															<!-- 처음[◀◀] / 이전[◀]  -->
															<c:if test="${startPage > pageBlock}">
																<a onclick="mminus();">[◀◀ ] </a>
																<a onclick="minus();">[◀ ]</a>
																<%-- <a href="myQnaList?pageNum=${startPage - pageBlock}">[◀ ] </a> --%>
															</c:if>
									
															<!-- 블록내의 페이지 번호 -->
															<c:forEach var="i" begin="${startPage}" end="${endPage}">
																<c:if test="${i == currentPage}">
																	<span><b>[${i}]</b></span>
																</c:if>
																<c:if test="${i != currentPage}">
																<!-- myQnaList?pageNum=${i} -->
																	<span><b><a href="#" onclick="now();">[${i}]</a></b></span>
																</c:if>
									
															</c:forEach>
									
															<!-- 다음[▶] / 끝[▶▶]   -->
															<c:if test="${pageCount > endPage}">
																<a onclick="plus();">[▶] </a>
																<a onclick="pplus();">[▶▶]</a>
																<%-- <a href="myQnaList?pageNum=${startPage + pageBlock}">[▶] </a>
																<a href="myQnaList?pageNum=${pageCount}">[▶▶]</a> --%>
															</c:if>
														</c:if>
													</th>
												</tr>
											</table>
										
											<hr>

										<div class="tab-content clearfix" id="tab-replies">
											<form class="row mb-0" id="website-cost" action="#"
												method="GET" enctype="multipart/form-data">
												<input type="hidden" name="${_csrf.parameterName}"
													value="${_csrf.token}">
												<h4>문의사항 작성</h4>
												<div class="form-process"></div>

												<div class="col-12 form-group mb-4">
													<label for="website-cost-email">제목:</label> <input
														name="website-cost-email" id="website-cost-email"
														class="form-control required" value="" placeholder="제목 입력"
														required="required">
												</div>

												<div class="col-md-6 form-group mb-4">
													<label for="website-cost-name">비밀번호:</label> <input
														type="password" name="website-cost-name"
														id="website-cost-name" class="form-control required"
														value="" placeholder="비밀번호 입력" required="required">
												</div>
												<div class="col-md-6 form-group mb-4">
													<label for="website-cost-contact">문의사항:</label>
													<!-- <input type="text" name="website-cost-contact" id="website-cost-contact" class="form-control required" value="" placeholder="Enter your Contact Number"> -->
													<select id="kind"
														name="template-contactform-default-select"
														class="form-control valid">
														<option value="" disabled="" selected="">문의 유형</option>
														<option value="개인정보">개인정보 문의</option>
														<option value="건강정보">건강정보 문의</option>
														<option value="운동정보">운동정보 문의</option>
														<option value="식단정보">식단정보 문의</option>
														<option value="기타">기타 문의</option>
													</select>
												</div>


												<div class="col-12 form-group mb-4">
													<label for="website-cost-message">문의내용:</label>
													<textarea name="website-cost-message"
														id="website-cost-message" class="form-control" cols="30"
														rows="10"></textarea>
												</div>

												<div class="col-12 hidden">
													<input type="text" id="website-cost-botcheck"
														name="website-cost-botcheck" value="" />
												</div>
												<div class="col-12">
													<button type="submit" id="qnaSubmit"
														name="jobs-application-submit" class="btn btn-secondary">질문작성
														완료</button>
												</div>

											</form>
							
											</div>
										</div>
										
									</div>

								</div>

							</div>

						</div>

					</div>

					<div class="w-100 line d-block d-md-none"></div>

					<div class="col-md-3 clearfix">

						<div class="list-group">
							<a href="#" onclick="return deleteChk();" class="list-group-item list-group-item-action clearfix">탈퇴하기<i class="icon-line-trash float-right"></i></a>
							<a href="logout" class="list-group-item list-group-item-action clearfix">로그아웃 <i class="icon-line2-logout float-right"></i></a>
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


<%@ include file="../include/footerScript.jsp"%>

<script type="text/javascript" )>
$(document).ready(function(){

		//질문목록 출력
		myQnaList();
		
		//질문등록 버튼 클릭
		$("#qnaSubmit").click(function(){
			var title = $("#website-cost-email").val();
			var content = $("#website-cost-message").val();
			var qna_password = $("#website-cost-name").val();
			var kind = $("#kind").val();
			var param = "title=" + title + "&content=" + content + "&qna_password=" + qna_password + "&kind=" + kind;
			
			$.ajax({
				type:"GET",
				url:"${pageContext.request.contextPath}/MyqnaWritePro",
				data:param,
				success:function(){
					console.log("success");
					alert("문의글 등록");
					myQnaList();
					return false;
				}
			});
		});
		
	
	//질문목록
	function myQnaList(){
		$.ajax({
			type:"GET",
			url:"${pageContext.request.contextPath}/myQnaList",
			success:function(result){
				console.dir(result);
				
				$("#myQnaListt").html(result);
			}
		});
	}
	
	function mminus(){
		var pageNum=${startPage - pageBlock};
		var param = "pageNum=" + pageNum;
		
		$.ajax({
			type:"GET",
			url:"${pageContext.request.contextPath}/myQnaList",
			data:param,
			success:function(){
				console.log("pageNum success");
				alert("다음페이지");
				myQnaList();
				return false;
			}
		});
	}
	
	function now(){
		var pageNum=${i};
		var param = "pageNum=" +pageNum;
		
		$.ajax({
			type:"GET",
			url:"${pageContext.request.contextPath}/myQnaList",
			data:param,
			success:function(){
				console.log("pageNum success");
				alert("페페이지");
				myQnaList();
				return false;
			}
		});
		
	}
	
	
});

</script>

<script type="text/javascript">
	function modiChk(){
		if(document.modiform.scrit.value != document.modiform.repassword.value){
			alert("입력하신 비밀번호가 일치하지않습니다.");
			document.modiform.scrit.focus();
			return false;
		}
	}
	/* bmi 계산 */
	function calbmi() {
		var height = Number($("#height").val());	
		var weight = Number($("#weight").val());
		var bmi = weight / ((height/100) * (height/100));
		
		$("#bmi").val(bmi.toFixed(2));
	}

	// 유저건강정보 재작성 버튼클릭시
	function refreshInfo() {
		$("#height").val("");
		$("#weight").val("");
		$("#bmi").val("");
		$("#sightL").val("");
		$("#sightR").val("");
		$("#glucose").val("");
		$("#pressure").val("");
		$("#pressure2").val("");
		$("#smokeAmount").val("");
		$("#drinkAmount").val("");
	}
</script>

<script type="text/javascript">
	function deleteChk(){
		if(confirm("탈퇴하시겠습니까?")){
			window.location = "delMember?username=${memId}";
			return false;
		} else {
			return false;
		}
	}
	
	
</script>

</body>
</html>