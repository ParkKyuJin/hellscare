<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어트 식품</title>
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
				<h1>다이어트 식품</h1>
				<span>다이어트에 도움이 되는 음식과 피해야할 음식 목록을 제공합니다.</span>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="main">Home</a></li>
					<li class="breadcrumb-item"><a href="#">식단</a></li>
					<li class="breadcrumb-item active" aria-current="page">다이어트 식품</li>
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
			
						<h3>다이어트 식품</h3>
			
						<ul id="myTab" class="nav nav-tabs boot-tabs">
						  <li class="nav-item"><a class="nav-link active" href="#reasonable_food" data-toggle="tab">다이어트에 좋은 음식</a></li>
						  <li class="nav-item"><a class="nav-link" href="#profile" data-toggle="tab">피해야할 음식</a></li>
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
						  <div class="tab-pane fade" id="profile">
							<p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit. Keytar helvetica VHS salvia yr, vero magna velit sapiente labore stumptown. Vegan fanny pack odio cillum wes anderson 8-bit, sustainable jean shorts beard ut DIY ethical culpa terry richardson biodiesel. Art party scenester stumptown, tumblr butcher vero sint qui sapiente accusamus tattooed echo park.</p>
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