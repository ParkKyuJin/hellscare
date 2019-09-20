 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>



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
	<%@ include file="include/header.jsp"%>

		<section id="slider" class="slider-element slider-parallax swiper_wrapper full-screen clearfix">
			<div class="slider-parallax-inner">

				<div class="swiper-container swiper-parent">
					<div class="swiper-wrapper">
						<div class="swiper-slide dark" style="background-image: url('/hellscare/resources/images/yoga2.jpg');">
							<div class="container clearfix">
								<div class="slider-caption slider-caption-center">
									<h2 data-animate="fadeInUp">Welcome to <font style="color:lightgreen">Health</font>care</h2>
									<p class="d-none d-sm-block" data-animate="fadeInUp" data-delay="200">We provide you helpful healthcare information , check continuously your body status by using our device and give you some directions for your healthful life</p>
								</div>
							</div>
						</div>
						<div class="swiper-slide dark">
							<div class="container clearfix">
								<div class="slider-caption slider-caption-center">
									<h2 data-animate="fadeInUp">New Health Paradigm</h2>
									<p class="d-none d-sm-block" data-animate="fadeInUp" data-delay="200">Browse our web site. You can get useful information from ours. </p>
								</div>
							</div>
							<div class="video-wrap">
								<video id="slide-video" poster="/hellscare/resources/images/videos/explore.jpg" preload="auto" loop autoplay muted>
									<source src='/hellscare/resources/images/videos/explore.webm' type='video/webm' />
									<source src='/hellscare/resources/images/videos/explore.mp4' type='video/mp4' />
								</video>
								<div class="video-overlay" style="background-color: rgba(0,0,0,0.55);"></div>
							</div>
						</div>
						<div class="swiper-slide" style="background-image: url('/hellscare/resources/images/slider/swiper/3.jpg'); background-position: center top;">
							<div class="container clearfix">
								<div class="slider-caption">
									<h2 data-animate="fadeInUp">Great Performance</h2>
									<p class="d-none d-sm-block" data-animate="fadeInUp" data-delay="200">You'll be surprised to see the Final Results of your Creation &amp; would crave for more.</p>
								</div>
							</div>
						</div>
					</div>
					<div class="slider-arrow-left"><i class="icon-angle-left"></i></div>
					<div class="slider-arrow-right"><i class="icon-angle-right"></i></div>
				</div>

				<a href="#" data-scrollto="#content" data-offset="100" class="dark one-page-arrow"><i class="icon-angle-down infinite animated fadeInDown"></i></a>

			</div>
		</section>

		<!-- Content
		============================================= -->
		<section id="content">
	
			<div class="content-wrap">

				<div class="container clearfix">
					<div class="row clearfix">

						<div class="col-xl-5">
							<div class="heading-block topmargin">
								<h1><b>건강진단</b></h1>
								<h1><a href="perse">pserse</a></h1>
								<h2>CREATING NEW VALUE FOR ADVANCING<br>Human Life</h2><br>
								<a href="nextpage" class="button button-border button-dark button-rounded button-large noleftmargin topmargin-sm">알아보기</a>
							</div>
							<p class="lead">건강진단 페이지에서는 자신의 신체정보를 충분히 입력하신 고객님들께 대해 입력해주신 신체정보를 이용하여 현재 위험군에 속해있는 질병과 식습관 및 운동에 대한 가이드라인을 제공합니다. </p>
						</div>

						<div class="col-xl-7">

							<div style="position: relative; margin-bottom: -60px;" class="ohidden" data-height-xl="426" data-height-lg="567" data-height-md="470" data-height-md="287" data-height-xs="183">
								<img src="/hellscare/resources/images/mainhelthcare2.jpg" style="position: absolute; top: 0; left: 0;" data-animate="fadeInUp" data-delay="100" alt="Chrome">
								
							</div>

						</div>

					</div>
				</div>
			

	<div class="container clearfix">
						<div class="heading-block center nomargin">
							<h3>최신 건강정보</h3>
						</div>
					</div>
				<div class="section nobottommargin">
				
					<!-- 기사 내용 크롤링 후 뿌릴 페이지 -->
            <div class="container clear-bottommargin clearfix">
               <div class="row">
                  <c:set var="cnt" value="0"/>
                  
                  <c:forEach var="news_dtos" items="${newsDtos}">
                     <c:if test="${cnt < 8 }">
                        <div class="col-lg-3 col-md-6 bottommargin">
                           <div class="ipost clearfix">
                              <div class="entry-image">
                                 <a href="news_detail?newsUrl=${news_dtos.newsUrl}">
                                    <img style="height:200px;" class="image_fade" src="${news_dtos.newsThumbnail}" alt="Image" onerror="this.src='/hellscare/resources/white.jpg'">
                                 </a>
                              </div>
                              <div class="entry-title">
                                 <h3><a href="news_detail?newsUrl=${news_dtos.newsUrl}">${news_dtos.newsTitle}</a></h3>
                              </div>
                              <ul class="entry-meta clearfix">
                                 <li><i class="icon-calendar3"></i> ${news_dtos.newsDate}</li>
                                 <li><i class="icon-comments"></i> ${news_dtos.newsAuthor}</li>
                              </ul>
                              <div class="entry-content">
                                 <p>${news_dtos.newsSummary}</p>
                              </div>
                           </div>
                        </div>
                        
                        <c:set var="cnt" value="${cnt + 1}"  />
                        
                     </c:if>
                  </c:forEach>
               </div>
            </div>
				</div>

				<div class="container clearfix">
					<div class="heading-block topmargin-lg center">
						<h2>모바일 앱 기능소개</h2>
						<span class="divcenter">걸음수, 심박수등을 직접 측정할 수 있고 웹페이지의 대부분의 정보를 모바일에서도 사용할 수 있습니다.</span>
					</div>

					<div class="row bottommargin-sm">

						<div class="col-lg-4 col-md-6 bottommargin">

							<div class="feature-box fbox-right topmargin" data-animate="fadeIn">
								<div class="fbox-icon">
									<a href="#"><i class="icon-line-heart"></i></a>
								</div>
								<h3>심박수 측정</h3>
								<p>심박수를 측정하여 확인할 수 있습니다.</p>
							</div>

							<div class="feature-box fbox-right topmargin" data-animate="fadeIn" data-delay="200">
								<div class="fbox-icon">
									<a href="#"><i class="icon-line-paper"></i></a>
								</div>
								<h3>건강정보</h3>
								<p>개인의 건강정보 기록 &amp; 결과를 확인할 수 있습니다.</p>
							</div>

							<div class="feature-box fbox-right topmargin" data-animate="fadeIn" data-delay="400">
								<div class="fbox-icon">
									<a href="#"><i class="icon-line-layers"></i></a>
								</div>
								<h3>식단</h3>
								<p>식품의 영양소 정보를 확인하고 섭취한 칼로리를 확인할 수 있습니다.</p>
							</div>

						</div>

						<div class="col-lg-4 d-md-none d-lg-block bottommargin center">
							<img src="/hellscare/resources/images/services/drcarephone.png" alt="Dr.Care App">
						</div>

						<div class="col-lg-4 col-md-6 bottommargin">

							<div class="feature-box topmargin" data-animate="fadeIn">
								<div class="fbox-icon">
									<a href="#"><i class="icon-line-power"></i></a>
								</div>
								<h3>운동</h3>
								<p>다양한 운동을 동영상으로 제공하여 보고 쉽게 따라할 수 있습니다.</p>
							</div>

							<div class="feature-box topmargin" data-animate="fadeIn" data-delay="200">
								<div class="fbox-icon">
									<a href="#"><i class="icon-line-check"></i></a>
								</div>
								<h3>질병정보</h3>
								<p>정확인 질병 정보를 확인하고 증상 &amp; 치료법 등을 조회 할 수 있습니다.</p>
							</div>

							<div class="feature-box topmargin" data-animate="fadeIn" data-delay="400">
								<div class="fbox-icon">
									<a href="#"><i class="icon-bulb"></i></a>
								</div>
								<h3>병원 &amp; 약국 정보</h3>
								<p>자신의 현재 위치를 기반으로 한 병원&amp;약국 정보를 확인할 수 있습니다.</p>
							</div>
						</div>
					</div>
				</div>



				<div class="row clearfix align-items-stretch">

					
				</div>

				<div class="row clearfix align-items-stretch bottommargin-lg">

					<div class="col-lg-3 col-md-6 dark center col-padding" style="background-color: #515875;">
						<i class="i-plain i-xlarge divcenter icon-line2-directions"></i>
						<div class="counter counter-lined"><span data-from="100" data-to="846" data-refresh-interval="50" data-speed="2000"></span>K</div>
						<h5>Lines of Codes</h5>
					</div>

					<div class="col-lg-3 col-md-6 dark center col-padding" style="background-color: #576F9E;">
						<i class="i-plain i-xlarge divcenter icon-line2-graph"></i>
						<div class="counter counter-lined"><span data-from="3000" data-to="21500" data-refresh-interval="100" data-speed="2500"></span></div>
						<h5>KBs of HTML Files</h5>
					</div>

					<div class="col-lg-3 col-md-6 dark center col-padding" style="background-color: #6697B9;">
						<i class="i-plain i-xlarge divcenter icon-line2-layers"></i>
						<div class="counter counter-lined"><span data-from="10" data-to="408" data-refresh-interval="25" data-speed="3500"></span></div>
						<h5>No. of Templates</h5>
					</div>

					<div class="col-lg-3 col-md-6 dark center col-padding" style="background-color: #88C3D8;">
						<i class="i-plain i-xlarge divcenter icon-line2-clock"></i>
						<div class="counter counter-lined"><span data-from="60" data-to="1400" data-refresh-interval="30" data-speed="2700"></span></div>
						<h5>Hours of Coding</h5>
					</div>

				</div>

				<div class="section topmargin nobottommargin nobottomborder">
				<div class="container clearfix">
					<div class="heading-block center nomargin">
						<h3>운동목록</h3>
					</div>
				</div>
			</div>

			<div id="portfolio"
				class="portfolio portfolio-nomargin grid-container portfolio-notitle portfolio-full grid-container clearfix">
				<c:if test="${cnt == 0}">
					<article class="portfolio-item pf-uielements pf-icons">
						현재 운동목록이 없습니다.</article>
				</c:if>

				<c:if test="${cnt > 0}">
					<c:forEach var="exer" items="${dtos}">
						<article class="portfolio-item pf-graphics pf-uielements">
							<div class="portfolio-image">
								<a href="#"> <img
									src="/hellscare/resources/images/videos/${exer.exercise_img}"
									alt="Mac Sunglasses"
									style="width: 328px; height: 246px; margin: 0 auto;">
								</a>
								<div class="portfolio-overlay">
									<a href="/hellscare/resources/images/videos/${exer.exercise_video}"
										class="center-icon" ><i
										class="icon-line-play"></i></a>
								</div>
							</div>
							<div class="portfolio-desc">
								<h3>
									<a href="details_exercise?exercise_code=${exer.exercise_code}">${exer.exercise_name}</a>
								</h3>
								<span><a href="details_exercise?exercise_code=${exer.exercise_code}">종류 : <c:if test="${exer.kind == 1}">스트레칭</c:if>
										<c:if test="${exer.kind == 2}">유산소운동</c:if>,칼로리
										소모량 : ${exer.kcal}kcal(30분 기준)</a></span>
							</div>
						</article>
					</c:forEach>
				</c:if>
			</div>


			<div class="clear"></div>

			<a href="exercise"
				class="button button-full button-dark center tright bottommargin-lg">
				<div class="container clearfix">
					전체운동 <strong>More</strong> <i class="icon-caret-right"
						style="top: 4px;"></i>
				</div>
			</a>

				

				
				<br><br>
				
				
				<div class="container clearfix">

					<div id="oc-clients" class="owl-carousel image-carousel carousel-widget" data-margin="60" data-loop="true" data-nav="false" data-autoplay="5000" data-pagi="false" data-items-xs="2" data-items-sm="3" data-items-md="4" data-items-lg="5" data-items-xl="6">

						<div class="oc-item"><a href="#"><img src="/hellscare/resources/images/clients/1.png" alt="Clients"></a></div>
						<div class="oc-item"><a href="#"><img src="/hellscare/resources/images/clients/2.png" alt="Clients"></a></div>
						<div class="oc-item"><a href="#"><img src="/hellscare/resources/images/clients/3.png" alt="Clients"></a></div>
						<div class="oc-item"><a href="#"><img src="/hellscare/resources/images/clients/4.png" alt="Clients"></a></div>
						<div class="oc-item"><a href="#"><img src="/hellscare/resources/images/clients/5.png" alt="Clients"></a></div>
						<div class="oc-item"><a href="#"><img src="/hellscare/resources/images/clients/6.png" alt="Clients"></a></div>
						<div class="oc-item"><a href="#"><img src="/hellscare/resources/images/clients/7.png" alt="Clients"></a></div>
						<div class="oc-item"><a href="#"><img src="/hellscare/resources/images/clients/8.png" alt="Clients"></a></div>
						<div class="oc-item"><a href="#"><img src="/hellscare/resources/images/clients/9.png" alt="Clients"></a></div>
						<div class="oc-item"><a href="#"><img src="/hellscare/resources/images/clients/10.png" alt="Clients"></a></div>

					</div>

				</div>

			</div>

		</section><!-- #content end -->

		<!-- Footer
		============================================= -->
		<%@ include file="include/footer.jsp" %>

	</div><!-- #wrapper end -->

	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>
	
	<%@ include file="include/footerScript.jsp" %>

</body>
</html>