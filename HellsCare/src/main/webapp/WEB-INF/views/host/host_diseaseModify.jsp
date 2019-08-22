<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
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
		<h3> <b>질병정보관리</b> <i class="fa fa-angle-right"></i> <b>질병정보상세보기</b></h3>
      <div class="row mt">
          <div class="col-lg-12">
            <div class="form-panel">
             <h4 class="mb"><i class="fa fa-angle-right"></i> 질병 정보 상세보기 </h4>
              <div class="form">
              
                <form class="cmxform form-horizontal style-form" id="diseaseModifyForm" method="post" action="host_diseaseModifyPro">
                	<input class="form-control" type="hidden" name="pageNum" value="${pageNum }">
                 
                  <div class="form-group ">
                    <label for="disease_code" class="control-label col-lg-2">질병코드</label>
                    <div class="col-lg-10">
                    	${dto.disease_code}
                      <input class="form-control" id="disease_code" name="disease_code" type="hidden" maxlength="50" value="${dto.disease_code }"/>
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="d_category" class="control-label col-lg-2">분류</label>
                    <div class="col-lg-10">
                      <input class=" form-control" id="d_category" name="d_category" type="text" maxlength="50" value="${dto.d_category }" autofocus required/>
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="disease_name" class="control-label col-lg-2">질병명</label>
                    <div class="col-lg-10">
                      <input class=" form-control" id="disease_name" name="disease_name" type="text" maxlength="50" value="${dto.disease_name }" required/>
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="definition" class="control-label col-lg-2">정의</label>
                    <div class="col-lg-10">
                      <textarea class="form-control " id="definition" name="definition" rows="5" required>${dto.definition }</textarea>
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="cause" class="control-label col-lg-2">원인</label>
                    <div class="col-lg-10">
                      <textarea class="form-control " id="cause" name="cause" rows="5" required>${dto.cause }</textarea>
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="symptom" class="control-label col-lg-2">증상</label>
                    <div class="col-lg-10">
                      <textarea class="form-control " id="symptom" name="symptom" rows="5" required>${dto.symptom }</textarea>
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="cure" class="control-label col-lg-2">치료</label>
                    <div class="col-lg-10">
                      <textarea class="form-control " id="cure" name="cure" rows="5" required>${dto.cure }</textarea>
                    </div>
                  </div>
               
               	<!-- 버튼 -->
                  <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                      <button class="btn btn-theme" type="submit">수정하기</button>
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
		</div>
	</div>  row end -->

	</section><!-- #content end -->
</section>
   
  <!--main content end-->    
  <!-- #wrapper end -->
  
<script type="text/javascript">
function refresh() {
	$("#disease_code").val("");
	$("#disease_name").val("");	
	$("#definition").val("");
	$("#cause").val("");
	$("#symptom").val("");
	$("#cure").val("");	
}

</script>

</body>
</html>