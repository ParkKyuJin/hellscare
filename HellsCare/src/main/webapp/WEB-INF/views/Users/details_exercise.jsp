<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<body>
	<%@ include file="../include/header.jsp"%>
	<nav class="navbar navbar-light bg-light justify-content-between">
		<a class="navbar-brand" style="margin: 0 auto;">운동소개</a>
	</nav>
	<!-- Content
		============================================= -->
	<section id="content">

		<div class="content-wrap">
			<div class="container clearfix">
				<!-- Post Content
					============================================= -->
				<div class="postcontent nobottommargin clearfix">
					<h3>
					<c:if test="${cnt != 1}">
						<a href="#" onclick="return favorit();"><i class="icon-star-empty"></i></a>
					</c:if>
					<c:if test="${cnt == 1}">
						<a href="#" onclick="return defavorit();"><i class="icon-star3"></i></a>
					</c:if>&emsp;&emsp;${vo.exercise_name}</h3>
				<iframe width="800" height="500" src="/hellscare/resources/images/videos/${vo.exercise_video}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
					<div class="divider">
						<i class="icon-circle"></i>
						<h4>&emsp;&emsp;&emsp;30분당 소모되는칼로리는 <font style="color:red">${vo.kcal}</font>입니다.</h4>
					</div>
				</div>
				<!-- .postcontent end -->

				<!-- Sidebar
					============================================= -->
				<div class="sidebar nobottommargin col_last clearfix">
					<div class="sidebar-widgets-wrap">
						<div class="widget widget_links clearfix">
							<h4>부위별 스트레칭</h4>
							<ul>
								<li><a href="details_stretching?part=1" style="font-weight:bold">목</a></li>
								<li><a href="details_stretching?part=2" style="font-weight:bold">어깨</a></li>
								<li><a href="details_stretching?part=3" style="font-weight:bold">허리</a></li>
								<li><a href="details_stretching?part=4" style="font-weight:bold">골반</a></li>
								<li><a href="details_stretching?part=5" style="font-weight:bold">다리</a></li>
								<li><a href="details_stretching?part=6" style="font-weight:bold">손목,발목</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- .sidebar end -->
				<!-- Portfolio Single Content
						============================================= -->
				<div class="col_full portfolio-single-content">

					<!-- Portfolio Single - Description
						============================================= -->
					<div class="fancy-title title-dotted-border">
						<h2>운동방법:</h2>
					</div>
					<p>${vo.way}</p>
					<!-- Portfolio Single - Description End -->
				</div>
				
				<div class="line">
				</div>
				
				<div class="col_full portfolio-single-content">

					<!-- Portfolio Single - Description
						============================================= -->
					<div class="fancy-title title-dotted-border">
						<h2>주의사항:</h2>
					</div>
					<p>${vo.note}</p>
					<!-- Portfolio Single - Description End -->

				</div>
				<!-- .portfolio-single-content end -->
				<div class="line"></div>
				
				<div class="col_full portfolio-single-content" style="margin:0 auto;">
					<a href="exercise" class="button button-border button-rounded button-fill fill-from-bottom button-black" style="text-align:center; float:right"><span>목록으로 돌아가기 →</span></a>
				</div>
			</div>
			<div class="line"></div>
		</div>

	</section>
	<!-- #content end -->
	<%@ include file="../include/footer.jsp"%>
	<%@ include file="../include/footerScript.jsp"%>
	<script type="text/javascript">
		function favorit(){
			if(confirm("즐겨찾기에 추가하시겠습니까?")){
				window.location="addFavorit?exercise_code="+${vo.exercise_code};
			} else{
				return false;
			}
		}
	</script>
	
	<script type="text/javascript">
		function defavorit(){
			if(confirm("즐겨찾기에서 삭제하시겠습니까?")){
				window.location="removeFavorit?favorite_code="+${favorite_code}+"&exercise_code="+${vo.exercise_code};
			} else{
				return false;
			}
		}
	</script>
</body>
</html>