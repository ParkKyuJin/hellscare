<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="SemiColonWeb" />
<!-- Stylesheets
	============================================= -->
<%@ include file="../include/setting.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- Document Title
	============================================= -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
</head>
<meta charset="UTF-8">
<body class="stretched">
<c:if test="${memId == null}">
	<script type="text/javascript">
		alert("로그인을 하셔야 이용하실수 있습니다.");
		window.location="login_reg";
	</script>
</c:if>
	<%@ include file="../include/header.jsp"%>
	<nav class="navbar navbar-light bg-light justify-content-between">
		<a class="navbar-brand" style="margin:0 auto;">동호회 목록</a>
	</nav>
	<br><br>
	<hr>

	<!-- Content
		============================================= -->
		<section id="content">
			<div class="content-wrap">
				<div class="container clearfix">
				<h4>내 동호회</h4>
				<table class="table table-hover" style="text-align: center;">
					<thead>
 						<tr>
							<th>동호회명</th>
							<th>대표자</th>
							<th>종류</th>
							<th>지역</th>
							<th>인원</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${myClubCnt == 0}">
							<tr>
								<th colspan="6">가입한 동호회가 없습니다.</th>
							</tr>
						</c:if>
						<c:if test="${myClubCnt != 0}">
							<c:if test="${vo1 != null}">
								<tr>
									<td style="vertical-align: middle">${vo1.club_name}</td>
									<td style="vertical-align: middle">${vo1.club_master}</td>
									<td style="vertical-align: middle">${vo1.club_kind}</td>
									<td style="vertical-align: middle">${vo1.area}</td>
									<td style="vertical-align: middle">${vo1.current_personnel}/${vo1.club_max}</td>
									<td style="vertical-align: middle; width: 350px;">
										<a href="details_Club?club_name=${vo1.club_name}&pageNum=${pageNum}"><button type="button" class="button button-large button-dark button-rounded">자세히</button></a>&emsp;&emsp;
									</td>
								</tr>
							</c:if>
							
							<c:if test="${vo2 != null}">
								<tr>
									<td style="vertical-align: middle">${vo2.club_name}</td>
									<td style="vertical-align: middle">${vo2.club_master}</td>
									<td style="vertical-align: middle">${vo2.club_kind}</td>
									<td style="vertical-align: middle">${vo2.area}</td>
									<td style="vertical-align: middle">${vo2.current_personnel}/${vo2.club_max}</td>
									<td style="vertical-align: middle; width: 350px;">
										<a href="details_Club?club_name=${vo2.club_name}&pageNum=${pageNum}"><button type="button" class="button button-large button-dark button-rounded">자세히</button></a>&emsp;&emsp;
									</td>
								</tr>
							</c:if>
							
							<c:if test="${vo3 != null}">
								<tr>
									<td style="vertical-align: middle">${vo3.club_name}</td>
									<td style="vertical-align: middle">${vo3.club_master}</td>
									<td style="vertical-align: middle">${vo3.club_kind}</td>
									<td style="vertical-align: middle">${vo3.area}</td>
									<td style="vertical-align: middle">${vo3.current_personnel}/${vo3.club_max}</td>
									<td style="vertical-align: middle; width: 350px;">
										<a href="details_Club?club_name=${vo3.club_name}&pageNum=${pageNum}"><button type="button" class="button button-large button-dark button-rounded">자세히</button></a>&emsp;&emsp;
									</td>
								</tr>
							</c:if>
						</c:if>
					</tbody>
				</table>
				</div>
				
				<div class="line"></div>
				
				<div class="container clearfix">
					<h4>동호회 목록</h4>
					<div class="table-responsive">
						<table id="datatable1" class="table table-striped table-bordered" cellspacing="0" style="text-align:center">
							<thead>
								<tr>
									<th style="cursor:pointer">동호회명</th>
									<th style="cursor:pointer">대표자</th>
									<th style="cursor:pointer">종류</th>
									<th style="cursor:pointer">지역</th>
									<th style="cursor:pointer">인원</th>
									<th>상세보기</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>동호회명</th>
									<th>대표자</th>
									<th>종류</th>
									<th>지역</th>
									<th>인원</th>
									<th>상세보기</th>
								</tr>
							</tfoot>
							<tbody>
							<c:if test="${cnt == 0}">
								<tr>
									<th colspan="6">현재 동호회목록이 없습니다.</th>
								</tr>
							</c:if>
							<c:if test="${cnt != 0}">
								<c:forEach var="dto" items="${dtos}">
									<c:if test="${dto.current_personnel != dto.club_max}">
										<tr>
											<td style="vertical-align: middle">${dto.club_name}</td>
											<td style="vertical-align: middle">${dto.club_master}</td>
											<td style="vertical-align: middle">${dto.club_kind}</td>
											<td style="vertical-align: middle">${dto.area}</td>
											<td style="vertical-align: middle">${dto.current_personnel} / ${dto.club_max}</td>
											<td style="vertical-align: middle; width: 200px;">
												<a href="details_Club?club_name=${dto.club_name}&pageNum=${pageNum}"><button type="button" class="button button-large button-dark button-rounded">자세히</button></a>
											</td>
										</tr>
									</c:if>
								</c:forEach>
							</c:if>
							</tbody>
						</table>
					</div>
				</div>
				
				<div class="line"></div>
				
				<div class="container clearfix" style="text-align:center;">
					<h3>원하시는 동호회가 없으십니까 ? &emsp;  <a href="makeClub"><button type="button" class="button button-large button-dark button-rounded">개설하기</button></a></h3>
				</div>
			</div>

		</section><!-- #content end -->
	
	<%@ include file="../include/footer.jsp"%>
	<%@ include file="../include/footerScript.jsp"%>
	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>

	<!-- External JavaScripts
	============================================= -->
	<script src="resources/js/jquery.js"></script>
	<script src="resources/js/plugins.js"></script>

	<!-- Bootstrap Data Table Plugin -->
	<script src="resources/js/components/bs-datatable.js"></script>

	<!-- Footer Scripts
	==============================dkwl=============== -->
	<script src="resources/js/functions.js"></script>

	<script>
		$(document).ready(function() {
			$('#datatable1').dataTable();
		});
	</script>
	
</body>
</html>