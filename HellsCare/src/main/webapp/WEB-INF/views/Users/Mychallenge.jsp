<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp"%>
<!DOCTYPE html>


<section id="page-title">
			<div class="container clearfix">
				<h1>나의 도전과제</h1>
				<span>진행중인 도전과제를 확인해보세요!</span>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="main">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page"><a href="challenge">challenge</a></li>
				</ol>
			</div>

</section><!-- #page-title end -->
<section id="content">
<c:if test="${cnt == 0}">
	<div class="style-msg2 successmsg" style="text-decoration:none;"  align="center">
		<div class="msgtitle">도전등록을 하신 운동이 없습니다!</div>
		<div class="sb-msg">
			<ul>
				<li>1. 마우스를 상단메뉴의 이벤트 탭으로 가져간다.</li>
				<li> 2. 아래 내려온 메뉴에서 도전과제 메뉴를 클릭한다.</li>
				<li> 3. 도전해보고 싶은 과제를 살펴본 뒤 당차게 도전하기 버튼을 클릭한다!</li>
				<li> 4. 도전과제를 달성하기 위해 열심히 노력한다!</li>
			</ul>
		</div>
	</div>
</c:if>
<c:if test="${cnt != 0}">
		<div class="content-wrap">

			<div class="container clearfix">

					<!-- Portfolio Filter
					============================================= -->
				
					<!-- Portfolio Items
					============================================= -->
					<div id="portfolio" class="portfolio grid-container portfolio-1 clearfix">
					<c:forEach var="dto" items="${list}">
						<article class="portfolio-item pf-media pf-icons clearfix">
							<div class="portfolio-image">
									<img src="/hellscare/resources/eventimg/${dto.challenge_img}" style="height:500px;width:700px;" alt="Open Imagination">		
							</div>
							<div class="portfolio-desc">
								<h3><a href="challengedetail?code=${dto.challenge_code}">${dto.challenge_name}</a></h3>
								<p>${dto.challenge_content}</p>
								<ul class="iconlist">
									<li><i class="icon-ok"></i> <strong>보상포인트:</strong><p><b>${dto.challenge_gift} Points</b></p></li>
									<li><i class="icon-ok"></i> <strong>완료여부:</strong> <c:if test="${dto.done == 1}"><p style=:color:green;>완료</p></c:if>
										<c:if test="${dto.done != 1}"><p style=color:red;>미완료</p></c:if>
									</li>
									<li><i class="icon-ok"></i> <strong>시작일:</strong><p style=:color:green;>${dto.challenge_start}</p></li>
									<li><i class="icon-ok"></i> <strong>완료일:</strong> <c:if test="${dto.challenge_end == null}"><p style=color:red;>-</p></c:if>
																					<c:if test="${dto.challenge_end != null}"><p style=:color:green;>${dto.challenge_end}</p></c:if>
									</li>
								</ul>
								<a href="delchall?code=${dto.challenge_code}" class="button button-3d noleftmargin">도전 포기</a>
							</div>
						</article>
						<hr>
					</c:forEach>
						
					</div><!-- #portfolio end -->

				</div>

			</div>
</c:if>
		</section><!-- #content end -->
<!-- #content end -->



<%@ include file="../include/footer.jsp"%>
<%@ include file="../include/footerScript.jsp"%>