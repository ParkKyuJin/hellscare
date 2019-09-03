<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	
	<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
function perse1() {
	$.ajax({
		url : '${pageContext.request.contextPath}/perse', // 컨트롤러/drugInfo_sub
		success : function(result) { // 콜백함수 - 정상적으로 처리되었을 때의 결과가 result에 들어간다.
			// 변수명이 반드시 .html(result)일 필요는 없으나 위 콜백함수와의 변수명과 일치해야 한다.
			$('#result').html(result);
		},
		error : function() {
			alert("오류");	
		}		
	});
	
}

<!--

//-->
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
<section id="content" style="margin:0px 0px 0px 0px; padding:0px 0px 0px 0px;">

			<div class="content-wrap">

				<div class="container clearfix">

					<!-- Post Content
					============================================= -->
			<div class="postcontent nobottommargin">

				<!-- Google Map
						============================================= -->

				<!-- <section id="google-map" class="gmap bottommargin" style="height: 300px;"></section> -->
				<div class="tabs nobottommargin clearfix" id="sidebar-tabs">

					<ul class="tab-nav clearfix">
						<li ><a onclick="perse1();">칼로리</a></li>
						<li><a href="perse2">혈압</a></li>
						<li><a href="#tabs-3">걸음수</a></li>
						<li><a href="#tabs-4">체중</a></li>
					</ul>


					<div class="tab-container">


						<div class="tab-content clearfix" id="tabs-1">
							<div id="popular-post-list-sidebar">

								 <div id="result"></div>

							</div>
							<div class="alert alert-warning" align="center">
							<i class="icon-warning-sign"></i><strong>Warning!</strong> 주의하세요! 섭취 칼로리에 비해 운동량이 낮습니다!
							</div>
						</div>
						
					</div>
				
			
				</div>
				
			


				<div class="line"></div>





			</div>
			<!-- .postcontent end -->

			<!-- Sidebar
					============================================= -->
					<div class="sidebar nobottommargin col_last clearfix">
						<div class="sidebar-widgets-wrap">

							<div class="widget widget_links clearfix">

								<h4>간편메뉴</h4>
								<ul>
									<li><a href="animations.html"><div>Animations</div></a></li>
									<li><a href="buttons.html"><div>Buttons</div></a></li>
									<li><a href="carousel.html"><div>Carousel</div></a></li>
									<li><a href="charts.html"><div>Charts</div></a></li>
									<li><a href="clients.html"><div>Clients</div></a></li>
									<li><a href="columns-grids.html"><div>Columns</div></a></li>
									<li><a href="counters.html"><div>Counters</div></a></li>
									<li><a href="dividers.html"><div>Dividers</div></a></li>
									<li><a href="featured-boxes.html"><div>Icon Boxes</div></a></li>
									<li><a href="gallery.html"><div>Galleries</div></a></li>
									<li><a href="headings-dropcaps.html"><div>Heading Styles</div></a></li>
									<li><a href="icon-lists.html"><div>Icon Lists</div></a></li>
									<li><a href="labels-badges.html"><div>Labels</div></a></li>
									<li><a href="lightbox.html"><div>Lightbox</div></a></li>
											
								</ul>

							</div>

							

						

						</div>
					</div><!-- .sidebar end -->

				</div>

			</div>

		</section><!-- #content end -->











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