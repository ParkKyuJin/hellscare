<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/setting.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%@ include file="../include/header.jsp"%>
	<!-- Content
		============================================= -->
		<section id="page-title">

			<div class="container clearfix">
				<h1>Exercise list</h1>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page"><a href="details_exercise">Exercise Details</a></li>
					<li class="breadcrumb-item active" aria-current="page"><a href="exercise_favorite">favorite</a></li>
				</ol>
			</div>

		</section><!-- #page-title end -->
		
		
	<section id="content">

		<div class="content-wrap">
			<div class="container clearfix">

				<div class="fancy-title title-center title-dotted-border">
					<h3>스트레칭</h3>
				</div>

				<div id="oc-images"
					class="owl-carousel image-carousel carousel-widget"
					data-margin="20" data-nav="true" data-pagi="true" data-items-xs="2"
					data-items-sm="3" data-items-lg="4" data-items-xl="5">

					<div class="oc-item">
						<a href="details_exercise"><img
							src="resources/images/portfolio/4/4-1.jpg" alt="Image 1"></a>
					</div>
					<div class="oc-item">
						<a href="#"><img src="resources/images/portfolio/4/6-1.jpg"
							alt="Image 2"></a>
					</div>
					<div class="oc-item">
						<a href="#"><img src="resources/images/portfolio/4/6-2.jpg"
							alt="Image 3"></a>
					</div>
					<div class="oc-item">
						<a href="#"><img src="resources/images/portfolio/4/6-3.jpg"
							alt="Image 4"></a>
					</div>
					<div class="oc-item">
						<a href="#"><img src="resources/images/portfolio/4/9-1.jpg"
							alt="Image 5"></a>
					</div>
					<div class="oc-item">
						<a href="#"><img src="resources/images/portfolio/4/9-2.jpg"
							alt="Image 6"></a>
					</div>
					<div class="oc-item">
						<a href="#"><img src="resources/images/portfolio/4/12-1.jpg"
							alt="Image 7"></a>
					</div>

				</div>


				<div class="clear"></div>
				<div class="line"></div>

				<div class="fancy-title title-center title-dotted-border">
					<h3>다이어트 운동</h3>
				</div>

				<div id="oc-images"
					class="owl-carousel image-carousel carousel-widget"
					data-margin="20" data-nav="true" data-pagi="true" data-items-xs="2"
					data-items-sm="3" data-items-lg="4" data-items-xl="5">

					<div class="oc-item">
						<a href="#"><img src="resources/images/portfolio/4/4-1.jpg"
							alt="Image 1"></a>
					</div>
					<div class="oc-item">
						<a href="#"><img src="resources/images/portfolio/4/6-1.jpg"
							alt="Image 2"></a>
					</div>
					<div class="oc-item">
						<a href="#"><img src="resources/images/portfolio/4/6-2.jpg"
							alt="Image 3"></a>
					</div>
					<div class="oc-item">
						<a href="#"><img src="resources/images/portfolio/4/6-3.jpg"
							alt="Image 4"></a>
					</div>
					<div class="oc-item">
						<a href="#"><img src="resources/images/portfolio/4/9-1.jpg"
							alt="Image 5"></a>
					</div>
					<div class="oc-item">
						<a href="#"><img src="resources/images/portfolio/4/9-2.jpg"
							alt="Image 6"></a>
					</div>
					<div class="oc-item">
						<a href="#"><img src="resources/images/portfolio/4/12-1.jpg"
							alt="Image 7"></a>
					</div>
				</div>
				
				<div class="clear"></div>
				<div class="line"></div>

				<div class="fancy-title title-center title-dotted-border">
					<h3>추천 운동</h3>
				</div>

				<div id="oc-images"
					class="owl-carousel image-carousel carousel-widget"
					data-margin="20" data-nav="true" data-pagi="true" data-items-xs="2"
					data-items-sm="3" data-items-lg="4" data-items-xl="5">

					<div class="oc-item">
						<a href="#"><img src="resources/images/portfolio/4/4-1.jpg"
							alt="Image 1"></a>
					</div>
					<div class="oc-item">
						<a href="#"><img src="resources/images/portfolio/4/6-1.jpg"
							alt="Image 2"></a>
					</div>
					<div class="oc-item">
						<a href="#"><img src="resources/images/portfolio/4/6-2.jpg"
							alt="Image 3"></a>
					</div>
					<div class="oc-item">
						<a href="#"><img src="resources/images/portfolio/4/6-3.jpg"
							alt="Image 4"></a>
					</div>
					
					<div class="oc-item">
						<a href="#"><img src="resources/images/portfolio/4/9-1.jpg"
							alt="Image 5"></a>
					</div>
					<div class="oc-item">
						<a href="#"><img src="resources/images/portfolio/4/9-2.jpg"
							alt="Image 6"></a>
					</div>
					<div class="oc-item">
						<a href="#"><img src="resources/images/portfolio/4/12-1.jpg"
							alt="Image 7"></a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- #content end -->


	<%@ include file="../include/footer.jsp"%>
	<%@ include file="../include/footerScript.jsp"%>
</body>
</html>