<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/setting.jsp"%>
<html>
<body class="stretched">
		<%@ include file="../include/header.jsp"%>
	<section id="content">
		<nav class="navbar navbar-light bg-light justify-content-between">
		<a class="navbar-brand" style="margin:0 auto;">동호회 개설</a>
		</nav>
		<div class="content-wrap">
			<div class="row clearfix">
				<div class="col-lg-6" style="margin: 0 auto;">
					<form id="billing-form" name="billing-form" class="nobottommargin"
						action="main2" method="post">

						<div class="col_full">
							<label for="billing-form-companyname">동호회명</label> <input
								type="text" id="billing-form-companyname"
								name="billing-form-companyname" value="" class="sm-form-control">
						</div>
						<div class="style-msg successmsg">
							<div class="sb-msg"><i class="icon-thumbs-up"></i><strong>축하합니다!</strong> 해당 동호회명을 사용하실 수 있습니다.</div>
							<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
						</div>
						<div class="clear"></div>
						<div class="col_half">
							<label for="billing-form-name">대표자 아이디</label> <input type="text"
								id="billing-form-name" name="billing-form-name" value="대표자 아이디"
								class="sm-form-control" disabled>
						</div>
						<div class="col_full">
							<div class="bottommargin-sm">
								<label for="">개설 목적</label> <select
									class="select-hide form-control bottommargin-sm"
									style="width: 100%;">
									<option value="CT">돈</option>
									<option value="DE">돈</option>
									<option value="FL">돈</option>
									<option value="GA">돈</option>
									<option value="IN">돈</option>
									<option value="ME">돈</option>
									<option value="MD">돈</option>
									<option value="MA">기타</option>
								</select>
							</div>
						</div>

						<div class="col_full">
							<input type="text" id="billing-form-city" name="billing-form-city"
								value="돈" class="sm-form-control" disabled>
						</div>
						
						<div>
						<label>분류</label><br>
							<input type="checkbox" name="kind" value=""> 건강정보<br>
							<input type="checkbox" name="kind" value=""> 운동<br>
							<input type="checkbox"name="kind" value=""> 다이어트 <br>
							<input type="checkbox" name="kind" value=""> 스트레칭<br>
							<input type="checkbox" name="kind" value=""> 업타운펑키업<br>
						</div>
						<br>
						<div class="col_full">
							<label for="billing-form-city">동호회 소개</label> <input
								type="text" id="billing-form-city" name="billing-form-city"
								value="" class="sm-form-control">
						</div>
						<div class="col_full">
							<label for="billing-form-city">인원수</label><small>(최대인원수 : 100)</small> <input
								type="number" id="billing-form-city" name="billing-form-city"
								value="" class="sm-form-control" style="width:100px;">
						</div>
						<br><br>
						<button type="submit" class="button button-3d button-rounded" style="width:670px;">개설</button>
					</form>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="../include/footer.jsp"%>

	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>
	<div id="gotoTop" class="icon-angle-up"></div>

	<%@ include file="../include/footerScript.jsp"%>
</body>
</html>