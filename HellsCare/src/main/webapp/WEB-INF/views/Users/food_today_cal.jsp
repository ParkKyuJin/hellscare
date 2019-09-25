<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="/hellscare/resources/ajax/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">
<title>오늘의 칼로리</title>
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
				<h1>오늘의 칼로리</h1>
				<span>오늘 섭취한 칼로리와 영양을 계산하고 분석합니다.</span>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="main">Home</a></li>
					<li class="breadcrumb-item"><a href="#">식단</a></li>
					<li class="breadcrumb-item active" aria-current="page">오늘의 칼로리</li>
				</ol>
			</div>

		</section><!-- #page-title end -->
		
			<!-- Content
		============================================= -->
		<section id="content">

			<div class="content-wrap">

				<div class="container clearfix">
				
					<c:if test="${sessionScope.memId == null}">
						<script type="text/javascript">
							alert("로그인 후 이용하십시오.");
							window.location = "login_reg";
						</script>
					</c:if>
					
					<c:if test="${sessionScope.memId != null}">
						<div class="row justify-content-center">
							<div class="col-lg-7 col-md-10">
								<div class="card shadow-sm">
									<div class="card-header">
										<h4 class="mb-0">섭취한 음식 입력</h4>
									</div>
									<div class="card-body">
	
										<div class="form-widget">
	
											<div class="form-result"></div>
	
											<div class="form-process css3-spinner">
												<div class="css3-spinner-double-bounce1"></div>
												<div class="css3-spinner-double-bounce2"></div>
											</div>
	
											<form class="nobottommargin" id="today_cal_form" 
												name="today_cal_form"
												method="post">
	
												<div class="row">
													<div class="col-12 bottommargin-sm">
														
														<h5>입력하신 음식들은 기록되어 <br>사용자 건강관리를 위한 데이터 제공에 활용됩니다.</h5>
													
														<input type="hidden" id="count" value="0">
														<table class="table" id="addTable">
															<tr>
																<td>
																	<input type="hidden" id="hidden0" value="0">
																	<label for="template-contactform-name">분류<small class="text-danger">*</small></label>
																	<select id="food_kind" name="food_kind" class="form-control">
																		<option value="0">선택 안함</option>
																		<option value="1">밥류</option>
																		<option value="2">면류</option>
																		<option value="3">국/찌개류</option>
																		<option value="4">탕/전골류</option>
																		<option value="5">고기류</option>
																		<option value="6">해산물류</option>
																		<option value="7">채소류</option>
																		<option value="8">과일류</option>
																		<option value="9">스낵류</option>
																		<option value="10">빙과류</option>
																		<option value="11">기타</option>
																	</select>
																	
																	<br>
																	<label for="template-contactform-name">음식명<small class="text-danger">*</small></label>
																	<input type="text" class="form-control" autocomplete="on" name="food_name" id="food_name">
																	
																	<div id="food_name_list" style="overflow:scroll; height:1%; display:none;"></div>
																	
																	<br>
																	<label for="template-contactform-number">인분<small class="text-danger">*</small></label>
																	<input type="number" class="form-control" name="food_count" id="food_count" min="1">
																</td>
															</tr>
														</table>
														
														<script src="//code.jquery.com/jquery.min.js"></script>
														<script src='//cdnjs.cloudflare.com/ajax/libs/jquery.devbridge-autocomplete/1.2.26/jquery.autocomplete.min.js'></script>
														
														<script type="text/javascript">
															var oTbl;
															var cellCount = document.getElementById("count").value;
															
															// Row추가
															function insRow() {
																oTbl = document.getElementById("addTable");
																cellCount++;
																
																var oRow = oTbl.insertRow();
																oRow.onmouseover = function(){ 
																	oTbl.clickedRowIndex = this.rowIndex
																};	// clickedRowIndex - 클릭한 Row의 위치를 확인;
																
																var oCell = oRow.insertCell();
																
																// 삽입될 Form Tag
																var frmTag = "<label for=template-contactform-name>분류<small class=text-danger>*</small></label>"
																			+ "<input type=hidden id=hidden" + cellCount + " value="+ cellCount + "> "
																			+ "<select name=food_kind class=form-control id=food_kind" +cellCount+" required>" 
																				+ "<option value=0>선택 안함</option>"
																				+ "<option value=1>밥류</option>"
																				+ "<option value=2>면류</option>"
																				+ "<option value=3>국/찌개류</option>"
																				+ "<option value=4>탕/전골류</option>"
																				+ "<option value=5>고기류</option>"
																				+ "<option value=6>해산물류</option>"
																				+ "<option value=7>채소류</option>"
																				+ "<option value=8>과일류</option>"
																				+ "<option value=9>스낵류</option>"
																				+ "<option value=10>빙과류</option>"
																				+ "<option value=11>기타</option>"
																			+ "</select>"
																			+ "<br>"
																			+ "<label for=template-contactform-name>음식명<small class=text-danger>*</small></label>"
																			+ "<input type=text class=form-control name=food_name id=food_name" +cellCount+" autocomplete=off required>"
																			+ "<div id=food_name_list" + cellCount +" style='overflow:scroll;height:1%;display:none;'></div>"
																			+ "<br>"
																			+ "<label for=template-contactform-number>인분<small class=text-danger>*</small></label>"
																			+ "<input type=number class=form-control name=food_count min=1 id=food_count" +cellCount+" required>"
																			+ "<br>";
																frmTag += "<input type=button class=form-control value='삭제' onclick='removeRow()' style='cursor:hand'>";
																oCell.innerHTML = frmTag;
																
																$("#addTable tr").focusin(function() {
																	var row = $(this).index();
																	// console.log("row : " + row);
																	
																	$(document.today_cal_form.food_kind[row]).change(function() {
																		var food_kind = $(this).val();
																		
																		$.ajax({
																			url : '${pageContext.request.contextPath}/food_find_equal_kind',
																			type : 'get',
																			data : 'food_kind=' + food_kind,
																			dataType : 'json',
																			success : function(data) {
																				var food_list = [];
																				
																				$.each(data, function(i, v){
																					food_list.push(v.food_name);
																				});
																				
																				var html = "<ul>";
																				$.each(data, function(i, v){
																					//console.log(i);
																					//console.log(v);
																					html += "<li><a href=javascript:setText(" + v.food_name +"); id=text"+i+">"+v.food_name+"</a></li>";
																				});
																				html += "</ul>";
																				
																				$("#food_name_list" + cellCount).html(html);
																				
																				if($("#food_kind" + cellCount).val() != 0) {
																					$("#food_name_list" + cellCount).css("display", "block");
																				} else {
																					$("#food_name_list" + cellCount).css("display", "none");
																				}
																				
																				$("#food_name_list" + cellCount + " ul li a").click(function() {
																					var index = $(this).parent().index();
																					
																					/* console.log("index : " + index);
																					console.log("selected food_name : " + $("#text" + index).text()); */
																					
																					$("#food_name" + cellCount).val($("#text" + index).text());
																					
																					$("#food_name_list" + cellCount).css("display", "none");
																				});
																				
																				$("#food_count" + cellCount).focusout(function() {
																					if($("#food_count" + cellCount).val() < 1) {
																						alert("음식 인분은 1개 이상으로 해주십시오.");
																						return false;
																					}
																				});
																				
																				
																			},
																			error : function() {
																				alert("오류");
																			}
																		});
																	});
																});
																
																document.getElementById("count").value = cellCount;
															}
															
															// Row 삭제
															function removeRow() {
																oTbl.deleteRow(oTbl.clickedRowIndex);
															}
														</script>
														
														<script type="text/javascript">
															var cnt = document.getElementById("count").value;
															
															$(document).ready(function() {
																$("#food_kind").change(function() {
																	var food_kind = $(this).val();
																	
																	$.ajax({
																		url : '${pageContext.request.contextPath}/food_find_equal_kind',
																		type : 'get',
																		data : 'food_kind=' + food_kind,
																		dataType : 'json',
																		success : function(data) {
																			var food_list = [];
																			
																			$.each(data, function(i, v){
																				food_list.push(v.food_name);
																			});
																			
																			var html = "<ul>";
																			$.each(data, function(i, v){
																				//console.log(i);
																				//console.log(v);
																				html += "<li><a href=# name=food"+i+" id=text"+i+" value="+v.food_name+ ">"+v.food_name+"</a></li>";
																			});
																			html += "</ul>";
																			
																			$("#food_name_list").html(html);
																			
																			if($("#food_kind").val() != 0) {
																				$("#food_name_list").css("display", "block");
																			} else {
																				$("#food_name_list").css("display", "none");
																			}
																			
																			$("#food_name_list ul li a").click(function() {
																				var index = $(this).parent().index();
																				
																				/* console.log("index : " + index);
																				console.log("selected food_name : " + $("#text" + index).text()); */
																				
																				$("#food_name").val($("#text" + index).text());
																				
																				$("#food_name_list").css("display", "none");
																			});
																		},
																		error : function() {
																			alert("오류");
																		}
																	});
																});
															});
														</script>
														
														<script type="text/javascript">
															
															$(document).ready(function() {
																$("#food_count").focusout(function () {
																	if($("#food_count").val() < 1) {
																		alert("음식 인분은 1개 이상으로 해주십시오.");
																		return false;
																	}
																});
															});
														
														</script>
														
														<script type="text/javascript">
															$(document).ready(function() {
																$("#submit").click(function() {
																	$.ajax({
																		url : '${pageContext.request.contextPath}/food_today_cal_sub',
																		type : 'get',
																		data : $("#today_cal_form").serialize(),
																		success : function(data) {
																			$('#kcalResult').html(data);
																		},
																		error : function() {
																			alert("오류");
																		}
																	});
																});
															});
														</script>
														
														<script type="text/javascript">
															$(document).ready(function() {
																$("#showNoInput").click(function() {
																	$.ajax({
																		url : '${pageContext.request.contextPath}/food_today_cal_no_input',
																		type : 'get',
																		success : function(data) {
																			$('#kcalResult').html(data);
																		},
																		error : function() {
																			alert("오류");
																		}
																	});
																});
															});
														</script>
													</div>
													
													<button type="button" id="add" name="add" class="btn btn-secondary btn-block btn-lg" onclick="insRow();">입력 추가</button>
													
													<button type="submit" id="submit" name="template-contactform-submit" class="btn btn-secondary btn-block btn-lg">입력 완료</button>
													
													<button type="button" id="showNoInput" name="showNoInput" class="btn btn-secondary btn-block btn-lg" onclick="showNoInput();">결과 보기</button>
												</div>
	
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:if>
						
					<br><br><br>
					
					<div id="kcalResult"></div>

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
	
	<!-- External JavaScripts
	============================================= -->
	<script src="${project}js/jquery.js"></script>
	<script src="${project}js/plugins.js"></script>

	<%@ include file="../include/footerScript.jsp"%>
</body>
</html>