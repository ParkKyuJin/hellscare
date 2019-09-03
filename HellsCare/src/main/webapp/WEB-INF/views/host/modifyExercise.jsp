<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/h_sidebarMenu.jsp"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Dashboard">
<meta name="keyword"
	content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<!-- Stylesheets
	============================================= -->
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700|Raleway:300,400,500,600,700|Crete+Round:400i"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="resources/css/bootstrap.css"
	type="text/css" />
<link rel="stylesheet" href="resources/style.css" type="text/css" />
<link rel="stylesheet" href="resources/css/dark.css" type="text/css" />
<link rel="stylesheet" href="resources/css/font-icons.css"
	type="text/css" />
<link rel="stylesheet" href="resources/css/animate.css" type="text/css" />
<link rel="stylesheet" href="resources/css/magnific-popup.css"
	type="text/css" />

<link rel="stylesheet" href="resources/css/responsive.css"
	type="text/css" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
</head>
<body>
	<div class="content-wrap">
		<center><h2>운동 수정</h2></center>
		<div class="row clearfix">
			<div class="col-lg-6" style="margin: 0 auto;">
				<form name="exerciseAddForm" class="nobottommargin"
					action="modifyExercisePro" method="post"
					onsubmit="return modifyCheck();">
					
					<input type="hidden" name="exercise_code" value="${vo.exercise_code}">
					<input type="hidden" name="pageNum" value="${pageNum}">
					 
					<div class="col_full">
						<label for="exname">운동명</label> <input type="text"
							id="exname" name="name" class="sm-form-control" value="${vo.exercise_name}"
							placeholder="운동명을 입력해주세요." required>
					</div>
					<div class="clear"></div>
					<div class="col_half">
						<label for="image2">대표 이미지</label>
						<img src="/hellscare/resources/images/videos/${vo.exercise_img}" width="500" height="250">
					</div>
					<div class="col_half">
						<label for="video2">영상</label>
						<video controls	src="/hellscare/resources/images/videos/${vo.exercise_video}"
							width="500px" height="350px">
						</video>
					</div>
					<div class="col_full">
						<div class="bottommargin-sm">
							<label>종류</label> <select id="selectbox"
								class="sm-form-control" name="kind" style="width: 100%;"
								onchange="chg_kind();">
								<option value="0">종류를 선택해주세요.</option>
								<option value="1">스트레칭</option>
								<option value="2">다이어트 운동</option>
							</select>
						</div>
					</div>
	
					<div class="col_full">
						<div class="bottommargin-sm">
							<label>운동부위</label> <select name="part"
								class="sm-form-control" style="width: 100%;"
								id="partselect">
								<option value="0">운동 부위를 선택해주세요.</option>
								<option value="1">목</option>
								<option value="2">어깨</option>
								<option value="3">골반</option>
								<option value="4">다리</option>
								<option value="5">손목,발목</option>
							</select>
						</div>
					</div>
	
					<div class="col_full">
						<label for="bang">운동방법</label>
						<textarea id="bang" name="way" cols="58" rows="7"
							tabindex="4" class="sm-form-control"
							placeholder="운동방법을 입력해주세요." required>${vo.way}</textarea>
						</textarea>
					</div>
	
					<div class="col_full">
						<label for="ju">주의사항</label>
						<textarea id="ju" name="note" cols="58" rows="7" tabindex="4"
							class="sm-form-control" placeholder="주의사항을 입력해주세요." required>${vo.note}</textarea>
						</textarea>
					</div>
	
					<div class="col_full">
						<label for="somo">소모칼로리</label><small>(30분기준 / 단위 :
							kcal)</small> <input type="number" id="somo" name="kcal"
							class="sm-form-control" style="width: 100px;" value="${vo.kcal}" required>
					</div>
					<br>
					<br>
					<div style="text-align:center; margin:0 auto">
						<button type="submit" class="button button-3d button-rounded"
							style="width: 300px;">수정하기</button>
						<button type="button" class="button button-3d button-rounded" style="width: 300px;" onclick="history.back();">취소하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	function chg_kind() {
		var kind = document.getElementById('selectbox').value;
		if (kind == 2) {
			$('#partselect').attr('disabled', true);
			document.getElementById('partselect').value = 0;
		} else {
			$('#partselect').attr('disabled', false);
		}
	}
	
	// 전송시 체크해주는 부분
	function modifyCheck() {
		var check = document.exerciseAddForm;

		if (check.kind.value == 0) {
			alert("종류를 선택해주세요.!!");
			return false;
		} else if (check.part.value == 0 && check.kind.value != 2) {
			alert("운동부위를 선택해주세요.!!");
			return false;
		} else if (check.kcal.value < 0) {
			alert("소모칼로리를 다시 입력해주세요.!!");
			return false;
		}
	}
</script>
</html>