<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단 추천</title>
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
				<h1>식단 추천</h1>
				<span>회원님의 건강 정보에 맞게 맞춤형 식단을 추천합니다.</span>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="main">Home</a></li>
					<li class="breadcrumb-item"><a href="#">식단</a></li>
					<li class="breadcrumb-item active" aria-current="page">식단 추천</li>
				</ol>
			</div>
		</section><!-- #page-title end -->
		
			<!-- Content
		============================================= -->
		<section id="content">

			<div class="content-wrap">

				<div class="container clearfix">
				
					<h3>월별 섭취 칼로리</h1>
					<div class="bottommargin divcenter" style="max-width: 750px; min-height: 350px;" >
						<div class="chartjs-size-monitor" style="position: absolute; 
							left: 0px; top: 0px; right : 0px; bottom : 0px; overflow : hidden; 
							pointer-events : none; visibility : hidden; z-index: -1;">
							
							<div class="chartjs-size-monitor-expand" 
								style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;
										pointer-events:none;visibility:hidden;z-index:-1;">
								<div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>
							</div>
						</div>
						
						<div class="chartjs-size-monitor-shrink" 
							style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;
								pointer-events:none;visibility:hidden;z-index:-1;">
							<div style="position:absolute;width:200%;height:200%;left:0; top:0"></div>
						</div>
						
						<canvas id="chart-0" width="720" height="360" class="chartjs-render-monitor"
							style="display: block; width: 720px; height : 360px;" />
					</div>
					<!-- <h1> 선 그래프 끝 </h1> -->
					
					<!-- <h1> 막대 그래프 </h1>
					<div class="bottommargin divcenter" style="max-width: 750px; min-height: 350px;">
						<div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; 
							right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: 
							hidden; z-index: -1;">
							<div class="chartjs-size-monitor-expand" 
							style="position:absolute;left:0; top:0;right:0;bottom:0;overflow:hidden;
								pointer-events:none; visibility:hidden;z-index:-1;">
								<div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>
							</div>
							
							<div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;
								bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
								<div style="position:absolute;width:200%;height:200%;left:0; top:0"></div>
							</div>
						</div>
						
						<canvas id="chart-1" width="720" height="360" class="chartjs-render-monitor" 
							style="display: block; width: 720px; height: 360px;"></canvas>
					</div>
					<h1> 막대 그래프 끝 </h1> -->

					
					<!-- Post Content
					============================================= -->
					<div class="postcontent nobottommargin clearfix">
			
						<h3>추천 식단</h3>
			
						<ul id="myTab" class="nav nav-tabs boot-tabs">
						  <li class="nav-item"><a class="nav-link active" href="#reasonable_food" data-toggle="tab">이상적인 식단</a></li>
						  <!-- <li class="nav-item"><a class="nav-link" href="#profile" data-toggle="tab">Profile</a></li> -->
						</ul>
						<div id="myTabContent" class="tab-content">
						  <div class="tab-pane fade show active" id="reasonable_food">
						  	<p>2000kcal</p>
						  	<table class="table table-bordered">
							  <thead style="align:center;">
								<tr>
								  <th colspan="2">아침</th>
								  <th colspan="2">간식</th>
								  <th colspan="2">점심</th>
								  <th colspan="2">간식</th>
								  <th colspan="2">저녁</th>
								</tr>
								<tr style="font-size: 14px;">
									<td>음식명(g)</td>
									<td>칼로리(kcal)</td>
									<td>음식명(g)</td>
									<td>칼로리(kcal)</td>
									<td>음식명(g)</td>
									<td>칼로리(kcal)</td>
									<td>음식명(g)</td>
									<td>칼로리(kcal)</td>
									<td>음식명(g)</td>
									<td>칼로리(kcal)</td>
								</tr>
							  </thead>
							  <tbody style="font-size:12px;" >
								<tr>
								  <td>식빵 2장</td>
								  <td>200</td>
								  <td>   </td>
								  <td>   </td>
								  <td>비빔밥(410)</td>
								  <td>600</td>
								  <td>   </td>
								  <td>   </td>
								  <td>보리밥(300)</td>
								  <td>600</td>
								</tr>
								
								<tr>
								  <td>우유</td>
								  <td>125</td>
								  <td>   </td>
								  <td>   </td>
								  <td>아욱된장국(250)</td>
								  <td>80</td>
								  <td>   </td>
								  <td>   </td>
								  <td>순두부찌개(300)</td>
								  <td>180</td>
								</tr>
								
								<tr>
								  <td>달걀프라이(50)</td>
								  <td>100</td>
								  <td>   </td>
								  <td>   </td>
								  <td>김무침(10)</td>
								  <td>20</td>
								  <td>   </td>
								  <td>   </td>
								  <td>코다리찜(80)</td>
								  <td>100</td>
								</tr>
								
								<tr>
								  <td>양배추샐러드(50)</td>
								  <td>70</td>
								  <td>   </td>
								  <td>   </td>
								  <td>동치미(100)</td>
								  <td>10</td>
								  <td>   </td>
								  <td>   </td>
								  <td>도토리무침(80)</td>
								  <td>50</td>
								</tr>
								
								<tr>
								  <td>바나나 1개</td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>콩나물무침(70)</td>
								  <td>50</td>
								</tr>
								
								<tr>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>배추김치(50)</td>
								  <td>15</td>
								</tr>
							  </tbody>
							  
							  <tfoot>
							  	<tr style="font-size:14px; align:center;">
							  		<td colspan="2">595 kcal</td>
							  		<td colspan="2"></td>
							  		<td colspan="2">710 kcal</td>
							  		<td colspan="2"></td>
							  		<td colspan="2">695 kcal</td>
							  	</tr>
							  </tfoot>
							</table>
						  	
						  </div>
						  
						</div>
			
					</div><!-- .postcontent end -->

				</div>

			</div>
			
			

		</section><!-- #content end -->

	</div>

