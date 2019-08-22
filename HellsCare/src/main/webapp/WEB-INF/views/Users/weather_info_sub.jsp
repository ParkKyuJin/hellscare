<%@page import="java.util.List"%>
<%@page import="com.pro.hellscare.VO.WeatherVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 정보_sub</title>
<!-- <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> -->
</head>
<body>

	<h2>${weather.city} 날씨</h2>
	
	<ul id="myTab" class="nav nav-tabs boot-tabs">
		<li class="nav-item"><a class="nav-link active" href="#todayWeather" data-toggle="tab">오늘</a></li>
		<li class="nav-item"><a class="nav-link" href="#tomorrowWeather" data-toggle="tab">내일</a></li>
		<li class="nav-item"><a class="nav-link" href="#dayAfterTomorrowWeather" data-toggle="tab">모레</a></li>
	</ul>
	
	<div id="myTabContent" class="tab-content">
		<div class="tab-pane fade show active" id="todayWeather">
			<div class="col_one_fourth">
				<c:if test="${weather.nowWeather == '흐림' }">
					<img src="/hellscare/resources/weather_images/cloudy.jpg">
				</c:if>
				
				<c:if test="${weather.nowWeather == '구름많음' }">
					<img src="/hellscare/resources/weather_images/very_cloudy.jpg">
				</c:if>
				
				<c:if test="${weather.nowWeather == '맑음' }">
					<img src="/hellscare/resources/weather_images/sunny.jpg">
				</c:if>
				
				<c:if test="${weather.nowWeather == '비' }">
					<img src="/hellscare/resources/weather_images/rainy.jpg">
				</c:if>
				
				<c:if test="${weather.nowWeather == '눈' }">
					<img src="/hellscare/resources/weather_images/snowy.jpg">
				</c:if>
				
				<c:if test="${weather.nowWeather == '흐리고 한때 비' }">
					<img src="/hellscare/resources/weather_images/cloudy_and_rainy.jpg">
				</c:if>
			</div>
				
			<div class="col_one_fourth">
				<h5>기온 : ${weather.presentTemp}℃</h5>
				<h5>날씨 : ${weather.presentWeather}</h5>
			
				<h5>
					최저 / 최고
					<br>
					<span style="color:blue;">${weather.minimumTemp}C</span> / 
					<span style="color:red;">${weather.maximumTemp}C</span>
				</h5>
				
				<h5>체감 기온 : ${weather.sensibleTemp}C</h5>
				
				<c:if test="${weather.checkWeather != '자외선'}">
					<h5>시간당 강수량 : <span style="color:#40b8f1;">${weather.rainfallOnHour}mm </span></h5>
				</c:if>
					
				<c:if test="${weather.checkWeather == '자외선'}">
					<!-- 자외선 지수 -->
					<c:set var="ultraVioletCriteria" value="자외선지수" />
					
					<c:if test="${weather.ultraVioletRay <= 2}">
						<c:set var="ultraVioletCriteria" value="좋음" />
						<style> #ultraViolet{color:#0000ff;}</style>
					</c:if>
					
					<c:if test="${weather.ultraVioletRay >= 3 && weather.ultraVioletRay <= 5}">
						<c:set var="ultraVioletCriteria" value="보통" />
						<style> #ultraViolet{color:#00ff00;}</style>
					</c:if>
					
					<c:if test="${weather.ultraVioletRay >= 6 && weather.ultraVioletRay <= 7}">
						<c:set var="ultraVioletCriteria" value="높음" />
						<style> #ultraViolet{color:#ffa500;}</style>
					</c:if>
					
					<c:if test="${weather.ultraVioletRay >= 8 && weather.ultraVioletRay <= 10}">
						<c:set var="ultraVioletCriteria" value="매우 높음" />
						<style> #ultraViolet{color:#ff3300;} </style>
					</c:if>
					
					<c:if test="${weather.ultraVioletRay >= 11}">
						<c:set var="ultraVioletCriteria" value="위험" />
						<style> #ultraViolet{color:#ff0000;}</style>
					</c:if>
					
					<script type="text/javascript">
						$(function() {
							$('#ultraVioletStandard').hover(function() {
								$('#ultraVioletTable').css("display", "block");
							}, function() {
								$('#ultraVioletTable').css("display", "none");
							});
						});
					</script>
					
					<h5>자외선 : 
						<span id="ultraViolet">${weather.ultraVioletRay}ppm ${ultraVioletCriteria}</span>
						<i class="icon-line2-info" id="ultraVioletStandard"></i>
					</h5>
				</c:if>
				
			</div>
			
			<div class="col_one_fourth">
				<!-- 미세먼지 -->
				<c:set var="microdustCriteria" value="미세먼지기준" />
				
				<c:if test="${weather.microdust <= 15}">
					<c:set var="microdustCriteria" value="최고" />
					<style> #microdust{color:blue;} </style>
				</c:if>
				
				<c:if test="${weather.microdust >= 16 && weather.microdust <= 30}">
					<c:set var="microdustCriteria" value="좋음" />
					<style> #microdust{color:#0099ff;} </style>
				</c:if>
				
				<c:if test="${weather.microdust >= 31 && weather.microdust <= 40}">
					<c:set var="microdustCriteria" value="양호" />
					<style> #microdust{color:#00ccff;} </style>
				</c:if>
				
				<c:if test="${weather.microdust >= 41 && weather.microdust <= 50}">
					<c:set var="microdustCriteria" value="보통" />
					<style> #microdust{color:#009900;} </style>
				</c:if>
				
				<c:if test="${weather.microdust >= 51 && weather.microdust <= 75}">
					<c:set var="microdustCriteria" value="나쁨" />
					<style> #microdust{color:#ff9900;} </style>
				</c:if>
				
				<c:if test="${weather.microdust >= 76 && weather.microdust <= 100}">
					<c:set var="microdustCriteria" value="상당히 나쁨" />
					<style> #microdust{color:#ff3300;} </style>
				</c:if>
				
				<c:if test="${weather.microdust >= 101 && weather.microdust <= 150}">
					<c:set var="microdustCriteria" value="매우 나쁨" />
					<style> #microdust{color:#ff0000;} </style>
				</c:if>
				
				<c:if test="${weather.microdust >= 151}">
					<c:set var="microdustCriteria" value="최악" />
					<style> #microdust{color:#000000;} </style>
				</c:if>
				
				<script type="text/javascript">
					$(function() {
						$('#microdustStandard').hover(function() {
							$('#microdustTable').css("display", "block");
						}, function() {
							$('#microdustTable').css("display", "none");
						});
					});
				</script>
				
				<h5>미세먼지 : 
					<span id="microdust">${weather.microdust}㎍/㎥  ${microdustCriteria}</span>
					<i class="icon-line2-info" id="microdustStandard"></i>
				</h5>
				
				<!-- 초미세먼지 -->
				<c:set var="superMicrodustCriteria" value="미세먼지기준" />
				
				<c:if test="${weather.superMicrodust <= 8}">
					<c:set var="superMicrodustCriteria" value="최고" />
					<style> #superMicrodust{color:blue;} </style>
				</c:if>
				
				<c:if test="${weather.superMicrodust >= 9 && weather.superMicrodust <= 15}">
					<c:set var="superMicrodustCriteria" value="좋음" />
					<style> #superMicrodust{color:#0099ff;} </style>
				</c:if>
				
				<c:if test="${weather.superMicrodust >= 16 && weather.superMicrodust <= 20}">
					<c:set var="superMicrodustCriteria" value="양호" />
					<style> #superMicrodust{color:#00ccff;} </style>
				</c:if>
				
				<c:if test="${weather.superMicrodust >= 21 && weather.superMicrodust <= 25}">
					<c:set var="superMicrodustCriteria" value="보통" />
					<style> #superMicrodust{color:#009900;} </style>
				</c:if>
				
				<c:if test="${weather.superMicrodust >= 26 && weather.superMicrodust <= 37}">
					<c:set var="superMicrodustCriteria" value="나쁨" />
					<style> #superMicrodust{color:#ff9900;} </style>
				</c:if>
				
				<c:if test="${weather.superMicrodust >= 38 && weather.superMicrodust <= 50}">
					<c:set var="superMicrodustCriteria" value="상당히 나쁨" />
					<style> #superMicrodust{color:#ff3300;} </style>
				</c:if>
				
				<c:if test="${weather.superMicrodust >= 51 && weather.superMicrodust <= 75}">
					<c:set var="superMicrodustCriteria" value="매우 나쁨" />
					<style> #superMicrodust{color:#ff0000;} </style>
				</c:if>
				
				<c:if test="${weather.superMicrodust >= 76}">
					<c:set var="superMicrodustCriteria" value="최악" />
					<style> #superMicrodust{color:#000000;} </style>
				</c:if>
				
				<script type="text/javascript">
					$(function() {
						$('#superMicrodustStandard').hover(function() {
							$('#superMicrodustTable').css("display", "block");
						}, function() {
							$('#superMicrodustTable').css("display", "none");
						});
					});
				</script>
				
				<h5>초미세먼지 : 
					<span id="superMicrodust">${weather.superMicrodust}㎍/㎥  ${superMicrodustCriteria}</span>
					<i class="icon-line2-info" id="superMicrodustStandard"></i>
				</h5>
				
				<!-- 오존 -->
				<c:set var="ozonCriteria" value="오존 기준" />
				
				<c:if test="${weather.ozon < 0.01}">
					<c:set var="ozonCriteria" value="최고" />
					<style> #ozon{color:blue;} </style>
				</c:if>
				
				<c:if test="${weather.ozon >= 0.01 && weather.ozon < 0.03}">
					<c:set var="ozonCriteria" value="좋음" />
					<style> #ozon{color:#0099ff;} </style>
				</c:if>
				
				<c:if test="${weather.ozon >= 0.03 && weather.ozon < 0.05}">
					<c:set var="ozonCriteria" value="양호" />
					<style> #ozon{color:#00ccff;} </style>
				</c:if>
				
				<c:if test="${weather.ozon >= 0.05 && weather.ozon < 0.09}">
					<c:set var="ozonCriteria" value="보통" />
					<style> #ozon{color:#009900;} </style>
				</c:if>
				
				<c:if test="${weather.ozon >= 0.09 && weather.ozon < 0.12}">
					<c:set var="ozonCriteria" value="나쁨" />
					<style> #ozon{color:#ff9900;} </style>
				</c:if>
				
				<c:if test="${weather.ozon >= 0.12 && weather.ozon < 0.15}">
					<c:set var="ozonCriteria" value="상당히 나쁨" />
					<style> #ozon{color:#ff3300;} </style>
				</c:if>
				
				<c:if test="${weather.ozon >= 0.15 && weather.ozon < 0.38}">
					<c:set var="ozonCriteria" value="매우 나쁨" />
					<style> #ozon{color:#ff0000;} </style>
				</c:if>
				
				<c:if test="${weather.ozon >= 0.38}">
					<c:set var="ozonCriteria" value="최악" />
					<style> #ozon{color:#000000;} </style>
				</c:if>
				
				<script type="text/javascript">
					$(function() {
						$('#ozonStandard').hover(function() {
							$('#ozonTable').css("display", "block");
						}, function() {
							$('#ozonTable').css("display", "none");
						});
					});
				</script>
				
				<h5>오존 : 
					<span id="ozon">${weather.ozon}ppm  ${ozonCriteria}</span>
					<i class="icon-line2-info" id="ozonStandard"></i>
				</h5>
				
			</div>
			
			<div class="col_one_fourth col_last">
				<table align="center" style="display : none;" id="ultraVioletTable">
					<tr>
						<th colspan="2">자외선 지수</th>
					</tr>
					
					<tr style="color:blue;">
						<td>좋음</td>
						<td>0 ~ 2 ppm</td>
					</tr>
					
					<tr style="color:green;">
						<td>보통</td>
						<td>3 ~ 5 ppm</td>
					</tr>
					
					<tr style="color: #ffa500;">
						<td>높음</td>
						<td>6 ~ 7 ppm</td>
					</tr>
					
					<tr style="color: #ff3300;">
						<td>매우 높음</td>
						<td>8 ~ 10 ppm</td>
					</tr>
					
					<tr style="color: red;">
						<td>위험</td>
						<td>11 ~ ppm</td>
					</tr>
				</table>
			
				<table align="center" id="microdustTable" style="display:none;">
					<tr>
						<th colspan="2">미세먼지 지수표</th>
					</tr>
					
					<tr style="color:blue;">
						<td>최고</td>
						<td>0~15㎍/㎥</td>
					</tr>
					
					<tr style="color:#0099ff;">
						<td>좋음</td>
						<td>16~30㎍/㎥</td>
					</tr>
					
					<tr style="color:#00ccff;">
						<td>양호</td>
						<td>31~40㎍/㎥</td>
					</tr>
					
					<tr style="color:#009900;">
						<td>보통</td>
						<td>41~50㎍/㎥</td>
					</tr>
					
					<tr style="color:#ff9900;">
						<td>나쁨</td>
						<td>51~75㎍/㎥</td>
					</tr>
					
					<tr style="color:#ff3300;">
						<td>상당히 나쁨</td>
						<td>75~100㎍/㎥</td>
					</tr>
					
					<tr style="color:#ff0000;">
						<td>매우 나쁨</td>
						<td>101~150㎍/㎥</td>
					</tr>
					
					<tr style="color:#000000;">
						<td>최악</td>
						<td>150~ ㎍/㎥</td>
					</tr>
				</table>
				
				<table align="center" id="superMicrodustTable" style="display:none;">
					<tr>
						<th colspan="2">초미세먼지 지수표</th>
					</tr>
					
					<tr style="color:blue;">
						<td>최고</td>
						<td>0~8㎍/㎥</td>
					</tr>
					
					<tr style="color:#0099ff;">
						<td>좋음</td>
						<td>9~15㎍/㎥</td>
					</tr>
					
					<tr style="color:#00ccff;">
						<td>양호</td>
						<td>16~20㎍/㎥</td>
					</tr>
					
					<tr style="color:#009900;">
						<td>보통</td>
						<td>21~25㎍/㎥</td>
					</tr>
					
					<tr style="color:#ff9900;">
						<td>나쁨</td>
						<td>26~37㎍/㎥</td>
					</tr>
					
					<tr style="color:#ff3300;">
						<td>상당히 나쁨</td>
						<td>38~50㎍/㎥</td>
					</tr>
					
					<tr style="color:#ff0000;">
						<td>매우 나쁨</td>
						<td>51~75㎍/㎥</td>
					</tr>
					
					<tr style="color:#000000;">
						<td>최악</td>
						<td>76~ ㎍/㎥</td>
					</tr>
				</table>
				
				<table align="center" id="ozonTable" style="display:none;">
					<tr>
						<th colspan="2">오존 지수표</th>
					</tr>
					
					<tr style="color:blue;">
						<td>최고</td>
						<td>0~0.01ppm</td>
					</tr>
					
					<tr style="color:#0099ff;">
						<td>좋음</td>
						<td>0.01~0.03ppm</td>
					</tr>
					
					<tr style="color:#00ccff;">
						<td>양호</td>
						<td>0.03~0.05ppm</td>
					</tr>
					
					<tr style="color:#009900;">
						<td>보통</td>
						<td>0.05~0.09ppm</td>
					</tr>
					
					<tr style="color:#ff9900;">
						<td>나쁨</td>
						<td>0.09~0.12ppm</td>
					</tr>
					
					<tr style="color:#ff3300;">
						<td>상당히 나쁨</td>
						<td>0.12~0.15ppm</td>
					</tr>
					
					<tr style="color:#ff0000;">
						<td>매우 나쁨</td>
						<td>0.15~0.38ppm</td>
					</tr>
					
					<tr style="color:#000000;">
						<td>최악</td>
						<td>0.38~ ㎍/㎥</td>
					</tr>
				</table>
			</div>
			
			<!-- 시간대별 날씨 탭으로 -->
			<div class="col_three_fourth">
				<h4>시간대별 날씨</h4>
				
				<script type="text/javascript">
					google.charts.load('current', {packages: ['corechart', 'line']});
					google.charts.setOnLoadCallback(drawTodayTemperatureChart);
					google.charts.setOnLoadCallback(drawTodayPrecipitationChart);
					google.charts.setOnLoadCallback(drawTodayHumidityChart);
				
					// 오늘 시간대의 기온 차트
					function drawTodayTemperatureChart() {
						var data = new google.visualization.DataTable();
						data.addColumn('number', 'X');
						data.addColumn('number', '기온');
				
						data.addRows([
					        [${weather.todayTimes.get(0)}, ${weather.todayTemperature.get(0)}],
					        [${weather.todayTimes.get(1)}, ${weather.todayTemperature.get(1)}],
					        [${weather.todayTimes.get(2)}, ${weather.todayTemperature.get(2)}],
					        [${weather.todayTimes.get(3)}, ${weather.todayTemperature.get(3)}],
					        [${weather.todayTimes.get(4)}, ${weather.todayTemperature.get(4)}],
					        [${weather.todayTimes.get(5)}, ${weather.todayTemperature.get(5)}],
					        [${weather.todayTimes.get(6)}, ${weather.todayTemperature.get(6)}],
					        [${weather.todayTimes.get(7)}, ${weather.todayTemperature.get(7)}] 
						]);
				
						var options = {
							hAxis: {
								title: '시간'
							},
							vAxis: {
								title: '기온'
							},
							width : 750,
							height : 400,
							backgroundColor: '#f1f8e9'
						};
				
						var todayTempChart = new google.visualization.LineChart(document.getElementById('todayTemp_div'));
						todayTempChart.draw(data, options);
					}
					
					function drawTodayPrecipitationChart() {
						var data = new google.visualization.DataTable();
						data.addColumn('number', 'X');
						data.addColumn('number', '강수확률');
				
						data.addRows([
					        [${weather.todayTimes.get(8)}, ${weather.todayPrecipitation.get(0)}],
					        [${weather.todayTimes.get(9)}, ${weather.todayPrecipitation.get(1)}],
					        [${weather.todayTimes.get(10)}, ${weather.todayPrecipitation.get(2)}],
					        [${weather.todayTimes.get(11)}, ${weather.todayPrecipitation.get(3)}],
					        [${weather.todayTimes.get(12)}, ${weather.todayPrecipitation.get(4)}],
					        [${weather.todayTimes.get(13)}, ${weather.todayPrecipitation.get(5)}],
					        [${weather.todayTimes.get(14)}, ${weather.todayPrecipitation.get(6)}],
					        [${weather.todayTimes.get(15)}, ${weather.todayPrecipitation.get(7)}]
						]);
				
						var options = {
							hAxis: {
								title: '시간'
							},
							vAxis: {
								title: '강수확률'
							},
							width : 750,
							height : 400,
							backgroundColor: '#f1f8e9'
						};
				
						var todayPrecipitationChart = new google.visualization.LineChart(document.getElementById('todayPrecipitation_div'));
						todayPrecipitationChart.draw(data, options);
					}
					
					function drawTodayHumidityChart() {
						var data = new google.visualization.DataTable();
						data.addColumn('number', 'X');
						data.addColumn('number', '습도');
				
						data.addRows([
					        [${weather.todayTimes.get(24)}, ${weather.todayHumidity.get(0)}],
					        [${weather.todayTimes.get(25)}, ${weather.todayHumidity.get(1)}],
					        [${weather.todayTimes.get(26)}, ${weather.todayHumidity.get(2)}],
					        [${weather.todayTimes.get(27)}, ${weather.todayHumidity.get(3)}],
					        [${weather.todayTimes.get(28)}, ${weather.todayHumidity.get(4)}],
					        [${weather.todayTimes.get(29)}, ${weather.todayHumidity.get(5)}],
					        [${weather.todayTimes.get(30)}, ${weather.todayHumidity.get(6)}],
					        [${weather.todayTimes.get(31)}, ${weather.todayHumidity.get(7)}]
						]);
				
						var options = {
							hAxis: {
								title: '시간'
							},
							vAxis: {
								title: '습도'
							},
							width : 750,
							height : 400,
							backgroundColor: '#f1f8e9'
						};
				
						var todayHumidityChart = new google.visualization.LineChart(document.getElementById('todayHumidity_div'));
						todayHumidityChart.draw(data, options);
					}
				</script>
				
				<script type="text/javascript">
					$(function() {
						$('input[name=todayChart]').click(function(){
							console.log($(this).val());
							//차트 도표 div class = 'aa' 다숨겨
							//$(".aa").hide();
							//차트 도표 각 id를 보이게해라
							//
							$(".todayChart").hide();
							
							var chartId = $(this).val();
							
							$('#'+chartId).show();
						});
					});
				</script>
				
				
				<table>
					<tr>
						<td>
							<input type="radio" name="todayChart" value="todayTemp_div"  checked> 날씨 &nbsp;
							<input type="radio" name="todayChart" value="todayPrecipitation_div"> 강수 &nbsp;
							<input type="radio" name="todayChart" value="todayHumidity_div" > 습도
						</td>
					</tr>
					<tr>
						<td>
							<div id="todayTemp_div" class="todayChart"></div>
							
							<div id="todayPrecipitation_div" class="todayChart" style="display:none;"></div>
							
							<div id="todayHumidity_div" class="todayChart" style="display:none;"></div>
						</td>
					</tr>
				</table>
				
			</div>
			
			<div class="col_one_fourth col_last">
				<h4>운동 추천</h4>
				<br>
				<c:if test="${weather.nowWeather == '맑음' && weather.microdust <= 50 
							&& weather.superMicrodust <= 25 && weather.ozon <= 0.09 
							&& weather.ultraVioletRay <= 5}">
					<h5>야외활동하기 좋습니다. <br> 야외운동을 적극 추천합니다!</h5>
				</c:if>
				
				<c:if test="${weather.nowWeather != '맑음' || weather.microdust > 50 
							|| weather.superMicrodust > 25 || weather.ozon > 0.09 
							|| weather.ultraVioletRay > 5}">
					<h5>야외활동하기에 좋지 않습니다. <br> 실내운동을 권장합니다. </h5>
				</c:if>
			</div>
			
		</div>
	  
		<div class="tab-pane fade" id="tomorrowWeather">
		
			<div class="col_half">
				
				<center><h3>오전</h3></center>
				
				<table>
					<tr>
						<td>
							<c:if test="${weather.tomorrowAMWeather == '흐림' }">
								<img style="max-width : 80%;" src="/hellscare/resources/weather_images/cloudy.jpg">
							</c:if>
							
							<c:if test="${weather.tomorrowAMWeather == '구름많음' }">
								<img style="max-width : 80%;" src="/hellscare/resources/weather_images/very_cloudy.jpg">
							</c:if>
							
							<c:if test="${weather.tomorrowAMWeather == '맑음' }">
								<img style="max-width : 80%;" src="/hellscare/resources/weather_images/sunny.jpg">
							</c:if>
							
							<c:if test="${weather.tomorrowAMWeather == '비' }">
								<img style="max-width : 80%;" src="/hellscare/resources/weather_images/rainy.jpg">
							</c:if>
							
							<c:if test="${weather.tomorrowAMWeather == '눈' }">
								<img style="max-width : 80%;" src="/hellscare/resources/weather_images/snowy.jpg">
							</c:if>
							
							<c:if test="${weather.tomorrowAMWeather == '흐리고 한때 비' }">
								<img style="max-width : 80%;" src="/hellscare/resources/weather_images/cloudy_and_rainy.jpg">
							</c:if>
						</td>
					
						<td>
							<h1>${weather.tomorrowAMTemp}℃</h1>
						</td>
					</tr>
					
					<tr>
						<td colspan="2">
							<c:if test="${weather.tomorrowAMMicrodust} == '좋음'">
								<style> #tomorrowAMDust { color : blue; } </style>
							</c:if>
							
							<c:if test="${weather.tomorrowAMMicrodust} == '보통'">
								<style> #tomorrowAMDust { color : green; } </style>
							</c:if>
							
							<c:if test="${weather.tomorrowAMMicrodust} == '나쁨'">
								<style> #tomorrowAMDust { color : orange; } </style>
							</c:if>
							
							<center>
								<h4>날씨 : ${weather.tomorrowAMWeather}</h4>
								<h4>미세먼지 : <span id="tomorrowAMDust">${weather.tomorrowAMMicrodust}</span> </h4>
							</center>
						</td>
					</tr>
				</table>
			</div>
			
			<div class="col_half col_last">
			
				<center><h3>오후</h3></center>
				
				<table>
					<tr>
						<td>
							<c:if test="${weather.tomorrowPMWeather == '흐림' }">
								<img style="max-width : 80%;" src="/hellscare/resources/weather_images/cloudy.jpg">
							</c:if>
							
							<c:if test="${weather.tomorrowPMWeather == '구름많음' }">
								<img style="max-width : 80%;" src="/hellscare/resources/weather_images/very_cloudy.jpg">
							</c:if>
							
							<c:if test="${weather.tomorrowPMWeather == '맑음' }">
								<img style="max-width : 80%;" src="/hellscare/resources/weather_images/sunny.jpg">
							</c:if>
							
							<c:if test="${weather.tomorrowPMWeather == '비' }">
								<img style="max-width : 80%;" src="/hellscare/resources/weather_images/rainy.jpg">
							</c:if>
							
							<c:if test="${weather.tomorrowPMWeather == '눈' }">
								<img style="max-width : 80%;" src="/hellscare/resources/weather_images/snowy.jpg">
							</c:if>
							
							<c:if test="${weather.tomorrowPMWeather == '흐리고 한때 비' }">
								<img style="max-width : 80%;" src="/hellscare/resources/weather_images/cloudy_and_rainy.jpg">
							</c:if>
						</td>
						
						<td>
							<h1>${weather.tomorrowPMTemp}℃</h1>
						</td>
					</tr>
					
					<tr>
						<td colspan="2">
							<c:if test="${weather.tomorrowPMMicrodust} == '좋음'">
								<style> #tomorrowPMDust { color : blue; } </style>
							</c:if>
							
							<c:if test="${weather.tomorrowPMMicrodust} == '보통'">
								<style> #tomorrowPMDust { color : green; } </style>
							</c:if>
							
							<c:if test="${weather.tomorrowPMMicrodust} == '나쁨'">
								<style> #tomorrowPMDust { color : orange; } </style>
							</c:if>
							
							<center>
								<h4>날씨 : ${weather.tomorrowPMWeather}</h4>
								<h4>미세먼지 : <span id="tomorrowPMDust">${weather.tomorrowPMMicrodust}</span> </h4>
							</center>
						</td>
					</tr>
				</table>
			</div>
			
			<!-- 시간대별 날씨 탭으로 -->
			<div class="col_full">
				<h4>시간대별 날씨</h4>
				
				<script type="text/javascript">
					google.charts.load('current', {packages: ['corechart', 'line']});
					google.charts.setOnLoadCallback(drawTomorrowTemperatureChart);
					google.charts.setOnLoadCallback(drawTomorrowPrecipitationChart);
					google.charts.setOnLoadCallback(drawTomorrowHumidityChart);
				
					// 내일 시간대의 기온 차트
					function drawTomorrowTemperatureChart() {
						var data = new google.visualization.DataTable();
						data.addColumn('number', 'X');
						data.addColumn('number', '기온');
				
						data.addRows([
					        [${weather.tomorrowTimes.get(0)}, ${weather.tomorrowTemperature.get(0)}],
					        [${weather.tomorrowTimes.get(1)}, ${weather.tomorrowTemperature.get(1)}],
					        [${weather.tomorrowTimes.get(2)}, ${weather.tomorrowTemperature.get(2)}],
					        [${weather.tomorrowTimes.get(3)}, ${weather.tomorrowTemperature.get(3)}],
					        [${weather.tomorrowTimes.get(4)}, ${weather.tomorrowTemperature.get(4)}],
					        [${weather.tomorrowTimes.get(5)}, ${weather.tomorrowTemperature.get(5)}],
					        [${weather.tomorrowTimes.get(6)}, ${weather.tomorrowTemperature.get(6)}],
					        [${weather.tomorrowTimes.get(7)}, ${weather.tomorrowTemperature.get(7)}] 
						]);
				
						var options = {
							hAxis: {
								title: '시간'
							},
							vAxis: {
								title: '기온'
							},
							width : 750,
							height : 400,
							backgroundColor: '#f1f8e9'
						};
				
						var tomorrowTempChart = new google.visualization.LineChart(document.getElementById('tomorrowTemp_div'));
						tomorrowTempChart.draw(data, options);
					}
					
					function drawTomorrowPrecipitationChart() {
						var data = new google.visualization.DataTable();
						data.addColumn('number', 'X');
						data.addColumn('number', '강수확률');
				
						data.addRows([
					        [${weather.tomorrowTimes.get(8)}, ${weather.tomorrowPrecipitation.get(0)}],
					        [${weather.tomorrowTimes.get(9)}, ${weather.tomorrowPrecipitation.get(1)}],
					        [${weather.tomorrowTimes.get(10)}, ${weather.tomorrowPrecipitation.get(2)}],
					        [${weather.tomorrowTimes.get(11)}, ${weather.tomorrowPrecipitation.get(3)}],
					        [${weather.tomorrowTimes.get(12)}, ${weather.tomorrowPrecipitation.get(4)}],
					        [${weather.tomorrowTimes.get(13)}, ${weather.tomorrowPrecipitation.get(5)}],
					        [${weather.tomorrowTimes.get(14)}, ${weather.tomorrowPrecipitation.get(6)}],
					        [${weather.tomorrowTimes.get(15)}, ${weather.tomorrowPrecipitation.get(7)}]
						]);
				
						var options = {
							hAxis: {
								title: '시간'
							},
							vAxis: {
								title: '강수확률'
							},
							width : 750,
							height : 400,
							backgroundColor: '#f1f8e9'
						};
				
						var tomorrowPrecipitationChart = new google.visualization.LineChart(document.getElementById('tomorrowPrecipitation_div'));
						tomorrowPrecipitationChart.draw(data, options);
					}
					
					function drawTomorrowHumidityChart() {
						var data = new google.visualization.DataTable();
						data.addColumn('number', 'X');
						data.addColumn('number', '습도');
				
						data.addRows([
					        [${weather.tomorrowTimes.get(24)}, ${weather.tomorrowHumidity.get(0)}],
					        [${weather.tomorrowTimes.get(25)}, ${weather.tomorrowHumidity.get(1)}],
					        [${weather.tomorrowTimes.get(26)}, ${weather.tomorrowHumidity.get(2)}],
					        [${weather.tomorrowTimes.get(27)}, ${weather.tomorrowHumidity.get(3)}],
					        [${weather.tomorrowTimes.get(28)}, ${weather.tomorrowHumidity.get(4)}],
					        [${weather.tomorrowTimes.get(29)}, ${weather.tomorrowHumidity.get(5)}],
					        [${weather.tomorrowTimes.get(30)}, ${weather.tomorrowHumidity.get(6)}],
					        [${weather.tomorrowTimes.get(31)}, ${weather.tomorrowHumidity.get(7)}]
						]);
				
						var options = {
							hAxis: {
								title: '시간'
							},
							vAxis: {
								title: '습도'
							},
							width : 750,
							height : 400,
							backgroundColor: '#f1f8e9'
						};
				
						var tomorrowHumidityChart = new google.visualization.LineChart(document.getElementById('tomorrowHumidity_div'));
						tomorrowHumidityChart.draw(data, options);
					}
				</script>
				
				<script type="text/javascript">
					$(function() {
						$('input[name=tomorrowChart]').click(function(){
							console.log($(this).val());
							//차트 도표 div class = 'aa' 다숨겨
							//$(".aa").hide();
							//차트 도표 각 id를 보이게해라
							//
							$(".tomorrowChart").hide();
							
							var chartId = $(this).val();
							
							$('#'+chartId).show();
						});
					});
				</script>
				
				
				<table>
					<tr>
						<td>
							<input type="radio" name="tomorrowChart" value="tomorrowTemp_div"  checked> 날씨 &nbsp;
							<input type="radio" name="tomorrowChart" value="tomorrowPrecipitation_div"> 강수 &nbsp;
							<input type="radio" name="tomorrowChart" value="tomorrowHumidity_div" > 습도
						</td>
					</tr>
					<tr>
						<td>
							<div id="tomorrowTemp_div" class="tomorrowChart"></div>
							
							<div id="tomorrowPrecipitation_div" class="tomorrowChart" style="display:none;"></div>
							
							<div id="tomorrowHumidity_div" class="tomorrowChart" style="display:none;"></div>
						</td>
					</tr>
				</table>
				
			</div>
		</div>
	  
		<div class="tab-pane fade" id="dayAfterTomorrowWeather">
		
			<div class="col_half">
				
				<center><h3>오전</h3></center>
				
				<table>
					<tr>
						<td>
							<c:if test="${weather.theDayAfterTomorrowAMWeather == '흐림' }">
								<img style="max-width : 80%;" src="/hellscare/resources/weather_images/cloudy.jpg">
							</c:if>
							
							<c:if test="${weather.theDayAfterTomorrowAMWeather == '구름많음' }">
								<img style="max-width : 80%;" src="/hellscare/resources/weather_images/very_cloudy.jpg">
							</c:if>
							
							<c:if test="${weather.theDayAfterTomorrowAMWeather == '맑음' }">
								<img style="max-width : 80%;" src="/hellscare/resources/weather_images/sunny.jpg">
							</c:if>
							
							<c:if test="${weather.theDayAfterTomorrowAMWeather == '비' }">
								<img style="max-width : 80%;" src="/hellscare/resources/weather_images/rainy.jpg">
							</c:if>
							
							<c:if test="${weather.theDayAfterTomorrowAMWeather == '눈' }">
								<img style="max-width : 80%;" src="/hellscare/resources/weather_images/snowy.jpg">
							</c:if>
							
							<c:if test="${weather.theDayAfterTomorrowAMWeather == '흐리고 한때 비' }">
								<img style="max-width : 80%;" src="/hellscare/resources/weather_images/cloudy_and_rainy.jpg">
							</c:if>
						</td>
						
						<td>
							<h1>${weather.theDayAfterTomorrowAMTemp}℃</h1>
						</td>
					</tr>
					
					<tr>
						<td colspan="2">
							<c:if test="${weather.dayAfterTomorrowAMMicrodust} == '좋음'">
								<style> #theDayAfterTomorrowAMDust { color : blue; } </style>
							</c:if>
							
							<c:if test="${weather.dayAfterTomorrowAMMicrodust} == '보통'">
								<style> #theDayAfterTomorrowAMDust { color : green; } </style>
							</c:if>
							
							<c:if test="${weather.dayAfterTomorrowAMMicrodust} == '나쁨'">
								<style> #theDayAfterTomorrowAMDust { color : orange; } </style>
							</c:if>
							
							<center>
								<h4>날씨 : ${weather.theDayAfterTomorrowAMWeather}</h4>
								<h4>미세먼지 : <span id="theDayAfterTomorrowAMDust">${weather.dayAfterTomorrowAMMicrodust}</span> </h4>
							</center>
						</td>
					</tr>
				</table>
			</div>
			
			<div class="col_half col_last">
			
				<center><h3>오후</h3></center>
				
				<table>
					<tr>
						<td>
							<c:if test="${weather.theDayAfterTomorrowPMWeather == '흐림' }">
								<img style="max-width : 80%;"  src="/hellscare/resources/weather_images/cloudy.jpg">
							</c:if>
							
							<c:if test="${weather.theDayAfterTomorrowPMWeather == '구름많음' }">
								<img style="max-width : 80%;" src="/hellscare/resources/weather_images/very_cloudy.jpg">
							</c:if>
							
							<c:if test="${weather.theDayAfterTomorrowPMWeather == '맑음' }">
								<img style="max-width : 80%;" src="/hellscare/resources/weather_images/sunny.jpg">
							</c:if>
							
							<c:if test="${weather.theDayAfterTomorrowPMWeather == '비' }">
								<img style="max-width : 80%;" src="/hellscare/resources/weather_images/rainy.jpg">
							</c:if>
							
							<c:if test="${weather.theDayAfterTomorrowPMWeather == '눈' }">
								<img style="max-width : 80%;" src="/hellscare/resources/weather_images/snowy.jpg">
							</c:if>
							
							<c:if test="${weather.theDayAfterTomorrowPMWeather == '흐리고 한때 비' }">
								<img style="max-width : 80%;" src="/hellscare/resources/weather_images/cloudy_and_rainy.jpg">
							</c:if>
						</td>
						<td>
							<h1>${weather.theDayAfterTomorrowPMTemp}℃</h1>
						</td>
					</tr>
					
					<tr>
						<td colspan="2">
							<c:if test="${weather.dayAfterTomorrowPMMicrodust} == '좋음'">
								<style> #theDayAfterTomorrowPMDust { color : blue; } </style>
							</c:if>
							
							<c:if test="${weather.dayAfterTomorrowPMMicrodust} == '보통'">
								<style> #theDayAfterTomorrowPMDust { color : green; } </style>
							</c:if>
							
							<c:if test="${weather.dayAfterTomorrowPMMicrodust} == '나쁨'">
								<style> #theDayAfterTomorrowPMDust { color : orange; } </style>
							</c:if>
							
							<center>
								<h4>날씨 : ${weather.theDayAfterTomorrowPMWeather}</h4>
								<h4>미세먼지 : <span id="theDayAfterTomorrowPMDust">${weather.dayAfterTomorrowPMMicrodust}</span> </h4>
							</center>
						</td>
					</tr>
				</table>
			</div>
			
			<!-- 시간대별 날씨 탭으로 -->
			<div class="col_full">
				<h4>시간대별 날씨</h4>
				
				<script type="text/javascript">
					google.charts.load('current', {packages: ['corechart', 'line']});
					google.charts.setOnLoadCallback(drawTheDayAfterTomorrowTemperatureChart);
					google.charts.setOnLoadCallback(drawTheDayAfterTomorrowPrecipitationChart);
					google.charts.setOnLoadCallback(drawTheDayAfterTomorrowHumidityChart);
				
					// 오늘 시간대의 기온 차트
					function drawTheDayAfterTomorrowTemperatureChart() {
						var data = new google.visualization.DataTable();
						data.addColumn('number', 'X');
						data.addColumn('number', '기온');
				
						data.addRows([
					        [${weather.dayAfterTomorrowTimes.get(0)}, ${weather.dayAfterTomorrowTemperature.get(0)}],
					        [${weather.dayAfterTomorrowTimes.get(1)}, ${weather.dayAfterTomorrowTemperature.get(1)}],
					        [${weather.dayAfterTomorrowTimes.get(2)}, ${weather.dayAfterTomorrowTemperature.get(2)}],
					        [${weather.dayAfterTomorrowTimes.get(3)}, ${weather.dayAfterTomorrowTemperature.get(3)}],
					        [${weather.dayAfterTomorrowTimes.get(4)}, ${weather.dayAfterTomorrowTemperature.get(4)}],
					        [${weather.dayAfterTomorrowTimes.get(5)}, ${weather.dayAfterTomorrowTemperature.get(5)}],
					        [${weather.dayAfterTomorrowTimes.get(6)}, ${weather.dayAfterTomorrowTemperature.get(6)}],
					        [${weather.dayAfterTomorrowTimes.get(7)}, ${weather.dayAfterTomorrowTemperature.get(7)}] 
						]);
				
						var options = {
							hAxis: {
								title: '시간'
							},
							vAxis: {
								title: '기온'
							},
							width : 750,
							height : 400,
							backgroundColor: '#f1f8e9'
						};
				
						var dayAfterTomorrowTempChart = new google.visualization.LineChart(document.getElementById('dayAfterTomorrowTemp_div'));
						dayAfterTomorrowTempChart.draw(data, options);
					}
					
					function drawTheDayAfterTomorrowPrecipitationChart() {
						var data = new google.visualization.DataTable();
						data.addColumn('number', 'X');
						data.addColumn('number', '강수확률');
				
						data.addRows([
					        [${weather.dayAfterTomorrowTimes.get(8)}, ${weather.todayPrecipitation.get(0)}],
					        [${weather.dayAfterTomorrowTimes.get(9)}, ${weather.todayPrecipitation.get(1)}],
					        [${weather.dayAfterTomorrowTimes.get(10)}, ${weather.todayPrecipitation.get(2)}],
					        [${weather.dayAfterTomorrowTimes.get(11)}, ${weather.todayPrecipitation.get(3)}],
					        [${weather.dayAfterTomorrowTimes.get(12)}, ${weather.todayPrecipitation.get(4)}],
					        [${weather.dayAfterTomorrowTimes.get(13)}, ${weather.todayPrecipitation.get(5)}],
					        [${weather.dayAfterTomorrowTimes.get(14)}, ${weather.todayPrecipitation.get(6)}],
					        [${weather.dayAfterTomorrowTimes.get(15)}, ${weather.todayPrecipitation.get(7)}]
						]);
				
						var options = {
							hAxis: {
								title: '시간'
							},
							vAxis: {
								title: '강수확률'
							},
							width : 750,
							height : 400,
							backgroundColor: '#f1f8e9'
						};
				
						var dayAfterTomorrowTempChart = new google.visualization.LineChart(document.getElementById('dayAfterTomorrowPrecipitation_div'));
						dayAfterTomorrowTempChart.draw(data, options);
					}
					
					function drawTheDayAfterTomorrowHumidityChart() {
						var data = new google.visualization.DataTable();
						data.addColumn('number', 'X');
						data.addColumn('number', '습도');
				
						data.addRows([
					        [${weather.dayAfterTomorrowTimes.get(24)}, ${weather.dayAfterTomorrowHumidity.get(0)}],
					        [${weather.dayAfterTomorrowTimes.get(25)}, ${weather.dayAfterTomorrowHumidity.get(1)}],
					        [${weather.dayAfterTomorrowTimes.get(26)}, ${weather.dayAfterTomorrowHumidity.get(2)}],
					        [${weather.dayAfterTomorrowTimes.get(27)}, ${weather.dayAfterTomorrowHumidity.get(3)}],
					        [${weather.dayAfterTomorrowTimes.get(28)}, ${weather.dayAfterTomorrowHumidity.get(4)}],
					        [${weather.dayAfterTomorrowTimes.get(29)}, ${weather.dayAfterTomorrowHumidity.get(5)}],
					        [${weather.dayAfterTomorrowTimes.get(30)}, ${weather.dayAfterTomorrowHumidity.get(6)}],
					        [${weather.dayAfterTomorrowTimes.get(31)}, ${weather.dayAfterTomorrowHumidity.get(7)}]
						]);
				
						var options = {
							hAxis: {
								title: '시간'
							},
							vAxis: {
								title: '습도'
							},
							width : 750,
							height : 400,
							backgroundColor: '#f1f8e9'
						};
				
						var dayAfterTomorrowTempChart = new google.visualization.LineChart(document.getElementById('dayAfterTomorrowHumidity_div'));
						dayAfterTomorrowTempChart.draw(data, options);
					}
				</script>
				
				<script type="text/javascript">
					$(function() {
						$('input[name=dayAfterTomorrowChart]').click(function(){
							console.log($(this).val());
							//차트 도표 div class = 'aa' 다숨겨
							//$(".aa").hide();
							//차트 도표 각 id를 보이게해라
							//
							$(".dayAfterTomorrow").hide();
							
							var chartId = $(this).val();
							
							$('#'+chartId).show();
						});
					});
				</script>
				
				
				<table>
					<tr>
						<td>
							<input type="radio" name="dayAfterTomorrowChart" value="dayAfterTomorrowTemp_div"  checked> 날씨 &nbsp;
							<input type="radio" name="dayAfterTomorrowChart" value="dayAfterTomorrowPrecipitation_div"> 강수 &nbsp;
							<input type="radio" name="dayAfterTomorrowChart" value="dayAfterTomorrowHumidity_div" > 습도
						</td>
					</tr>
					<tr>
						<td>
							<div id="dayAfterTomorrowTemp_div" class="dayAfterTomorrow"></div>
							
							<div id="dayAfterTomorrowPrecipitation_div" class="dayAfterTomorrow" style="display:none;"></div>
							
							<div id="dayAfterTomorrowHumidity_div" class="dayAfterTomorrow" style="display:none;"></div>
						</td>
					</tr>
				</table>
				
			</div>
			
		</div>
	</div>
</body>
</html>