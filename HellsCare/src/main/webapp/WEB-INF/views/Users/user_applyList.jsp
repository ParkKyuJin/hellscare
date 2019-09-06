<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<html>
<script type="text/javascript">
	$(function() {
		$("#all_check").change(function() {
			var is_check = $(this).is(":checked"); // this는 전체선택용 체크박스
			$(".remove").prop("checked", is_check);
		});
	});
</script>
<body>
<c:if test="${memId == null}">
	<script type="text/javascript">
		alert("로그인을 하셔야 이용하실수 있습니다.");
		window.location="login_reg";
	</script>
</c:if>
	<!-- Content
		============================================= -->
	<nav class="navbar navbar-light bg-light justify-content-between">
		<a class="navbar-brand" style="margin: 0 auto;">동호회 신청목록</a>
	</nav>
	<section id="content">
		<div class="content-wrap">
			<div class="container clearfix">
				<form action="deleteApply?${_csrf.parameterName}=${_csrf.token}" onsubmit="return check();" class="nobottommargin" name="fa_deleteForm">
					<table class="table table-hover"
						style="text-align: center; width: 1000px; margin:0 auto">
						<thead>
							<tr>
								<th><input type="checkbox" name="all_remove" id="all_check"></th>
								<th>동호회명</th>
								<th>대표자</th>
								<th>종류</th>
								<th>지역</th>
								<th>인원</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${cnt == 0}">
								<td colspan="7" style="vertical-align: middle">현재 가입신청한 목록이 없습니다.</td>
							</c:if>

							<c:if test="${cnt != 0}">
								<c:forEach var="dto" items="${dtos}">
									<tr>
										<td style="vertical-align: middle">
											<input type="checkbox" name="remove2" class="remove" value="${dto.apply_code}">
										</td>
										<td style="vertical-align: middle">${dto.club_name}</td>
										<td style="vertical-align: middle">${dto.club_master}</td>
										<td style="vertical-align: middle">${dto.club_kind}</td>
										<td style="vertical-align: middle">${dto.area}</td>
										<td style="vertical-align: middle">${dto.current_personnel}<font style="font-weight:bold;">/${dto.club_max}</font></td>
										<td style="vertical-align: middle">
											<a href="details_Club?club_name=${dto.club_name}"><button type="button" class="button button-large button-dark button-rounded">자세히</button></a>
										</td>
									</tr>
								</c:forEach>
							</c:if>
							<tr>
								<td colspan="6" style="text-align:left"><br><br><button	type="submit" class="button button-large button-dark button-rounded">삭제하기</button></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	<div class="line"></div>
	</section>
	<!-- #content end -->
	<%@ include file="../include/footer.jsp"%>
	<%@ include file="../include/footerScript.jsp"%>
	
	<script type="text/javascript">
	// 삭제버튼 눌렀을시 즐겨찾기 목록 선택했는지 여부
		function check(){
			var temp = false;
			if(${cnt} == 0){
				alert("현재 삭제하실 목록이없습니다.");
				return false;
			}
			if(!document.fa_deleteForm.remove2.length){
				temp = document.fa_deleteForm.remove2.checked;
				if(temp){
					var yn = confirm("선택하신 목록을 삭제하시겠습니까?");
					if(yn){
						return true;
					} else{
						return false;	
					}
				}
			} else{
				for(var i=0; i<document.fa_deleteForm.remove2.length; i++){
					temp = document.fa_deleteForm.remove2[i].checked;
					if(temp){
						var yn = confirm("선택하신 목록을 삭제하시겠습니까?");
						if(yn){
							return true;
						} else{
							return false;	
						}
					}
				}
			}
			if(!temp){
				alert("목록을 선택해주세요.");
				return false;
			}
			return false;
		}
	</script>
</body>
</html>