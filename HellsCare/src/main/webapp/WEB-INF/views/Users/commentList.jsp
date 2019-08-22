<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/setting.jsp" %>
<html>
<body>

	

	 <c:forEach var="com" items="${co}">
		<li class="comment even thread-even depth-1" id="li-comment-1">

			<div id="comment-1" class="comment-wrap clearfix">

				<div class="comment-meta">

					<div class="comment-author vcard">

						<span class="comment-avatar clearfix">
						<img alt='' src='http://0.gravatar.com/avatar/ad516503a11cd5ca435acc9bb6523536?s=60' class='avatar avatar-60 photo avatar-default' height='60' width='60' /></span>

					</div>

				</div>

				<div class="comment-content clearfix" id="commentList">
					
					<div class="comment-author">${com.username}<span><a href="#" title="Permalink to this comment">${com.comment_date}</a></span></div>

					<p>${com.content}</p>

					<a class='comment-reply-link' href='#'><i class="icon-reply"></i></a>
					
					<c:if test="${sessionScope.username == com.username}">
						<div style="float: right;">
						<button type="button" class="btn btn-secondary btn-sm" id="cUpdate">수정</button>
						<button type="button" class="btn btn-secondary btn-sm" id="cDelete">삭제</button>
						</div>
					</c:if>
					
				</div>
				<div class="clear"></div>

			</div>	
		</li>
		</c:forEach> 
									
	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>

	<!-- External JavaScripts
	============================================= -->
	<script src="resources/js/jquery.js"></script>
	<script src="resources/js/plugins.js"></script>

	<!-- Bootstrap Data Table Plugin -->
	<script src="resources/js/components/bs-datatable.js"></script>

	<!-- Footer Scripts
	============================================= -->
	<script src="resources/js/functions.js"></script>

	
	
</body>
</html>