<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
				
					<c:if test="${sessionScope.memId == null}">
						<script type="text/javascript">
							alert("로그인 후 이용해주세요!");
							window.location = 'login_reg';
						</script>
					</c:if>
					
					<c:if test="${standard.separation =='man'}">
						<c:set var="gender" value="남성" />
					</c:if>
					
					<c:if test="${standard.separation =='woman'}">
						<c:set var="gender" value="여성" />
					</c:if>
					
					<c:if test="${sessionScope.memId != null}">
						<div class="bottommargin divcenter" style="max-width: 750px; min-height: 350px;" >
							<h3>주간 섭취 칼로리</h1>
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
						
						<div class="bottommargin divcenter" style="max-width: 750px; min-height: 350px;">
							<h3>주간 탄수화물 섭취율</h3>
							<div id="carbo-chart" style="width: 75%; height: 50%;"></div>
							
							<br>
							<c:if test="${weekCarbo >= standard.avgCarbohydrate *100 && weekCarbo < standard.recoCarbohydrate *100}">
								<div class="style-msg successmsg">
									<div class="sb-msg"><i class="icon-thumbs-up"></i><strong>적정량을 섭취하셨습니다.</strong> 이 섭취량을 유지하십시오.</div>
									<!-- <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button> -->
								</div>
							</c:if>
							
							<c:if test="${weekCarbo < standard.avgCarbohydrate *100}">
								<div class="style-msg alertmsg">
									<div class="sb-msg"><i class="icon-warning-sign"></i><strong>부족량을 섭취하셨습니다.</strong> 더 많은 탄수화물을 섭취하십시오.</div>
								</div>
							</c:if>
							
							<c:if test="${weekCarbo > standard.recoCarbohydrate *100}">
								<div class="style-msg errormsg">
									<div class="sb-msg"><i class="icon-remove"></i><strong>과다량을 섭취하셨습니다.</strong> 탄수화물 섭취량을 줄이십시오.</div>
								</div>
							</c:if>
							
						</div>
						
						<div class="bottommargin divcenter" style="max-width: 750px; min-height: 350px;">
							<h3>주간 단백질 섭취량</h3>
							<div id="protein-chart" style="width: 75%; height: 50%;"></div>
							<br>
							<c:if test="${weekProtein >= standard.avgProtein && weekProtein < standard.recoProtein}">
								<div class="style-msg successmsg">
									<div class="sb-msg"><i class="icon-thumbs-up"></i><strong>적정량을 섭취하셨습니다.</strong> 이 섭취량을 유지하십시오.</div>
									<!-- <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button> -->
								</div>
							</c:if>
							
							<c:if test="${weekProtein < standard.avgProtein}">
								<div class="style-msg alertmsg">
									<div class="sb-msg"><i class="icon-warning-sign"></i><strong>부족량을 섭취하셨습니다.</strong> 더 많은 단백질을 섭취하십시오.</div>
								</div>
							</c:if>
							
							<c:if test="${weekProtein > standard.recoProtein}">
								<div class="style-msg errormsg">
									<div class="sb-msg"><i class="icon-remove"></i><strong>과다량을 섭취하셨습니다.</strong> 단백질 섭취량을 줄이십시오.</div>
								</div>
							</c:if>
							
						</div>
						
						<div class="bottommargin divcenter" style="max-width: 750px; min-height: 350px;">
							<h3>주간 지방 섭취율</h3>
							<div id="fat-chart" style="width: 75%; height: 50%;"></div>
							<br>
							<c:if test="${weekFat >= standard.avgFat *100 && weekFat < standard.recoFat *100}">
								<div class="style-msg successmsg">
									<div class="sb-msg"><i class="icon-thumbs-up"></i><strong>적정량을 섭취하셨습니다.</strong> 이 섭취량을 유지하십시오.</div>
									<!-- <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button> -->
								</div>
							</c:if>
							
							<c:if test="${weekFat < standard.avgFat * 100}">
								<div class="style-msg alertmsg">
									<div class="sb-msg"><i class="icon-warning-sign"></i><strong>부족량을 섭취하셨습니다.</strong> 더 많은 지방을 섭취하십시오.</div>
								</div>
							</c:if>
							
							<c:if test="${weekFat > standard.recoFat * 100}">
								<div class="style-msg errormsg">
									<div class="sb-msg"><i class="icon-remove"></i><strong>과다량을 섭취하셨습니다.</strong> 지방 섭취량을 줄이십시오.</div>
								</div>
							</c:if>
						</div>
						
						<div class="bottommargin divcenter" style="max-width: 750px; min-height: 350px;">
							<h3>주간 당류 섭취율</h3>
							<div id="saccharide-chart" style="width: 75%; height: 50%;"></div>
							<br>
							<c:if test="${weekSaccharide <= standard.saccharide}">
								<div class="style-msg successmsg">
									<div class="sb-msg"><i class="icon-thumbs-up"></i><strong>적정량을 섭취하셨습니다.</strong> 이 섭취량을 유지하십시오.</div>
									<!-- <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button> -->
								</div>
							</c:if>
							
							<c:if test="${weekSaccharide > standard.saccharide}">
								<div class="style-msg errormsg">
									<div class="sb-msg"><i class="icon-remove"></i><strong>과다량을 섭취하셨습니다.</strong> 지방 섭취량을 줄이십시오.</div>
								</div>
							</c:if>
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
						<!-- <div class="postcontent nobottommargin clearfix">
			
							<h3>추천 식단</h3>
				
							<ul id="myTab" class="nav nav-tabs boot-tabs">
							  <li class="nav-item"><a class="nav-link active" href="#reasonable_food" data-toggle="tab">이상적인 식단</a></li>
							  <li class="nav-item"><a class="nav-link" href="#profile" data-toggle="tab">Profile</a></li>
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
			
						</div> --><!-- .postcontent end -->
					</c:if>

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

		var MONTHS = ["${userWeeklyKcalList.get(0).kcal_date}", 
						"${userWeeklyKcalList.get(1).kcal_date}", 
						"${userWeeklyKcalList.get(2).kcal_date}", 
						"${userWeeklyKcalList.get(3).kcal_date}", 
						"${userWeeklyKcalList.get(4).kcal_date}", 
						"${userWeeklyKcalList.get(5).kcal_date}", 
						"${userWeeklyKcalList.get(6).kcal_date}"];
		var config = {
			type: 'line',
			data: {
				labels: ["${userWeeklyKcalList.get(0).kcal_date}", 
						"${userWeeklyKcalList.get(1).kcal_date}", 
						"${userWeeklyKcalList.get(2).kcal_date}", 
						"${userWeeklyKcalList.get(3).kcal_date}", 
						"${userWeeklyKcalList.get(4).kcal_date}", 
						"${userWeeklyKcalList.get(5).kcal_date}", 
						"${userWeeklyKcalList.get(6).kcal_date}"],
				datasets: [{
					label: "내가 섭취한 칼로리",
					backgroundColor: window.chartColors.red,
					borderColor: window.chartColors.red,
					data: [
						${userWeeklyKcalList.get(0).total_kcal},
						${userWeeklyKcalList.get(1).total_kcal},
						${userWeeklyKcalList.get(2).total_kcal},
						${userWeeklyKcalList.get(3).total_kcal},
						${userWeeklyKcalList.get(4).total_kcal},
						${userWeeklyKcalList.get(5).total_kcal},
						${userWeeklyKcalList.get(6).total_kcal}
					],
					fill: false,
				}, {
					label: "${standard.age}세 ${gender} 칼로리 기준치",
					fill: false,
					backgroundColor: window.chartColors.blue,
					borderColor: window.chartColors.blue,
					data: [
						${standard.calory},
						${standard.calory},
						${standard.calory},
						${standard.calory},
						${standard.calory},
						${standard.calory},
						${standard.calory}
					],
				}]
			},
			options: {
				responsive: true,
				title:{
					display:true,
					text:'주간 섭취 칼로리'
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
							labelString: 'Week'
						}
					}],
					yAxes: [{
						display: true,
						scaleLabel: {
							display: true,
							labelString: 'Kcal'
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
	
	<script type="text/javascript">
		google.charts.load('current', {'packages':['bar']});
	    google.charts.setOnLoadCallback(drawChartCarbo);
	
	    function drawChartCarbo() {
	      var data = google.visualization.arrayToDataTable([
	        ['탄수화물', '${standard.age}세 ${gender} 기준 평균 탄수화물 섭취율', '나의 섭취율', '${standard.age}세 ${gender} 기준 최대 탄수화물 섭취율'],
	        ['주간 탄수화물 섭취율(%)', ${standard.avgCarbohydrate * 100}, ${weekCarbo}, ${standard.recoCarbohydrate * 100}]
	      ]);
	
	      var options = {
	        chart: {
	          title: '주간 탄수화물 비교',
	          subtitle: '${standard.age}세 ${gender} 기준 탄수화물 권장량과 나의 섭취량 비교',
	        }
	      };
	
	      var chart = new google.charts.Bar(document.getElementById('carbo-chart'));
	
	      chart.draw(data, google.charts.Bar.convertOptions(options));
	    }
	</script>
	
	<script type="text/javascript">
		google.charts.load('current', {'packages':['bar']});
	    google.charts.setOnLoadCallback(drawChartProtein);
	
	    function drawChartProtein() {
	      var data = google.visualization.arrayToDataTable([
	        ['단백질', '${standard.age}세 ${gender} 기준 평균 단백질 섭취량', '나의 섭취량', '${standard.age}세 ${gender} 기준 최대 단백질 섭취량'],
	        ['주간 단백질 섭취량(g)', ${standard.avgProtein}, ${weekProtein}, ${standard.recoProtein}]
	      ]);
	
	      var options = {
	        chart: {
	          title: '주간 단백질 비교',
	          subtitle: '${standard.age}세 ${gender} 기준 단백질 권장량과 나의 섭취량 비교',
	        }
	      };
	
	      var chart = new google.charts.Bar(document.getElementById('protein-chart'));
	
	      chart.draw(data, google.charts.Bar.convertOptions(options));
	    }
	</script>
	
	<script type="text/javascript">
		google.charts.load('current', {'packages':['bar']});
	    google.charts.setOnLoadCallback(drawChartFat);
	
	    function drawChartFat() {
	      var data = google.visualization.arrayToDataTable([
	        ['지방', '${standard.age}세 ${gender} 기준 평균 지방 섭취율', '나의 섭취율', '${standard.age}세 ${gender} 기준 최대 지방 섭취율'],
	        ['주간 지방 섭취율(%)', ${standard.avgFat * 100}, ${weekFat}, ${standard.recoFat * 100}]
	      ]);
	
	      var options = {
	        chart: {
	          title: '주간 지방 비교',
	          subtitle: '${standard.age}세 ${gender} 기준 지방 권장량과 나의 섭취량 비교',
	        }
	      };
	
	      var chart = new google.charts.Bar(document.getElementById('fat-chart'));
	
	      chart.draw(data, google.charts.Bar.convertOptions(options));
	    }
	</script>
	
	<script type="text/javascript">
		google.charts.load('current', {'packages':['bar']});
	    google.charts.setOnLoadCallback(drawChartSaccharide);
	
	    function drawChartSaccharide() {
	      var data = google.visualization.arrayToDataTable([
	        ['당류', '${standard.age}세 ${gender} 기준 당류 권장량', '나의 섭취량'],
	        ['주간 당류 섭취량(g)', ${standard.saccharide}, ${weekSaccharide}]
	      ]);
	
	      var options = {
	        chart: {
	          title: '주간 당류 비교',
	          subtitle: '${standard.age}세 ${gender} 기준 지방 권장량과 나의 섭취량 비교',
	        }
	      };
	
	      var chart = new google.charts.Bar(document.getElementById('saccharide-chart'));
	
	      chart.draw(data, google.charts.Bar.convertOptions(options));
	    }
	</script>
	
</body>
</html>