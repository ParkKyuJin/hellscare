<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
var Script = function () {

    //morris chart

    $(function () {
      // data stolen from http://howmanyleft.co.uk/vehicle/jaguar_'e'_type
      var tax_data = [
           {"period": "2011 Q3", "섭취칼로리": 200, "소모칼로리": 300},
           {"period": "2011 Q2", "섭취칼로리": 200, "소모칼로리": 210},
           {"period": "2011 Q1", "섭취칼로리": 200, "소모칼로리": 550},
           {"period": "2010 Q4", "섭취칼로리": 200, "소모칼로리": 720},
           {"period": "2009 Q4", "섭취칼로리": 200, "소모칼로리": 300},
           {"period": "2008 Q4", "섭취칼로리": 200, "소모칼로리": 220},
           {"period": "2007 Q4", "섭취칼로리": 200, "소모칼로리": 100},
           {"period": "2006 Q4", "섭취칼로리": 200, "소모칼로리": null},
           {"period": "2005 Q4", "섭취칼로리": 200, "소모칼로리": null}
      ];
      Morris.Line({
        element: 'hero-graph',
        data: tax_data,
        xkey: 'period',
        ykeys: ['섭취칼로리', '소모칼로리'],
        labels: ['섭취칼로리', '소모칼로리'],
        lineColors:['#4ECDC4','#ed5565']
      });

      Morris.Donut({
        element: 'hero-donut',
        data: [
          {label: 'Jam', value: 25 },
          {label: 'Frosted', value: 40 },
          {label: 'Custard', value: 25 },
          {label: 'Sugar', value: 10 }
        ],
          colors: ['#3498db', '#2980b9', '#34495e'],
        formatter: function (y) { return y + "%" }
      });

      Morris.Area({
        element: 'hero-area',
        data: [
          {period: '2010 Q1', iphone: 2666, ipad: null, itouch: 2647},
          {period: '2010 Q2', iphone: 2778, ipad: 2294, itouch: 2441},
          {period: '2010 Q3', iphone: 4912, ipad: 1969, itouch: 2501},
          {period: '2010 Q4', iphone: 3767, ipad: 3597, itouch: 5689},
          {period: '2011 Q1', iphone: 6810, ipad: 1914, itouch: 2293},
          {period: '2011 Q2', iphone: 5670, ipad: 4293, itouch: 1881},
          {period: '2011 Q3', iphone: 4820, ipad: 3795, itouch: 1588},
          {period: '2011 Q4', iphone: 15073, ipad: 5967, itouch: 5175},
          {period: '2012 Q1', iphone: 10687, ipad: 4460, itouch: 2028},
          {period: '2012 Q2', iphone: 8432, ipad: 5713, itouch: 1791}
        ],

          xkey: 'period',
          ykeys: ['iphone', 'ipad', 'itouch'],
          labels: ['iPhone', 'iPad', 'iPod Touch'],
          hideHover: 'auto',
          lineWidth: 1,
          pointSize: 5,
          lineColors: ['#4a8bc2', '#ff6c60', '#a9d86e'],
          fillOpacity: 0.5,
          smooth: true
      });

      Morris.Bar({
        element: 'hero-bar',
        data: [
          {device: '월', geekbench: 136},
          {device: '화', geekbench: 137},
          {device: '수', geekbench: 275},
          {device: '목', geekbench: 380},
          {device: '금', geekbench: 655},
          {device: '토', geekbench: 1571}
          
        ],
        xkey: 'device',
        ykeys: ['geekbench'],
        labels: ['Geekbench'],
        barRatio: 0.4,
        xLabelAngle: 35,
        hideHover: 'auto',
        barColors: ['#ac92ec']
      });

      new Morris.Line({
        element: 'examplefirst',
        xkey: 'year',
        ykeys: ['value'],
        labels: ['Value'],
        data: [
          {year: '2008', value: 20},
          {year: '2009', value: 10},
          {year: '2010', value: 5},
          {year: '2011', value: 5},
          {year: '2012', value: 20}
        ]
      });

      $('.code-example').each(function (index, el) {
        eval($(el).text());
      });
    });

}();



</script>

	
	
	
	<!-- 중간 lable -->
	<section id="page-title">

			<div class="container clearfix">
				<h1>날짜별 신체정보</h1>
				<span>Labelling Data Points</span>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="main2">Home</a></li>
					<li class="breadcrumb-item"><a href="healthstateresult">Result</a></li>
					
				</ol>
			</div>
		</section><!-- #page-title end -->
		
<!-- 탭메뉴 관련 -->
 <section id="main-content" style="margin:0;">
      <section class="wrapper site-min-height">
        <h3><i class="fa fa-angle-right"></i> 건강진단 목록</h3>
        <!-- page start-->
        <div id="morris">
          <div class="row mt">
            <div class="col-lg-6">
              <div class="content-panel">
                <h4><i class="fa fa-angle-right"></i> 칼로리 변화</h4>
                <div class="panel-body">
                  <div id="hero-graph" class="graph"></div>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="content-panel">
                <h4><i class="fa fa-angle-right"></i> 혈압변화</h4>
                <div class="panel-body">
                  <div id="hero-bar" class="graph"></div>
                </div>
              </div>
            </div>
          </div>
          <div class="row mt">
            <div class="col-lg-6">
              <div class="content-panel">
                <h4><i class="fa fa-angle-right"></i> Chart Example 3</h4>
                <div class="panel-body">
                  <div id="hero-area" class="graph"></div>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="content-panel">
                <h4><i class="fa fa-angle-right"></i> Chart Example 4</h4>
                <div class="panel-body">
                  <div id="hero-donut" class="graph"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- page end-->
      </section>
</section>










<script src="resources/js/functions.js"></script>

<!-- 	<script>
		jQuery(window).on( 'load',  function(){
			var filters = {};

			var $container = $('.grid');

			$container.isotope();

			$('.combination-filter').on( 'click', '.btn', function() {
				var $this = $(this);
				// get group key
				var $buttonGroup = $this.parents('.btn-group');
				var filterGroup = $buttonGroup.attr('data-filter-group');
				// set filter for group
				filters[ filterGroup ] = $this.attr('data-filter');
				// combine filters
				var filterValue = concatValues( filters );
				$container.isotope({ filter: filterValue });

				$this.parents('.btn-group').find('.btn').removeClass('btn-primary').addClass( 'btn-secondary');

				$this.removeClass( 'btn-secondary').addClass('btn-primary');

				return false;
			});

			// flatten object by concatting values
			function concatValues( obj ) {
				var value = '';
				for ( var prop in obj ) {
					value += obj[ prop ];
				}
				return value;
			}

			$(window).resize(function() {
				$container.isotope('layout');
			});
		});

	</script>
 -->
	
	<%@ include file="../include/footer.jsp" %>
	<%@ include file="../include/footerScript.jsp" %>