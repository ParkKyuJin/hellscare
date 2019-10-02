<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
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
     
      
<!--footer start-->
    <footer class="site-footer">
      <div class="text-center">
        <p>
          &copy; Copyrights <strong>Healthcare</strong>. All Rights Reserved
        </p>
        <div class="credits">
          <!--
            You are NOT allowed to delete the credit link to TemplateMag with free version.
            You can delete the credit link only if you bought the pro version.
            Buy the pro version with working PHP/AJAX contact form: https://templatemag.com/dashio-bootstrap-admin-template/
            Licensing information: https://templatemag.com/license/
          -->
          <!-- Created with Healthcare template by <a href="https://templatemag.com/">TemplateMag</a> -->
        </div>
        <a href="host_main#" class="go-top">
          <i class="fa fa-angle-up"></i>
          </a>
      </div>
    </footer>
    <!--footer end-->
      
      
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