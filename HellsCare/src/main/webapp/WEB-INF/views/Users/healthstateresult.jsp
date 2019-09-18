<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<body class="stretched">
<%@ include file="../include/header.jsp"%>
<section id="page-title">

			<div class="container clearfix">
				<h1>진단 결과</h1>
				<span>입력하신 정보를 토대로 위험군에 속한 병을 안내합니다.</span>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="main">Home</a></li>
					<li class="breadcrumb-item"><a href="nextpage">HealthState</a></li>

				</ol>
			</div>

		</section><!-- #page-title end -->
<table class="table table-striped" >
	<thead align="center">
		<tr>
			<th>#</th>
			<th align="center">항목</th>
			<th align="center">현재수치</th>
			<th align="center">정삼범위</th>
			<th align="center">상태</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td align="center">1</td>
			<td align="center">혈압</td>
			<td align="center"><ul class="skills">
					<li><div class="progress skills-animated" style="width: 80%;">
							<div class="progress-percent">
								<div class="counter counter-inherit counter-instant">
									<span data-from="0" data-to="80" data-refresh-interval="30"
										data-speed="1100"></span>%
								</div>
							</div>
						</div></li>
				</ul></td>
			<td align="center"> 130</td>
			<td align="center"> 
			<div class="form-group">
					<script type="text/javascript">
						function checked(){
							document.getElementById("feedback-form-cleanliness-1").toggle;
						}
					</script>
						<div class="btn-group btn-group-toggle d-flex"
							data-toggle="buttons" >
							<label class="btn btn-outline-danger ls0 nott"> <input
								type="radio" class="required" name="feedback-form-cleanliness"
								id="feedback-form-cleanliness-1" value="Terrible" readonly="readonly" checked="checked" ><i
								class="icon-sad-cry1" ></i>
							</label> <label class="btn btn-outline-danger ls0 nott"> <input
								type="radio" class="required" name="feedback-form-cleanliness"
								id="feedback-form-cleanliness-2" value="Bad" checked="checked"><i
								class="icon-frown1"></i>
							</label> <label class="btn btn-outline-warning ls0 nott"> <input
								type="radio" class="required" name="feedback-form-cleanliness"
								id="feedback-form-cleanliness-3" value="Average"><i
								class="icon-meh1"></i>
							</label> <label class="btn btn-outline-success ls0 nott"> <input
								type="radio" class="required" name="feedback-form-cleanliness"
								id="feedback-form-cleanliness-4" value="Good"><i
								class="icon-smile1"></i>
							</label> <label class="btn btn-outline-success ls0 nott"> <input
								type="radio" class="required" name="feedback-form-cleanliness"
								id="feedback-form-cleanliness-5" value="Awesome"><i
								class="icon-grin-beam1"></i>
							</label>
						</div>
					</div> <!-- <div class="alert alert-danger">
						  <i class="icon-remove-sign"></i><strong>Oh snap!</strong> 위험! 관리가 필요합니다!
						</div> -->
</td>
		</tr>
		<tr>
			<td align="center">2</td>
			<td align="center">BMI</td>
			<td align="center"><ul class="skills">
					<li><div class="progress skills-animated" style="width: 40%;">
							<div class="progress-percent">
								<div class="counter counter-inherit counter-instant">
									<span data-from="0" data-to="40" data-refresh-interval="30"
										data-speed="1100"></span>%
								</div>
							</div>
						</div></li>
				</ul></td>
				<td align="center">120~125</td>
				<td align="center">  <div class="alert alert-warning">
						  <i class="icon-warning-sign"></i><strong>Warning!</strong> 주의가 필요합니다!
						</div>
</td>
		</tr>
		<tr>
			<td align="center">3</td>
			<td align="center">섭취칼로리</td>
			<td align="center"><ul class="skills">
					<li><div class="progress skills-animated" style="width: 10%;">
							<div class="progress-percent">
								<div class="counter counter-inherit counter-instant">
									<span data-from="0" data-to="${userWeeklyKcalList.get(6).total_kcal / standard.calory * 100}" data-refresh-interval="30"
										data-speed="1100"></span>%
								</div>
							</div>
						</div></li>
				</ul></td>
				<td align="center">${standard.calory} kcal</td>
				<td align="center" style="width:400px;">
					<c:if test="${userWeeklyKcalList.get(6).total_kcal <= standard.calory}">
						<div class="alert alert-success" >
							<i class="icon-gift"></i><strong>Well done!</strong> 지금처럼 유지하세요! 
						</div>
					</c:if>
					
					<c:if test="${userWeeklyKcalList.get(6).total_kcal > standard.calory}">
						<div class="alert alert-warning">
							<i class="icon-warning-sign"></i><strong>Warning!</strong> 주의가 필요합니다!
						</div>
					</c:if>
				</td>
		</tr>
	</tbody>
</table>
<br><br>


<%@ include file="../include/footer.jsp"%>
<%@ include file="../include/footerScript.jsp"%>
</body>