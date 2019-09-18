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
  <title>Dashio - Bootstrap Admin Template</title>

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
		<h3> <b>질병정보관리</b> <i class="fa fa-angle-right"></i> <b>질병정보등록</b></h3>
      <div class="row mt">
          <div class="col-lg-11">
            <div class="form-panel">
             <h4 class="mb"><i class="fa fa-angle-right"></i> 질병 정보 등록 </h4>
              <div class="form">
              
                <form class="cmxform form-horizontal style-form" id="diseaseRegForm" method="post" action="host_diseaseRegPro">
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> 
                  <div class="form-group ">
                    <label for="disease_code" class="control-label col-lg-2">질병코드</label>
                    <div class="col-lg-7">
                      <input class="form-control " id="disease_code" name="disease_code" type="text" maxlength="50" oninput="checkCode();" autofocus required />                      
                    </div>
                    <div class="col-lg-2" id="chkMsg"></div>
                  </div>
                  <div class="form-group ">
                    <label for="d_category" class="control-label col-lg-2">분류</label>
                    <div class="col-lg-9">
                      <input class=" form-control" id="d_category" name="d_category" type="text" maxlength="50" required/>
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="disease_name" class="control-label col-lg-2">질병명</label>
                    <div class="col-lg-9">
                      <input class=" form-control" id="disease_name" name="disease_name" type="text" maxlength="50" required/>
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="definition" class="control-label col-lg-2">정의</label>
                    <div class="col-lg-9">
                      <textarea class="form-control " id="definition" name="definition" rows="6" required></textarea>
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="cause" class="control-label col-lg-2">원인</label>
                    <div class="col-lg-9">
                      <textarea class="form-control " id="cause" name="cause" rows="6" required></textarea>
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="symptom" class="control-label col-lg-2">증상</label>
                    <div class="col-lg-9">
                      <textarea class="form-control " id="symptom" name="symptom" rows="6" required></textarea>
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="cure" class="control-label col-lg-2">치료</label>
                    <div class="col-lg-9">
                      <textarea class="form-control " id="cure" name="cure" rows="6" required></textarea>
                    </div>
                  </div>
               
               	<!-- 버튼 -->
                  <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-9">
                      <button class="btn btn-theme" id="btnSubmit" type="submit">등록하기</button>
                      <button class="btn btn-theme04" type="button" onclick="refresh();">재작성</button>
                      <button class="btn btn-theme02 btn-danger" type="button" onclick="location.href='host_disease'">목록으로</button>
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
      

	</section><!-- #content end -->
</section>
   
  <!--main content end-->    
  <!-- #wrapper end -->
  
<script type="text/javascript">
function refresh() {
	$("#disease_code").val("");
	$("#d_category").val("");
	$("#disease_name").val("");	
	$("#definition").val("");
	$("#cause").val("");
	$("#symptom").val("");
	$("#cure").val("");
	$('#chkMsg').html("");
	
}

function checkCode(){
    var disease_code = $('#disease_code').val().toUpperCase();
    $.ajax({
        url:'codeDuplChk',
        type:'GET',
        data:{disease_code:disease_code},
        success:function(data){
        	if(data==0){
                $('#chkMsg').html("<span style='color:blue;'>사용가능</span>");
                $('#btnSubmit').prop("disabled", false);
            }else if(data==1){
                $('#chkMsg').html("<span style='color:red;'>사용불가</span>");
                $('#btnSubmit').prop("disabled", true);
            }
        },
        error:function(){
                alert("오류");
        }
    });
}

</script>

</body>
</html>