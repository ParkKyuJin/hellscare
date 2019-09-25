 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 


<head>

	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />

	<!-- Stylesheets
	============================================= -->

	<meta name="viewport" content="width=device-width, initial-scale=1" />

	<!-- Document Title
	============================================= -->
	<title>Canvas | The Multi-Purpose HTML5 Template</title>

</head>

<body class="stretched">

<!-- Document Wrapper
	============================================= -->
	<%@ include file="../include/header.jsp" %>
		<%
		String club_name = request.getParameter("club_name");
		String club_master = request.getParameter("club_master");
		String club_kind = request.getParameter("club_kind");
		String area = request.getParameter("area");
		String club_max = request.getParameter("club_max");
		String club_pr = request.getParameter("club_pr");
		%>
	<div>
	
		<!-- Page Title
		============================================= -->
		<section id="page-title">

			<div class="container clearfix">
				<h1>동호회 개설비 지불</h1>
				<!-- <div id="portfolio-navigation">
					<a href="#"><i class="icon-angle-left"></i></a>
					<a href="#"><i class="icon-line-grid"></i></a>
					<a href="#"><i class="icon-angle-right"></i></a>
				</div> -->
			</div>

		</section><!-- #page-title end -->

		<!-- Content
		============================================= -->
		<section id="content">

			<div class="content-wrap">

				<div class="container clearfix">

			<!-- Portfolio Single Gallery
					============================================= -->
					<div class="col_full portfolio-single-image">
						<div class="fslider" data-arrows="true" data-animation="slide">
							<div class="flexslider">
								<div class="slider-wrap">
									<div class="slide"><a href="#"><img src="resources/images/club/ethereum1.jpg" alt=""></a></div>
									<div class="slide"><a href="#"><img src="resources/images/club/ethereum2.jpg" alt=""></a></div>
								</div>
							</div>
						</div>
					</div><!-- portfolio-single-image end -->
		<form action="payCreateClubPro" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> 
			<input type="hidden" name="club_name" value="<%= club_name %>">
			<input type="hidden" name="club_master" value="<%= club_master %>">
			<input type="hidden" name="club_kind" value="<%= club_kind %>">
			<input type="hidden" name="area" value="<%= area %>">
			<input type="hidden" name="club_max" value="<%= club_max %>">
			<input type="hidden" name="club_pr" value="<%= club_pr %>">
		
					<div class="col_one_third nobottommargin">
		
						<!-- Portfolio Single - Meta
						============================================= -->
						<div class="card events-meta">
							<div class="card-body">
								<ul class="portfolio-meta nobottommargin">
									<li><span><i class="icon-book"></i>동호회명:</span> <%= club_name %></li>
									<li><span><i class="icon-user"></i>개설자:</span> <%= club_master %></li>
									<li><span><i class="icon-lightbulb"></i>분류:</span> <%= club_kind %></li>
									<li><span><i class="icon-link"></i>지역:</span> <%= area %></li>
								</ul>
							</div>
						</div>
						<!-- Portfolio Single - Meta End -->



					</div>

					<!-- Portfolio Single Content
					============================================= -->
					<div class="col_two_third portfolio-single-content col_last nobottommargin">

						<!-- Portfolio Single - Description
						============================================= -->
						<div class="fancy-title title-dotted-border">
							<h2>개설비 지불정보:</h2>
						</div>

						<div class="col_half nobottommargin">
							<p>이더를 지급하실 개인키와 지불하실 이더를 입력하세요</p>
							<p>개설비는 동호회를 개설할 때 최초 일회만 지급받습니다.</p>
							<p>지불한 개설비는 동호회를 해산하여도 반환되지 않습니다.</p>
						</div>

						<div class="col_half col_last nobottommargin">
						
							
							<p><b style="font-size:1.5em" >private key: </b><br>
							<input type="password" name="user_key" size="50"></p>
							<p><b style="font-size:1.5em"> 개설비(ETH): </b><br>
							<input type="text" name="amount"></p>
							<p><button type="submit" class="button button-desc button-border button-rounded center">지불하기</button>
							<button type="button" class="button button-desc button-border button-rounded center" onclick="return cancelChk();">취소</button></p>
					
						</div>
						<!-- Portfolio Single - Description End -->

					</div><!-- .portfolio-single-content end -->
			</form>
					<div class="clear"></div>

					<div class="divider divider-center"><i class="icon-circle"></i></div>

	<!-- .portfolio-carousel end -->
	
	

				</div>

			</div>

		</section><!-- #content end -->
	
	

	<!-- Footer
	============================================= -->
	<%@ include file="../include/footer.jsp" %>

	</div><!-- #wrapper end -->

	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>


	<%@ include file="../include/footerScript.jsp" %>

<script type="text/javascript">


</script>

<script type="text/javascript">
	function cancelChk(){
		if(confirm("동호회 개설을 취소하시겠습니까?")){
			window.location="cancel_club?club_name="+<%=club_name%>;	
		} else{
			return false;
		}
	}
</script>


</body>
</html>
