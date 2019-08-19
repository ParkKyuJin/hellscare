<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/h_sidebarMenu.jsp"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
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
<style>
	th {
		font-size:25px;
	}
	
	td {
		padding-top:30px;
		vertical-align:middle;
		font-size:20px;
	}
</style>
<body>
	<!--sidebar end-->
	<section id="main-content">
		<section class="wrapper">
			<div class="tabs tabs-alt tabs-justify clearfix" id="tab-10">

				<ul class="tab-nav clearfix">
					<li style="font-size:50px;"><a href="#tabs-38">운동 목록</a></li>
					<li class="hidden-phone"><a href="#tabs-40">운동 등록</a></li>
				</ul>
				
				<div class="tab-container">
					<div class="tab-content clearfix" id="tabs-38">
						<div class="container clearfix">
			
			<table class="table table-hover" style="text-align:center;">
				<thead>
					<tr>
						<th>운동이름</th>
						<th>운동방법</th>
						<th>운동부위</th>
						<th>소모되는 칼로리</th>
						<th>주의사항</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>Mark</td>
						<td>Otto</td>
						<td>11</td>
						<td><i class="i-rounded i-bordered icon-check"></i><i class="i-rounded i-bordered icon-remove"></i></td>
					</tr>
					<tr>
						<td>2</td>
						<td>Jacob</td>
						<td>Thornton</td>
						<td>22</td>
						<td><i class="i-rounded i-bordered icon-check" style="width:10px; height:10px;"></i><i class="i-rounded i-bordered icon-remove"></i></td>
					</tr>
					<tr>
						<td>3</td>
						<td>sfd</td>
						<td>sdf</td>
						<td>33</td>
						<td><i class="i-rounded i-bordered icon-check"></i><i class="i-rounded i-bordered icon-remove"></i></td>
					</tr>
				</tbody>
			</table>
	</div>
					</div>

					<div class="tab-content clearfix" id="tabs-40">
						<div class="content-wrap">
							<div class="row clearfix">
								<div class="col-lg-6" style="margin: 0 auto;">
									<form name="exerciseAddForm"
										class="nobottommargin" action="host_exerciseAddPro" method="post" onsubmit="return addCheck();" >

										<div class="col_full">
											<label for="exname">운동명</label> <input
												type="text" id="exname"
												name="name"	class="sm-form-control" placeholder="운동명을 입력해주세요." required>
										</div>
										<div class="clear"></div>
										<div class="col_half">
											<label for="billing-form-name">영상</label> <input
												type="file" id="billing-form-name" name="img" class="sm-form-control">
										</div>
										<div class="col_full">
											<div class="bottommargin-sm">
												<label>종류</label> <select id="selectbox"
													class="sm-form-control" name="kind"
													style="width: 100%;" onchange="chg_kind();">
													<option value="0">종류를 선택해주세요.</option>
													<option value="1">스트레칭</option>
													<option value="2">다이어트 운동</option>
												</select>
											</div>
										</div>
										
										<div class="col_full">
											<div class="bottommargin-sm">
												<label>운동부위</label> 
												<select name="part" class="sm-form-control" style="width: 100%;" id="partselect">
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
											<textarea id="bang" name="way" cols="58" rows="7" tabindex="4" class="sm-form-control" placeholder="운동방법을 입력해주세요." required></textarea>											</textarea>
										</div>
										
										<div class="col_full">
											<label for="ju">주의사항</label>
											<textarea id="ju" name="note" cols="58" rows="7" tabindex="4" class="sm-form-control" placeholder="주의사항을 입력해주세요." required></textarea>											</textarea>
										</div>
										
										<div class="col_full">
											<label for="somo">소모칼로리</label><small>(30분기준 / 단위 : kcal)</small> 
											<input type="number" id="somo" name="kcal" class="sm-form-control"
												style="width: 100px;" required>
										</div>
										<br><br>
										<button type="submit" class="button button-3d button-rounded"
											style="width: 670px;">등록하기</button>
									</form>
								</div>
							</div>
						</div>
					</div>

				</div>

			</div>
		</section>
	</section>
	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>

	<!-- External JavaScripts
	============================================= -->
	<script src="resources/js/plugins.js"></script>

	<!-- Footer Scripts
	============================================= -->
	<script src="resources/js/functions.js"></script>
	<script type="text/javascript">
	function chg_kind(){
		var kind = document.getElementById('selectbox').value;
		if(kind == 2){
			$('#partselect').attr('disabled',true);
			document.getElementById('partselect').value = 0;
		} else {
			$('#partselect').attr('disabled',false);
		}
	}
	
	// 전송시 체크해주는 부분
	function addCheck(){
		var check = document.exerciseAddForm;
		
		if(check.kind.value == 0){
			alert("종류를 선택해주세요.!!");
			return false;
		} else if(check.part.value == 0 && check.kind.value != 2){
			alert("운동부위를 선택해주세요.!!");
			return false;
		} else if(check.kcal.value < 0){
			alert("소모칼로리를 다시 입력해주세요.!!");
			return false;
		}
	}
	</script>

</body>
</html>