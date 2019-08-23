<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Header
	============================================= -->
	<header id="header" class="transparent-header full-header" data-sticky-class="not-dark">

		<div id="header-wrap">

			<div class="container clearfix">

				<div id="primary-menu-trigger"><i class="icon-reorder"></i></div>

				<!-- Logo
				============================================= -->
				<div id="logo">
					<a href="index.html" class="standard-logo" data-dark-logo="/hellscare/resources/images/logo-dark.png"><img src="/hellscare/resources/images/logo.png" alt="Canvas Logo"></a>
				</div><!-- #logo end -->

				<!-- Primary Navigation
				============================================= -->
				<nav id="primary-menu" class="dark" >

					<ul>
						<li><a href="#"><div>건강진단</div></a>
							<ul style="background:white">
							<!--@@@@@@@@@ 메뉴 배경색 바꾸는 곳 @@@@@@@@@@@@-->
								<li><a href="nextpage" ><div style="color:black;">건강진단 목록</div></a></li>
								<li><a href="healthstateresult"><div style="color:black;">건강진단 결과</div></a></li>
							</ul>
						</li>
						<li><a href="#"><div>운동</div></a>
							<ul style="background:white">
								<li><a href="exercise"><div style="color:black;">운동 정보</div></a>
									<!-- <ul style="background:white">
										<li><a href="exercise"><div style="color:black;">운동정보 목록</div></a></li>
									</ul> -->
								</li>
								<li><a href="exercise_favorite"><div style="color:black;">즐겨찾기</div></a>
								</li>
							
								
								<li><a href="steps"><div style="color:black;">걸음수</div></a>
								</li>
								<li><a href="stepsRank"><div style="color:black;">걸음수 랭킹</div></a></li>
							</ul>
						</li>
						<li><a href="#"><div>식단</div></a>
							<ul style="background:white">
								<li><a href="food_info"><div style="color:black;">식단 정보</div></a></li>
								<li><a href="food_recommendation"><div style="color:black;">식단 추천</div></a></li>
								<li><a href="food_today_cal"><div style="color:black;">오늘의 칼로리</div></a></li>
								<li><a href="food_diet"><div style="color:black;">다이어트 식품</div></a></li>
							</ul>
						</li>
							
						<li><a href="#"><div>정보</div></a>
							<ul style="background:white">
								<li><a href="hospital_location"><div style="color:black;">병원 정보</div></a></li>
								<li><a href="pharmacy_location"><div style="color:black;">약국 정보</div></a></li>
								<li><a href="drugInfo"><div style="color:black;">의약품 정보</div></a></li>
								<li><a href="disease"><div style="color:black;">질병 정보</div></a></li>
								<li><a href="weather_info"><div style="color:black;">날씨 정보</div></a></li>
								<!-- <li><a href="shop.html"><div style="color:black;">식중독 지수</div></a></li> -->
							</ul>
						</li>
						
						<li><a href="#"><div>동호회</div></a>
							<ul style="background:white">
								<li><a href="club"><div style="color:black;">동호회 목록</div></a></li>
								<li><a href="makeClub"><div style="color:black;">동호회 개설</div></a></li>
							</ul>
						</li>
						<li><a href="#"><div>이벤트</div></a>
							<ul style="background:white">
								<li><a href="challenge"><div style="color:black;">도전과제</div></a></li>
								<li><a href="Mychallenge"><div style="color:black;">진행중인 도전과제</div></a></li>
							</ul>
						</li>
						<li><a href="#"><div>게시판</div></a>
                     <ul style="background:white">
                        <li><a href="boardList"><div style="color:black;">자유게시판</div></a></li>
                        <li><a href="boardList"><div style="color:black;">Q&A</div></a></li>
                     </ul>
                  </li>
					</ul>
					
					<div id="top-account" class="dropdown">
						<a href="#" class="btn btn-secondary btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><i class="icon-user"></i></a>
						<ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1">
							<a class="dropdown-item tleft" href="login_reg">Login</a>
							<!-- <a class="dropdown-item tleft" href="#">MyPage <span class="badge badge-pill badge-secondary fright" style="margin-top: 3px;">5</span></a> -->
							<a class="dropdown-item tleft" href="myPage">MyPage</a>
<!-- 							<div class="dropdown-divider"></div> -->
							<a class="dropdown-item tleft" href="#">Logout <i class="icon-signout"></i></a>
						</ul>
					</div>

					<!-- Top Search
					============================================= -->
					<div id="top-search">
						<a href="#" id="top-search-trigger"><i class="icon-search3"></i><i class="icon-line-cross"></i></a>
						<form action="search.html" method="get">
							<input type="text" name="q" class="form-control" value="" placeholder="Type &amp; Hit Enter..">
						</form>
						
					</div><!-- #top-search end -->

				</nav><!-- #primary-menu end -->

			</div>

		</div>
<script>
		jQuery( "#tabs-profile" ).on( "tabsactivate", function( event, ui ) {
			jQuery( '.flexslider .slide' ).resize();
		});
	</script>
	</header><!-- #header end -->
</body>
</html>