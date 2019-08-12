<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<body>
	<%@ include file="../include/header.jsp"%>
	<nav class="navbar navbar-light bg-light justify-content-between">
		<a class="navbar-brand" style="margin: 0 auto;">게시판</a>
	</nav>
	<br>
	<br>
	<br>
	<div class="row">
		<div>
			<div class="list-group" id="list-tab" role="tablist"
				style="width: 250px; margin-left: 50px;">
				<a class="list-group-item list-group-item-action active"
					id="list-home-list" data-toggle="list" href="#list-home" role="tab"
					aria-controls="home">자유 게시판</a> <a
					class="list-group-item list-group-item-action"
					id="list-profile-list" data-toggle="list" href="#list-profile"
					role="tab" aria-controls="profile">QnA</a>
			</div>
		</div>
		<div class="col-8">
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="list-home"
					role="tabpanel" aria-labelledby="list-home-list">
					<table id="datatable1"
										class="table table-striped table-bordered" cellspacing="0"
										width="100%">
										<thead>
											<tr>
												<th>No.</th>
												<th>Date.</th>
												<th>제목</th>
												<th>작성자</th>
												<th>조회수</th>
											</tr>
										</thead>
										<tfoot>
											<tr>
												<th>No.</th>
												<th>Date.</th>
												<th>제목</th>
												<th>작성자</th>
												<th>조회수</th>
											</tr>
										</tfoot>
										<tbody>
										
											<tr>
												<td>12</td>
												<td>2011/06/27</td>
												<td>울라울라</td>
												<td>짱구</td>
												<td>11</td>
											</tr>
											<tr>
												<td>11</td>
												<td>2011/06/27</td>
												<td>울라울라</td>
												<td>짱구</td>
												<td>11</td>
											</tr>
											<tr>
												<td>10</td>
												<td>2011/06/27</td>
												<td>울라울라</td>
												<td>짱구</td>
												<td>11</td>
											</tr>
											<tr>
												<td>09</td>
												<td>2011/06/27</td>
												<td>울라울라</td>
												<td>짱구</td>
												<td>11</td>
											</tr>
											<tr>
												<td>08</td>
												<td>2011/06/27</td>
												<td>울라울라</td>
												<td>짱구</td>
												<td>11</td>
											</tr>
											<tr>
												<td>07</td>
												<td>2011/06/27</td>
												<td>울라울라</td>
												<td>짱구</td>
												<td>11</td>
											</tr>
											<tr>
												<td>06</td>
												<td>2011/06/27</td>
												<td>울라울라</td>
												<td>짱구</td>
												<td>11</td>
											</tr>
											<tr>
												<td>05</td>
												<td>2011/06/27</td>
												<td>울라울라</td>
												<td>짱구</td>
												<td>11</td>
											</tr>
											<tr>
												<td>04</td>
												<td>2014/06/27</td>
												<td>울라울라</td>
												<td>짱구</td>
												<td>124</td>
											</tr>
											<tr>
												<td>03</td>
												<td>2014/05/03</td>
												<td>번역기는 파파고</td>
												<td>네이버</td>
												<td>345</td>
											</tr>
											<tr>
												<td>02</td>
												<td>2011/06/28</td>
												<td>울트라파워</td>
												<td>독수리</td>
												<td>1</td>
											</tr>
											<tr>
												<td>01</td>
												<td>2011/06/27</td>
												<td>키자루랑 원장쌤이랑 싸우면 누가 이기냐</td>
												<td>짱구</td>
												<td>3235235</td>
											</tr>
										</tbody>
									</table>
								</div>
				<div class="tab-pane fade" id="list-profile" role="tabpanel"
					aria-labelledby="list-profile-list">
					<!-- Content
		============================================= -->
					<section id="content">
							<div class="container clearfix">
								<div class="table-responsive">
									<table id="datatable2"
										class="table table-striped table-bordered" cellspacing="0"
										width="100%">
										<thead>
											<tr>
												<th>No.</th>
												<th>Date.</th>
												<th>제목</th>
												<th>작성자</th>
												<th>조회수</th>
											</tr>
										</thead>
										<tfoot>
											<tr>
												<th>No.</th>
												<th>Date.</th>
												<th>제목</th>
												<th>작성자</th>
												<th>조회수</th>
											</tr>
										</tfoot>
										<tbody>
										
											<tr>
												<td>12</td>
												<td>2011/06/27</td>
												<td>질문이있슙닏다</td>
												<td>짱구</td>
												<td>11</td>
											</tr>
											<tr>
												<td>11</td>
												<td>2011/06/27</td>
												<td>아이디 바꾸고 시튠데</td>
												<td>철수</td>
												<td>2</td>
											</tr>
											<tr>
												<td>10</td>
												<td>2011/06/27</td>
												<td>원장쌤이 안보여유</td>
												<td>영수</td>
												<td>10</td>
											</tr>
											<tr>
												<td>09</td>
												<td>2011/06/27</td>
												<td>걸음수가 안바뀜</td>
												<td>짱구</td>
												<td>7</td>
											</tr>
											<tr>
												<td>08</td>
												<td>2011/06/27</td>
												<td>엉덩이로 걸어도 걸음수가 올라가나요</td>
												<td>짱구</td>
												<td>3521</td>
											</tr>
											<tr>
												<td>07</td>
												<td>2011/06/27</td>
												<td>질문</td>
												<td>짱구</td>
												<td>11</td>
											</tr>
											<tr>
												<td>06</td>
												<td>2011/06/27</td>
												<td>질문질문</td>
												<td>짱구</td>
												<td>11</td>
											</tr>
											<tr>
												<td>05</td>
												<td>2011/06/27</td>
												<td>울라울라</td>
												<td>짱구</td>
												<td>11</td>
											</tr>
											<tr>
												<td>04</td>
												<td>2014/06/27</td>
												<td>울라울라</td>
												<td>짱구</td>
												<td>124</td>
											</tr>
											<tr>
												<td>03</td>
												<td>2014/05/03</td>
												<td>다음은 별로</td>
												<td>네이버</td>
												<td>345</td>
											</tr>
											<tr>
												<td>02</td>
												<td>2011/06/28</td>
												<td>개인정보 수정하려면 어디서</td>
												<td>독수리</td>
												<td>1</td>
											</tr>
											<tr>
												<td>01</td>
												<td>2011/06/27</td>
												<td>질문이 있슙니다</td>
												<td>짱구</td>
												<td>345</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
					</section>
					<!-- #content end -->
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
	<%@ include file="../include/footerScript.jsp"%>
	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>

	<!-- External JavaScripts
	============================================= -->
	<script src="resources/js/jquery.js"></script>
	<script src="resources/js/plugins.js"></script>

	<!-- Bootstrap Data Table Plugin -->
	<script src="resources/js/components/bs-datatable.js"></script>

	<!-- Footer Scripts
	============================================= -->
	<script src="resources/js/functions.js"></script>

	<script>
		$(document).ready(function() {
			$('#datatable1').dataTable();
		});
		
		$(document).ready(function() {
			$('#datatable2').dataTable();
		});
	</script>
</body>
</html>