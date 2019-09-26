<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>

	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />

	<!-- Stylesheets
	============================================= -->
	<meta name="viewport" content="width=device-width, initial-scale=1" />


  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>음식 조회</title>

  <!-- Favicons -->
<link href="resources/img/favicon.png" rel="icon">
  <link href="resources/img/apple-touch-icon.png" rel="apple-touch-icon">

  <link href="resources/css2/bootstrap.min.css" rel="stylesheet">
  <link href="resources/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="resources/css2/zabuto_calendar.css">
  <link rel="stylesheet" type="text/css" href="resources/lib/gritter/css/jquery.gritter.css" />
  <link href="resources/css2/style.css" rel="stylesheet">
  <link href="resources/css2/style-responsive.css" rel="stylesheet">
  <script src="resources/lib/chart-master/Chart.js"></script>
  
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

  <!-- =======================================================
    Template Name: Dashio
    Template URL: https://templatemag.com/dashio-bootstrap-admin-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
</head>

<body>
  <section id="container">
   <!-- **********************************************************************************************************************************************************
     h_sidebarMenu.jsp:
        TOP BAR CONTENT & NOTIFICATIONS
        & MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
  	<%@ include file="../include/h_sidebarMenu.jsp" %>
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
  

    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
    
        <!-- row -->
        <div class="row mt">
          <div class="col-md-12">
            <div class="content-panel">
            	<div class="container clearfix">
					<form action="host_foodListDeletePro" class="nobottommargin" name="deleteform" onsubmit="return confirmCheckboxSelected();">
						<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}"> 
						<table class="table table-hover" style="text-align: center;">
							<h4><i class="fa fa-angle-right"></i> 음식 조회 </h4>
							<thead>
								<tr>
									<th><input type="checkbox" name="all_remove"
										id="all_check"></th>
									<th><center><i class="fa fa-bullhorn"></i> 음식명</center></th>
				                    <th><center>음식 이미지</center></th>
				                    <th class="hidden-phone"><center><i class="fa fa-question-circle"></i> 음식 코드</center></th>
				                    <th><center><i class="fa fa-bookmark"></i>칼로리</center></th>
				                    <th><center><i class=" fa fa-edit"></i>용량</center></th>
				                    <th><center>음식 종류</center></th>
				                    <th><center>상세조회</center></th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${cnt == 0}">
									<tr>
										<th colspan="8"><center>현재 등록하신 음식이 없습니다. 음식을 등록해주세요.</center></th>
									</tr>
								</c:if>
								<c:if test="${cnt != 0}">
									<c:set var="selectedCnt" value="0" />
									<c:forEach var="food" items="${foodList}">
										<tr>
											<td style="vertical-align: middle; align: center;">
											
												<input type="checkbox" name="food_code" 
													class="remove" value="${food.food_code}">
											</td>
											<td style="vertical-align: middle; align: center;">
												${food.food_name}
											</td>
											<td style="vertical-align: middle; align: center;">
												<img src="/hellscare/resources/images/food/${food.food_img}" width="200px" height="150px">
											</td>
											<td style="vertical-align: middle; align: center;">
												${food.food_code}
											</td>
											<td style="vertical-align: middle; align: center;">${food.kcal}</td>
											<td style="vertical-align: middle; align: center;">${food.quantity}</td>
											<td style="vertical-align: middle; align: center;">
												<c:if test="${food.food_kind == 1}">
													밥류
												</c:if>
												
												<c:if test="${food.food_kind == 2}">
													면류
												</c:if>
												
												<c:if test="${food.food_kind == 3}">
													국/찌개류
												</c:if>
												
												<c:if test="${food.food_kind == 4}">
													탕/전골류
												</c:if>
												
												<c:if test="${food.food_kind == 5}">
													고기
												</c:if>
												
												<c:if test="${food.food_kind == 6}">
													해산물
												</c:if>
												
												<c:if test="${food.food_kind == 7}">
													채소
												</c:if>
												
												<c:if test="${food.food_kind == 8}">
													과일
												</c:if>
												
												<c:if test="${food.food_kind == 9}">
													스낵
												</c:if>
												
												<c:if test="${food.food_kind == 10}">
													빙과류
												</c:if>
												
												<c:if test="${food.food_kind > 10}">
													기타
												</c:if>
												
											</td>
											<td style="vertical-align: middle; align: center;">
												<a href="host_foodDetail?food_code=${food.food_code}&pageNum=${pageNum}">
													<button type="button" class="button button-large button-dark button-rounded" style="width:90px;">조회</button>
												</a>
												<a href="host_foodModifyForm?food_code=${food.food_code}&pageNum=${pageNum}">
													<button type="button" class="button button-large button-dark button-rounded" style="width:90px;">수정</button>
												</a>
											</td>
										</tr>
									</c:forEach>
								</c:if>
								
								<script type="text/javascript">

								//체크 박스 선택 삭제
								function confirmCheckboxSelected() { 	 
									var f = document.deleteform;
									var count=0;
									var v_id = f.food_code.value;
									// alert(id);
									for(var i=0; i<f.food_code.length; i++){
										if(f.food_code[i].checked){
											count++;
									    }
								    }
								    if(count > 0){
								        if(confirm("선택된 항목을 삭제하시겠습니까?")){
								        	deleteform.action="host_foodListDeletePro";
								        	deleteform.submit();
								        }
								    } else {
								        alert("선택된 항목이 없습니다.");
								        
								        return false;
								    }
								    
								}
								
								</script>
								
							</tbody>
						</table>

						<table class="table table-hover" style="text-align: center;">
							<td style="margin-left: 0px;">
								<button type="submit" class="button button-large button-dark button-rounded" style="float:left">삭제하기</button>
								<button type="button" class="button button-large button-dark button-rounded" style="float:left" onclick="window.location='host_foodRegForm'">추가하기</button>
								
							</td>
							<th style="padding-right:320px; vertical-align:middle;">
								<!-- 게시글이 있으면  --> <c:if test="${cnt > 0}">
									<!-- 처음[◀◀] / 이전블록[◀] -->
									<c:if test="${startPage > pageBlock}">
										<a href="host_foodList">[◀◀]</a>
										<a href="host_foodList?pageNum=${startPage - pageBlock}">[◀]</a>
									</c:if>

									<!-- 블록내의 페이지 번호  -->
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:if test="${i == currentPage}">
											<span><b style="background: rigthgreen">[${i}]</b></span>
										</c:if>

										<c:if test="${i != currentPage}">
											<span><b><a href="host_foodList?pageNum=${i}">[${i}]</a></b></span>
										</c:if>
									</c:forEach>

									<!-- 다음블록[▶] / 마지막[▶▶]  -->
									<c:if test="${pageCount > endPage}">
										<a href="host_foodList?pageNum=${startPage + pageBlock}">▶</a>
										<a href="host_foodList?pageNum=${pageCount}">▶▶</a>
									</c:if>
								</c:if>
							</th>
						</table>
						</form>
					</div>
            </div>
            <!-- /content-panel -->

				</div>

			</div>

		</section><!-- #content end -->

      
  
      </section>
    </section>
    <!--main content end-->
    
  </div><!-- #wrapper end -->
  
  <script type="text/javascript">
	$(function() {
		$("#all_check").change(function() {
			var is_check = $(this).is(":checked"); // this는 전체선택용 체크박스
			$(".remove").prop("checked", is_check);
		});
		
		$(".remove").click(function() {  // 개별선택
			$("#all_check").prop("checked", false);
		});
	});
	</script>


</body>
</html>