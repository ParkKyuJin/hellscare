<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
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
  <!-- 여기 고치ㅡㅁㄴ 됨!! -->
  <link href="resources/host_style/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="resources/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="resources/css2/zabuto_calendar.css">
  <link rel="stylesheet" type="text/css" href="resources/lib/gritter/css/jquery.gritter.css" />
  <!-- Custom styles for this template -->
  <link href="resources/css2/style.css" rel="stylesheet">
  <link href="resources/css2/style-responsive.css" rel="stylesheet">

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
      <a href="index.html" class="logo"><b>HEALTH<span>CARE</span></b></a>
      <!--logo end-->
      <div class="top-menu">
        <ul class="nav pull-right top-menu">
          <li><a class="logout" href="login.html">Logout</a></li>
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
          <p class="centered"><a href="profile.html"><img src="resources/img/ui-sam.jpg" class="img-circle" width="80"></a></p>
          <h5 class="centered">쀼팀장</h5>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-dashboard"></i>
              <span>정보관리</span>
              </a>
              <ul class="sub">
              <li><a href="general.html">운동관리</a></li>
              <li><a href="buttons.html">질병관리</a></li>
              <li><a href="panels.html">약 관리</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-desktop"></i>
              <span>회원관리</span>
              </a>
            <ul class="sub">
              <li><a href="general.html">이용자관리</a></li>
              <li><a href="buttons.html">이용자통계</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-cogs"></i>
              <span>식단관리</span>
              </a>
            <ul class="sub">
              <li><a href="grids.html">음식 조회</a></li>
              <li><a href="calendar.html">음식 등록</a></li>
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
              <li><a href="form_component.html">동호회 가입승인/거절</a></li>
              <li><a href="advanced_form_components.html">동호회 해체승인</a></li>
              <li><a href="form_validation.html">동호회 결산</a></li>
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
    <!--sidebar end-->
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
   <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> 공지사항 </h3>
        <!-- BASIC FORM ELELEMNTS -->
        <div class="row mt">
          <div class="col-lg-12 col-md-12 col-sm-12">
            <h4 class="title">공지사항</h4>
            <br>
            <div id="message"></div>
            
            <form class="contact-form php-mail-form" role="form" action="notice_modify" method="POST">
              <div class="form-group">
                제목<input type="text" name="subject" class="form-control" id="contact-subject" value="${dto.title}" data-rule="minlen:4" disabled="disabled">
                <div class="validate"></div>
              </div>
              
              <div class="form-group">
              	 등록일<input type="text" value="${dto.write_date}" disabled="disabled"  class="form-control">
              	<br>
                                     조회수<input type="text"  value="${dto.readCnt}" disabled="disabled"  class="form-control">
              </div>

              <div class="form-group">
                내용<textarea class="form-control" name="message" id="contact-message"  rows="5" data-rule="required" data-msg="Please write something for us" disabled="disabled">${dto.content}</textarea>
                <div class="validate"></div>
              </div>

              <div class="loading"></div>
              <div class="error-message"></div>
              <div class="sent-message">Your message has been sent. Thank you!</div>

              <div class="form-send">
                <button type="submit" class="btn btn-large btn-primary" onclick="javascript: form.action='notice_modify?board_code=${dto.board_code}'">수정</button>
                <button type="submit" class="btn btn-large btn-primary" onclick="javascript: form.action='board_delete?board_code=${dto.board_code}'">삭제</button>
                <button type="submit" class="btn btn-large btn-primary" onclick="javascript: form.action='host_notice'">취소</a></button>
              </div>

            </form>
          </div>

         
        </div>
        <!-- /row -->


        <!-- /row -->
      </section>
      <!-- /wrapper -->
    </section>

    <!--main content end-->
    <!--footer start-->
    <footer class="site-footer">
      <div class="text-center">
        <p>
          &copy; Copyrights <strong>Dashio</strong>. All Rights Reserved
        </p>
        
        <a href="index.html#" class="go-top">
          <i class="fa fa-angle-up"></i>
          </a>
      </div>
    </footer>
    <!--footer end-->
  </section>
   <!-- js placed at the end of the document so the pages load faster -->
  <script src="resources/lib/jquery/jquery.min.js"></script>
  <script src="resources/lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="resources/lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="resources/lib/jquery.scrollTo.min.js"></script>
  <script src="resources/lib/jquery.nicescroll.js" type="text/javascript"></script>
  <!--common script for all pages-->
  <script src="resources/lib/common-scripts.js"></script>


</body>
</html>