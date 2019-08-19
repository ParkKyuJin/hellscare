<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<section id="page-title">

			<div class="container clearfix">
				<h1>도전과제</h1>
				<span>도전과제를 달성하고 포인트를 쌓아보세요!</span>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="main2">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page"><a href="Mychallenge">My challenge</a></li>
				</ol>
			</div>

</section><!-- #page-title end -->
<section id="content">

			<div class="content-wrap">
 
				<!-- Posts
				============================================= -->
				<div id="posts" class="post-grid grid-container post-masonry post-masonry-full grid-3 clearfix">
<c:forEach var="dto" items="${dtos}">
					<div class="entry clearfix">
						<div class="entry-image">
							<a href="/hellscare/resources/eventimg/${dto.challenge_img}" data-lightbox="image"><img class="image_fade" src="/hellscare/resources/eventimg/${dto.challenge_img}" alt="Standard Post with Image"></a>
						</div>
						<div class="entry-title">
							<h2><a href="blog-single.html">${dto.challenge_name}</a></h2>
						</div>
						<ul class="entry-meta clearfix">
							<li><i class="icon-calendar3"></i>${dto.challange_date}</li>
							<li><a href="blog-single.html#comments"><i class="icon-comments"></i></a></li>
							<li><a href="#"><i class="icon-camera-retro"></i></a></li>
						</ul>
						<div class="entry-content">
							<p>${dto.challenge_content}</p>
							<a href="blog-single.html"class="more-link">Read More</a>
						</div>
					</div>
	</c:forEach>
				</div><!-- #posts end -->

			</div>

		</section><!-- #content end -->



<%@ include file="../include/footer.jsp"%>
<%@ include file="../include/footerScript.jsp"%>