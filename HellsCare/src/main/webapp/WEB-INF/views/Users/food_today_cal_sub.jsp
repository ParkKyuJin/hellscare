<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />

	<!-- Stylesheets
	============================================= -->
	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700|Raleway:300,400,500,600,700|Crete+Round:400i" rel="stylesheet" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />

	<!-- Document Title
	============================================= -->
	<title>Charts - Bar Chart Vertical | Canvas</title>

</head>
<body>
	
	<c:if test="${standard.separation =='man'}">
		<c:set var="gender" value="남성" />
	</c:if>
	
	<c:if test="${standard.separation =='woman'}">
		<c:set var="gender" value="여성" />
	</c:if>
	
	<div class="bottommargin divcenter" style="max-width: 750px; min-height: 350px;">
		<div id="columnchart_material" style="width: 100%; height: 100%;"></div>
	</div>
	<!-- Charts Area End -->
	<script>
		google.charts.load('current', {'packages':['bar']});
	    google.charts.setOnLoadCallback(drawChart);
	
	    function drawChart() {
	      var data = google.visualization.arrayToDataTable([
	        ['Times', '${standard.age}세 ${gender} 기준 칼로리 하루 권장량', '나의 섭취량'],
	        ['어제', ${standard.calory}, ${userYesterdayKcal}],
	        ['오늘', ${standard.calory}, ${userTodayKcal}]
	      ]);
	
	      var options = {
	        chart: {
	          title: '칼로리 비교',
	          subtitle: '${standard.age}세 ${gender} 기준 칼로리 하루 권장량과 나의 섭취량 비교',
	        }
	      };
	
	      var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
	
	      chart.draw(data, google.charts.Bar.convertOptions(options));
	    }
	</script>
</body>
</html>