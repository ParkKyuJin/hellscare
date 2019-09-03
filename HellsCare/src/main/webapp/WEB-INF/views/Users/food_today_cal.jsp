<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	var oTbl = document.getElementById("addTable");
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
		var frmTag = "<lable for=template-contactform-name>분류<small class=text-danger>*</small></label>" 
					+ "<select name=food_kind class=form-control id=food_kind" + oTbl.clickedRowIndex +" required>" 
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
					+ "<lable for=template-contactform-name>음식명<small class=text-danger>*</small></label>"
					+ "<input type=text class=form-control name=food_name id=food_name required>"
					+ "<div id=find_food_name></div>"
					+ "<br>"
					+ "<lable for=template-contactform-number>인분<small class=text-danger>*</small></label>"
					+ "<input type=number class=form-control name=food_count min=1 id=food_count" + oTbl.clickedRowIndex +" required>"
					+ "<br>";
		frmTag += "<input type=button class=form-control value='삭제' onclick='removeRow()' style='cursor:hand'>";
		oCell.innerHTML = frmTag;
		
		document.getElementById("count").value = cellCount;
	}
	
	// Row 삭제
	function removeRow() {
		document.getElementById("count").value = cellCount - 1;
		oTbl.deleteRow(oTbl.clickedRowIndex);
	}
	
	/* $(document).ready(function() {
		$("#food_kind" + oTbl.clickedRowIndex).onchange(function() {
			
			alert("음식 종류 : " + $("#food_kind" + oTbl.clickedRowIndex).val());
			
			var food_kind = $("#food_kind" + oTbl.clickedRowIndex).val();
			
			$.ajax({
				url : '${pageContext.request.contextPath}/food_find_equal_kind?food_kind='+ food_kind,
				type : 'get',
				success : function(data) {
					if (!$('#food_kind' + oTbl.clickedRowIndex).val()) {
						$("#find_food_name" + oTbl.clickedRowIndex).css('display', 'none');
					} else {
						$("#find_food_name" + oTbl.clickedRowIndex).css('display', '');
					}
					
					if (data != null) {
						// 1. 아이디가 중복되는 문구
						// $("#id_check").text("사용중인 동호회명입니다.");
						// $("#id_check").css("color","red");
						$("#find_food_name" + oTbl.clickedRowIndex).html(data);
					} else {
						// $("#id_check").text("사용가능한 동호회명입니다.");
						// $("#id_check").css("color","green");
						$("#find_food_name" + oTbl.clickedRowIndex).html(data);
					}
				},
				error : function() {
					alert("오류");
				}
			});
		});
	}); */
</script>

<script src="/hellscare/resources/ajax/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function getKcalResult() {
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
	}
	
	$(document).ready(function() {
		$('select').change(function() {
			var food_kind = $(this).val();
			
			$.ajax({
				url : '${pageContext.request.contextPath}/food_find_equal_kind',
				type : 'get',
				data : 'food_kind=' + food_kind,
				success : function(data) {
					$('#food_find_name1').html(data);
				},
				error : function() {
					alert("오류");
				}
			});
		});
	}); 
</script>

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
							alert("로그인 후 이용해주세요!");
							window.location = 'login_reg';
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
												name="today_cal_form" action="food_today_cal_sub?${_csrf.parameterName}=${_csrf.token}" 
												method="post" onsubmit="return getKcalResult();">
	
												<div class="row">
													<div class="col-12 bottommargin-sm">
														
														<h5>입력하신 음식들은 기록되어 사용자 건강관리를 위한 데이터 제공에 활용됩니다.</h5>
													
														<input type="hidden" id="count" value="1">
														<table class="table" id="addTable">
															<tr>
																<td>
																	<label for="template-contactform-name">분류<small class="text-danger">*</small></label>
																	<select id="food_kind1" name="food_kind" class="form-control">
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
																	<input type="text" class="form-control" name="food_name" id="food_name1">
																	
																	<div id="find_food_name1"></div>
																	
																	<br>
																	<label for="template-contactform-number">인분<small class="text-danger">*</small></label>
																	<input type="number" class="form-control" name="food_count" id="food_count1" min="1">
																</td>
															</tr>
														</table>
														
													</div>
													
													<button type="button" id="add" name="template-contactform" class="btn btn-secondary btn-block btn-lg" onclick="insRow();">입력 추가</button>
													
													<button type="submit" name="template-contactform-submit" class="btn btn-secondary btn-block btn-lg">입력 완료</button>
	
												</div>
	
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<br><br><br>
						
						<div id="kcalResult"></div>
					</c:if>

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