</div>

		</section>
		<!-- #content end -->

		<!-- Footer
		============================================= -->
		<%@ include file="../include/footer.jsp"%>
		<!-- #footer end -->

	</div><!-- #wrapper end -->

	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>

	<%@ include file="../include/footerScript.jsp"%>
	
	<script src="resources/js/chart.js"></script>
	<script src="resources/js/chart-utils.js"></script>
	
	<script>

		var MONTHS = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
		var config = {
			type: 'line',
			data: {
				labels: ["January", "February", "March", "April", "May", "June", "July"],
				datasets: [{
					label: "내가 섭취한 월별 칼로리",
					backgroundColor: window.chartColors.red,
					borderColor: window.chartColors.red,
					data: [
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor()
					],
					fill: false,
				}, {
					label: "평균 칼로리 기준치",
					fill: false,
					backgroundColor: window.chartColors.blue,
					borderColor: window.chartColors.blue,
					data: [
						randomScalingFactor(),
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
					display:true,
					text:'월별 섭취한 칼로리'
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
							labelString: '월'
						}
					}],
					yAxes: [{
						display: true,
						scaleLabel: {
							display: true,
							labelString: '칼로리'
						}
					}]
				}
			}
		};

		window.onload = function() {
			var ctx = document.getElementById("chart-0").getContext("2d");
			window.myLine = new Chart(ctx, config);
		};

		document.getElementById('randomizeData').addEventListener('click', function() {
			config.data.datasets.forEach(function(dataset) {
				dataset.data = dataset.data.map(function() {
					return randomScalingFactor();
				});

			});

			window.myLine.update();
		});

		var NUTRIENTS = ["Carbohydrate", "Protein", "Fat", "Minerals", "Vitamin"];
		var color = Chart.helpers.color;
		var barChartData = {
			labels: ["Carbohydrate", "Protein", "Fat", "Minerals", "Vitamin"],
			datasets: [{
				label: '내가 섭취한 영양소',
				backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
				borderColor: window.chartColors.red,
				borderWidth: 1,
				data: [
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor()
				]
			}, {
				label: '영양소 한달 권장량',
				backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
				borderColor: window.chartColors.blue,
				borderWidth: 1,
				data: [
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor()
				]
			}]

		};

		window.onload = function() {
			var ctx = document.getElementById("chart-1").getContext("2d");
			window.myBar = new Chart(ctx, {
				type: 'bar',
				data: barChartData,
				options: {
					responsive: true,
					legend: {
						position: 'top',
					},
					title: {
						display: true,
						text: '한달 간 섭취한 영양소'
					}
				}
			});

		};

		document.getElementById('randomizeData').addEventListener('click', function() {
			var zero = Math.random() < 0.2 ? true : false;
			barChartData.datasets.forEach(function(dataset) {
				dataset.data = dataset.data.map(function() {
					return zero ? 0.0 : randomScalingFactor();
				});

			});
			window.myBar.update();
		});

		var colorNames = Object.keys(window.chartColors);
		document.getElementById('addDataset').addEventListener('click', function() {
			var colorName = colorNames[barChartData.datasets.length % colorNames.length];;
			var dsColor = window.chartColors[colorName];
			var newDataset = {
				label: 'Dataset ' + barChartData.datasets.length,
				backgroundColor: color(dsColor).alpha(0.5).rgbString(),
				borderColor: dsColor,
				borderWidth: 1,
				data: []
			};

			for (var index = 0; index < barChartData.labels.length; ++index) {
				newDataset.data.push(randomScalingFactor());
			}

			barChartData.datasets.push(newDataset);
			window.myBar.update();
		});

		document.getElementById('addData').addEventListener('click', function() {
			if (barChartData.datasets.length > 0) {
				var month = MONTHS[barChartData.labels.length % MONTHS.length];
				barChartData.labels.push(month);

				for (var index = 0; index < barChartData.datasets.length; ++index) {
					//window.myBar.addData(randomScalingFactor(), index);
					barChartData.datasets[index].data.push(randomScalingFactor());
				}

				window.myBar.update();
			}
		});

		document.getElementById('removeDataset').addEventListener('click', function() {
			barChartData.datasets.splice(0, 1);
			window.myBar.update();
		});

		document.getElementById('removeData').addEventListener('click', function() {
			barChartData.labels.splice(-1, 1); // remove the label first

			barChartData.datasets.forEach(function(dataset, datasetIndex) {
				dataset.data.pop();
			});

			window.myBar.update();
		});

	</script>
</body>
</html>