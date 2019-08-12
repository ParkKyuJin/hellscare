<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/setting.jsp" %>

<html>

<head>
	<!-- Stylesheets
	============================================= -->
	<!-- <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700|Roboto:300,400,700" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="/hellscare/resources/css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="/hellscare/resources/style.css" type="text/css" />

	One Page Module Specific Stylesheet
	<link rel="stylesheet" href="onepage.css" type="text/css" />
	/

	<link rel="stylesheet" href="/hellscare/resources/css/dark.css" type="text/css" />
	<link rel="stylesheet" href="/hellscare/resources/css/font-icons.css" type="text/css" />
	<link rel="stylesheet" href="/hellscare/resources/css/et-line.css" type="text/css" />
	<link rel="stylesheet" href="/hellscare/resources/css/animate.css" type="text/css" />
	<link rel="stylesheet" href="/hellscare/resources/css/magnific-popup.css" type="text/css" />

	<link rel="stylesheet" href="/hellscare/resources/css/fonts.css" type="text/css" />

	<link rel="stylesheet" href="/hellscare/resources/css/responsive.css" type="text/css" /> -->
	<meta name="viewport" content="width=device-width, initial-scale=1" />

</head>

<body class="stretched">

   <!-- Document Wrapper
   ============================================= -->
   <div id="wrapper" class="clearfix">

      <!-- Header
      ============================================= -->
      <%@ include file="../include/header.jsp" %>
      <!-- #header end -->

      <!-- Page Title
      ============================================= -->
      <section id="page-title">

         <div class="container clearfix">
            <h1>걸음 수</h1>
         </div>

      </section><!-- #page-title end -->
      
      <!-- Slider
		============================================= -->
		<section id="slider" class="slider-element slider-parallax full-screen">

			<div class="slider-parallax-inner">

				<div class="full-screen section nobg nopadding nomargin noborder ohidden">
					<div class="container clearfix">
						<div class="vertical-middle ignore-header">
							<div class="row">

								<div class="col-lg-7 center">
									<img alt="" src="/hellscare/resources/images/exercise/steps.png" style="width:100%; height:100%;">
								</div>

								<div class="col-lg-5">
									<div class="heading-block nobottomborder bottommargin-sm">
										<h1 class="capitalize">오늘의 걸음 수</h1>
									</div>
									<p class="lead bottommargin-sm">We make sure that your Business Model makes the most out of Modern Day Technologies. We prove our case wih your Business Results.</p>
									<a href="stepsRank" class="button button-black tright noleftmargin">내 걸음 수 랭킹 보러가기 <i class="icon-angle-right"></i></a>
								</div>

							</div>
						</div>
					</div>
				</div>

				<a href="#" data-scrollto="#section-about" data-easing="easeInOutExpo" data-speed="1250" data-offset="70" class="one-page-arrow"><i class="icon-angle-down infinite animated fadeInDown"></i></a>

			</div>

		</section><!-- #slider end -->

		<!-- Content
		============================================= -->
		<section id="content">

			<div class="content-wrap nopadding">

				<div id="section-about" class="center page-section">

					<div class="container clearfix">

						<h2 class="divcenter bottommargin font-body" style="max-width: 700px; font-size: 40px;">월 별 걸음 수</h2>

						<div class="col-lg-12 center">
									<div class="bottommargin divcenter" style="max-width: 600px; min-height: 350px;">
										<canvas id="chart-0" width="547" height="350"></canvas>
									</div>
						</div>
						<div class="clear"></div>

						

					</div>

				</div>

			</div>

		</section><!-- #content end -->


      <!-- Footer
      ============================================= -->
      <%@ include file="../include/footer.jsp"%>
      <!-- #footer end -->

   </div><!-- #wrapper end -->

   <!-- Go To Top
   ============================================= -->
   <div id="gotoTop" class="icon-angle-up"></div>

   <%@ include file="../include/footerScript.jsp"%>
   
   <!-- Charts JS
	============================================= -->
	<script src="/hellscare/resources/js/chart.js"></script>
	<script src="/hellscare/resources/js/chart-utils.js"></script>

	<script>

		var MONTHS = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"];
		var config = {
			type: 'line',
			data: {
				labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun"],
				datasets: [{
					label: "2015",
					backgroundColor: window.chartColors.red,
					borderColor: window.chartColors.red,
					data: [
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor()
					],
					fill: false,
				}, {
					label: "2016",
					fill: false,
					backgroundColor: window.chartColors.blue,
					borderColor: window.chartColors.blue,
					data: [
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor()
					],
				}]
			},
			options: {
				responsive: true,
				title:{
					display:false,
					text:'Line Chart'
				},
				tooltips: {
					mode: 'index',
					intersect: false,
				},
				hover: {
					mode: 'nearest',
					intersect: true
				},
				scales: {
					xAxes: [{
						display: true,
						scaleLabel: {
							display: true,
							labelString: 'Month'
						}
					}],
					yAxes: [{
						display: true,
						scaleLabel: {
							display: true,
							labelString: 'Value'
						}
					}]
				}
			}
		};

		window.onload = function() {
			var ctx = document.getElementById("chart-0").getContext("2d");
			window.myLine = new Chart(ctx, config);
		};

	
		


	</script>
   
   
</body>
</html>