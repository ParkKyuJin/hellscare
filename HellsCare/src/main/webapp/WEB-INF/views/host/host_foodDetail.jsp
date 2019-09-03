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
	<%@ include file="../include/setting.jsp" %>
	<meta name="viewport" content="width=device-width, initial-scale=1" />


  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>음식 상세 정보</title>

  <!-- Favicons -->
  <link href="resources/img/favicon.png" rel="icon">
  <link href="resources/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="resources/css2/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="resources/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="resources/css2/zabuto_calendar.css">
  <link rel="stylesheet" type="text/css" href="resources/lib/gritter/css/jquery.gritter.css" />
  <!-- Custom styles for this template -->
  <link href="resources/css2/style.css" rel="stylesheet">
  <link href="resources/css2/style-responsive.css" rel="stylesheet">
  <script src="resources/lib/chart-master/Chart.js"></script>

  <!-- =======================================================
    Template Name: Dashio
    Template URL: https://templatemag.com/dashio-bootstrap-admin-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
  
  <script type="text/javascript">
  	function deleteFood() {
  		if(confirm("삭제하시겠습니까?") == false) {
  			return false;
  		} else {
  			window.location='host_foodDeletePro?pageNum=${pageNum}&food_code=${food.food_code}';
  		}
  	}
  </script>
</head>

<body>

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
  
      <div class="row mt">
          <div class="col-lg-12">
            <div class="form-panel">
             <h4 class="mb"><i class="fa fa-angle-right"></i> 음식 상세 정보 </h4>
              <div class="form">
                <form class="cmxform form-horizontal style-form" id="food_detail" name="food_detail" 
                	method="post" action="host_foodModifyForm?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
                <input type="hidden" id="pageNum" name="pageNum" value="${pageNum}">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                
                <div class="form-group ">
                    <label for="food_name" class="control-label col-lg-2">음식 코드</label>
                    <div class="col-lg-4">
                      ${food.food_code}
                      <input type="hidden" id="food_code" name="food_code" value="${food.food_code}">
                    </div>
                  </div>
                
                  <div class="form-group ">
                    <label for="food_name" class="control-label col-lg-2">음식 이름</label>
                    <div class="col-lg-4">
                      ${food.food_name}
                      <input type="hidden" id="food_name" name="food_name" value="${food.food_name}">
                    </div>
                  </div>
                  
                  <div class="form-group ">
                    <label for="food_img" class="control-label col-lg-2">음식 이미지</label>
                    <div class="col-lg-4">
                      <img src="/hellscare/resources/images/food/${food.food_img}" style="width:128px; height:128px;">
                      <input type="hidden" id="food_img" name="food_img" value="${food.food_img}">
                    </div>
                  </div>
                  
                  <div class="form-group ">
                    <label for="quantity" class="control-label col-lg-2">권장 섭취량(단위:g)</label>
                    <div class="col-lg-4">
                      ${food.quantity}
                      <input type="hidden" id="quantity" name="quantity" value="${food.quantity}">
                    </div>
                  </div>
                  
                  <div class="form-group">
                  	<label for="food_kind" class="control-label col-lg-2">음식 종류</label>
                  	<div class="col-lg-4">
                  		${food.food_kind}
                  		<input type="hidden" id="food_kind" name="food_kind" value="${food.food_kind}">
                  	</div>
                  </div>
                  
                  <div class="form-group ">
                    <label for="kcal" class="control-label col-lg-2">칼로리(단위:kcal)</label>
                    <div class="col-lg-4">
                     	${food.kcal}
                     	<input type="hidden" id="kcal" name="kcal" value="${food.kcal}">
                    </div>
                  </div>
                  
                  <div class="form-group ">
                    <label for="carbohydrate" class="control-label col-lg-2">탄수화물(단위:g)</label>
                    <div class="col-lg-4">
                    	${food.carbohydrate}
                    	<input type="hidden" id="carbohydrate" name="carbohydrate" value="${food.carbohydrate}">
                    </div>
                  </div>
                  
                  <div class="form-group ">
                    <label for="protein" class="control-label col-lg-2">단백질(단위:g)</label>
                    <div class="col-lg-4">
						${food.protein}
						<input type="hidden" id="protein" name="protein" value="${food.protein}">
                    </div>
                  </div>
                  
                  <div class="form-group ">
                    <label for="fat" class="control-label col-lg-2">지방(단위:g)</label>
                    <div class="col-lg-4">
                    	${food.fat}
                    	<input type="hidden" id="fat" name="fat" value="${food.fat}">
                    </div>
                  </div>
                  
                  <div class="form-group ">
                    <label for="saccharides" class="control-label col-lg-2">당류(단위:g)</label>
                    <div class="col-lg-4">
                    	${food.saccharides}
                    	<input type="hidden" id="saccharides" name="saccharides" value="${food.saccharides}">
                    </div>
                  </div>
                  
                  <div class="form-group ">
                    <label for="salt" class="control-label col-lg-2">나트륨(단위:mg)</label>
                    <div class="col-lg-4">
                    	${food.salt}
                    	<input type="hidden" id="salt" name="salt" value="${food.salt}">
                    </div>
                  </div>
                  
                  <div class="form-group ">
                    <label for="cholesterol" class="control-label col-lg-2">콜레스테롤(단위:mg)</label>
                    <div class="col-lg-4">
                    	${food.cholesterol}
                    	<input type="hidden" id="cholesterol" name="cholesterol" value="${food.cholesterol}">
                    </div>
                  </div>
                  
                  <div class="form-group ">
                    <label for="saturation" class="control-label col-lg-2">포화지방산(단위:g)</label>
                    <div class="col-lg-4">
                    	${food.saturation}
                    	<input type="hidden" id="saturation" name="saturation" value="${food.saturation}">
                    </div>
                  </div>
                  
                  <div class="form-group ">
                    <label for="trans" class="control-label col-lg-2">트랜스지방산(단위:g)</label>
                    <div class="col-lg-4">
                    	${food.trans}
                    	<input type="hidden" id="trans" name="trans" value="${food.trans}">
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                      <button class="btn btn-theme" type="submit">수정</button>
                      <button class="btn btn-theme04" type="button" onclick="deleteFood();">삭제</button>
                      <button class="btn btn-theme04" type="button" onclick="window.history.back()">뒤로가기</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
            <!-- /form-panel -->
          </div>
          <!-- /col-lg-12 -->
        </div>
        <!-- /row -->

				</div>

			</div>

		</section><!-- #content end -->

      
  
      </section>
    </section>
    <!--main content end-->
    
  </div><!-- #wrapper end -->
</body>
</html>