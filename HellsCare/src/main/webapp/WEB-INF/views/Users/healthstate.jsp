<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<%@ include file="../include/setting.jsp" %>
	<%@ include file="../include/header.jsp" %>
	
	<!-- 중간 lable -->
	<section id="page-title">

			<div class="container clearfix">
				<h1>날짜별 신체정보</h1>
				<span>Labelling Data Points</span>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="main2">Home</a></li>
					<li class="breadcrumb-item"><a href="healthstateresult">Result</a></li>
					
				</ol>
			</div>
		</section><!-- #page-title end -->
		
<!-- 탭메뉴 관련 -->
<section id="content" style="margin:0px 0px 0px 0px; padding:0px 0px 0px 0px;">

			<div class="content-wrap">

				<div class="container clearfix">

					<!-- Post Content
					============================================= -->
			<div class="postcontent nobottommargin">

				<!-- Google Map
						============================================= -->

				<!-- <section id="google-map" class="gmap bottommargin" style="height: 300px;"></section> -->
				<div class="tabs nobottommargin clearfix" id="sidebar-tabs">

					<ul class="tab-nav clearfix">
						<li><a href="#tabs-1">칼로리</a></li>
						<li><a href="#tabs-2">혈압</a></li>
						<li><a href="#tabs-3">걸음수</a></li>
						<li><a href="#tabs-4">체중</a></li>
					</ul>


					<div class="tab-container">


						<div class="tab-content clearfix" id="tabs-1">
							<div id="popular-post-list-sidebar">

								<canvas id="chart-0" style="display: block;"></canvas>

							</div>
						</div>
						<div class="tab-content clearfix" id="tabs-2">
							<div id="recent-post-list-sidebar">
								<!-- <div class="bottommargin divcenter" style=" max-width: 70%; min-height: 350px;">
						<canvas id="chart-1"></canvas>
					</div> -->
								혈압 그래프

							</div>
						</div>
						<div class="tab-content clearfix" id="tabs-3">
							<div id="recent-post-list-sidebar">자료넣기</div>
						</div>
						<div class="tab-content clearfix" id="tabs-4">
							<div id="recent-post-list-sidebar">자료넣기2</div>
						</div>

					</div>

				</div>
				<div class="alert alert-warning" align="center">
					<i class="icon-warning-sign"></i><strong>Warning!</strong> 주의하세요! 섭취 칼로리에 비해 운동량이 낮습니다!
				</div>
			
			


				<div class="line"></div>





			</div>
			<!-- .postcontent end -->

			<!-- Sidebar
					============================================= -->
					<div class="sidebar nobottommargin col_last clearfix">
						<div class="sidebar-widgets-wrap">

							<div class="widget widget_links clearfix">

								<h4>간편메뉴</h4>
								<ul>
									<li><a href="animations.html"><div>Animations</div></a></li>
									<li><a href="buttons.html"><div>Buttons</div></a></li>
									<li><a href="carousel.html"><div>Carousel</div></a></li>
									<li><a href="charts.html"><div>Charts</div></a></li>
									<li><a href="clients.html"><div>Clients</div></a></li>
									<li><a href="columns-grids.html"><div>Columns</div></a></li>
									<li><a href="counters.html"><div>Counters</div></a></li>
									<li><a href="dividers.html"><div>Dividers</div></a></li>
									<li><a href="featured-boxes.html"><div>Icon Boxes</div></a></li>
									<li><a href="gallery.html"><div>Galleries</div></a></li>
									<li><a href="headings-dropcaps.html"><div>Heading Styles</div></a></li>
									<li><a href="icon-lists.html"><div>Icon Lists</div></a></li>
									<li><a href="labels-badges.html"><div>Labels</div></a></li>
									<li><a href="lightbox.html"><div>Lightbox</div></a></li>
											
								</ul>

							</div>

							

						

						</div>
					</div><!-- .sidebar end -->

				</div>

			</div>

		</section><!-- #content end -->







