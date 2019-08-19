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

	<meta name="viewport" content="width=device-width, initial-scale=1" />

	<!-- Document Title
	============================================= -->
	<title>Canvas | The Multi-Purpose HTML5 Template</title>

</head>

<body class="stretched">

	<!-- Document Wrapper
	============================================= -->
		<%@ include file="../include/header.jsp"%>

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
				
					<div class="container clear-bottommargin clearfix">
	<div class="row">
		<c:forEach var="news_dtos" items="${newsDtos}">
						
			<div class="col-lg-3 col-md-3 bottommargin">
				<div class="ipost clearfix">
					<div class="entry-image">
						<a href="#">
							<c:if test="${news_dtos.newsThumbnail != null}">
								<img class="image_fade" src="${news_dtos.newsThumbnail}" alt="Image" style="height:200px;">
							</c:if>
							<c:if test="${news_dtos.newsThumbnail == null}">
								<img class="image_fade" src="/hellscare/resources/white.JPG" alt="Image">
							</c:if>
						</a>
					</div>
					<div class="entry-title">
						<h3><a href="blog-single.html">${news_dtos.newsTitle}</a></h3>
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
		</c:forEach>
	</div>
</div>
				</div>

				<div class="container clearfix">

					<div class="heading-block topmargin-lg center">
						<h2>모바일 앱 기능소개</h2>
						<span class="divcenter">Philanthropy convener livelihoods, initiative end hunger gender rights local. John Lennon storytelling; advocate, altruism impact catalyst.</span>
					</div>

					<div class="row bottommargin-sm">

						<div class="col-lg-4 col-md-6 bottommargin">

							<div class="feature-box fbox-right topmargin" data-animate="fadeIn">
								<div class="fbox-icon">
									<a href="#"><i class="icon-line-heart"></i></a>
								</div>
								<h3>Boxed &amp; Wide Layouts</h3>
								<p>Stretch your Website to the Full Width or make it boxed to surprise your visitors.</p>
							</div>

							<div class="feature-box fbox-right topmargin" data-animate="fadeIn" data-delay="200">
								<div class="fbox-icon">
									<a href="#"><i class="icon-line-paper"></i></a>
								</div>
								<h3>Extensive Documentation</h3>
								<p>We have covered each &amp; everything in our Docs including Videos &amp; Screenshots.</p>
							</div>

							<div class="feature-box fbox-right topmargin" data-animate="fadeIn" data-delay="400">
								<div class="fbox-icon">
									<a href="#"><i class="icon-line-layers"></i></a>
								</div>
								<h3>Parallax Support</h3>
								<p>Display your Content attractively using Parallax Sections with HTML5 Videos.</p>
							</div>

						</div>

						<div class="col-lg-4 d-md-none d-lg-block bottommargin center">
							<img src="/hellscare/resources/images/services/iphone7.png" alt="iphone 2">
						</div>

						<div class="col-lg-4 col-md-6 bottommargin">

							<div class="feature-box topmargin" data-animate="fadeIn">
								<div class="fbox-icon">
									<a href="#"><i class="icon-line-power"></i></a>
								</div>
								<h3>HTML5 Video</h3>
								<p>Canvas provides support for Native HTML5 Videos that can be added to a Background.</p>
							</div>

							<div class="feature-box topmargin" data-animate="fadeIn" data-delay="200">
								<div class="fbox-icon">
									<a href="#"><i class="icon-line-check"></i></a>
								</div>
								<h3>Endless Possibilities</h3>
								<p>Complete control on each &amp; every element that provides endless customization.</p>
							</div>

							<div class="feature-box topmargin" data-animate="fadeIn" data-delay="400">
								<div class="fbox-icon">
									<a href="#"><i class="icon-bulb"></i></a>
								</div>
								<h3>Light &amp; Dark Color Schemes</h3>
								<p>Change your Website's Primary Scheme instantly by simply adding the dark class.</p>
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
							<h3>추천운동</h3>
						</div>
					</div>
				</div>

				<div id="portfolio" class="portfolio portfolio-nomargin grid-container portfolio-notitle portfolio-full grid-container clearfix">

					<article class="portfolio-item pf-media pf-icons">
						<div class="portfolio-image">
							<a href="portfolio-single.html">
								<img src="/hellscare/resources/images/portfolio/4/1.jpg" alt="Open Imagination">
							</a>
							<div class="portfolio-overlay">
								<a href="images/portfolio/full/1.jpg" class="left-icon" data-lightbox="image"><i class="icon-line-plus"></i></a>
								<a href="portfolio-single.html" class="right-icon"><i class="icon-line-ellipsis"></i></a>
							</div>
						</div>
						<div class="portfolio-desc">
							<h3><a href="portfolio-single.html">Open Imagination</a></h3>
							<span><a href="#">Media</a>, <a href="#">Icons</a></span>
						</div>
					</article>

					<article class="portfolio-item pf-illustrations">
						<div class="portfolio-image">
							<a href="portfolio-single.html">
								<img src="/hellscare/resources/images/portfolio/4/2.jpg" alt="Locked Steel Gate">
							</a>
							<div class="portfolio-overlay">
								<a href="images/portfolio/full/2.jpg" class="left-icon" data-lightbox="image"><i class="icon-line-plus"></i></a>
								<a href="portfolio-single.html" class="right-icon"><i class="icon-line-ellipsis"></i></a>
							</div>
						</div>
						<div class="portfolio-desc">
							<h3><a href="portfolio-single.html">Locked Steel Gate</a></h3>
							<span><a href="#">Illustrations</a></span>
						</div>
					</article>

					<article class="portfolio-item pf-graphics pf-uielements">
						<div class="portfolio-image">
							<a href="#">
								<img src="/hellscare/resources/images/portfolio/4/3.jpg" alt="Mac Sunglasses">
							</a>
							<div class="portfolio-overlay">
								<a href="/hellscare/resources/video/videoplayback.mp4" class="left-icon" data-lightbox="iframe"><i class="icon-line-play"></i></a>
								<a href="portfolio-single-video.html" class="right-icon"><i class="icon-line-ellipsis"></i></a>
							</div>
						</div>
						<div class="portfolio-desc">
							<h3><a href="portfolio-single-video.html">Mac Sunglasses</a></h3>
							<span><a href="#">Graphics</a>, <a href="#">UI Elements</a></span>
						</div>
					</article>

					<article class="portfolio-item pf-icons pf-illustrations">
						<div class="portfolio-image">
							<a href="portfolio-single.html">
								<img src="/hellscare/resources/images/portfolio/4/4.jpg" alt="Open Imagination">
							</a>
							<div class="portfolio-overlay" data-lightbox="gallery">
								<a href="images/portfolio/full/4.jpg" class="left-icon" data-lightbox="gallery-item"><i class="icon-line-stack-2"></i></a>
								<a href="images/portfolio/full/4-1.jpg" class="hidden" data-lightbox="gallery-item"></a>
								<a href="portfolio-single-gallery.html" class="right-icon"><i class="icon-line-ellipsis"></i></a>
							</div>
						</div>
						<div class="portfolio-desc">
							<h3><a href="portfolio-single-gallery.html">Morning Dew</a></h3>
							<span><a href="#">Icons</a>, <a href="#">Illustrations</a></span>
						</div>
					</article>

					<article class="portfolio-item pf-uielements pf-media">
						<div class="portfolio-image">
							<a href="portfolio-single.html">
								<img src="/hellscare/resources/images/portfolio/4/5.jpg" alt="Console Activity">
							</a>
							<div class="portfolio-overlay">
								<a href="images/portfolio/full/5.jpg" class="left-icon" data-lightbox="image"><i class="icon-line-plus"></i></a>
								<a href="portfolio-single.html" class="right-icon"><i class="icon-line-ellipsis"></i></a>
							</div>
						</div>
						<div class="portfolio-desc">
							<h3><a href="portfolio-single.html">Console Activity</a></h3>
							<span><a href="#">UI Elements</a>, <a href="#">Media</a></span>
						</div>
					</article>

					<article class="portfolio-item pf-graphics pf-illustrations">
						<div class="portfolio-image">
							<a href="portfolio-single.html">
								<img src="/hellscare/resources/images/portfolio/4/6.jpg" alt="Open Imagination">
							</a>
							<div class="portfolio-overlay" data-lightbox="gallery">
								<a href="images/portfolio/full/6.jpg" class="left-icon" data-lightbox="gallery-item"><i class="icon-line-stack-2"></i></a>
								<a href="images/portfolio/full/6-1.jpg" class="hidden" data-lightbox="gallery-item"></a>
								<a href="images/portfolio/full/6-2.jpg" class="hidden" data-lightbox="gallery-item"></a>
								<a href="images/portfolio/full/6-3.jpg" class="hidden" data-lightbox="gallery-item"></a>
								<a href="portfolio-single-gallery.html" class="right-icon"><i class="icon-line-ellipsis"></i></a>
							</div>
						</div>
						<div class="portfolio-desc">
							<h3><a href="portfolio-single-gallery.html">Shake It!</a></h3>
							<span><a href="#">Illustrations</a>, <a href="#">Graphics</a></span>
						</div>
					</article>

					<article class="portfolio-item pf-uielements pf-icons">
						<div class="portfolio-image">
							<a href="portfolio-single-video.html">
								<img src="/hellscare/resources/images/portfolio/4/7.jpg" alt="Backpack Contents">
							</a>
							<div class="portfolio-overlay">
								<a href="http://www.youtube.com/watch?v=kuceVNBTJio" class="left-icon" data-lightbox="iframe"><i class="icon-line-play"></i></a>
								<a href="portfolio-single-video.html" class="right-icon"><i class="icon-line-ellipsis"></i></a>
							</div>
						</div>
						<div class="portfolio-desc">
							<h3><a href="portfolio-single-video.html">Backpack Contents</a></h3>
							<span><a href="#">UI Elements</a>, <a href="#">Icons</a></span>
						</div>
					</article>

					<article class="portfolio-item pf-graphics">
						<div class="portfolio-image">
							<a href="portfolio-single.html">
								<img src="/hellscare/resources/images/portfolio/4/8.jpg" alt="Sunset Bulb Glow">
							</a>
							<div class="portfolio-overlay">
								<a href="images/portfolio/full/8.jpg" class="left-icon" data-lightbox="image"><i class="icon-line-plus"></i></a>
								<a href="portfolio-single.html" class="right-icon"><i class="icon-line-ellipsis"></i></a>
							</div>
						</div>
						<div class="portfolio-desc">
							<h3><a href="portfolio-single.html">Sunset Bulb Glow</a></h3>
							<span><a href="#">Graphics</a></span>
						</div>
					</article>

				</div>


				<div class="clear"></div>

				<a href="exercise" class="button button-full button-dark center tright bottommargin-lg">
					<div class="container clearfix">
						전체운동 <strong>More</strong> <i class="icon-caret-right" style="top:4px;"></i>
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
		<%@ include file="../include/footer.jsp" %>

	</div><!-- #wrapper end -->

	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>
	<div id="gotoTop" class="icon-angle-up"></div>

	<%@ include file="../include/footerScript.jsp" %>

</body>
</html>