<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어트 식품</title>
</head>
<body class="stretched">

	<!-- Document Wrapper
	============================================= -->
	<div id="wrapper" class="clearfix">

		<!-- Header
		============================================= -->
		<%@ include file="../include/header.jsp" %>
		<!-- #header end -->

		<!-- Page Title
		============================================= -->
		<section id="page-title">

			<div class="container clearfix">
				<h1>다이어트 식품</h1>
				<span>다이어트에 도움이 되는 음식과 피해야할 음식 목록을 제공합니다.</span>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="main">Home</a></li>
					<li class="breadcrumb-item"><a href="#">식단</a></li>
					<li class="breadcrumb-item active" aria-current="page">다이어트 식품</li>
				</ol>
			</div>

		</section><!-- #page-title end -->
		
			<!-- Content
		============================================= -->
		<section id="content">

			<div class="content-wrap">

				<div class="container clearfix">

					<!-- Post Content
					============================================= -->
					<div class="postcontent nobottommargin clearfix">
			
						<h3>다이어트 식품</h3>
			
						<ul id="myTab" class="nav nav-tabs boot-tabs">
						  <li class="nav-item"><a class="nav-link active" href="#good_for_diet" data-toggle="tab">다이어트에 좋은 음식</a></li>
						  <li class="nav-item"><a class="nav-link" href="#bad_for_diet" data-toggle="tab">피해야 할 음식</a></li>
						</ul>
						<div id="myTabContent" class="tab-content">
						  <div class="tab-pane fade show active" id="good_for_diet">
						  	<div class="table-responsive">
						  		<div id="datatable1_wrapper" class="dataTables_wrapper dt-bootstrap4">
						  			<div class="row">
						  				<div class="col-sm-12">
						  					<table id="datatable1" class="table table-striped table-bordered" cellspacing="0" width="100%">
												<thead>
													<tr>
														<th>식품명</th>
														<th>kcal</th>
														<th>g</th>
													</tr>
												</thead>
												<tfoot>
													<tr>
														<th>식품명</th>
														<th>kcal</th>
														<th>g</th>
													</tr>
												</tfoot>
												<tbody>
													<tr>
														<td>김치</td>
														<td>15</td>
														<td>  </td>
													</tr>
													
													<tr>
														<td>밥</td>
														<td>200</td>
														<td>2/3 공기</td>
													</tr>
													
													<tr>
														<td>콩밥</td>
														<td>300</td>
														<td>1인분</td>
													</tr>
													
													<tr>
														<td>현미</td>
														<td>364</td>
														<td>100</td>
													</tr>
													
													<tr>
														<td>미역국</td>
														<td>80</td>
														<td>  </td>
													</tr>
													
													<tr>
														<td>멸치조림</td>
														<td>28</td>
														<td>10</td>
													</tr>
													
													<tr>
														<td>새우조림</td>
														<td>40</td>
														<td>25</td>
													</tr>
													
													<tr>
														<td>두부된장국</td>
														<td>50</td>
														<td>  </td>
													</tr>
													
													<tr>
														<td>두부된장찌개</td>
														<td>50</td>
														<td>  </td>
													</tr>
													
													<tr>
														<td>콩나물국</td>
														<td>120</td>
														<td>1인분</td>
													</tr>
													
													<tr>
														<td>두부</td>
														<td>164</td>
														<td>408 (1모)</td>
													</tr>
													
													<tr>
														<td>콩자반</td>
														<td>137</td>
														<td>40</td>
													</tr>
													
													<tr>
														<td>당근</td>
														<td>137</td>
														<td>100 (1개)</td>
													</tr>
													
													<tr>
														<td>오이</td>
														<td>19</td>
														<td>100 (1개)</td>
													</tr>
													
													<tr>
														<td>블랙커피</td>
														<td>5</td>
														<td>  </td>
													</tr>
													
													<tr>
														<td>녹차</td>
														<td>0</td>
														<td>  </td>
													</tr>
													
													<tr>
														<td>보리차</td>
														<td>0</td>
														<td>  </td>
													</tr>
												</tbody>
											</table>
						  				</div>
						  			</div>
						  			
						  		</div>
								
							</div>
						  </div>
						  <div class="tab-pane fade" id="bad_for_diet">
							<div class="table-responsive">
								<table id="datatable1" class="table table-striped table-bordered" cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>식품명</th>
											<th>kcal</th>
											<th>g</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>식품명</th>
											<th>kcal</th>
											<th>g</th>
										</tr>
									</tfoot>
									<tbody>
										<tr>
											<td>햄버거</td>
											<td>488</td>
											<td>  </td>
										</tr>
										
										<tr>
											<td>돈까스</td>
											<td>600</td>
											<td>  </td>
										</tr>
										
										<tr>
											<td>계란우동</td>
											<td>520</td>
											<td>  </td>
										</tr>
										
										<tr>
											<td>매밀국수</td>
											<td>552</td>
											<td>  </td>
										</tr>
										
										<tr>
											<td>튀김</td>
											<td>472</td>
											<td>  </td>
										</tr>
										
										<tr>
											<td>피자</td>
											<td>688</td>
											<td>  </td>
										</tr>
										
										<tr>
											<td>카레라이스</td>
											<td>616</td>
											<td>  </td>
										</tr>
										
										<tr>
											<td>아이스크림</td>
											<td>180</td>
											<td>  </td>
										</tr>
										
										<tr>
											<td>마요네즈</td>
											<td>90</td>
											<td>1큰술</td>
										</tr>
										
										<tr>
											<td>소주</td>
											<td>90</td>
											<td>1잔</td>
										</tr>
										
										<tr>
											<td>맥주</td>
											<td>185</td>
											<td>1잔</td>
										</tr>
										
										<tr>
											<td>양주</td>
											<td>140</td>
											<td>50ml 1잔</td>
										</tr>
										
									</tbody>
								</table>
							</div>
						  </div>
						</div>
					</div><!-- .postcontent end -->
				</div>

			</div>

		</section><!-- #content end -->

	</div>

</div>

		</section>
		<!-- #content end -->

		<!-- Footer
		============================================= -->
		<%@ include file="../include/footer.jsp"%>
		<%@ include file="../include/footerScript.jsp"%>
		<!-- #footer end -->

	</div><!-- #wrapper end -->

	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>
	
	<!-- Bootstrap Data Table Plugin -->
	<script src="resources/js/components/bs-datatable.js"></script>
	
	<script>

		$(document).ready(function() {
			$('#datatable1').dataTable();
		});

	</script>
</body>
</html>