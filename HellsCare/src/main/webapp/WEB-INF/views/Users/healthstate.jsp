<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	
<%@ include file="../include/header.jsp" %>



	
	
	
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