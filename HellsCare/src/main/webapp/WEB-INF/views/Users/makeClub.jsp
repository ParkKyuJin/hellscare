<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<body class="stretched">
	<%@ include file="../include/header.jsp"%>
	<section id="content">
		<nav class="navbar navbar-light bg-light justify-content-between">
			<a class="navbar-brand" style="margin: 0 auto;">동호회 개설</a>
		</nav>
		<div class="content-wrap">
			<div class="row clearfix">
				<div class="col-lg-6" style="margin: 0 auto;">
					<form name="makeClubForm" class="nobottommargin" action="makeClubApply"
							method="post" onsubmit="return subCheck();">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> 
						<div id="checkCnt"></div>

						<div class="col_full">
							<label for="club_id">동호회명</label> <input type="text" id="club_id"
								name="club_name" class="sm-form-control" required> <br>
							<div class="sb-msg" id="id_check"></div>
						</div>

						<div class="clear"></div>
						
						<div class="col_half">
							<label for="billing-form-name">대표자 아이디</label> <input type="text"
								id="billing-form-name" name="club_master" value="${memId}"
								class="sm-form-control" readonly>
						</div>

						<div class="col_full">
							<label>분류</label><br> 
							<input type="radio" name="kind"	value="1" checked> 건강정보<br> 
							<input type="radio"	name="kind" value="2"> 운동<br> 
							<input type="radio"	name="kind" value="3"> 다이어트 <br> 
							<input type="radio" name="kind" value="4"> 스트레칭<br>
						</div>
						
						<div class="col_full">
							<label>지역</label>
							<select class="sm-form-control" name="area">
								<option value="0">지역을 선택해주세요.</option>
								<option value="1">서울특별시</option>
								<option value="2">부산광역시</option>
								<option value="3">대구광역시</option>
								<option value="4">인천광역시</option>
								<option value="5">광주광역시</option>
								<option value="6">대전광역시</option>
								<option value="7">울산광역시</option>
								<option value="8">세종특별자치사</option>
								<option value="9">경기도</option>
								<option value="10">강원도</option>
								<option value="11">충청북도</option>
								<option value="12">충청남도</option>
								<option value="13">전라북도</option>
								<option value="14">전라남도</option>
								<option value="15">경상북도</option>
								<option value="16">경상남도</option>
								<option value="17">제주특별자치도</option>
							</select>
						</div>
						
						<div class="col_full">
							<label for="bang">동호회 소개<small>(1000자 이내)</small></label><br>
							<input id="bang" name="club_pr" size="1000" class="sm-form-control" placeholder="동호회 소개를 작성해주세요." required>
							<!-- <textarea id="bang" name="club_pr" cols="58" rows="7"
								tabindex="4" class="sm-form-control"
								placeholder="동호회 소개를 작성해주세요." required></textarea> -->
						</div>
						<div class="col_full">
							<label for="inwon">인원수</label><small>(최대인원수 :
								100)</small> <input type="number" id="inwon"
								name="club_max" class="sm-form-control"
								style="width: 100px;" required>
						</div>
						
						<br> <br>
						<button type="submit" class="button button-3d button-rounded"
							style="width: 670px;">개설 신청하기</button>
					</form>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="../include/footer.jsp"%>

	<%@ include file="../include/footerScript.jsp"%>
	<script src="/hellscare/resources/ajax/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#club_id").keyup(function() {
				var club_id = $('#club_id').val();
				$.ajax({
					url : '${pageContext.request.contextPath}/club_IdCheck?clubId='+ club_id,
					type : 'get',
					success : function(data) {
					if (!$('#club_id').val()) {
						$("#id_check").css('display', 'none');
					} else {
						$("#id_check").css('display', '');
					}
					if (data == 1) {
						// 1. 아이디가 중복되는 문구
						$("#id_check").text("사용중인 동호회명입니다.");
						$("#id_check").css("color","red");
						$("#checkCnt").html("<input type='hidden' name='cnt' value="+data+">");
					} else {
						$("#id_check").text("사용가능한 동호회명입니다.");
						$("#id_check").css("color","green");
						$("#checkCnt").html("<input type='hidden' name='cnt' value="+data+">");
					}
				},
				error : function() {
					alert("오류");
				}
			});
		});
	});
	
	</script>
	
	<script type="text/javascript">
		function subCheck(){
			if(document.makeClubForm.area.value == 0){
				alert("지역을 선택해주세요.");
				return false;
			} else if(document.makeClubForm.cnt.value == 1){
				alert("현재 존재하는 동호회입니다. \n새로운 동호회명을 입력해주세요.");
				return false;
			} else if(document.makeClubForm.club_max.value < 0 || document.makeClubForm.club_max.value > 100){
				alert("인원수를 다시 작성해주세요.");
				return false;
			} 
			
			if(confirm("개설신청하시겠습니까?")){
				return true;
			} else{
				return false;
			}
		}
	</script>
</body>
</html>