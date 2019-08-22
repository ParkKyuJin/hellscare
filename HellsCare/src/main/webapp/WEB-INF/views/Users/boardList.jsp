<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<body>
	<%@ include file="../include/header.jsp"%>
	<section id="page-title">

         <div class="container clearfix">
            <h1>게시판 / QnA</h1>
            <span>Board List</span>
         </div>
      </section><!-- #page-title end -->

	<section id="content">
	
	<div class="content-wrap">
	
		<div class="container clearfix">
	
			<div class="form-widget">


	<div class="row">
	<%-- 	<!-- 글쓰기 실패 -->
		<c:if test="${insertCnt == 0}">
			<script type="text/javascript">
			 	alert("게시글 작성 실패");
			</script>
		</c:if>
		
		<!-- 글쓰기 성공 -->
		<c:if test="${insertCnt == 1}">
			<script type="text/javascript">
				alert("게시글 작성 완료");
			</script>
		</c:if> --%>
		
		<div class="col-12">
		
		<ul id="myTab" class="nav nav-tabs boot-tabs">
		  <li class="nav-item"><a class="nav-link active" href="#board" data-toggle="tab">게시판</a></li>
		  <li class="nav-item"><a class="nav-link" href="#qna" data-toggle="tab">QnA</a></li>
		</ul>
		
		<br>
			<div id="myTabContent" class="tab-content">
				
				<div class="tab-pane fade show active" id="board">

					<table id="datatable1"
						class="table table-striped table-bordered" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th>No.</th>							
								<th>제목</th>
								<th>작성자</th>
								<th>조회수</th>
								<th>Date.</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>No.</th>							
								<th>제목</th>
								<th>작성자</th>
								<th>조회수</th>
								<th>Date.</th>
							</tr>
						</tfoot>
						<tbody>
							
							<!-- 게시글이 있으면 -->
							<!-- 컬럼은 dto에서 꺼내고 계산한한것들은 일반변수..dto붙이면 안됨 -->
								<c:forEach var="dto" items="${dtos}" >
									<tr>
										<td align="center" style="width:50px">
										${dto.rNum}
										</td>
										
										<td align="left">
										<%-- <!-- hot 이미지 -->
										<c:if test="${dto.readCnt > 18}">
										<img src="${project}images/hot.gif" board="0" width="20" height="15">
										</c:if> --%>

											<!-- 상세페이지 -->
											<!-- num은 where절의 키를비교하기 위해 가져옴 -->
											<a href="board_detail?board_code=${dto.board_code}">${dto.title}
												<c:if test="${board_image}"><li><i class="icon-camera-retro"></i></a></li></c:if>
												<c:if test="${dto.commentCnt>0}"><i class="icon-chat-3">${dto.commentCnt}</i></c:if>
											</a>
										</td>
										
										<td align="left" style="width:150px">
											${dto.username}
										</td>
										
										<td align="center" style="width:70px">
											${dto.readCnt}
										</td>
																				
										<td align="left" style="width:200px">
											${dto.write_date}
										</td>

									</tr>
								</c:forEach>


						</tbody>
					</table>
					<a href="writeForm" class="button button-black tright noleftmargin">글쓰기<i class="icon-angle-right"></i></a>
					<br><br>
				</div>
								
				<div class="tab-pane fade active" id="qna">

								<div class="table-responsive">
									<table id="datatable2"
										class="table table-striped table-bordered" cellspacing="0" width="100%">
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
												<td>01</td>
												<td>2011/06/27</td>
												<td>질문이 있슙니다</td>
												<td>짱구</td>
												<td>345</td>
											</tr>
										</tbody>
									</table>	
									<a href="qna_write" class="button button-black tright noleftmargin" style="text-align: center;">질문하기<i class="icon-angle-right"></i></a>
									<br><br>									
								</div>
							</div>
					
			</div>
		</div>
		<%-- </c:if> --%>
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