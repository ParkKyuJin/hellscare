<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../include/header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<section id="page-title" class="page-title-parallax page-title-dark" style="background-image: url('/hellscare/resources/images/challmenu.jpg'); background-size: cover; padding: 80px 0;" data-bottom-top="background-position:0px 0px;" data-top-bottom="background-position:0px -300px;">
<!-- <section id="page-title"> -->

         <div class="container clearfix">
				<h1>도전과제</h1>
				<span>도전과제를 달성하고 포인트를 쌓아보세요!</span>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="main">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page"><a href="Mychallenge">My challenge</a></li>
				</ol>
			</div>
</section><!-- #page-title end -->


	
<!-- 컨텐츠 영역 -->
<section id="content">

	<div class="content-wrap">
	   <div class="container clearfix">
	   
	  

			<form id="challengedetail" action="" method="post">
			<div class="row">
			<div class="col-lg-6 pl-lg-6">
				<div class="entry-image" >
							<a href="/hellscare/resources/eventimg/${dto.challenge_img}" data-lightbox="image" style="height:100%;"><img style="height:100%;"T class="image_fade" src="/hellscare/resources/eventimg/${dto.challenge_img}" alt="Standard Post with Image"></a>
				</div>
			</div>
			<div class="col-lg-5">
			
				<div style="max-width: 30rem;">
					<label for="drug_name">도전과제명</label>
					<hr>
					<h3>${dto.challenge_name}</h3>
					<hr>
					<label for="entp_name">도전과제 내용 </label>
					<hr>
					<h4>${dto.challenge_content}</h4>
					<hr>
					<label for="entp_name">보상포인트</label>
					<hr>
					<h4>${dto.challenge_gift} Points</h4>
					<div id="map" style="width:100%;height:350px;"></div>
				</div>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f11ce067be0e4302a3047b3e2f5dbe9"></script>
<script>
var ttt = ${dto.latitude};
var vvv = ${dto.longitude};
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 

    mapOption = { 
        center: new kakao.maps.LatLng(ttt,vvv), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
       
    };
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(ttt, vvv); 

//마커를 생성합니다
var marker = new kakao.maps.Marker({
 position: markerPosition
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

//아래 코드는 지도 위의 마커를 제거하는 코드입니다
//marker.setMap(null);    
</script>
				<br>
				<c:if test="${cnt != 0}">
				<div class="style-msg infomsg">
					<div class="sb-msg"><i class="icon-info-sign"></i><strong>Fail XD !</strong> <b>이미 도전등록을 하신 과제입니다!</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Mychallenge">내 과제 보기</a></div>
					</div>
				</c:if>
				
				<c:if test="${cnt==0}">
				<div id="btns">
					<a onclick="window.history.back()" class="button button-border button-rounded button-blue"><i class="icon-repeat"></i>뒤로가기</a>				
					<a onclick="window.location='addchall?code=${dto.challenge_code}'" class="button button-border button-rounded button-blue" id="btn_idfysearch"><i class="icon-line-circle-check"></i>도전하기</a>
				</div>
				</c:if>
			</div>
			
			</div>
			
			</form>
			
			<div class="line"></div>


	
</div>		
</div>

</section><!-- #content end -->








<%@ include file="../include/footer.jsp"%>
<%@ include file="../include/footerScript.jsp"%>
</body>
</html>