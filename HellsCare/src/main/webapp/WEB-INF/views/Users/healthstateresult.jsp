<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<body class="stretched">
<%@ include file="../include/header.jsp"%>
<section id="page-title">

			<div class="container clearfix">
				<h1>진단 결과</h1>
				<span>입력하신 정보를 토대로 위험군을 안내합니다.</span>
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
			<td align="center" style="font-size:1.7em;">BMI</td>
			<td align="center"><ul class="skills">
					<li><div class="progress skills-animated" style="width: 80%;">
							<div class="progress-percent">
								<div class="counter counter-inherit counter-instant">
									<span data-from="0" data-to="${dto.bmi}" data-refresh-interval="30"
										data-speed="1100"></span>
								</div>
							</div>
						</div></li>
				</ul></td>
			<td align="center"style="font-size:1.7em;"> 18.5 ~ 23</td>
			<td align="center"> 
			<c:if test="${dto.bmi>=18.5&&dto.bmi<=23}">
			<div class="alert alert-danger">
			 <i class="icon-warning-sign"></i><strong>Warning!</strong> 과체중! 주의가 필요합니다!
						 
						</div> <!-- <div class="alert alert-danger">
						  <i class="icon-remove-sign"></i><strong>Oh snap!</strong> 위험! 관리가 필요합니다!
						</div> -->
			</c:if>
			<c:if test="${dto.bmi>=23&&dto.bmi<=25}">
			<div class="alert alert-danger">
			 <i class="icon-warning-sign"></i><strong>Warning!</strong> 과체중! 주의가 필요합니다!
						 
						</div> <!-- <div class="alert alert-danger">
						  <i class="icon-remove-sign"></i><strong>Oh snap!</strong> 위험! 관리가 필요합니다!
						</div> -->
			</c:if>
			<c:if test="${dto.bmi>=25}">
			<div class="alert alert-danger">
			 <i class="icon-remove-sign"></i><strong>Oh snap!</strong> 위험! 관리가 필요합니다!
						 
						</div> <!-- <div class="alert alert-danger">
						  <i class="icon-remove-sign"></i><strong>Oh snap!</strong> 위험! 관리가 필요합니다!
						</div> -->
			</c:if>
</td> 
		</tr>
		<tr>
			<td align="center">2</td>
			<td align="center"style="font-size:1.7em;">혈당</td>
			<td align="center"><ul class="skills">
					<li><div class="progress skills-animated" style="width: 40%;">
							<div class="progress-percent">
								<div class="counter counter-inherit counter-instant">
									<span data-from="0" data-to="${dto.glucose}" data-refresh-interval="${dto.glucose*10}"
										data-speed="1100"></span>
								</div>
							</div>
						</div>
						</li>
				</ul></td>
				<td align="center"style="font-size:1.7em;">120~125</td>
				<td align="center">  <div class="alert alert-warning">
						  <i class="icon-warning-sign"></i><strong>Warning!</strong> 주의가 필요합니다!
						</div>
</td>
		</tr>
		<tr>
			<td align="center">3</td>
			<td align="center"style="font-size:1.7em;">혈압</td>
			<td align="center"><ul class="skills">
					<li><div class="progress skills-animated" style="width: 10%;">
							<div class="progress-percent">
								<div class="counter counter-inherit counter-instant">
									<span data-from="0" data-to="${dto.pressure}" data-refresh-interval="30"
										data-speed="1100"></span>
								</div>
							</div>
						</div></li>
				</ul></td>
				<td align="center"style="font-size:1.7em;">100 ~ 120</td>
				<td align="center" style="width:400px;">
				<c:if test="${dto.pressure<100}">
			<div class="alert alert-danger">
			 <i class="icon-warning-sign"></i><strong>Warning!</strong> 저혈압! 주의가 필요합니다!
						 
						</div> <!-- <div class="alert alert-danger">
						  <i class="icon-remove-sign"></i><strong>Oh snap!</strong> 위험! 관리가 필요합니다!
						</div> -->
			</c:if>
			<c:if test="${dto.pressure>=100&&dto.pressure<=120}">
			<div class="alert alert-success" >
							<i class="icon-gift"></i><strong>Well done!</strong> 지금처럼 유지하세요! 
						</div>
			</c:if>
			<c:if test="${dto.pressure>=130&&dto.pressure<140}">
			<div class="alert alert-danger">
			 <i class="icon-remove-sign"></i><strong>Oh snap!</strong> 위험! 관리가 필요합니다!
						 
						</div> <!-- <div class="alert alert-danger">
						  <i class="icon-remove-sign"></i><strong>Oh snap!</strong> 위험! 관리가 필요합니다!
						</div> -->
			</c:if>
			<c:if test="${dto.pressure>=140}">
			<div class="alert alert-danger">
			 <i class="icon-remove-sign"></i><strong>Oh snap!</strong> 위험! 관리가 필요합니다!
						 
						</div> <!-- <div class="alert alert-danger">
						  <i class="icon-remove-sign"></i><strong>Oh snap!</strong> 위험! 관리가 필요합니다!
						</div> -->
			</c:if>
				</td>
		</tr>
		<tr>
			<td align="center">4</td>
			<td align="center"style="font-size:1.7em;">음주량</td>
			<td align="center"><ul class="skills">
					<li><div class="progress skills-animated" style="width: 10%;">
							<div class="progress-percent">
								<div class="counter counter-inherit counter-instant">
									<span data-from="0" data-to="${dto.drinkAmount}" data-refresh-interval="30"
										data-speed="1100"></span>
								</div>
							</div>
						</div></li>
				</ul></td>
				<td align="center"style="font-size:1.7em;">4잔(맥주기준)</td>
				<td align="center" style="width:400px;">
				<c:if test="${dto.drinkAmount>4}">
			<div class="alert alert-danger">
			 <i class="icon-warning-sign"></i><strong>Warning!</strong> 폭음은 건강에 매우 해롭습니다!
						 
						</div> <!-- <div class="alert alert-danger">
						  <i class="icon-remove-sign"></i><strong>Oh snap!</strong> 위험! 관리가 필요합니다!
						</div> -->
			</c:if>
			<c:if test="${dto.drinkAmount<=4}">
			<div class="alert alert-success" >
							<i class="icon-gift"></i><strong>Well done!</strong> 지금처럼 유지하세요! 
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