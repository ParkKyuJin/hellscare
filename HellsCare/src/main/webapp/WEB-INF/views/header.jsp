<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
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
				<nav id="primary-menu" class="dark">

					<ul>
						<li class="current"><a href="index.html"><div>로그인</div></a></li>
						<li><a href="#"><div>건강진단</div></a>
							<ul style="background:white">
							<!--@@@@@@@@@ 메뉴 배경색 바꾸는 곳 @@@@@@@@@@@@-->
								<li><a href="shop.html"><div>건강진단 목록</div></a></li>
								<li><a href="shop-2.html"><div>건강진단 결과</div></a></li>
							</ul>
						</li>
						<li><a href="#"><div>운동</div></a>
							<ul>
								<li><a href="shop.html"><div>운동 정보</div></a>
									<ul>
										<li><a href="shop-3.html"><div>운동정보 목록</div></a></li>
										<li><a href="shop-3-right-sidebar.html"><div>운동상세보기</div></a></li>
									</ul>
								</li>
								<li><a href="shop-3.html"><div>즐겨찾기</div></a>
								</li>
								<li><a href="shop-2.html"><div>추천운동</div></a></li>
								
								<li><a href="shop-1.html"><div>걸음수</div></a>
								</li>
								<li><a href="shop-category-parallax.html"><div>걸음수 랭킹</div></a></li>
							</ul>
						</li>
						<li><a href="#"><div>식단</div></a>
							<ul>
								<li><a href="shop.html"><div>식단 정보</div></a></li>
								<li><a href="shop-2.html"><div>식단 추천</div></a></li>
								<li><a href="shop-2.html"><div>오늘의 칼로리</div></a></li>
								<li><a href="shop-2.html"><div>다이어트 식품</div></a></li>
							</ul>
						</li>
							
						<li><a href="shop.html"><div>정보</div></a>
							<ul>
								<li><a href="shop.html"><div>병원 정보</div></a></li>
								<li><a href="shop.html"><div>약국 정보</div></a></li>
								<li><a href="shop.html"><div>약 정보</div></a></li>
								<li><a href="shop.html"><div>날씨 정보</div></a></li>
								<li><a href="shop.html"><div>식중독 지수</div></a></li>
							</ul>
						</li>
						
						<li><a href="#"><div>동호회</div></a>
							<ul>
								<li><a href="shop.html"><div>동호회 목록</div></a></li>
								<li><a href="shop-3.html"><div>동호회 개설</div></a></li>
							</ul>
						</li>
						
						<li class="mega-menu"><a href="#"><div>게시판</div></a>
					</ul>
					

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

	</header><!-- #header end -->
</body>
</html>