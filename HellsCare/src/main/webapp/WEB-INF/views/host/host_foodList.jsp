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
	<%@ include file="../include/setting.jsp" %>
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
              <table class="table table-striped table-advance table-hover">
                <h4><i class="fa fa-angle-right"></i> 음식 조회 </h4>
                <hr>
                <thead>
                  <tr>
                    <th><i class="fa fa-bullhorn"></i> 음식명</th>
                    <th class="hidden-phone"><i class="fa fa-question-circle"></i> 음식 코드</th>
                    <th><i class="fa fa-bookmark"></i> 일일 권장 칼로리</th>
                    <th><i class=" fa fa-edit"></i> 권장 섭취량</th>
                    <th>음식 종류</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>
                      <a href="basic_table.html#">현미밥</a>
                    </td>
                    <td class="hidden-phone">R001</td>
                    <td>123 kcal </td>
                    <td><span class="label label-info label-mini">50 g</span></td>
                    <td>밥류</td>
                    <td>
                      <button class="btn btn-light btn-xs"  onclick="location.href='medi_reg' ">등록</button>
                      <button class="btn btn-light btn-xs" onclick="location.href='medi_reg' ">수정</button>
                      <button class="btn btn-light btn-xs">삭제</button>
                    </td>
                  </tr>
                  
                  <tr>
                    <td>
                      <a href="basic_table.html#">김치찌개</a>
                    </td>
                    <td class="hidden-phone">S001</td>
                    <td>256 kcal </td>
                    <td><span class="label label-info label-mini">100 g</span></td>
                    <td>찌개류</td>
                    <td>
                      <button class="btn btn-light btn-xs"  onclick="location.href='medi_reg' ">등록</button>
                      <button class="btn btn-light btn-xs" onclick="location.href='medi_reg' ">수정</button>
                      <button class="btn btn-light btn-xs">삭제</button>
                    </td>
                  </tr>
                  
                  <tr>
                    <td>
                      <a href="basic_table.html#">삼겹살</a>
                    </td>
                    <td class="hidden-phone">M001</td>
                    <td>100 kcal </td>
                    <td><span class="label label-info label-mini">80 g</span></td>
                    <td>반찬류</td>
                    <td>
                      <button class="btn btn-light btn-xs"  onclick="location.href='medi_reg' ">등록</button>
                      <button class="btn btn-light btn-xs" onclick="location.href='medi_reg' ">수정</button>
                      <button class="btn btn-light btn-xs">삭제</button>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <!-- /content-panel -->

				</div>

			</div>

		</section><!-- #content end -->

      
  
      </section>
    </section>
    <!--main content end-->
    
  </div><!-- #wrapper end -->


</body>
</html>