<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
	
<meta charset="UTF-8">
<title>날씨 정보</title>
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
				<h1>날씨 정보</h1>
				<span>내가 위치한 곳의 날씨 정보를 조회합니다.</span>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="main">Home</a></li>
					<li class="breadcrumb-item"><a href="#">정보</a></li>
					<li class="breadcrumb-item active" aria-current="page">날씨 정보</li>
				</ol>
			</div>

		</section><!-- #page-title end -->
		
			<!-- Content
		============================================= -->
		<section id="content">

			<div class="content-wrap">

				<div class="container clearfix">

					<input type="hidden" id="geoinfo" name="geoinfo">
					<input type="hidden" id="latitude" name="latitude">
					<input type="hidden" id="longitude" name="longitude">
					<input type="hidden" id="dong" name="dong">
					
					<!-- 위도 경도 값을 받는 스크립트 -->
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=97a3d04aa04f41226092b7d8ac65e681&libraries=services"></script>
					<script src="/hellscare/resources/ajax/jquery-3.4.1.min.js"></script>
					<script language="Javascript">
						if (navigator.geolocation) {
						  navigator.geolocation.getCurrentPosition(function(position) {
						  doStuff(position.coords.latitude, position.coords.longitude);
						  });
						} 
						 
						function doStuff(mylat, mylong) {
						  if (document.getElementById("geoinfo")) { 
							document.getElementById("latitude").value = mylat;
							document.getElementById("longitude").value = mylong;
							
							getDong();
						  }
						}
						
						function getDong() {
							var geocoder = new kakao.maps.services.Geocoder();
							
							var callback = function(result, status) {
							    if (status === kakao.maps.services.Status.OK) {
							        document.getElementById("dong").value = result[0].address_name;
							        
							        setTimeout(getWeatherInfo(), 10000);
							    }
							};
							geocoder.coord2RegionCode(document.getElementById("longitude").value, document.getElementById("latitude").value, callback);
						}
						
						function getWeatherInfo() {
							var dong = document.getElementById("dong").value;
							
							$.ajax({
								url : '${pageContext.request.contextPath}/weather_info_sub?dong=' + dong,
								type : 'GET',
								success : function(msg) {
									$('#weatherInfo').html(msg);
								}, 
								error : function() {
									alert("오류");
								}
							});
						}
						
					</script>
					
					<div id="weatherInfo"></div>
					
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
	
	<!-- Bootstrap Data Table Plugin -->
	<script src="resources/js/components/bs-datatable.js"></script>

	<%@ include file="../include/footerScript.jsp"%>
	
	<script>

		$(document).ready(function() {
			$('#datatable1').dataTable();
		});

	</script>
</body>
</html>