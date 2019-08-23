<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<body>
	<%@ include file="../include/header.jsp"%>
	 
	  <section id="page-title">

         <div class="container clearfix">
            <h1>걸음 수 랭킹</h1>
         </div>

      </section><!-- #page-title end -->
	<section id="content">

			<div class="content-wrap">

				<div class="container clearfix">

					<div class="table-responsive">
					<button class="button button-xlarge button-dark button-rounded tright"> 내 등수 확인 <i class="icon-circle-arrow-right"></i> </button>
					&ensp;&ensp;&ensp; 결과는 요기에
						<table id="datatable1" class="table table-striped table-bordered" cellspacing="0" width="100%" style="text-align: center;">
							<thead>
								<tr>
									<th>Rank</th>
									<th>참가자</th>
									<th>걸음 수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>1</th>
									<td>짱구</td>
									<td>12342</td>
								</tr>
								<tr>
									<th>2</th>
									<td>철수</td>
									<td>11111</td>
								</tr>
								<tr>
									<th>3</th>
									<td>맹구</td>
									<td>10000</td>
								</tr>
								<tr>
									<th>4</th>
									<td>원장쌤</td>
									<td>9000</td>
								</tr>
								<tr>
									<th>5</th>
									<td>미나리</td>
									<td>8999</td>
								</tr>
								
							</tbody>
						</table>
					</div>

				</div>

			</div>

		</section><!-- #content end -->

	<%@ include file="../include/footer.jsp"%>
	<%@ include file="../include/footerScript.jsp"%>
	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>

	<!-- External JavaScripts
	============================================= -->
	<script src="/hellscare/resources/js/jquery.js"></script>
	<script src="/hellscare/resources/js/plugins.js"></script>

	<!-- Bootstrap Data Table Plugin -->
<!-- 	<script src="/hellscare/resources/js/components/bs-datatable.js"></script> -->

	<!-- Footer Scripts
	============================================= -->
	<script src="/hellscare/resources/js/functions.js"></script>

	<script>
		$(document).ready(function() {
			$('#datatable1').dataTable();
		});
	</script>
</body>
</html>