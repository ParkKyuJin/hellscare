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
							  <a class="dropdown-item" href="#dropdown1" tabindex="-1" data-toggle="tab">1000 kcal 식단 1</a>
							  <a class="dropdown-item" href="#dropdown2" tabindex="-1" data-toggle="tab">1000 kcal 식단 2</a>
							  <a class="dropdown-item" href="#dropdown3" tabindex="-1" data-toggle="tab">1500 kcal 식단 1</a>
							  <a class="dropdown-item" href="#dropdown4" tabindex="-1" data-toggle="tab">1500 kcal 식단 2</a>
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
						  <div class="tab-pane fade" id="dropdown1">
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
						  <div class="tab-pane fade" id="dropdown2">
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
						  
						  <div class="tab-pane fade" id="dropdown3">
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
						  
						  <div class="tab-pane fade" id="dropdown4">
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
						  <li class="nav-item"><a class="nav-link active" href="#home" data-toggle="tab">Home</a></li>
						  <li class="nav-item"><a class="nav-link" href="#profile" data-toggle="tab">Profile</a></li>
						  <li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="myTabDrop1" data-toggle="dropdown">Dropdown</a>
							<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
							  <a class="dropdown-item" href="#dropdown1" tabindex="-1" data-toggle="tab">@fat</a>
							  <a class="dropdown-item" href="#dropdown2" tabindex="-1" data-toggle="tab">@mdo</a>
							</ul>
						  </li>
						</ul>
						
						<div id="myTabContent" class="tab-content">
						  <div class="tab-pane fade show active" id="home">
							<p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
						  </div>
						  <div class="tab-pane fade" id="profile">
							<p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit. Keytar helvetica VHS salvia yr, vero magna velit sapiente labore stumptown. Vegan fanny pack odio cillum wes anderson 8-bit, sustainable jean shorts beard ut DIY ethical culpa terry richardson biodiesel. Art party scenester stumptown, tumblr butcher vero sint qui sapiente accusamus tattooed echo park.</p>
						  </div>
						  <div class="tab-pane fade" id="dropdown1">
							<p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork. Williamsburg banh mi whatever gluten-free, carles pitchfork biodiesel fixie etsy retro mlkshk vice blog. Scenester cred you probably haven't heard of them, vinyl craft beer blog stumptown. Pitchfork sustainable tofu synth chambray yr.</p>
						  </div>
						  <div class="tab-pane fade" id="dropdown2">
							<p>Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, banh mi before they sold out farm-to-table VHS viral locavore cosby sweater. Lomo wolf viral, mustache readymade thundercats keffiyeh craft beer marfa ethical. Wolf salvia freegan, sartorial keffiyeh echo park vegan.</p>
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