<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/setting.jsp" %>


	<!-- Header
	============================================= -->
	<header id="header" class="transparent-header full-header" data-sticky-class="not-dark">

		<div id="header-wrap">

			<div class="container clearfix">

				<div id="primary-menu-trigger"><i class="icon-reorder"></i></div>

				<!-- Logo
				============================================= -->
				<div id="logo">
					<a href="main" class="standard-logo" data-dark-logo="/hellscare/resources/images/DrCARE2.png"><img src="/hellscare/resources/images/DrCARE.png" alt="Canvas Logo"></a>
				</div><!-- #logo end -->

				<!-- Primary Navigation
				============================================= -->
				<nav id="primary-menu" class="dark" >

					<ul>
						<li><a href="#"><div style="font-size:1.5em">건강진단</div></a>
							<ul style="background:white">
							<!--@@@@@@@@@ 메뉴 배경색 바꾸는 곳 @@@@@@@@@@@@-->
								
								<li><a href="healthstateresult"><div style="color:black; font-size:1.2em;">건강진단</div></a></li>
							</ul>
						</li>
						<li><a href="#"><div style="font-size:1.5em">식단</div></a>
						<ul style="background: white">
						<li><a href="food_diet"><div style="color: black; font-size:1.2em;">다이어트
										식품</div></a></li>
										<li><a href="javascript:goTodayCalory();"><div
										style="color: black; font-size:1.2em;">오늘의 칼로리</div></a></li>
							<li><a href="food_info"><div style="color: black; font-size:1.2em;">식단
										정보</div></a></li>
							<li><a href="javascript:goFoodRecommendation();"><div
										style="color: black; font-size:1.2em;">섭취영양성분 분석</div></a></li>
							
							
						</ul></li>
						<li><a href="#"><div style="font-size:1.5em">정보</div></a>
							<ul style="background:white">
								<li><a href="hospital_location"><div style="color:black; font-size:1.2em;">병원/약국 정보</div></a></li>
								<!-- <li><a href="pharmacy_location"><div style="color:black;">약국 정보</div></a></li> -->
								<li><a href="drugInfo"><div style="color:black; font-size:1.2em;">의약품 정보</div></a></li>
								<li><a href="disease"><div style="color:black; font-size:1.2em;">질병 정보</div></a></li>
								<li><a href="weather_info"><div style="color:black; font-size:1.2em;">날씨 정보</div></a></li>
								<!-- <li><a href="shop.html"><div style="color:black;">식중독 지수</div></a></li> -->
							</ul>
						</li>
						<li><a href="#"><div style="font-size:1.5em">운동</div></a>
							<ul style="background:white">
								<li><a href="exercise"><div style="color:black; font-size:1.2em;">운동 정보</div></a>
									<!-- <ul style="background:white">
										<li><a href="exercise"><div style="color:black;">운동정보 목록</div></a></li>
									</ul> -->
								</li>
								<li><a href="exercise_favorite"><div style="color:black; font-size:1.2em;">즐겨찾기</div></a>
								</li>
							
								
							<!-- 	<li><a href="steps"><div style="color:black; font-size:1.2em;">걸음수</div></a>
								</li>
								<li><a href="stepsRank"><div style="color:black; font-size:1.2em;">걸음수 랭킹</div></a></li> -->
							</ul>
						</li>
					
					

					<li><a href="#"><div style="font-size:1.5em">동호회</div></a>
						<ul style="background: white">
							<li><a href="#" onclick="return clubSessionChk();"><div
										style="color: black; font-size:1.2em;">동호회 목록</div></a></li>
							<li><a href="makeClub" onclick="return clubSessionChk();"><div style="color: black; font-size:1.2em;">동호회
										개설</div></a></li>
							<c:if test="${memId != null}">
								<li><a href="user_applyList"><div style="color: black; font-size:1.2em;">동호회
											신청목록</div></a></li>
							</c:if>
						</ul></li>
					<li><a href="#"><div style="font-size:1.5em">이벤트</div></a>
							<ul style="background:white">
								<li><a href="challenge"><div style="color:black; font-size:1.2em;">도전과제</div></a></li>
								<li><a href="Mychallenge"><div style="color:black; font-size:1.2em;">진행중인 도전과제</div></a></li>
							</ul>
						</li>
						<li><a href="#"><div style="font-size:1.5em">게시판</div></a>
                     <ul style="background:white">
                        <li><a href="boardList"><div style="color:black; font-size:1.2em;">자유게시판</div></a></li>
                        <li><a href="boardList"><div style="color:black; font-size:1.2em;">Q&A</div></a></li>
                     </ul>
                  </li>
					</ul>
					
					<div id="top-account" class="dropdown" >
						<a href="#" class="btn btn-secondary btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" ><i class="icon-user"></i></a>
						<ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1"  >
							<c:if test="${sessionScope.memId == null }">
								<a class="dropdown-item tleft" href="login_reg">Login</a>
								<a class="dropdown-item tleft" href="signUp">Sign Up</a>
							
							</c:if>
							<c:if test="${sessionScope.memId != null}">
								<a class="dropdown-item tleft" href="javascript:void(0)">${sessionScope.memId }</a>
								<!-- <a class="dropdown-item tleft" href="#">MyPage <span class="badge badge-pill badge-secondary fright" style="margin-top: 3px;">5</span></a> -->
								<a class="dropdown-item tleft" href="myPage">MyPage</a>
								
								<!-- <div class="dropdown-divider"></div> -->
								<a class="dropdown-item tleft" href="logout">Logout <i class="icon-signout"></i></a>
							</c:if>
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
	<script type="text/javascript">
      function sessionChk(){
         if("${memId}" == ""){
            alert("로그인 후 이용해주세요.");
            window.location = "login_reg";
            return false;
         } else{
            window.location="exercise_favorite";
            return false;
         }
      } 
   </script>
   
   <script type="text/javascript">
      function clubSessionChk(){
         if("${memId}" == ""){
            alert("로그인 후 이용해주세요.");
            window.location = "login_reg";
            return false;
         } else{
            window.location="club";
            return false;
         }
      }
      
      
          function goFoodRecommendation() {
               if("${sessionScope.memId}" == "") {
                  alert("로그인 후 이용하십시오.");
                  window.location = "login_reg";
               } else {
                  window.location = "food_recommendation";
               }
            }
            
            function goTodayCalory() {
               if("${sessionScope.memId}" == "") {
                  alert("로그인 후 이용하십시오.");
                  window.location = "login_reg";
               } else {
                  window.location = "food_today_cal";
               }
            }
      /*       
            function Mychallenge(){
               if("${sessionScope.memId}" == "") {
                     alert("로그인 후 이용하십시오.");
                     window.location = "login_reg";
            }else{
               window.location = "Mychallenge";
            }
       */
   </script>
		
		
<script>
		jQuery( "#tabs-profile" ).on( "tabsactivate", function( event, ui ) {
			jQuery( '.flexslider .slide' ).resize();
		});
	</script>
	</header><!-- #header end -->
