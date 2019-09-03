<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
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
    <!--main content start-->

    <section id="main-content">
      <section class="wrapper">          	
      	<h3> <b>회원관리</b> <i class="fa fa-angle-right"></i> <b>회원통계</b></h3>
      	<input type="hidden" id="female" value="${genderChart['Female']}">
      	<input type="hidden" id="male" value="${genderChart['Male']}">
      	<input type="hidden" id="total" value="${genderChart['total']}">
      	        
        <!-- page start-->
        <div class="tab-pane" id="chartjs">
       
          <div class="row mt">
      
            <div class="col-lg-6">
              <div class="content-panel">
                <h4><i class="fa fa-angle-right"></i> 회원 성별 분포(%)</h4>
                <div class="panel-body">
                  <div id="hero-donut" class="graph"></div>
                </div>       
              </div>
            </div>
            <div class="col-lg-6">
              <div class="content-panel">
                <h4><i class="fa fa-angle-right"></i> 성별 회원수</h4>
                <div class="panel-body">
                  <div id="hero-bar" class="graph"></div>
                </div>
              </div>
            </div>

            
          </div>         
 
          
        </div>
        <!-- page end-->
      </section>
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
    
    
    

    <section id="main-content" style ="margin-left: 300px;">
      <section class="wrapper">
    <div class="row">
          <div class="col-lg-9 main-chart">
            <!--CUSTOM CHART START -->
            <div class="border-head">
              <h3>회원 방문수(작업중)</h3>
            </div>
            <div class="custom-bar-chart">
              <ul class="y-axis">
                <li><span>10.000</span></li>
                <li><span>8.000</span></li>
                <li><span>6.000</span></li>
                <li><span>4.000</span></li>
                <li><span>2.000</span></li>
                <li><span>0</span></li>
              </ul>
              <div class="bar">
                <div class="title">JAN</div>
                <div class="value tooltips" data-original-title="8.500" data-toggle="tooltip" data-placement="top">85%</div>
              </div>
              <div class="bar ">
                <div class="title">FEB</div>
                <div class="value tooltips" data-original-title="5.000" data-toggle="tooltip" data-placement="top">50%</div>
              </div>
              <div class="bar ">
                <div class="title">MAR</div>
                <div class="value tooltips" data-original-title="6.000" data-toggle="tooltip" data-placement="top">60%</div>
              </div>
              <div class="bar ">
                <div class="title">APR</div>
                <div class="value tooltips" data-original-title="4.500" data-toggle="tooltip" data-placement="top">45%</div>
              </div>
              <div class="bar">
                <div class="title">MAY</div>
                <div class="value tooltips" data-original-title="3.200" data-toggle="tooltip" data-placement="top">32%</div>
              </div>
              <div class="bar ">
                <div class="title">JUN</div>
                <div class="value tooltips" data-original-title="6.200" data-toggle="tooltip" data-placement="top">62%</div>
              </div>
              <div class="bar">
                <div class="title">JUL</div>
                <div class="value tooltips" data-original-title="7.500" data-toggle="tooltip" data-placement="top">75%</div>
              </div>
            </div>
            <!--custom chart end-->
            </div>
  	</div>
 
		</section><!-- #wrapper end -->
      </section><!-- #content end -->
      
</section>
<!--main content end-->
    
  <!--script for this page-->
  <script src="resources/lib/raphael/raphael.min.js"></script>
  <script src="resources/lib/morris/morris.min.js"></script>
  <script src="resources/lib/chart-master/Chart.js"></script>
 

<script type="text/javascript">
var femaleCnt = Number($('#female').val());
var maleCnt = Number($('#male').val());
var total = Number($('#total').val());
var femalePersentage = (femaleCnt/total)*100;
var malePersentage = (maleCnt/total)*100;

var Script = function () {
	 //morris chart

    $(function () {
      // data stolen from http://howmanyleft.co.uk/vehicle/jaguar_'e'_type
      Morris.Donut({
        element: 'hero-donut',
        data: [
          {label: 'Female', value: femalePersentage.toFixed(1) },
          {label: 'Male', value: malePersentage.toFixed(1) },
          
        ],
          colors: ['#ff1919', '#0000ff' ],
        formatter: function (y) { return y + "%" }
      });
    
    Morris.Bar({
        element: 'hero-bar',
        data: [
          {gender: 'Male', number: maleCnt},
          {gender: 'Female', number: femaleCnt},
          
        ],
        xkey: 'gender',
        ykeys: ['number'],
        labels: ['number'],
        barRatio: 0.4,
        xLabelAngle: 0,
        hideHover: 'auto',
        barColors: ['#24baff']
      });

   	$('.code-example').each(function (index, el) {
        eval($(el).text());
      });
    });

}();

  
</script>



</body>
</html>