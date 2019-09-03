<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<script type="text/javascript">
function idfySend() {
	var challange = $('#search').val();
	
	$.ajax({
		url : '${pageContext.request.contextPath}/challengesearch', // 컨트롤러/drugInfo_sub
		type : 'GET',
		data: 'content=' + challange,
		
		success : function(result) { // 콜백함수 - 정상적으로 처리되었을 때의 결과가 result에 들어간다.
			// 변수명이 반드시 .html(result)일 필요는 없으나 위 콜백함수와의 변수명과 일치해야 한다.
			$('#result').html(result);
		},
		error : function() {
			alert("오류");	
		}		
	});
	
}

<!--

//-->
</script>


<section id="page-title" class="page-title-parallax page-title-dark" style="background-image: url('/hellscare/resources/images/challmenu.jpg'); background-size: cover; padding: 80px 0;" data-bottom-top="background-position:0px 0px;" data-top-bottom="background-position:0px -300px;">

			<div class="container clearfix">
				<h1>도전과제</h1>
				<span  style="color:white;">도전과제를 달성하고 포인트를 쌓아보세요!</span>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="main2">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page"><a href="Mychallenge">My challenge</a></li>
				</ol>
			</div>

</section><!-- #page-title end -->
				
<section id="content">
				<div class="col-lg-2">
					<label>이벤트명을 입력하세요</label>
					<input  onkeyup="idfySend();" type="text"  class="required sm-form-control input-block-level valid" size="20px" id="search" >
				</div>
		 <div id="result">
			<div class="content-wrap">
				
				<div class="container clearfix">
			
					<div class="row grid-container" data-layout="masonry" style="overflow: visible">
						<c:forEach var="dto" items="${dtos}">
						<div class="col-lg-4 mb-4">
							<div class="flip-card text-center">
								<div class="flip-card-front dark" style="background-image: url('/hellscare/resources/eventimg/${dto.challenge_img}')">
									<div class="flip-card-inner">
										<div class="card nobg noborder text-center">
											<div class="card-body">
												<i class="icon-line2-camera h1"></i>
												<h3 class="card-title">${dto.challenge_name}</h3>
												<p class="card-text t400">${dto.challenge_content}</p>
											</div>
										</div>
									</div>
								</div>
								<div class="flip-card-back bg-danger no-after">
									<div class="flip-card-inner">
										<p class="mb-2 text-white">${dto.challenge_content}</p>
										<a href="challengedetail?code=${dto.challenge_code}"><button type="button"class="btn btn-outline-light mt-2">자세히보기</button></a>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
					</div>
			
				</div>
					
			</div>
			</div>
		</section><!-- #content end -->




<%@ include file="../include/footer.jsp"%>
<%@ include file="../include/footerScript.jsp"%>