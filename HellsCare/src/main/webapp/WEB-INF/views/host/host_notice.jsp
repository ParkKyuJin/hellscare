<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="../include/h_sidebarMenu.jsp"%>
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
 <!--  <link href="resources/img/favicon.png" rel="icon">
  <link href="resources/img/apple-touch-icon.png" rel="apple-touch-icon">

  Bootstrap core CSS
  <link href="resources/css2/bootstrap.min.css" rel="stylesheet">
  external css
  <link href="resources/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="resources/css2/zabuto_calendar.css">
  <link rel="stylesheet" type="text/css" href="resources/lib/gritter/css/jquery.gritter.css" />
  Custom styles for this template
  <link href="resources/css2/style.css" rel="stylesheet">
  <link href="resources/css2/style-responsive.css" rel="stylesheet"> -->

  <!-- =======================================================
    Template Name: Dashio
    Template URL: https://templatemag.com/dashio-bootstrap-admin-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
</head>

<script type="text/javascript">
	$(function() {
		$("#all_check").change(function() {
			var is_check = $(this).is(":checked"); // this는 전체선택용 체크박스
			$(".remove").prop("checked", is_check);
		});
	});
</script>

<body>
  <section id="container">
  
    <!--sidebar end-->
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
   
   <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> Basic Table Examples</h3>
        <div class="row">
          <!-- /col-md-12 -->
          <div class="col-md-12 mt">
            <div class="content-panel">
              <table class="table table-hover">
                <h4><i class="fa fa-bullhorn"></i> 공지사항 </h4>
                <hr>
                <thead>
                  <tr>
                  	<th><input type="checkbox" name="all_remove" id="all_check"></th>
                    <th>#</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>조회수</th>
                    <th>작성일</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach var="dto" items="${dtos}" >
                	<input type="hidden" name="board_code" class=""board_code"" value="${dto.board_code}">
                  <tr>
                  	<td style="vertical-align: middle"><input type="checkbox" name="remove2" class="remove" value="${dto.rNum}"></td>
                    <td>${dto.rNum}</td>
                    <td><a href="host_noticeContent?board_code=${dto.board_code}">${dto.title}</a></td>
                    <td>${dto.username}</td>
                    <td>${dto.readCnt}</td>
                    <td>${dto.write_date}</td>
                  </tr>
                 </c:forEach>
                </tbody>
              </table>
              &nbsp;&nbsp;&nbsp;<a href="notice_write"><button type="button" class="btn btn-primary">공지사항 작성</button></a>
              &nbsp;<a href="notice_write"><button type="button" class="btn btn-primary">삭제</button></a>
            </div>
          </div>
          <!-- /col-md-12 -->
        </div>

      </section>
    </section>
   
   
    <!--main content end-->
    <!--footer start-->
  
    <!--footer end-->
  </section>
   <!-- js placed at the end of the document so the pages load faster -->
<!--   <script src="resources/lib/jquery/jquery.min.js"></script>
  <script src="resources/lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="resources/lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="resources/lib/jquery.scrollTo.min.js"></script>
  <script src="resources/lib/jquery.nicescroll.js" type="text/javascript"></script>
  common script for all pages
  <script src="resources/lib/common-scripts.js"></script> -->


</body>
</html>