<script>
	var eat1 = 10;
	var eat2 = 20;
	var eat3 = 30;
	var eat4 = 40;
	var eat5 = 50;
	var eat6 = 60;
	var eat7 = 70;

	var burn1 = 70;
	var burn2 = 60;
	var burn3 = 50;
	var burn4 = 40;
	var burn5 = 30;
	var burn6 = 20;
	var burn7 = 10;

	var color = Chart.helpers.color;
	var barChartData = {
		labels : [ "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday",
				"Friday", "Saturday" ],
		datasets : [
				{
					type : 'bar',
					label : '섭취 열량',
					backgroundColor : color(window.chartColors.red).alpha(0.2)
							.rgbString(),
					borderColor : window.chartColors.red,
					data : [ eat1, eat2, eat3, eat4, eat5, eat6, eat7 ]
				},
				{
					type : 'line',
					label : '잉여 열량',
					backgroundColor : color(window.chartColors.blue).alpha(0.2)
							.rgbString(),
					borderColor : window.chartColors.blue,
					data : [ (eat1 - burn1), (eat2 - burn2), (eat3 - burn3),
							(eat4 - burn4), (eat5 - burn5), (eat6 - burn6),
							(eat7 - burn7) ]
				},
				{
					type : 'bar',
					label : '소비열량',
					backgroundColor : color(window.chartColors.green)
							.alpha(0.2).rgbString(),
					borderColor : window.chartColors.green,
					data : [ burn1, burn2, burn3, burn4, burn5, burn6, burn7 ]
				} ]
	};

	// Define a plugin to provide data labels
	Chart.plugins.register({
		afterDatasetsDraw : function(chart, easing) {
			// To only draw at the end of animation, check for easing === 1
			var ctx = document.getElementById("chart-0").getContext("2d");

			chart.data.datasets.forEach(function(dataset, i) {
				var meta = chart.getDatasetMeta(i);
				if (!meta.hidden) {
					meta.data.forEach(function(element, index) {
						// Draw the text in black, with the specified font
						ctx.fillStyle = 'rgb(0, 0, 0)';

						var fontSize = 16;
						var fontStyle = 'normal';
						var fontFamily = 'Helvetica Neue';
						ctx.font = Chart.helpers.fontString(fontSize,
								fontStyle, fontFamily);

						// Just naively convert to string for now
						var dataString = dataset.data[index].toString();

						// Make sure alignment settings are correct
						ctx.textAlign = 'center';
						ctx.textBaseline = 'middle';

						var padding = 5;
						var position = element.tooltipPosition();
						ctx.fillText(dataString, position.x, position.y
								- (fontSize / 2) - padding);
					});
				}
			});
		}
	});

	window.onload = function() {
		var ctx = document.getElementById("chart-0").getContext("2d");
		window.myBar = new Chart(ctx, {
			type : 'bar',
			data : barChartData,
			options : {
				responsive : true,
				title : {
					display : true,
					text : 'Combo Bar Line Chart'
				},
			}
		});
	};

</script>
<script>
/* 
		var randomScalingFactor = function() {
			return Math.round(Math.random() * 100);
		};

		var config = {
			type: 'pie',
			data: {
				datasets: [{
					data: [
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
					],
					backgroundColor: [
						window.chartColors.red,
						window.chartColors.orange,
						window.chartColors.yellow,
						window.chartColors.green,
						window.chartColors.blue,
					],
					label: 'Dataset 1'
				}],
				labels: [
					"Red",
					"Orange",
					"Yellow",
					"Green",
					"Blue"
				]
			},
			options: {
				responsive: true
			}
		};

		window.onload = function() {
			var ctx2 = document.getElementById("chart-1").getContext("2d");
			window.myPie = new Chart(ctx2, config);
		};

		document.getElementById('randomizeData').addEventListener('click', function() {
			config.data.datasets.forEach(function(dataset) {
				dataset.data = dataset.data.map(function() {
					return randomScalingFactor();
				});
			});

			window.myPie.update();
		});

		var colorNames = Object.keys(window.chartColors);
		document.getElementById('addDataset').addEventListener('click', function() {
			var newDataset = {
				backgroundColor: [],
				data: [],
				label: 'New dataset ' + config.data.datasets.length,
			};

			for (var index = 0; index < config.data.labels.length; ++index) {
				newDataset.data.push(randomScalingFactor());

				var colorName = colorNames[index % colorNames.length];;
				var newColor = window.chartColors[colorName];
				newDataset.backgroundColor.push(newColor);
			}

			config.data.datasets.push(newDataset);
			window.myPie.update();
		});

	
 */
	</script>
<script src="resources/js/functions.js"></script>

	<script>
		jQuery(window).on( 'load',  function(){
			var filters = {};

			var $container = $('.grid');

			$container.isotope();

			$('.combination-filter').on( 'click', '.btn', function() {
				var $this = $(this);
				// get group key
				var $buttonGroup = $this.parents('.btn-group');
				var filterGroup = $buttonGroup.attr('data-filter-group');
				// set filter for group
				filters[ filterGroup ] = $this.attr('data-filter');
				// combine filters
				var filterValue = concatValues( filters );
				$container.isotope({ filter: filterValue });

				$this.parents('.btn-group').find('.btn').removeClass('btn-primary').addClass( 'btn-secondary');

				$this.removeClass( 'btn-secondary').addClass('btn-primary');

				return false;
			});

			// flatten object by concatting values
			function concatValues( obj ) {
				var value = '';
				for ( var prop in obj ) {
					value += obj[ prop ];
				}
				return value;
			}

			$(window).resize(function() {
				$container.isotope('layout');
			});
		});

	</script>

	
	<%@ include file="../include/footer.jsp" %>
	<%@ include file="../include/footerScript.jsp" %>