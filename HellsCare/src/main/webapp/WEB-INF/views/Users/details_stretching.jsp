<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	font-size: 14px;
}
</style>
<body>
	<!--sidebar end-->
	<%@ include file="../include/header.jsp"%>
	<nav class="navbar navbar-light bg-light justify-content-between">
		<a class="navbar-brand" style="margin: 0 auto;"><c:if
				test="${part == 1}">목</c:if> <c:if test="${part == 2}">어깨</c:if> <c:if
				test="${part == 3}">허리</c:if> <c:if test="${part == 4}">골반</c:if> <c:if
				test="${part == 5}">다리</c:if> <c:if test="${part == 6}">손목,발목</c:if>
			스트레칭</a>
	</nav>
	<br>
	<br>
	<br>
	<div class="tab-content clearfix col_" id="tabs-38">
		<div class="container clearfix">
			<form action="deleteExercise" class="nobottommargin"
				onsubmit="return checkReview();" name="deleteform">
				<table class="table table-hover" style="text-align: center;">
					<thead>
						<tr>
							<th>운동명</th>
							<th>이미지</th>
							<th>운동종류</th>
							<th>소모칼로리</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${dtos}">
							<tr>
								<td style="vertical-align: middle">${dto.exercise_name}</td>
								<td style="vertical-align: middle"><img
									src="/hellscare/resources/video/${dto.exercise_img}"
									width="200px" height="150px"></td>
								<td style="vertical-align: middle"><c:if
										test="${dto.kind == 1}">스트레칭</c:if> <c:if
										test="${dto.kind == 2}">유산소운동</c:if></td>
								<td style="vertical-align: middle">${dto.kcal}kcal</td>
								<td style="vertical-align: middle;"><a
									href="details_exercise?exercise_code=${dto.exercise_code}&pageNum=${pageNum}"><button
											type="button"
											class="button button-large button-dark button-rounded">자세히보기</button></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
	</div>

	<div class="sidebar nobottommargin col_last clearfix">
		<div class="widget widget_links clearfix">
			<h4>부위별 스트레칭</h4>
			<ul>
				<li><a href="details_stretching?part=1"
					style="font-weight: bold">목</a></li>
				<li><a href="details_stretching?part=2"
					style="font-weight: bold">어깨</a></li>
				<li><a href="details_stretching?part=3"
					style="font-weight: bold">허리</a></li>
				<li><a href="details_stretching?part=4"
					style="font-weight: bold">골반</a></li>
				<li><a href="details_stretching?part=5"
					style="font-weight: bold">다리</a></li>
				<li><a href="details_stretching?part=6"
					style="font-weight: bold">손목,발목</a></li>
			</ul>
		</div>
	</div>
	</section>
</body>
</html>