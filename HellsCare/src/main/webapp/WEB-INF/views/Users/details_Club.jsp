<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/setting.jsp"%>
<html>
<body>
<c:if test="${memId == null}">
	<script type="text/javascript">
		alert("로그인을 하셔야 이용하실수 있습니다.");
		window.location="login_reg";
	</script>
</c:if>
<script type="text/javascript">
	$(function() {
		$("#all_check").change(function() {
			var is_check = $(this).is(":checked"); // this는 전체선택용 체크박스
			$(".remove").prop("checked", is_check);
		});
	});
</script>

<script type="text/javascript">
	$(function() {
		$("#all_check2").change(function() {
			var is_check = $(this).is(":checked"); // this는 전체선택용 체크박스
			$(".board_remove").prop("checked", is_check);
		});
	});
</script>

	<%@ include file="../include/header.jsp"%>
	<nav class="navbar navbar-light bg-light justify-content-between">
		<a class="navbar-brand" style="margin: 0 auto;">${vo.club_name} 동호회</a>
	</nav>
	<br>
	<br>
	<br>
	<c:if test="${memCnt == 0}">
		<section id="content">
			<div class="container clearfix">
				<div class="col_one_fourth">
					<br>
						<h3>동호회 정보</h3>
							<div class="toggle">
								<div class="togglet"><i class="toggle-closed icon-ok-circle"></i><i class="toggle-open icon-remove-circle"></i>동호회명</div>
								<div class="togglec">${vo.club_name}</div>
							</div>
							
							<div class="toggle">
								<div class="togglet"><i class="toggle-closed icon-ok-circle"></i><i class="toggle-open icon-remove-circle"></i>대표자</div>
								<div class="togglec">${vo.club_master}</div>
							</div>
	
							<div class="toggle">
								<div class="togglet"><i class="toggle-closed icon-ok-circle"></i><i class="toggle-open icon-remove-circle"></i>동호회 종류</div>
								<div class="togglec">${vo.club_kind}</div>
							</div>
	
							<div class="toggle">
								<div class="togglet"><i class="toggle-closed icon-ok-circle"></i><i class="toggle-open icon-remove-circle"></i>지역</div>
								<div class="togglec">${vo.area}</div>
							</div>
							
							<div class="toggle">
								<div class="togglet"><i class="toggle-closed icon-ok-circle"></i><i class="toggle-open icon-remove-circle"></i>소개</div>
								<div class="togglec">${vo.club_pr}</div>
							</div>
							
							<br><br>
							<button type="button" class="button button-3d button-rounded" onclick="history.back();">이전페이지로 이동</button>
						</div>
					
						<div class="col_three_fourth col_last">
							<div class="sidebar-widgets-wrap">
								<div class="widget widget_links clearfix">
									<form name="applyClubForm" class="nobottommargin" action="clubApply?${_csrf.parameterName}=${_csrf.token}"
										method="post" onsubmit="return applyChk();" style="text-align:center; border:2px solid; width:700px;">
										<br><br>
										<center><h3><font style="color:green; size:50px;">${vo.club_name}</font>&emsp;동호회 가입신청<small>(최대 3곳만 가입가능)</small></h3></center>
										
										<input type="hidden" name="username" value="${memId}">
										<input type="hidden" name="club_name" value="${vo.club_name}">
										
										<div style="text-align:center">
											<label for="billing-form-name">아이디</label>
											<h3><font color=red>${memId}</font></h3>
										</div>
				
										<div class="clear"></div>
										
										<div style="text-align:center">
											<label for="billing-form-name">동호회명</label>
											<h3><font color=green>${vo.club_name}</font></h3>
										</div>
										
										<br>
										<button type="submit" class="button button-3d button-rounded">가입 신청하기</button>
										<br><br><br>
									</form>
								</div>
							</div>
						</div>
					</div>
				</section>
	</c:if>
	<c:if test="${memCnt != 0}">
	<div class="row">
		<div>
			<div class="list-group" id="list-tab" role="tablist"
				style="width: 190px; margin-left: 50px;">
				<a class="list-group-item list-group-item-action active" 
					id="list-home-list" data-toggle="list" href="#list-home" role="tab"
					aria-controls="home">동호회 회원</a> <a
					class="list-group-item list-group-item-action"
					id="list-profile-list" data-toggle="list" href="#list-profile"
					role="tab" aria-controls="profile">동호회 게시판</a> 
					<c:if test="${vo.club_master == memId}">
						<a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" href="#list-messages"
						role="tab" aria-controls="messages">가입신청목록</a>
					</c:if>
					<br><br>
					<a href="exit_Club?club_name=${vo.club_name}" onclick="return exitChk();"><button type="button" class="button button-3d button-large button-rounded button-red">탈퇴하기</button></a>
			</div>
		</div>
		<div class="col-9">
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="list-home"
					role="tabpanel" aria-labelledby="list-home-list">
					<table class="table table-hover" style="text-align: center;">
						<thead>
	 						<tr>
								<th>아이디</th>
								<th>이름</th>
								<th>연락처</th>
								<c:if test="${vo.club_master == memId}"><th>추방</th></c:if>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="dto" items="${dtos}">
							<tr> 
								<td style="vertical-align: middle">
									<c:if test="${vo.club_master == dto.username}">${dto.username}
										<font style="color:red; font-weight:bold">  [클럽대표]</font></c:if>
									<c:if test="${vo.club_master != dto.username}">${dto.username}</c:if>
								<td style="vertical-align: middle">${dto.name}</td>
								<td style="vertical-align: middle">${dto.phone_number}</td>
								<td><c:if test="${vo.club_master == memId}">
									<c:if test="${vo.club_master != dto.username}">
										<a href="deleteClubMember?username=${dto.username}&club_name=${vo.club_name}&pageNum=${pageNum}" onclick="return kickMember();"><button type="button" class="button button-large button-dark button-rounded">강제탈퇴</button></a>
									</c:if>
								</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<table class="table table-hover" style="text-align: center;">
					<tr>
						<th style="vertical-align:middle; text-align:center;">
							<!-- 처음[◀◀] / 이전블록[◀] -->
							<c:if test="${startPage > pageBlock}">
								<a href="details_Club">[◀◀]</a>
								<a href="details_Club?pageNum=${startPage - pageBlock}">[◀]</a>
							</c:if>
	
							<!-- 블록내의 페이지 번호  -->
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == currentPage}">
									<span><b style="background: rigthgreen">[${i}]</b></span>
								</c:if>
	
								<c:if test="${i != currentPage}">
									<span><b><a href="details_Club?pageNum=${i}">[${i}]</a></b></span>
								</c:if>
							</c:forEach>
	
							<!-- 다음블록[▶] / 마지막[▶▶]  -->
							<c:if test="${pageCount > endPage}">
								<a href="details_Club?pageNum=${startPage + pageBlock}">▶</a>
								<a href="details_Club?pageNum=${pageCount}">▶▶</a>
							</c:if>
						</th>
					</tr>
				</table>
				</div>
				<div class="tab-pane fade" id="list-profile" role="tabpanel"
					aria-labelledby="list-profile-list">
					<!-- Content
		============================================= -->
					<section id="content" >
						<div class="container clearfix">
							<div class="table-responsive">
							<form name="clubBoardForm" action="club_BoardRemove" method="get" onsubmit="return boadChk();">
								<input type="hidden" name="club_name2" value="${vo.club_name}">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								
								<table id="datatable1"
									class="table table-striped table-bordered" cellspacing="0"
									style="width: 100%; text-align:center;">
									<thead>
										<tr>
											<c:if test="${memId == vo.club_master}">
												<th style="vertical-align:middle"><input type="checkbox" id="all_check2"></th>
											</c:if>
											<th style="vertical-align:middle">작성자</th>
											<th style="vertical-align:middle">제목</th>
											<th style="vertical-align:middle">조회수</th>
											<th style="vertical-align:middle">작성일</th>
											<th style="vertical-align:middle">상세보기</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<c:if test="${memId == vo.club_master}">
												<th style="vertical-align:middle; width:100px;"><button class="button button-large button-dark button-rounded" style="height:50px;">삭제하기</button></th>
											</c:if>
											<th style="vertical-align:middle">작성자</th>
											<th style="vertical-align:middle">제목</th>
											<th style="vertical-align:middle">조회수</th>
											<th style="vertical-align:middle">작성일</th>
											<th style="vertical-align:middle">상세보기</th>
										</tr>
									</tfoot>
									<tbody>
										<c:if test="${boardCnt <= 0}">
											<tr>
												<td colspan="6">현재 게시글이 없습니다. 글을 작성해주세요.</td>
											</tr>
										</c:if>
										
										<c:if test="${boardCnt > 0}">
											<c:forEach var="club_dtos" items="${board_dtos}">
												<tr>
													<c:if test="${memId == vo.club_master}">
														<th style="vertical-align:middle"><input type="checkbox" name="remove" class="board_remove" value="${club_dtos.club_board_code}"></th>												
													</c:if>
													<th style="vertical-align:middle">${club_dtos.username}</th>
													<th style="vertical-align:middle">${club_dtos.title}</th>
													<th style="vertical-align:middle">${club_dtos.readCnt}</th>
													<th style="vertical-align:middle">${club_dtos.write_date}</th>
													<th style="vertical-align:middle">
														<a href="detail_clubBoard?club_board_code=${club_dtos.club_board_code}&club_name=${vo.club_name}"><button class="button button-large button-dark button-rounded" type="button">상세보기</button></a>
													</th>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</form>
							<br>
							<a style="float:right;" href="club_BoardWriteForm?club_name=${vo.club_name}" class="button button-black tright noleftmargin">글쓰기<i class="icon-angle-right"></i></a>
							<br><br><br>
						</div>
						</div>
					</section>
					<!-- #content end -->
					
				</div>
				<div class="tab-pane fade" id="list-messages" role="tabpanel"
					aria-labelledby="list-messages-list">
					<div class="container clearfix">
						<form name="clubapplyForm" class="nobottommargin" action="removeClubApply?${_csrf.parameterName}=${_csrf.token}&club_name=${vo.club_name}"
								method="get" onsubmit="return deleteChk();">
						<table class="table table-hover" style="text-align: center;">
						<thead>
	 						<tr>
	 							<th style="vertical-align: middle"><input type="checkbox" name="all_remove" id="all_check"></th>
								<th style="vertical-align: middle">아이디</th>
	 							<th style="vertical-align: middle">이름</th>
								<th style="vertical-align: middle">성별</th>
								<th style="vertical-align: middle">주소</th>
								<th style="vertical-align: middle">연락처</th>
								<th style="vertical-align: middle">승인</th>
							</tr>
						</thead>
						<tbody>
						<c:if test="${applyCnt == 0}">
							<tr>
								<td colspan="7">현재 해당 동호회에 가입신청한 목록이 없습니다.</td>
							</tr>
						</c:if>
						
					
						<c:if test="${applyCnt != 0}">
							<c:forEach var="userdtos" items="${userdtos}">
								<tr> 
									<td style="vertical-align: middle"><input type="checkbox" class="remove" name="remove2" value="${userdtos.apply_code}"></td>
									<td style="vertical-align: middle">${userdtos.username}</td>
									<td style="vertical-align: middle">${userdtos.name}</td>
									<td style="vertical-align: middle">${userdtos.gender}</td>
									<td style="vertical-align: middle">${userdtos.address}</td>
									<td style="vertical-align: middle">${userdtos.phone_number}</td>
									<td style="vertical-align: middle">
										<a href="confirmMember?username=${userdtos.username}&club_name=${vo.club_name}&apply_code=${userdtos.apply_code}" onclick="return confirmChk();"><button type="button" class="button button-large button-dark button-rounded">승인</button></a>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
				
				<table class="table table-hover" style="text-align: center;">
					<tr>
						<th width="250px;"><button type="submit" class="button button-large button-dark button-rounded" style="float:left">삭제하기</button></th>
						<th colspan="2" style="vertical-align:middle; text-align:center;">
							<!-- 처음[◀◀] / 이전블록[◀] -->
							<c:if test="${startPage > pageBlock}">
								<a href="details_Club">[◀◀]</a>
								<a href="details_Club?a_pageNum=${a_startPage - a_pageBlock}">[◀]</a>
							</c:if>
	
							<!-- 블록내의 페이지 번호  -->
							<c:forEach var="j" begin="${a_startPage}" end="${a_endPage}">
								<c:if test="${j == a_currentPage}">
									<span><b style="background: rigthgreen">[${j}]</b></span>
								</c:if>
	
								<c:if test="${j != a_currentPage}">
									<span><b><a href="details_Club?pageNum=${j}">[${j}]</a></b></span>
								</c:if>
							</c:forEach>
	
							<!-- 다음블록[▶] / 마지막[▶▶]  -->
							<c:if test="${a_pageCount > a_endPage}">
								<a href="details_Club?pageNum=${a_startPage + a_pageBlock}">▶</a>
								<a href="details_Club?pageNum=${a_pageCount}">▶▶</a>
							</c:if>
						</th>
						<th></th>
					</tr>
				</table>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:if>
	<div class="line"></div>
	<%@ include file="../include/footer.jsp"%>
	<%@ include file="../include/footerScript.jsp"%>
	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>

	<!-- External JavaScripts
	============================================= -->
	<script src="resources/js/jquery.js"></script>
	<script src="resources/js/plugins.js"></script>

	<!-- Footer Scripts
	============================================= -->
	<script src="resources/js/functions.js"></script>

	<script>
		$(document).ready(function() {
			$('#datatable1').dataTable();
		});
	</script>
	
	<script type="text/javascript">
		function applyChk(){
			if(confirm("해당 동호회에 가입신청하시겠습니까?")){
				return true;
			} else {
				return false;
			}
		}
	</script>
	
	<script type="text/javascript">
		function kickMember(){
			if(confirm("해당 회원을 탈퇴시키겠습니까?")){
				return true;
			} else{
				return false;
			}
		}
	</script>
	
	<script type="text/javascript">
		function exitChk(){
			if(confirm("해당 동호회를 탈퇴하시겠습니까?")){
				return true;
			} else{
				return false;
			}
		}
	</script>
	
	<script type="text/javascript">
		function confirmChk(){
			if(confirm("해당 회원을 가입승인하시겠습니까?")){
				return true;
			} else{
				return false;
			}
		}
	</script>
	
	<script type="text/javascript">
		function deleteChk(){
			var temp = false;
			if(${applyCnt} == 0){
				alert("현재 삭제하실 회원목록이 없습니다.");
				return false;
			}
			if(!document.clubapplyForm.remove2.length){
				temp = document.clubapplyForm.remove2.checked;
				if(temp){
					var yn = confirm("선택하신 회원의 가입을 취소하시겠습니까?");
					if(yn){
						return true;
					} else{
						return false;	
					}
				}
			} else{
				for(var i=0; i<document.clubapplyForm.remove2.length; i++){
					temp = document.clubapplyForm.remove2[i].checked;
					if(temp){
						var yn = confirm("선택하신 회원의 가입을 취소하시겠습니까?");
						if(yn){
							return true;
						} else{
							return false;	
						}
					}
				}
			}
			if(!temp){
				alert("회원을 한명이상 선택해주세요.");
				return false;
			}
			return false;
		}
	</script>
	
	<script type="text/javascript">
	// 삭제버튼 눌렀을시 즐겨찾기 목록 선택했는지 여부
		function boadChk(){
			var temp = false;
			if(${boardCnt} == 0){
				alert("현재 삭제하실 게시글이없습니다.");
				return false;
			}
			if(!document.clubBoardForm.remove.length){
				temp = document.clubBoardForm.remove.checked;
				if(temp){
					var yn = confirm("선택하신 게시글을 삭제하시겠습니까?");
					if(yn){
						return true;
					} else{
						return false;	
					}
				}
			} else{
				for(var i=0; i<document.clubBoardForm.remove.length; i++){
					temp = document.clubBoardForm.remove[i].checked;
					if(temp){
						var yn = confirm("선택하신 게시글을 삭제하시겠습니까?");
						if(yn){
							return true;
						} else{
							return false;	
						}
					}
				}
			}
			if(!temp){
				alert("게시글을 하나이상 선택해주세요.");
				return false;
			}
			return false;
		}
	</script>
</body>
</html>