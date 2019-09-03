<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/h_sidebarMenu.jsp"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword"
	content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<!-- Stylesheets
	============================================= -->
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700|Raleway:300,400,500,600,700|Crete+Round:400i"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="resources/css/bootstrap.css"
	type="text/css" />
<link rel="stylesheet" href="resources/style.css" type="text/css" />
<link rel="stylesheet" href="resources/css/dark.css" type="text/css" />
<link rel="stylesheet" href="resources/css/font-icons.css"
	type="text/css" />
<link rel="stylesheet" href="resources/css/animate.css" type="text/css" />
<link rel="stylesheet" href="resources/css/magnific-popup.css"
	type="text/css" />

<link rel="stylesheet" href="resources/css/responsive.css"
	type="text/css" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
</head>
<style>
	th {
		font-size: 15px;
	}
	
	td {
		vertical-align: middle;
		font-size: 16px;
		font-weight: bold;
	}
</style>
<html>
<body>
 <section id="main-content">
	<section class="wrapper">
		<div class="tabs tabs-alt tabs-justify clearfix" id="tab-10">
		<nav class="navbar navbar-light bg-light justify-content-between" style="text-align:center;">
			<h2 style="padding-top:30px;">동호회 상세정보</h2>
		</nav>
		<br><br>
			<table class="table table-hover" style="text-align: center;">
				<tr>
					<td>동호회명 : ${vo.club_name}</td>
				</tr>
				<tr>
					<td>대표자 : ${vo.club_master}</td>
				</tr>
				<tr>
					<td>분류 : ${vo.club_kind}</td>
				</tr>
				<tr>
					<td>지역 : ${vo.area}</td>
				</tr>
				<tr>
					<td>최대인원 : ${vo.club_max}</td>
				</tr>
				<tr>
					<td>소개 : ${vo.club_pr}</td>
				</tr>
				<tr>
					<td><button type="submit" class="button button-3d button-rounded"
							style="width: 300px;" onclick="window.history.back();">뒤로가기</button></td>
				</tr>
			</table>
		</div>
  	</section>
  </section>

</body>
</html>