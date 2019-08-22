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
	font-size: 14px;
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
<body>
	<!--sidebar end-->
	<section id="main-content">
		<section class="wrapper">
			<div class="tabs tabs-alt tabs-justify clearfix" id="tab-10">
				<br><br>
				<ul class="tab-nav clearfix">
					<li style="width: 50%;"><a
						href="#tabs-38" style="font-size: 27px;">운동 목록</a></li>
					<li class="hidden-phone" style="width: 50%;"><a
						href="#tabs-40" style="font-size: 27px;">운동 등록</a></li>
				</ul>

				<div class="tab-container">
					<div class="tab-content clearfix" id="tabs-38">
						<div class="container clearfix">
						<form action="deleteExercise" class="nobottommargin" onsubmit="return checkReview();" name="deleteform">
							<table class="table table-hover" style="text-align: center;">
								<thead>
									<tr>
										<th><input type="checkbox" name="all_remove"
											id="all_check"></th>
										<th>대표이미지</th>
										<th>영상</th>
										<th>운동명</th>
										<th>운동방법</th>
										<th>운동부위</th>
										<th>칼로리</th>
										<th>주의사항</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${cnt == 0}">
										<tr>
											<th colspan="8">현재 등록하신 운동이 없습니다. 운동을 등록해주세요.</th>
										</tr>
									</c:if>
									<c:if test="${cnt != 0}">
										<c:forEach var="dto" items="${dtos}">
											<tr>
												<td style="vertical-align: middle"><input
													type="checkbox" name="remove2" class="remove"
													value="${dto.exercise_code}"></td>
												<td style="vertical-align: middle">
													<img src="/hellscare/resources/video/${dto.exercise_img}" width="200px" height="150px">
												</td>
												<td style="vertical-align: middle">
												<video controls	src="/hellscare/resources/video/${dto.exercise_video}"
														width="200px" height="150px">
													</video></td>
												<td style="vertical-align: middle">${dto.exercise_name}</td>
												<td style="vertical-align: middle">
													<c:if test="${fn:length(dto.way) > 10}">
														   <c:out value="${fn:substring(dto.way,0,9)}"/>···
													</c:if>
													
													<c:if test="${fn:length(dto.way) <= 10}">
														${dto.way}
													</c:if>
												</td>
												<td style="vertical-align: middle"><c:if
														test="${dto.part == null}">유산소운동</c:if> <c:if
														test="${dto.part == 1}">목	</c:if> <c:if
														test="${dto.part == 2}">어깨</c:if> <c:if
														test="${dto.part == 3}">골반</c:if> <c:if
														test="${dto.part == 4}">다리</c:if> <c:if
														test="${dto.part == 5}">손목,발목</c:if></td>
												<td style="vertical-align: middle">${dto.kcal}kcal</td>
												<td style="vertical-align: middle">
													<c:if test="${fn:length(dto.note) > 10}">
														<c:out value="${fn:substring(dto.note,0,9)}"/>···
													</c:if>
													
													<c:if test="${fn:length(dto.note) <= 10}">
														${dto.note}
													</c:if>
												</td>
												<td style="vertical-align: middle;">
													<a href="modifyExercise?exercise_code=${dto.exercise_code}&pageNum=${pageNum}"><button type="button" class="button button-large button-dark button-rounded" style="width:90px;">수정</button></a>
												</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>

							<table class="table table-hover" style="text-align: center;">
								<td style="margin-left: 0px;"><button type="submit"
									class="button button-large button-dark button-rounded" style="float:left">삭제하기</button>
								</td>
								<th style="padding-right:320px; vertical-align:middle">
									<!-- 게시글이 있으면  --> <c:if test="${cnt > 0}">
										<!-- 처음[◀◀] / 이전블록[◀] -->
										<c:if test="${startPage > pageBlock}">
											<a href="host_exercise">[◀◀]</a>
											<a href="host_exercise?pageNum=${startPage - pageBlock}">[◀]</a>
										</c:if>

										<!-- 블록내의 페이지 번호  -->
										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<c:if test="${i == currentPage}">
												<span><b style="background: rigthgreen">[${i}]</b></span>
											</c:if>

											<c:if test="${i != currentPage}">
												<span><b><a href="host_exercise?pageNum=${i}">[${i}]</a></b></span>
											</c:if>
										</c:forEach>

										<!-- 다음블록[▶] / 마지막[▶▶]  -->
										<c:if test="${pageCount > endPage}">
											<a href="host_exercise?pageNum=${startPage + pageBlock}">▶</a>
											<a href="host_exercise?pageNum=${pageCount}">▶▶</a>
										</c:if>
									</c:if>
								</th>
							</table>
							</form>
						</div>
					</div>

					<div class="tab-content clearfix" id="tabs-40">
						<div class="content-wrap">
							<div class="row clearfix">
								<div class="col-lg-6" style="margin: 0 auto;">
									<form name="exerciseAddForm" class="nobottommargin"
										action="host_exerciseAddPro" method="post"
										onsubmit="return addCheck();" enctype="multipart/form-data">

										<div class="col_full">
											<label for="exname">운동명</label> <input type="text"
												id="exname" name="name" class="sm-form-control"
												placeholder="운동명을 입력해주세요." required>
										</div>
										<div class="clear"></div>
										<div class="col_half">
											<label for="image2">대표 이미지</label> <input type="file"
												id="image2" name="img" class="sm-form-control"
												required>
										</div>
										<div class="col_half">
											<label for="video2">영상</label> <input type="file"
												id="video2" name="video" class="sm-form-control"
												required>
										</div>
										<div class="col_full">
											<div class="bottommargin-sm">
												<label>종류</label> <select id="selectbox"
													class="sm-form-control" name="kind" style="width: 100%;"
													onchange="chg_kind();">
													<option value="0">종류를 선택해주세요.</option>
													<option value="1">스트레칭</option>
													<option value="2">다이어트 운동</option>
												</select>
											</div>
										</div>

										<div class="col_full">
											<div class="bottommargin-sm">
												<label>운동부위</label> <select name="part"
													class="sm-form-control" style="width: 100%;"
													id="partselect">
													<option value="0">운동 부위를 선택해주세요.</option>
													<option value="1">목</option>
													<option value="2">어깨</option>
													<option value="3">골반</option>
													<option value="4">다리</option>
													<option value="5">손목,발목</option>
												</select>
											</div>
										</div>

										<div class="col_full">
											<label for="bang">운동방법</label>
											<textarea id="bang" name="way" cols="58" rows="7"
												tabindex="4" class="sm-form-control"
												placeholder="운동방법을 입력해주세요." required></textarea>
											</textarea>
										</div>

										<div class="col_full">
											<label for="ju">주의사항</label>
											<textarea id="ju" name="note" cols="58" rows="7" tabindex="4"
												class="sm-form-control" placeholder="주의사항을 입력해주세요." required></textarea>
											</textarea>
										</div>

										<div class="col_full">
											<label for="somo">소모칼로리</label><small>(30분기준 / 단위 :
												kcal)</small> <input type="number" id="somo" name="kcal"
												class="sm-form-control" style="width: 100px;" required>
										</div>
										<br>
										<br>
										<button type="submit" class="button button-3d button-rounded"
											style="width: 670px;">등록하기</button>
									</form>
								</div>
							</div>
						</div>
					</div>

				</div>

			</div>
		</section>
	</section>
	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>

	<!-- External JavaScripts
	============================================= -->
	<script src="resources/js/plugins.js"></script>

	<!-- Footer Scripts
	============================================= -->
	<script src="resources/js/functions.js"></script>
	<script type="text/javascript">
		function chg_kind() {
			var kind = document.getElementById('selectbox').value;
			if (kind == 2) {
				$('#partselect').attr('disabled', true);
				document.getElementById('partselect').value = 0;
			} else {
				$('#partselect').attr('disabled', false);
			}
		}

		// 전송시 체크해주는 부분
		function addCheck() {
			var check = document.exerciseAddForm;

			if (check.kind.value == 0) {
				alert("종류를 선택해주세요.!!");
				return false;
			} else if (check.part.value == 0 && check.kind.value != 2) {
				alert("운동부위를 선택해주세요.!!");
				return false;
			} else if (check.kcal.value < 0) {
				alert("소모칼로리를 다시 입력해주세요.!!");
				return false;
			}
		}

		// 삭제버튼 눌렀을시 운동선택했는지 여부
		function checkReview(){
			var temp = false;
			if(${cnt} == 0){
				alert("현재 삭제하실 운동이없습니다.");
				return false;
			}
			if(!document.deleteform.remove2.length){
				temp = document.deleteform.remove2.checked;
				if(temp){
					var yn = confirm("선택하신 운동을 삭제하시겠습니까?");
					if(yn){
						return true;
					} else{
						return false;	
					}
				}
			} else{
				for(var i=0; i<document.deleteform.remove2.length; i++){
					alert("temp : " + temp)
					temp = document.deleteform.remove2[i].checked;
					if(temp){
						var yn = confirm("선택하신 운동을 삭제하시겠습니까?");
						if(yn){
							return true;
						} else{
							return false;	
						}
					}
				}
			}
			if(!temp){
				alert("운동을 하나이상 선택해주세요.");
				return false;
			}
			return false;
		}
	</script>

</body>
</html>