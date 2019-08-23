<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
			<td align="center">  <div class="alert alert-danger">
						  <i class="icon-remove-sign"></i><strong>Oh snap!</strong> 위험! 관리가 필요합니다!
						</div>
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
									<span data-from="0" data-to="10" data-refresh-interval="30"
										data-speed="1100"></span>%
								</div>
							</div>
						</div></li>
				</ul></td>
				<td align="center">2200 kcal</td>
				<td align="center" style="width:400px;"> <div class="alert alert-success" >
						  <i class="icon-gift"></i><strong>Well done!</strong> 지금처럼 유지하세요! 
						</div>
</td>
		</tr>
	</tbody>
</table>
<br><br>


<%@ include file="../include/footer.jsp"%>
	<%@ include file="../include/footerScript.jsp"%>