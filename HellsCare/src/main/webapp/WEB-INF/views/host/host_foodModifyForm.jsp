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
  <title>음식 등록</title>

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
             <h4 class="mb"><i class="fa fa-angle-right"></i> 음식 등록 </h4>
              <div class="form">
                <form class="cmxform form-horizontal style-form" id="food_modify" name="food_modify" 
                	method="post" action="host_foodModifyPro?${_csrf.parameterName}=${_csrf.token}" onsubmit="return foodModifyCheck();" enctype="multipart/form-data">
				
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}">
				<input type="hidden" name="food_code" value="${food.food_code}">
				
				<div class="form-group ">
                    <label for="food_code" class="control-label col-lg-2">음식 코드</label>
                    <div class="col-lg-4">
                      <input class="form-control" id="food_name" name="food_name" value="${food.food_code}" type="text" readonly>
                    </div>
                  </div>
                  
                  <div class="form-group ">
                    <label for="food_name" class="control-label col-lg-2">음식 이름</label>
                    <div class="col-lg-4">
                      <input class="form-control" id="food_name" name="food_name" type="text" required value="${food.food_name}">
                    </div>
                  </div>
                  
                  <div class="form-group ">
                    <label for="food_img" class="control-label col-lg-2">음식 이미지</label>
                    <div class="col-lg-4">
                      <input type="hidden" id="food_old_img" name="food_old_img" value="${food.food_img}" >
                      <input type="file" class="form-control" id="food_img" name="food_img" required>
                    </div>
                    <div class="col-lg-4">
                    	<img src="/hellscare/resources/images/food/${food.food_img}" style="width:128px; height:128px;">
                    </div>
                  </div>
                  
                  <div class="form-group ">
                    <label for="quantity" class="control-label col-lg-2">권장 섭취량(단위:g)</label>
                    <div class="col-lg-4">
                      <input class="form-control" id="quantity" name="quantity" type="number" min="0" required value="${food.quantity}">
                    </div>
                  </div>
                  
                  <div class="form-group">
                  	<label for="food_kind" class="control-label col-lg-2">음식 종류</label>
                  	<div class="col-lg-2">
                  		<select class="form-control" id="food_kind" name="food_kind" onchange="inPersonModify();">
							<option value="0" ${food.food_kind  == ""? "selected" : ""}>선택 안함</option>
                  			<option value="1" ${food.food_kind  == "1"? "selected" : ""}>밥류</option>
                  			<option value="2" ${food.food_kind  == "2"? "selected" : ""}>면류</option>
                  			<option value="3" ${food.food_kind  == "3"? "selected" : ""}>국/찌개류</optino>
                  			<option value="4" ${food.food_kind  == "4"? "selected" : ""}>탕/전골</option>
                  			<option value="5" ${food.food_kind  == "5"? "selected" : ""}>고기류</option>
                  			<option value="6" ${food.food_kind  == "6"? "selected" : ""}>해산물류</option>
                  			<option value="7" ${food.food_kind  == "7"? "selected" : ""}>채소류</option>
                  			<option value="8" ${food.food_kind  == "8"? "selected" : ""}>과일류</option>
                  			<option value="9" ${food.food_kind  == "9"? "selected" : ""}>스낵</option>
                  			<option value="10" ${food.food_kind  == "10"? "selected" : ""}>빙과류</option>
                  			<option value="11" ${food.food_kind  == "11"? "selected" : ""}>직접입력</option>
                  		</select>
                  	</div>
                  	
                  	<div class="col-lg-2" id="inPersonInput" style="display:none;">
                  		<input class="form-control" id="inputInPerson" name="inputInPerson" type="text">
                  	</div>
                  	
                  </div>
                  
                  <div class="form-group ">
                    <label for="kcal" class="control-label col-lg-2">칼로리(단위:kcal)</label>
                    <div class="col-lg-4">
                      <input class="form-control" id="kcal" name="kcal" type="number" min="0" value="${food.kcal}">
                    </div>
                  </div>
                  
                  <div class="form-group ">
                    <label for="carbohydrate" class="control-label col-lg-2">탄수화물(단위:g)</label>
                    <div class="col-lg-4">
                      <input class="form-control" id="carbohydrate" name="carbohydrate" type="number" min="0" value="${food.carbohydrate}">
                    </div>
                  </div>
                  
                  <div class="form-group ">
                    <label for="protein" class="control-label col-lg-2">단백질(단위:g)</label>
                    <div class="col-lg-4">
                      <input class="form-control" id="protein" name="protein" type="number" min="0" value="${food.protein}">
                    </div>
                  </div>
                  
                  <div class="form-group ">
                    <label for="fat" class="control-label col-lg-2">지방(단위:g)</label>
                    <div class="col-lg-4">
                      <input class="form-control" id="fat" name="fat" type="number" min="0" value="${food.fat}">
                    </div>
                  </div>
                  
                  <div class="form-group ">
                    <label for="saccharides" class="control-label col-lg-2">당류(단위:g)</label>
                    <div class="col-lg-4">
                      <input class="form-control" id="saccharides" name="saccharides" type="number" min="0" value="${food.saccharides}">
                    </div>
                  </div>
                  
                  <div class="form-group ">
                    <label for="salt" class="control-label col-lg-2">나트륨(단위:mg)</label>
                    <div class="col-lg-4">
                      <input class="form-control" id="salt" name="salt" type="number" min="0" value="${food.salt}">
                    </div>
                  </div>
                  
                  <div class="form-group ">
                    <label for="cholesterol" class="control-label col-lg-2">콜레스테롤(단위:mg)</label>
                    <div class="col-lg-4">
                      <input class="form-control" id="cholesterol" name="cholesterol" type="number" min="0" value="${food.cholesterol}">
                    </div>
                  </div>
                  
                  <div class="form-group ">
                    <label for="saturation" class="control-label col-lg-2">포화지방산(단위:g)</label>
                    <div class="col-lg-4">
                      <input class="form-control" id="saturation" name="saturation" type="number" min="0" value="${food.saturation}">
                    </div>
                  </div>
                  
                  <div class="form-group ">
                    <label for="trans" class="control-label col-lg-2">트랜스지방산(단위:g)</label>
                    <div class="col-lg-4">
                      <input class="form-control" id="trans" name="trans" type="number" min="0" value="${food.trans}">
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                      <button class="btn btn-theme" type="submit">수정</button>
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
      
