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
  <title>Dashio - Bootstrap Admin Template</title>


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
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
      <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
      </div>
      <!--logo start-->
      <a href="host_main" class="logo"><b>HEALTH<span>CARE</span></b></a>
      <!--logo end-->
      <div class="top-menu" >
        <ul class="nav pull-right top-menu" >
          <li style="margin:0px 0px 10px 0px;"><a class="logout" href="logout">Logout</a></li>
        </ul>
      </div>
     
    </header>
    <!--header end-->
    <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
   
    <aside>
   
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
          <p class="centered"><a href="#"><img src="resources/img/ui-sam.jpg" class="img-circle" width="80"></a></p>
          <h5 class="centered">쀼팀장</h5>
          <li class="sub-menu">
            <a href="javascript:;">
           
              <i class="fa fa-dashboard"></i>
              <span>정보관리</span>
              </a>
              <ul class="sub">
              <li><a href="host_exercise">운동관리</a></li>
              <li><a href="host_disease">질병관리</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-desktop"></i>
              <span>회원관리</span>
              </a>
            <ul class="sub">
              <li><a href="host_userList">회원목록</a></li>
              <li><a href="host_userChart">회원통계</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-cogs"></i>
              <span>식단관리</span>
              </a>
            <ul class="sub">
              <li><a href="host_foodList">음식 조회</a></li>
              <li><a href="host_foodRegForm">음식 등록</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-book"></i>
              <span>게시판 관리</span>
              </a>
            <ul class="sub">
              <li><a href="host_notice">공지사항 관리</a></li>
              <li><a href="host_board">게시글 관리</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-tasks"></i>
              <span>동호회 관리</span>
              </a>
						<ul class="sub">
							<li><a href="host_clubManagement">동호회 관리</a></li>
							<li><a href="host_clubManage">동호회 가입승인/거절</a></li>
							<li><a href="host_total">동호회 결산</a></li>
						</ul>
					</li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-tasks"></i>
              <span>이벤트 관리</span>
              </a>
            <ul class="sub">
              <li><a href="host_challenge">도전과제 관리</a></li>
            </ul>
          </li>
          <li>
            <a href="host_qna">
              <i class="fa fa-th"></i>
              <span>QnA 관리</span>
            </a>
          </li>
        </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
 </section>
    <!--sidebar end-->
    
    <!-- js placed at the end of the document so the pages load faster -->
  <script src="resources/host_style/lib/jquery/jquery.min.js"></script>

  <script src="resources/host_style/lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="resources/lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="resources/host_style/lib/jquery.scrollTo.min.js"></script>
  <script src="resources/host_style/lib/jquery.nicescroll.js" type="text/javascript"></script>
  <script src="resources/host_style/lib/jquery.sparkline.js"></script>
  <!--common script for all pages-->
  <script src="resources/host_style/lib/common-scripts.js"></script>
  <script type="text/javascript" src="resources/host_style/lib/gritter/js/jquery.gritter.js"></script>
  <script type="text/javascript" src="resources/host_style/lib/gritter-conf.js"></script>
  <!--script for this page-->
  <script src="resources/host_style/lib/sparkline-chart.js"></script>
  <script src="resources/host_style/lib/zabuto_calendar.js"></script>
  <script src="resources/host_style/js/jquery.js"></script>
  <script src="resources/host_style/plugins.js"></script>
  <script src="resources/host_style/js/functions.js"></script>
 	
 	
 	 <script src="resources/host_style/lib/jquery-ui-1.9.2.custom.min.js"></script>
  <script type="text/javascript" src="resources/host_style/lib/bootstrap-fileupload/bootstrap-fileupload.js"></script>
  <script type="text/javascript" src="resources/host_style/lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
  <script type="text/javascript" src="resources/host_style/lib/bootstrap-daterangepicker/date.js"></script>
  <script type="text/javascript" src="resources/host_style/lib/bootstrap-daterangepicker/daterangepicker.js"></script>
  <script type="text/javascript" src="resources/host_style/lib/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
  <script type="text/javascript" src="resources/host_style/lib/bootstrap-daterangepicker/moment.min.js"></script>
  <script type="text/javascript" src="resources/host_style/lib/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
  <script src="resources/host_style/lib/advanced-form-components.js"></script>

</body>
</html>
    
    
    
    