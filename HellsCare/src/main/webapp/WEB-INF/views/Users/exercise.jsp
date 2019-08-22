<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<nav class="navbar navbar-light bg-light justify-content-between">
		<a class="navbar-brand" style="margin: 0 auto;">운동목록</a>
	</nav>
	<!-- Content
		============================================= -->
	<section id="content">

		<div class="content-wrap">
			<div class="container clearfix">

				<div class="fancy-title title-center title-dotted-border">
					<h3>스트레칭</h3>
				</div>

				<div id="oc-images"
					class="owl-carousel image-carousel carousel-widget"
					data-margin="20" data-nav="true" data-pagi="true" data-items-xs="2"
					data-items-sm="3" data-items-lg="4" data-items-xl="5">
					<c:if test="${cntSt == 0}">
						<div class="oc-item">
						<img
							src="/hellscare/resources/exercise/wait.jpg" alt="Image 1">
						</div>
					</c:if>
					
					<c:if test="${cntSt != 0}">
						<c:forEach var="dtosSt" items="${dtosSt}">
							<div class="oc-item">
								<a href="details_exercise?exercise_code=${dtosSt.exercise_code}"><img
									src="/hellscare/resources/video/${dtosSt.exercise_img}" alt="Image 1" style="width:200px; height:160px;" ></a>
							</div>
						</c:forEach>
					</c:if>
				</div>
				
				<div class="clear"></div>
				<div class="line"></div>

				<div class="fancy-title title-center title-dotted-border">
					<h3>유산소 운동</h3>
				</div>

				<div id="oc-images"
					class="owl-carousel image-carousel carousel-widget"
					data-margin="20" data-nav="true" data-pagi="true" data-items-xs="2"
					data-items-sm="3" data-items-lg="4" data-items-xl="5">
					<c:if test="${cntDi == 0}">
						<div class="oc-item">
						<img
							src="/hellscare/resources/exercise/wait.jpg" alt="Image 1">
						</div>
					</c:if>
					<c:if test="${cntDi != 0}">
						<c:forEach var="dtosDi" items="${dtosDi}">
							<div class="oc-item">
								<a href="details_exercise?exercise_code=${dtosDi.exercise_code}">
								<img src="/hellscare/resources/video/${dtosDi.exercise_img}"
									alt="Image 1"  style="width:200px; height:160px;"></a>
							</div>
						</c:forEach>
					</c:if>
				</div>
				
				<div class="clear"></div>
				<div class="line"></div>
			</div>
		</div>
	</section>
	<!-- #content end -->


	<%@ include file="../include/footer.jsp"%>
	<%@ include file="../include/footerScript.jsp"%>
</body>
</html>