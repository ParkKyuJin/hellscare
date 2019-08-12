<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ include file="../include/h_sidebarMenu.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="SemiColonWeb" />
<!-- Stylesheets
	============================================= -->

<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- Document Title
	============================================= -->
<title>Canvas | The Multi-Purpose HTML5 Template</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>Dashio - Bootstrap Admin Template</title>

  
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

	<nav class="navbar navbar-light bg-light justify-content-between">
		<a class="navbar-brand" style="margin:0 auto;">동호회 목록</a>
	</nav>
	<br><br>
		<div class="container clearfix">
			
			<table class="table table-hover" style="text-align:center;">
				<thead>
					<tr>
						<th>번호</th>
						<th>동호회명</th>
						<th>대표자</th>
						<th>인원</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>Mark</td>
						<td>Otto</td>
						<td>11</td>
						<td><i class="i-rounded i-bordered icon-check"></i><i class="i-rounded i-bordered icon-remove"></i></td>
					</tr>
					<tr>
						<td>2</td>
						<td>Jacob</td>
						<td>Thornton</td>
						<td>22</td>
						<td><i class="i-rounded i-bordered icon-check"></i><i class="i-rounded i-bordered icon-remove"></i></td>
					</tr>
					<tr>
						<td>3</td>
						<td>sfd</td>
						<td>sdf</td>
						<td>33</td>
						<td><i class="i-rounded i-bordered icon-check"></i><i class="i-rounded i-bordered icon-remove"></i></td>
					</tr>
				</tbody>
			</table>
	</div>
    <!--footer start-->
    <footer class="site-footer">
      <div class="text-center">
        <p>
          &copy; Copyrights <strong>Dashio</strong>. All Rights Reserved
        </p>
        <div class="credits">
          <!--
            You are NOT allowed to delete the credit link to TemplateMag with free version.
            You can delete the credit link only if you bought the pro version.
            Buy the pro version with working PHP/AJAX contact form: https://templatemag.com/dashio-bootstrap-admin-template/
            Licensing information: https://templatemag.com/license/
          -->
          Created with Dashio template by <a href="https://templatemag.com/">TemplateMag</a>
        </div>
        <a href="index.html#" class="go-top">
          <i class="fa fa-angle-up"></i>
          </a>
      </div>
    </footer>
    <!--footer end-->
  </section>
  <!-- js placed at the end of the document so the pages load faster -->
  

</body>
</html>