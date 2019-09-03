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
<script type="text/javascript">
	$(function() {
		$("#all_check").change(function() {
			var is_check = $(this).is(":checked"); // this는 전체선택용 체크박스
			$(".remove").prop("checked", is_check);
		});
	});
</script>
<html>
<body>
 <section id="main-content">
	<section class="wrapper">
		<div class="tabs tabs-alt tabs-justify clearfix" id="tab-10">
		<nav class="navbar navbar-light bg-light justify-content-between" style="text-align:center;">
			<h2 style="padding-top:30px;">동호회 관리</h2>
		</nav>
		<br><br>
			<form action="host_existenceClubRemove" class="nobottommargin" onsubmit="return checkReview();" name="deleteform">
				<table class="table table-hover" style="text-align: center;">
					<thead>
 						<tr>
							<th><input type="checkbox" name="all_remove"
								id="all_check"></th>
							<th>동호회명</th>
							<th>대표자</th>
							<th>종류</th>
							<th>지역</th>
							<th>최대인원</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${cnt == 0}">
							<tr>
								<th colspan="7">현재 신청한 동호회목록이 없습니다.</th>
							</tr>
						</c:if>
						<c:if test="${cnt != 0}">
							<c:forEach var="dto" items="${dtos}">
								<tr>
									<td style="vertical-align: middle">
									<input type="checkbox" name="remove2" class="remove" value="${dto.club_name}"></td>
									<td style="vertical-align: middle">${dto.club_name}</td>
									<td style="vertical-align: middle">${dto.club_master}</td>
									<td style="vertical-align: middle">${dto.club_kind}</td>
									<td style="vertical-align: middle">${dto.area}</td>
									<td style="vertical-align: middle">${dto.club_max}</td>
									<td style="vertical-align: middle; width: 350px;">
										<a href="host_ClubDetail?club_name=${dto.club_name}&pageNum=${pageNum}"><button type="button" class="button button-large button-dark button-rounded">자세히</button></a>&emsp;&emsp;
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
				
				<input type="hidden" name="pageNum" value="${pageNum}">
				
				<table class="table table-hover" style="text-align: center;">
					<tr>
					<td style="margin-left: 0px;"><button type="submit"
						class="button button-large button-dark button-rounded" style="float:left">삭제하기</button>
					</td>
					<th style="padding-right:320px; vertical-align:middle">
						<!-- 게시글이 있으면  --> <c:if test="${cnt > 0}">
							<!-- 처음[◀◀] / 이전블록[◀] -->
							<c:if test="${startPage > pageBlock}">
								<a href="host_clubManage">[◀◀]</a>
								<a href="host_clubManage?pageNum=${startPage - pageBlock}">[◀]</a>
							</c:if>

							<!-- 블록내의 페이지 번호  -->
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == currentPage}">
									<span><b style="background: rigthgreen">[${i}]</b></span>
								</c:if>

								<c:if test="${i != currentPage}">
									<span><b><a href="host_clubManage?pageNum=${i}">[${i}]</a></b></span>
								</c:if>
							</c:forEach>

							<!-- 다음블록[▶] / 마지막[▶▶]  -->
							<c:if test="${pageCount > endPage}">
								<a href="host_clubManage?pageNum=${startPage + pageBlock}">▶</a>
								<a href="host_clubManage?pageNum=${pageCount}">▶▶</a>
							</c:if>
						</c:if>
					</th>
					</tr>
				</table>
				</form>
			</div>
  </section>
  </section>

	<script type="text/javascript">
	// 삭제버튼 눌렀을시 운동선택했는지 여부
	function checkReview(){
		var temp = false;
		if(${cnt} == 0){
			alert("현재 삭제하실 동호회가 없습니다.");
			return false;
		}
		if(!document.deleteform.remove2.length){
			temp = document.deleteform.remove2.checked;
			if(temp){
				var yn = confirm("선택하신 동호회를 삭제하시겠습니까?");
				if(yn){
					return true;
				} else{
					return false;	
				}
			}
		} else{
			for(var i=0; i<document.deleteform.remove2.length; i++){
				temp = document.deleteform.remove2[i].checked;
				if(temp){
					var yn = confirm("선택하신 동호회를 삭제하시겠습니까?");
					if(yn){
						return true;
					} else{
						return false;	
					}
				}
			}
		}
		if(!temp){
			alert("동호회를 하나이상 선택해주세요.");
			return false;
		}
		return false;
	}
</script>

</body>
</html>