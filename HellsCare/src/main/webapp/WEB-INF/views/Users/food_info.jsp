<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단 정보</title>
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
				<h1>식단 정보</h1>
				<span>필수 건강 요소를 기반으로 한 대표적인 다이어트 식단 정보를 제공합니다.</span>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="main">Home</a></li>
					<li class="breadcrumb-item"><a href="#">식단</a></li>
					<li class="breadcrumb-item active" aria-current="page">식단 정보</li>
				</ol>
			</div>

		</section><!-- #page-title end -->
		
			<!-- Content
		============================================= -->
		<section id="content">

			<div class="content-wrap">

				<div class="container clearfix">

					<!-- Post Content
					============================================= -->
					<div class="postcontent nobottommargin clearfix">
			
						<h3>다이어트 식단</h3>
			
						<ul id="myTab" class="nav nav-tabs boot-tabs">
						  <li class="nav-item"><a class="nav-link active" href="#reasonable_food" data-toggle="tab">이상적인 식단</a></li>
						  <!-- <li class="nav-item"><a class="nav-link" href="#profile" data-toggle="tab">Profile</a></li> -->
						  <li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="myTabDrop1" data-toggle="dropdown">칼로리별 식단</a>
							<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
							  <a class="dropdown-item" href="#kcal1000_1" tabindex="-1" data-toggle="tab">1000 kcal 식단 1</a>
							  <a class="dropdown-item" href="#kcal1000_2" tabindex="-1" data-toggle="tab">1000 kcal 식단 2</a>
							  <a class="dropdown-item" href="#kcal1500_1" tabindex="-1" data-toggle="tab">1500 kcal 식단 1</a>
							  <a class="dropdown-item" href="#kcal1500_2" tabindex="-1" data-toggle="tab">1500 kcal 식단 2</a>
							</ul>
						  </li>
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
						  	
						  	
							<p></p>
						  </div>
						  <!-- <div class="tab-pane fade" id="profile">
							<p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit. Keytar helvetica VHS salvia yr, vero magna velit sapiente labore stumptown. Vegan fanny pack odio cillum wes anderson 8-bit, sustainable jean shorts beard ut DIY ethical culpa terry richardson biodiesel. Art party scenester stumptown, tumblr butcher vero sint qui sapiente accusamus tattooed echo park.</p>
						  </div> -->
						  <div class="tab-pane fade" id="kcal1000_1">
							<p> 1000 kcal 식단 1</p>
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
								  <td>전복죽(50)</td>
								  <td>125.8</td>
								  <td>블랙커피<br/>(원두2)</td>
								  <td>50</td>
								  <td>보리밥(50)</td>
								  <td>170</td>
								  <td>자두(100)</td>
								  <td>62</td>
								  <td>현미밥(50)</td>
								  <td>177</td>
								</tr>
								
								<tr>
								  <td>김치(100)</td>
								  <td>32</td>
								  <td>   </td>
								  <td>   </td>
								  <td>미역국(150)</td>
								  <td>67</td>
								  <td>   </td>
								  <td>   </td>
								  <td>시래기국(120)</td>
								  <td>88</td>
								</tr>
								
								<tr>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>양파볶음(100)</td>
								  <td>54</td>
								  <td>   </td>
								  <td>   </td>
								  <td>토란탕(110)</td>
								  <td>83</td>
								</tr>
								
								<tr>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>겉절이(80)</td>
								  <td>32</td>
								  <td>   </td>
								  <td>   </td>
								  <td>무우생채(100)</td>
								  <td>27</td>
								</tr>
							  </tbody>
							  
							  <tfoot>
							  	<tr style="font-size:14px; align:center;">
							  		<td colspan="2">157.8 kcal</td>
							  		<td colspan="2">50 kcal</td>
							  		<td colspan="2">323 kcal</td>
							  		<td colspan="2">62 kcal</td>
							  		<td colspan="2">375 kcal</td>
							  	</tr>
							  </tfoot>
							</table>
						  </div>
						  <div class="tab-pane fade" id="kcal1000_2">
							<p> 1000 kcal 식단 2</p>
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
								  <td>밤밥(60)</td>
								  <td>149.7</td>
								  <td>수박(100)</td>
								  <td>22</td>
								  <td>현미밥(60)</td>
								  <td>170</td>
								  <td>수박(100)</td>
								  <td>22</td>
								  <td>보리밥(50)</td>
								  <td>183</td>
								</tr>
								
								<tr>
								  <td>미역된장국(27)</td>
								  <td>41.5</td>
								  <td>   </td>
								  <td>   </td>
								  <td>불고기(90.7)</td>
								  <td>67</td>
								  <td>   </td>
								  <td>   </td>
								  <td>무우국(100)</td>
								  <td>31</td>
								</tr>
								
								<tr>
								  <td>오이김치(100)</td>
								  <td>20</td>
								  <td>   </td>
								  <td>   </td>
								  <td>무우생채(80)</td>
								  <td>54</td>
								  <td>   </td>
								  <td>   </td>
								  <td>멸치볶음(20)</td>
								  <td>67</td>
								</tr>
								
								<tr>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>쌈장(15)</td>
								  <td>19.5</td>
								  <td>   </td>
								  <td>   </td>
								  <td>청포묵무침(60)</td>
								  <td>61.5</td>
								</tr>
								
								<tr>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>배추국(110)</td>
								  <td>11</td>
								  <td>   </td>
								  <td>   </td>
								  <td>배추김치(80)</td>
								  <td>15</td>
								</tr>
							  </tbody>
							  
							  <tfoot>
							  	<tr style="font-size:14px; align:center;">
							  		<td colspan="2">211 kcal</td>
							  		<td colspan="2">22 kcal</td>
							  		<td colspan="2">403 kcal</td>
							  		<td colspan="2">22 kcal</td>
							  		<td colspan="2">360 kcal</td>
							  	</tr>
							  </tfoot>
							</table>
						  </div>
						  
						  <div class="tab-pane fade" id="kcal1500_1">
							<p> 1500 kcal 식단 1</p>
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
								  <td>밥(150)</td>
								  <td>210</td>
								  <td>우유(210)</td>
								  <td>100</td>
								  <td>밥(150)</td>
								  <td>210</td>
								  <td>사과(1/2)</td>
								  <td>65</td>
								  <td>밥(150)</td>
								  <td>210</td>
								</tr>
								
								<tr>
								  <td>애탕국(250)</td>
								  <td>150</td>
								  <td>   </td>
								  <td>   </td>
								  <td>냉이된장국(250)</td>
								  <td>80</td>
								  <td>   </td>
								  <td>   </td>
								  <td>무우국(250)</td>
								  <td>50</td>
								</tr>
								
								<tr>
								  <td>쥐어채볶음(20)</td>
								  <td>60</td>
								  <td>   </td>
								  <td>   </td>
								  <td>갈치구이(50)</td>
								  <td>70</td>
								  <td>   </td>
								  <td>   </td>
								  <td>연근조림(40)</td>
								  <td>40</td>
								</tr>
								
								<tr>
								  <td>연근조림(40)</td>
								  <td>40</td>
								  <td>   </td>
								  <td>   </td>
								  <td>풋고추<br>멸치볶음(50)</td>
								  <td>100</td>
								  <td>   </td>
								  <td>   </td>
								  <td>도랑지<br>오리생채(70)</td>
								  <td>50</td>
								</tr>
								
								<tr>
								  <td>김치(50)</td>
								  <td>15</td>
								  <td>   </td>
								  <td>   </td>
								  <td>김치(50)</td>
								  <td>15</td>
								  <td>   </td>
								  <td>   </td>
								  <td>김치(50)</td>
								  <td>15</td>
								</tr>
							  </tbody>
							  
							  <tfoot>
							  	<tr style="font-size:14px; align:center;">
							  		<td colspan="2">475 kcal</td>
							  		<td colspan="2">100 kcal</td>
							  		<td colspan="2">475 kcal</td>
							  		<td colspan="2">65 kcal</td>
							  		<td colspan="2">365 kcal</td>
							  	</tr>
							  </tfoot>
							</table>
						  </div>
						  
						  <div class="tab-pane fade" id="kcal1500_2">
							<p> 1500 kcal 식단 2</p>
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
								  <td>완두콩밥(150)</td>
								  <td>210</td>
								  <td>사과(1/2)</td>
								  <td>60</td>
								  <td>보리밥(150)</td>
								  <td>210</td>
								  <td>수박(250)</td>
								  <td>100</td>
								  <td>흑미밥(150)</td>
								  <td>100</td>
								</tr>
								
								<tr>
								  <td>버섯국(70)</td>
								  <td>130</td>
								  <td>   </td>
								  <td>   </td>
								  <td>두부된장(250)</td>
								  <td>100</td>
								  <td>   </td>
								  <td>   </td>
								  <td>조개국(115)</td>
								  <td>118</td>
								</tr>
								
								<tr>
								  <td>상추겉절이(35)</td>
								  <td>60</td>
								  <td>   </td>
								  <td>   </td>
								  <td>미역줄기볶음(50)</td>
								  <td>40</td>
								  <td>   </td>
								  <td>   </td>
								  <td>고추부각(20)</td>
								  <td>60</td>
								</tr>
								
								<tr>
								  <td>김치(70)</td>
								  <td>20</td>
								  <td>   </td>
								  <td>   </td>
								  <td>달걀조림 1개</td>
								  <td>60</td>
								  <td>   </td>
								  <td>   </td>
								  <td>콩나물잡채(70)</td>
								  <td>100</td>
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
								  <td>풋고추조림(40)</td>
								  <td>41</td>
								</tr>
							  </tbody>
							  
							  <tfoot>
							  	<tr style="font-size:14px; align:center;">
							  		<td colspan="2">439 kcal</td>
							  		<td colspan="2">60 kcal</td>
							  		<td colspan="2">440 kcal</td>
							  		<td colspan="2">100 kcal</td>
							  		<td colspan="2">419 kcal</td>
							  	</tr>
							  </tfoot>
							</table>
						  </div>
						</div>
						
						<div class="divider"><i class="icon-circle"></i></div>
						
						<h3>연령별 식단</h3>
			
						<ul id="myTab" class="nav nav-tabs boot-tabs">
						 <li class="nav-item"><a class="nav-link active" href="#home" data-toggle="tab">연령별 가이드라인</a></li>
						  <li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="myTabDrop1" data-toggle="dropdown">연령별 식단</a>
							<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
							  <a class="dropdown-item" href="#womanAdult" tabindex="-1" data-toggle="tab">2000 kcal 식단 성인 20~49세 여자</a>
							  <a class="dropdown-item" href="#manAdult" tabindex="-1" data-toggle="tab">2500 kcal 식단 성인 20~49세 남자</a>
							  <a class="dropdown-item" href="#womanYouth1" tabindex="-1" data-toggle="tab">2100 kcal 식단 청소년 16~19세 여자</a>
							  <a class="dropdown-item" href="#manYouth1" tabindex="-1" data-toggle="tab">2600 kcal 식단 청소년 16~19세 남자</a>
							  <a class="dropdown-item" href="#womanYouth2" tabindex="-1" data-toggle="tab">2000 kcal 식단 청소년 13~15세 여자</a>
							  <a class="dropdown-item" href="#manYouth2" tabindex="-1" data-toggle="tab">2200 kcal 식단 청소년 13~15세 남자</a>
							  <a class="dropdown-item" href="#womanElement" tabindex="-1" data-toggle="tab">1900 kcal 식단 초등학생 10~12세 여자</a>
							  <a class="dropdown-item" href="#manElement" tabindex="-1" data-toggle="tab">2000 kcal 식단 초등학생 10~12세 남자</a>
							  <a class="dropdown-item" href="#elementStudent" tabindex="-1" data-toggle="tab">1800 kcal 식단 초등학생 7~9세</a>
							  <a class="dropdown-item" href="#infant" tabindex="-1" data-toggle="tab">1200 kcal 식단 소아 1~3세 영유아</a>
							</ul>
						  </li>
						</ul>
						
						<div id="myTabContent" class="tab-content">
						  <div class="tab-pane fade show active" id="home">
						  	<span><b>성인 다이어트 식단</b></span>
							<p> 성인 시기는 나이가 많아 짐에 따라 체중이 줄지만 사무직은 운동 부족과 대사가 저하되어 각종 기능 장애가 일어나기 쉽습니다.
								주부의 가사 노동 경감과 미삭화, 가공 식품의 애용 등 식사 양식과 내용 변화가 가족 건강에 영향을 주고 주부 비만의 원인이 될 수 있다는 점에 주의 합니다. 
							</p>
							<br>	
							
							<span><b>청소년 다이어트 식단</b></span>
							<p> 청소년 시기는 일생중 영양이 가장 많이 필요한 때입니다.
								청소년 기에 단백질 공급이 충분하지 못하면 감염성 질환, 특히 폐결핵 등에 대한 저항력이 떨어집니다.
								밤새우기, 야식, 늦잠으로 인한 아침결식, 도시락의 제한된 영양 당질위주식사.
								무리한 다이어트로 인한 절식, 결식, 외식 등으로 빈혈이 많으므로 신경을 써야 합니다.
							 </p>
							 
							 <br>
							 
							 <span><b>초등학생 다이어트 식단</b></span>
							 <p>
							 	초등학생 시기는 발육이 왕성한 시기며 남녀 구별이 나타나기 시작합니다.
								양질의 단백질 섭취에 중점을 두어야 합니다.
								어릴 때 좋은 영양은 평생의 식습관과 성격 형성에 영향을 미친다는 점을 염두하고 식단을 짜야 합니다.
							 </p>
							 
							 <br>
							 
							 <span><b>유아 식단</b></span>
							 <p>
							 	소아식단은 소화 흡수 능력이 미숙하므로 부드러운 형태로 한 입에 먹기 좋게 합니다.
								소아는 예쁜 모양과 부드러운 것, 입안에 넣기 쉬운 크기, 미지근한 온도의 음식을 좋아 합니다.
								소아기는 식사 습관이 형성되는 시기므로 편식하지 않도록 지도합니다.
							 </p>
							 
						  </div>
						  
						  <div class="tab-pane fade" id="womanAdult">
							<p> 2000 kcal 식단 성인 20~49세 여자 다이어트 식단</p>
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
								  <td>밥(150)</td>
								  <td>210</td>
								  <td>우유(210)</td>
								  <td>100</td>
								  <td>밥(150)</td>
								  <td>210</td>
								  <td>사과(1/2)</td>
								  <td>65</td>
								  <td>밥(150)</td>
								  <td>210</td>
								</tr>
								
								<tr>
								  <td>애탕국(250)</td>
								  <td>150</td>
								  <td>   </td>
								  <td>   </td>
								  <td>냉이된장국(250)</td>
								  <td>80</td>
								  <td>   </td>
								  <td>   </td>
								  <td>무우국(250)</td>
								  <td>50</td>
								</tr>
								
								<tr>
								  <td>쥐어채볶음(20)</td>
								  <td>60</td>
								  <td>   </td>
								  <td>   </td>
								  <td>갈치구이(50)</td>
								  <td>70</td>
								  <td>   </td>
								  <td>   </td>
								  <td>연근조림(40)</td>
								  <td>40</td>
								</tr>
								
								<tr>
								  <td>연근조림(40)</td>
								  <td>40</td>
								  <td>   </td>
								  <td>   </td>
								  <td>풋고추<br>멸치볶음(50)</td>
								  <td>100</td>
								  <td>   </td>
								  <td>   </td>
								  <td>도랑지<br>오리생채(70)</td>
								  <td>50</td>
								</tr>
								
								<tr>
								  <td>김치(50)</td>
								  <td>15</td>
								  <td>   </td>
								  <td>   </td>
								  <td>김치(50)</td>
								  <td>15</td>
								  <td>   </td>
								  <td>   </td>
								  <td>김치(50)</td>
								  <td>15</td>
								</tr>
							  </tbody>
							  
							  <tfoot>
							  	<tr style="font-size:14px; align:center;">
							  		<td colspan="2">475 kcal</td>
							  		<td colspan="2">100 kcal</td>
							  		<td colspan="2">475 kcal</td>
							  		<td colspan="2">65 kcal</td>
							  		<td colspan="2">365 kcal</td>
							  	</tr>
							  </tfoot>
							</table>
						  </div>
						  
						  <div class="tab-pane fade" id="manAdult">
							<p>2500 kcal 식단 성인 20~49세 남자 다이어트 식단</p>
							
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
								  <td>토스트 2쪽</td>
								  <td>510</td>
								  <td>우유 1컵</td>
								  <td>125</td>
								  <td>오징어덮밥</td>
								  <td>550</td>
								  <td>   </td>
								  <td>   </td>
								  <td>팥밥</td>
								  <td>300</td>
								</tr>
								
								<tr>
								  <td>감자스프</td>
								  <td>170</td>
								  <td>   </td>
								  <td>   </td>
								  <td>맑은장국</td>
								  <td>120</td>
								  <td>   </td>
								  <td>   </td>
								  <td>곰국</td>
								  <td>240</td>
								</tr>
								
								<tr>
								  <td>토마토샐러드</td>
								  <td>90</td>
								  <td>   </td>
								  <td>   </td>
								  <td>깍두기</td>
								  <td>40</td>
								  <td>   </td>
								  <td>   </td>
								  <td>메밀묵무침</td>
								  <td>80</td>
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
								  <td>오이무침</td>
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
								  <td>배추김치</td>
								  <td>20</td>
								</tr>
							  </tbody>
							  
							  <tfoot>
							  	<tr style="font-size:14px; align:center;">
							  		<td colspan="2">770 kcal</td>
							  		<td colspan="2">125 kcal</td>
							  		<td colspan="2">710 kcal</td>
							  		<td colspan="2">0 kcal</td>
							  		<td colspan="2">690 kcal</td>
							  	</tr>
							  </tfoot>
							</table>
						  </div>
						  
						  <div class="tab-pane fade" id="womanYouth1">
							<p>2100 kcal 식단 청소년 16~19세 여자 다이어트 식단</p>
							
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
								  <td>팥밥</td>
								  <td>300</td>
								  <td>귤 1개</td>
								  <td>40</td>
								  <td>자장밥</td>
								  <td>670</td>
								  <td>   </td>
								  <td>   </td>
								  <td>보리밥</td>
								  <td>300</td>
								</tr>
								
								<tr>
								  <td>쇠고기아욱국</td>
								  <td>100</td>
								  <td>   </td>
								  <td>   </td>
								  <td>미역냉국</td>
								  <td>40</td>
								  <td>   </td>
								  <td>   </td>
								  <td>순두부찌개</td>
								  <td>100</td>
								</tr>
								
								<tr>
								  <td>달걀말이</td>
								  <td>140</td>
								  <td>   </td>
								  <td>   </td>
								  <td>깍두기</td>
								  <td>40</td>
								  <td>   </td>
								  <td>   </td>
								  <td>풋고추전</td>
								  <td>110</td>
								</tr>
								
								<tr>
								  <td>오이부추무침</td>
								  <td>50</td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>가지나물</td>
								  <td>40</td>
								</tr>
								
								<tr>
								  <td>총각김치</td>
								  <td>30</td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>총각김치</td>
								  <td>30</td>
								</tr>
							  </tbody>
							  
							  <tfoot>
							  	<tr style="font-size:14px; align:center;">
							  		<td colspan="2">620 kcal</td>
							  		<td colspan="2">40 kcal</td>
							  		<td colspan="2">750 kcal</td>
							  		<td colspan="2">0 kcal</td>
							  		<td colspan="2">580 kcal</td>
							  	</tr>
							  </tfoot>
							</table>
						  </div>
						  
						  <div class="tab-pane fade" id="manYouth1">
							<p>2600 kcal 식단 청소년 16~19세 남자 다이어트 식단</p>
							
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
								  <td>모닝빵 3개</td>
								  <td>120</td>
								  <td>사과 1개</td>
								  <td>100</td>
								  <td>볶음밥</td>
								  <td>750</td>
								  <td>   </td>
								  <td>   </td>
								  <td>콩밥</td>
								  <td>300</td>
								</tr>
								
								<tr>
								  <td>우유1컵</td>
								  <td>125</td>
								  <td>   </td>
								  <td>   </td>
								  <td>달걀실파국</td>
								  <td>50</td>
								  <td>   </td>
								  <td>   </td>
								  <td>두부된장찌개</td>
								  <td>130</td>
								</tr>
								
								<tr>
								  <td>감자샐러드</td>
								  <td>100</td>
								  <td>   </td>
								  <td>   </td>
								  <td>깍두기</td>
								  <td>40</td>
								  <td>   </td>
								  <td>   </td>
								  <td>불고기</td>
								  <td>280</td>
								</tr>
								
								<tr>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>깻잎찜</td>
								  <td>50</td>
								  <td>   </td>
								  <td>   </td>
								  <td>도라지생채</td>
								  <td>40</td>
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
								  <td>총각김치</td>
								  <td>30</td>
								</tr>
							  </tbody>
							  
							  <tfoot>
							  	<tr style="font-size:14px; align:center;">
							  		<td colspan="2">325 kcal</td>
							  		<td colspan="2">40 kcal</td>
							  		<td colspan="2">890 kcal</td>
							  		<td colspan="2">0 kcal</td>
							  		<td colspan="2">780 kcal</td>
							  	</tr>
							  </tfoot>
							</table>
						  </div>
						  
						  <div class="tab-pane fade" id="womanYouth2">
							<p>2000 kcal 식단 청소년 13~15세 여자 다이어트 식단</p>
							
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
								  <td>쌀밥</td>
								  <td>300</td>
								  <td>   </td>
								  <td>   </td>
								  <td>비빔밥</td>
								  <td>560</td>
								  <td>   </td>
								  <td>   </td>
								  <td>보리밥</td>
								  <td>300</td>
								</tr>
								
								<tr>
								  <td>쇠고기미역국</td>
								  <td>110</td>
								  <td>   </td>
								  <td>   </td>
								  <td>달걀실파국</td>
								  <td>50</td>
								  <td>   </td>
								  <td>   </td>
								  <td>육개장</td>
								  <td>210</td>
								</tr>
								
								<tr>
								  <td>꽁치구이</td>
								  <td>160</td>
								  <td>   </td>
								  <td>   </td>
								  <td>간전</td>
								  <td>140</td>
								  <td>   </td>
								  <td>   </td>
								  <td>멸치볶음</td>
								  <td>30</td>
								</tr>
								
								<tr>
								  <td>애호박나물</td>
								  <td>40</td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>도토리묵무침</td>
								  <td>60</td>
								</tr>
								
								<tr>
								  <td>배추김치</td>
								  <td>20</td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>열무김치</td>
								  <td>20</td>
								</tr>
							  </tbody>
							  
							  <tfoot>
							  	<tr style="font-size:14px; align:center;">
							  		<td colspan="2">325 kcal</td>
							  		<td colspan="2">40 kcal</td>
							  		<td colspan="2">890 kcal</td>
							  		<td colspan="2">0 kcal</td>
							  		<td colspan="2">780 kcal</td>
							  	</tr>
							  </tfoot>
							</table>
						  </div>
						  
						  <div class="tab-pane fade" id="manYouth2">
							<p>2200 kcal 식단 청소년 13~15세 남자 다이어트 식단</p>
							
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
								  <td>팥밥</td>
								  <td>300</td>
								  <td>우유 1컵</td>
								  <td>125</td>
								  <td>카레라이스</td>
								  <td>780</td>
								  <td>   </td>
								  <td>   </td>
								  <td>보리밥</td>
								  <td>300</td>
								</tr>
								
								<tr>
								  <td>무맑은장국</td>
								  <td>60</td>
								  <td>   </td>
								  <td>   </td>
								  <td>오이냉국</td>
								  <td>40</td>
								  <td>   </td>
								  <td>   </td>
								  <td>배추된장국</td>
								  <td>60</td>
								</tr>
								
								<tr>
								  <td>오이생채</td>
								  <td>40</td>
								  <td>   </td>
								  <td>   </td>
								  <td>배추김치</td>
								  <td>20</td>
								  <td>   </td>
								  <td>   </td>
								  <td>시금치나물</td>
								  <td>40</td>
								</tr>
								
								<tr>
								  <td>조기구이</td>
								  <td>90</td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>새우튀김</td>
								  <td>260</td>
								</tr>
								
								<tr>
								  <td>배추김치</td>
								  <td>20</td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>총각김치</td>
								  <td>30</td>
								</tr>
							  </tbody>
							  
							  <tfoot>
							  	<tr style="font-size:14px; align:center;">
							  		<td colspan="2">510 kcal</td>
							  		<td colspan="2">125 kcal</td>
							  		<td colspan="2">840 kcal</td>
							  		<td colspan="2">0 kcal</td>
							  		<td colspan="2">690 kcal</td>
							  	</tr>
							  </tfoot>
							</table>
						  </div>
						  
						  <div class="tab-pane fade" id="womanElement">
							<p>1900 kcal 식단 초등학생 10~12세 여자 다이어트 식단</p>
							
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
								  <td>콩밥</td>
								  <td>300</td>
								  <td>우유 1컵</td>
								  <td>125</td>
								  <td>오므라이스</td>
								  <td>690</td>
								  <td>   </td>
								  <td>   </td>
								  <td>팥밥</td>
								  <td>300</td>
								</tr>
								
								<tr>
								  <td>시금치조개국</td>
								  <td>70</td>
								  <td>   </td>
								  <td>   </td>
								  <td>콩나물국</td>
								  <td>60</td>
								  <td>   </td>
								  <td>   </td>
								  <td>호박잎된장국</td>
								  <td>80</td>
								</tr>
								
								<tr>
								  <td>달걀찜</td>
								  <td>100</td>
								  <td>   </td>
								  <td>   </td>
								  <td>오이소박이</td>
								  <td>40</td>
								  <td>   </td>
								  <td>   </td>
								  <td>해물샐러드</td>
								  <td>50</td>
								</tr>
								
								<tr>
								  <td>오이생채</td>
								  <td>40</td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>장산적</td>
								  <td>100</td>
								</tr>
								
								<tr>
								  <td>배추김치</td>
								  <td>20</td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>배추김치</td>
								  <td>20</td>
								</tr>
							  </tbody>
							  
							  <tfoot>
							  	<tr style="font-size:14px; align:center;">
							  		<td colspan="2">530 kcal</td>
							  		<td colspan="2">125 kcal</td>
							  		<td colspan="2">790 kcal</td>
							  		<td colspan="2">0 kcal</td>
							  		<td colspan="2">550 kcal</td>
							  	</tr>
							  </tfoot>
							</table>
						  </div>
						  
						  <div class="tab-pane fade" id="manElement">
							<p>2000 kcal 식단 초등학생 10~12세 남자 다이어트 식단</p>
							
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
								  <td>오곡밥</td>
								  <td>300</td>
								  <td>우유 1컵</td>
								  <td>125</td>
								  <td>찰밥</td>
								  <td>370</td>
								  <td>   </td>
								  <td>   </td>
								  <td>보리밥</td>
								  <td>300</td>
								</tr>
								
								<tr>
								  <td>동태국</td>
								  <td>170</td>
								  <td>   </td>
								  <td>   </td>
								  <td>시금치된장국</td>
								  <td>100</td>
								  <td>   </td>
								  <td>   </td>
								  <td>쇠고기미역국</td>
								  <td>110</td>
								</tr>
								
								<tr>
								  <td>달걀말이</td>
								  <td>140</td>
								  <td>   </td>
								  <td>   </td>
								  <td>멸치볶음</td>
								  <td>30</td>
								  <td>   </td>
								  <td>   </td>
								  <td>장산적</td>
								  <td>100</td>
								</tr>
								
								<tr>
								  <td>오이생채</td>
								  <td>40</td>
								  <td>   </td>
								  <td>   </td>
								  <td>삼치구이</td>
								  <td>130</td>
								  <td>   </td>
								  <td>   </td>
								  <td>콩나물무침</td>
								  <td>50</td>
								</tr>
								
								<tr>
								  <td>배추김치</td>
								  <td>20</td>
								  <td>   </td>
								  <td>   </td>
								  <td>깍두기</td>
								  <td>30</td>
								  <td>   </td>
								  <td>   </td>
								  <td>배추김치</td>
								  <td>20</td>
								</tr>
							  </tbody>
							  
							  <tfoot>
							  	<tr style="font-size:14px; align:center;">
							  		<td colspan="2">670 kcal</td>
							  		<td colspan="2">125 kcal</td>
							  		<td colspan="2">660 kcal</td>
							  		<td colspan="2">0 kcal</td>
							  		<td colspan="2">580 kcal</td>
							  	</tr>
							  </tfoot>
							</table>
						  </div>
						  
						  <div class="tab-pane fade" id="elementStudent">
							<p>1800 kcal 식단 초등학생 7~9세</p>
							
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
								  <td>흑미밥</td>
								  <td>210</td>
								  <td>우유 1컵</td>
								  <td>125</td>
								  <td>비프커틀릿</td>
								  <td>390</td>
								  <td>플레인요구르트</td>
								  <td>210</td>
								  <td>콩밥</td>
								  <td>210</td>
								</tr>
								
								<tr>
								  <td>쇠고기미역국</td>
								  <td>80</td>
								  <td>   </td>
								  <td>   </td>
								  <td>옥수수스프</td>
								  <td>160</td>
								  <td>   </td>
								  <td>   </td>
								  <td>무어묵국</td>
								  <td>50</td>
								</tr>
								
								<tr>
								  <td>동태조림</td>
								  <td>80</td>
								  <td>   </td>
								  <td>   </td>
								  <td>사과샐러드</td>
								  <td>120</td>
								  <td>   </td>
								  <td>   </td>
								  <td>삼치구이</td>
								  <td>80</td>
								</tr>
								
								<tr>
								  <td>고구마줄기볶음</td>
								  <td>30</td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>고사리나물</td>
								  <td>40</td>
								</tr>
								
								<tr>
								  <td>도라지오이생채</td>
								  <td>40</td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>애호박전</td>
								  <td>50</td>
								</tr>
								
								<tr>
								  <td>깍두기</td>
								  <td>30</td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								  <td>   </td>
								</tr>
							  </tbody>
							  
							  <tfoot>
							  	<tr style="font-size:14px; align:center;">
							  		<td colspan="2">470 kcal</td>
							  		<td colspan="2">125 kcal</td>
							  		<td colspan="2">670 kcal</td>
							  		<td colspan="2">210 kcal</td>
							  		<td colspan="2">430 kcal</td>
							  	</tr>
							  </tfoot>
							</table>
						  </div>
						  
						  <div class="tab-pane fade" id="infant">
							<p>소아식단 1200 kcal(1~3세 영아, 유아)</p>
							
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
								  <td>타락죽</td>
								  <td>170</td>
								  <td>우유 1컵</td>
								  <td>125</td>
								  <td>쌀밥</td>
								  <td>150</td>
								  <td>푸딩</td>
								  <td>80</td>
								  <td>보리밥</td>
								  <td>150</td>
								</tr>
								
								<tr>
								  <td>나박김치</td>
								  <td>10</td>
								  <td>복숭아</td>
								  <td>20</td>
								  <td>양파스프</td>
								  <td>80</td>
								  <td>사과구이</td>
								  <td>80</td>
								  <td>곰국</td>
								  <td>120</td>
								</tr>
								
								<tr>
								  <td>도미구이</td>
								  <td>50</td>
								  <td>   </td>
								  <td>   </td>
								  <td>옥수수샐러드</td>
								  <td>60</td>
								  <td>   </td>
								  <td>   </td>
								  <td>달걀조림</td>
								  <td>40</td>
								</tr>
								
								<tr>
								  <td>가지나물</td>
								  <td>20</td>
								  <td>   </td>
								  <td>   </td>
								  <td>배추김치</td>
								  <td>10</td>
								  <td>   </td>
								  <td>   </td>
								  <td>근대나물</td>
								  <td>40</td>
								</tr>
							  </tbody>
							  
							  <tfoot>
							  	<tr style="font-size:14px; align:center;">
							  		<td colspan="2">250 kcal</td>
							  		<td colspan="2">145 kcal</td>
							  		<td colspan="2">300 kcal</td>
							  		<td colspan="2">160 kcal</td>
							  		<td colspan="2">350 kcal</td>
							  	</tr>
							  </tfoot>
							</table>
						  </div>
						  
						</div>
			
						<div class="line"></div>
			
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
</body>
</html>