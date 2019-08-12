<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="../include/h_sidebarMenu.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />

	<!-- Stylesheets
	============================================= -->
	
	<meta name="viewport" content="width=device-width, initial-scale=1" />


  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>Dashio - Bootstrap Admin Template</title>

  
</head>

<body>
  <section id="container">
    
    <!--sidebar end-->
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
  

		<!-- Content
		============================================= -->
		 <!--main content start-->
    <section id="main-content">
      <section class="wrapper">

			<div class="content-wrap" style="padding-bottom: 30px;">

				<div class="container clearfix">

					<!-- Charts Area
					============================================= -->
					<div class="bottommargin divcenter" style="max-width: 750px; min-height: 350px;">
						<canvas id="chart-0"></canvas>
					</div>

					<div class="toolbar center">
						<button class="btn btn-secondary btn-sm" id="randomizeData">Randomize Data</button>
						<button class="btn btn-secondary btn-sm" id="addDataset">Add Dataset</button>
						<button class="btn btn-secondary btn-sm" id="removeDataset">Remove Dataset</button>
						<button class="btn btn-secondary btn-sm" id="addData">Add Data</button>
						<button class="btn btn-secondary btn-sm" id="removeData">Remove Data</button>
					</div>
					<!-- Charts Area End -->

					<div class="line"></div>

					<div class="row grid-container chart-samples clearfix" data-layout="fitRows">

						<div class="col-lg-3 bottommargin-sm">
							<h4>Bar Charts</h4>
							<ul>
								<li><a href="charts-bar-vertical.html">Vertical</a></li>
								<li><a href="charts-bar-horizontal.html">Horizontal</a></li>
								<li><a href="charts-bar-multi-axis.html">Multi axis</a></li>
								<li><a href="charts-bar-stacked.html">Stacked</a></li>
								<li><a href="charts-bar-stacked-group.html">Stacked groups</a></li>
							</ul>
						</div>

						<div class="col-lg-3 bottommargin-sm">
							<h4>Line Charts</h4>
							<ul>
								<li><a href="charts-line-basic.html">Basic</a></li>
								<li><a href="charts-line-multi-axis.html">Multi axis</a></li>
								<li><a href="charts-line-stepped.html">Stepped</a></li>
								<li><a href="charts-line-interpolation-modes.html">Interpolation</a></li>
								<li><a href="charts-line-line-styles.html">Line styles</a></li>
								<li><a href="charts-line-point-styles.html">Point styles</a></li>
								<li><a href="charts-line-point-sizes.html">Point sizes</a></li>
							</ul>
						</div>

						<div class="col-lg-3 bottommargin-sm">
							<h4>Area Charts</h4>
							<ul>
								<li><a href="charts-area-line-boundaries.html">Boundaries (line)</a></li>
								<li><a href="charts-area-line-datasets.html">Datasets (line)</a></li>
								<li><a href="charts-area-line-stacked.html">Stacked (line)</a></li>
								<li><a href="charts-area-radar.html">Radar</a></li>
							</ul>
						</div>

						<div class="col-lg-3 bottommargin-sm">
							<h4>Other Charts</h4>
							<ul>
								<li><a href="charts-scatter-basic.html">Scatter</a></li>
								<li><a href="charts-scatter-multi-axis.html">Scatter - Multi axis</a></li>
								<li><a href="charts-doughnut.html">Doughnut</a></li>
								<li><a href="charts-pie.html">Pie</a></li>
								<li><a href="charts-polar-area.html">Polar area</a></li>
								<li><a href="charts-radar.html">Radar</a></li>
								<li><a href="charts-combo-bar-line.html">Combo bar/line</a></li>
							</ul>
						</div>

						<div class="col-lg-3 bottommargin-sm">
							<h4>Linear Scale</h4>
							<ul>
								<li><a href="charts-scales-linear-step-size.html">Step size</a></li>
								<li><a href="charts-scales-linear-min-max.html">Min &amp; max</a></li>
								<li><a href="charts-scales-linear-min-max-suggested.html">Min &amp; max (suggested)</a></li>
							</ul>
						</div>

						<div class="col-lg-3 bottommargin-sm">
							<h4>Logarithmic Scale</h4>
							<ul>
								<li><a href="charts-scales-logarithmic-line.html">Line</a></li>
								<li><a href="charts-scales-logarithmic-scatter.html">Scatter</a></li>
							</ul>
						</div>

						<div class="col-lg-3 bottommargin-sm">
							<h4>Time Scale</h4>
							<ul>
								<li><a href="charts-scales-time-line.html">Line</a></li>
								<li><a href="charts-scales-time-line-point-data.html">Line (point data)</a></li>
								<li><a href="charts-scales-time-combo.html">Combo</a></li>
							</ul>
						</div>

						<div class="col-lg-3 bottommargin-sm">
							<h4>Scale Options</h4>
							<ul>
								<li><a href="charts-scales-gridlines-display.html">Grid lines display</a></li>
								<li><a href="charts-scales-gridlines-style.html">Grid lines style</a></li>
								<li><a href="charts-scales-multiline-labels.html">Multiline labels</a></li>
								<li><a href="charts-scales-filtering-labels.html">Filtering Labels</a></li>
								<li><a href="charts-scales-non-numeric-y.html">Non numeric Y Axis</a></li>
							</ul>
						</div>

						<div class="col-lg-3 bottommargin-sm">
							<h4>Legend</h4>
							<ul>
								<li><a href="charts-legend-positioning.html">Positioning</a></li>
								<li><a href="charts-legend-point-style.html">Point style</a></li>
							</ul>
						</div>

						<div class="col-lg-3 bottommargin-sm">
							<h4>Tooltip</h4>
							<ul>
								<li><a href="charts-tooltips-positioning.html">Positioning</a></li>
								<li><a href="charts-tooltips-interactions.html">Interactions</a></li>
								<li><a href="charts-tooltips-callbacks.html">Callbacks</a></li>
								<li><a href="charts-tooltips-border.html">Border</a></li>
								<li><a href="charts-tooltips-custom-line.html">HTML tooltips (line)</a></li>
								<li><a href="charts-tooltips-custom-pie.html">HTML tooltips (pie)</a></li>
								<li><a href="charts-tooltips-custom-points.html">HTML tooltips (points)</a></li>
							</ul>
						</div>

						<div class="col-lg-3 bottommargin-sm">
							<h4>Advanced</h4>
							<ul>
								<li><a href="charts-advanced-progress-bar.html">Progress bar</a></li>
								<li><a href="charts-advanced-data-labelling.html">Data labelling (plugin)</a></li>
							</ul>
						</div>

					</div>

				</div>

			</div>

		</section><!-- #content end -->
      
     
	
		</section><!-- #content end -->

      
  
      </section>
    <!--main content end-->
    

  <!-- js placed at the end of the document so the pages load faster -->
  

</body>
</html>