<!--         ADVANCED FILE INPUT
        <div class="row mt">
        
          <div class="col-lg-12">
            <div class="form-panel">
              <form action="#" class="form-horizontal style-form">
              <table>
              <tr>
              <td>
                <div class="form-group">
                  <label class="control-label col-md-3">Default</label>
                  <div class="col-md-4">
                    <input type="file" class="default" />
                  </div>
                </div>
               </td>
               <td>
                <div class="form-group">
                  <label class="control-label col-md-3">Without input</label>
                  <div class="controls col-md-9">
                    <div class="fileupload fileupload-new" data-provides="fileupload">
                      <span class="btn btn-theme02 btn-file">
                        <span class="fileupload-new"><i class="fa fa-paperclip"></i> Select file</span>
                      <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                      <input type="file" class="default" />
                      </span>
                      <span class="fileupload-preview" style="margin-left:5px;"></span>
                      <a href="advanced_form_components.html#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                    </div>
                  </div>
                </div>
                </td>
                </tr>
                <tr>

                <div class="form-group last">
                <td>
                  <label class="control-label col-md-3">Image Upload</label>
                  </td>
                  <td>
                  <div class="col-md-9">
                    <div class="fileupload fileupload-new" data-provides="fileupload">
                      <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                        <img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&text=no+image" alt="" />
                      </div>
                      
                      <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
                      <div>
                        <span class="btn btn-theme02 btn-file">
                          <span class="fileupload-new"><i class="fa fa-paperclip"></i> Select image</span>
                        <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                        <input type="file" class="default" />
                        </span>
                        <a href="advanced_form_components.html#" class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash-o"></i> Remove</a>
                      </div>
                    </div>
                    <span class="label label-info">NOTE!</span>
                    <span>
                      Attached image thumbnail is
                      supported in Latest Firefox, Chrome, Opera,
                      Safari and Internet Explorer 10 only
                      </span>
                  </div>
                </div>
                </table>
              </form>
            </div>
            /form-panel
          </div>
          /col-lg-12
        </div>
        row -->
          

				</div>

			</div>

		</section><!-- #content end -->

      
  
      </section>
    </section>
    <!--main content end-->
    
  </div><!-- #wrapper end -->

	<script>
		function inPersonModify() {
			var inPersonInput = document.food_modify.food_kind.value;
			
			if(inPersonInput == 11) {
				$("#inPersonInput").css("display", "");
			} else {
				$("#inPersonInput").css("display", "none");
			}
		}
		
		function foodRegCheck() {
			if(document.food_modify.food_kind.value == 0) {
				alert("음식 종류를 선택해주세요!");
				return false;
			} else if(document.food_modify.food_kind.value == 11 && 
						document.food_modify.inputInPerson.value == null) {
				alert("음식 종류를 입력해주세요!");
			}
		}
	</script>

</body>
</html>