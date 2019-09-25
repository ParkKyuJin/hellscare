<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스 상세</title>
</head>
<body class="stretched device-md gototop-active">

	<!-- Document Wrapper
	============================================= -->
	<div id="wrapper" class="clearfix">

		<!-- Header
		============================================= -->
		<%@ include file="../include/header.jsp" %>
		<!-- #header end -->

		<!-- Page Title
		============================================= -->
		<section id="page-title">
			<div class="container clearfix">
				<h1>건강 뉴스 페이지</h1>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="main">Home</a></li>
					<li class="breadcrumb-item"><a href="#">뉴스</a></li>
					<li class="breadcrumb-item active" aria-current="page">건강 뉴스</li>
				</ol>
			</div>
		</section><!-- #page-title end -->
		
			<!-- Content
		============================================= -->
		<section id="content" style="margin-bottom: 0px;">

			<div class="content-wrap">

				<div class="container clearfix">

					<!-- Post Content
					============================================= -->
					<div class="postcontent nobottommargin clearfix">

						<div class="single-post nobottommargin">

							<!-- Single Post
							============================================= -->
							<div class="entry clearfix">

								<!-- Entry Title
								============================================= -->
								<div class="entry-title">
									<h2>${news.newsTitle}</h2>
								</div><!-- .entry-title end -->

								<!-- Entry Meta
								============================================= -->
								<ul class="entry-meta clearfix">
									<li><i class="icon-calendar3"></i> ${news.newsDate}</li>
									<li><i class="icon-user"></i> ${news.newsAuthor}</li>
									<li><i class="icon-folder-open"></i> 건강</li>
									<li><a href="#"><i class="icon-camera-retro"></i></a></li>
								</ul><!-- .entry-meta end -->

								<!-- Entry Image
								============================================= -->
								<div class="entry-image">
									<c:if test="${news.newsImg != null}">
										<img src="${news.newsImg}">
									</c:if>
								</div><!-- .entry-image end -->

								<!-- Entry Content
								============================================= -->
								<div class="entry-content notopmargin">

									<p>${news.newsContents}</p>
									<!-- Post Single - Content End -->

								</div>
							</div><!-- .entry end -->

							<h4>Related Posts:</h4>

							<div class="related-posts clearfix">
							
								<c:set var="cnt" value="0" />
								
								<c:forEach var="other_news" items="${newsDtos}">
									
									<c:if test="${cnt % 8 == 0}">
										<div class="col_half nobottommargin">
									</c:if>
									
									<c:if test="${cnt % 8 == 4}">
										<div class="col_half nobottommargin col_last">
									</c:if>
							
									<div class="mpost clearfix">
										<div class="entry-image">
											<a href="news_detail?newsUrl=${other_news.newsUrl}">
												<img src="${other_news.newsThumbnail}" onerror="this.src='/hellscare/resources/white.jpg'">				
											</a>
										</div>
										<div class="entry-c">
											<div class="entry-title">
												<h4><a href="news_detail?newsUrl=${other_news.newsUrl}">${other_news.newsTitle}</a></h4>
											</div>
											<ul class="entry-meta clearfix">
												<li><i class="icon-calendar3"></i>${other_news.newsDate}</li>
											</ul>
											<div class="entry-content">${other_news.newsSummary}</div>
										</div>
									</div>
									
									<c:if test="${cnt % 8 == 3 }">
										</div>
									</c:if>
									
									<c:if test="${cnt % 8 == 7 }">
										</div>
									</c:if>
									
									<c:set var="cnt" value="${cnt = cnt + 1}" />
								</c:forEach>
							</div>

						</div>

					</div><!-- .postcontent end -->

					<!-- Sidebar
					============================================= -->

							</div>

						</div>

					</section>
					<!-- Content end -->
		
				</div>

			</div>

		</section>
		<!-- #content end -->

		<!-- Footer
		============================================= -->
		<%@ include file="../include/footer.jsp"%>
		<!-- #footer end -->

	</div><!-- #wrapper end -->

	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>

	<%@ include file="../include/footerScript.jsp"%>
	
	<script src="resources/js/chart.js"></script>
	<script src="resources/js/chart-utils.js"></script>
</body>
</html>