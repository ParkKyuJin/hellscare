 <%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>




<head>

	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />

	<!-- Stylesheets
	============================================= -->


	
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
	<!-- DatePicker CSS -->
	<link rel="stylesheet" href="resources/css/components/datepicker.css" type="text/css" />

	<!-- Bootstrap File Upload CSS -->
	<link rel="stylesheet" href="resources/css/components/bs-filestyle.css" type="text/css" />

	<link rel="stylesheet" href="resources/css/responsive.css" type="text/css" />

	<link rel="stylesheet" href="resources/css/custom.css" type="text/css" />
	
	

	<!-- Document Title
	============================================= -->
	

	<!-- Document Title
	============================================= -->
	<title>Canvas | The Multi-Purpose HTML5 Template</title>

</head>

<body class="stretched">

<!-- Document Wrapper
	============================================= -->
		<%@ include file="../include/header.jsp"%>
		
	<div>
	
	
	<section id="page-title">

         <div class="container clearfix">
            <h1>게시판</h1>
            <span>VIEW</span>
         </div>
      </section><!-- #page-title end -->
	
	<!-- Content
		============================================= -->
		<section id="content">

			<div class="content-wrap">

				<div class="container clearfix">

					<!-- Post Content
					============================================= -->
					<div class="postcontent nobottommargin clearfix">

						<div class="single-post nobottommargin">

							<!-- Single Post
							============================================= -->
							
						<form name="form1" action="post">	
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<input type="hidden" name="board_code" value="${dto.board_code}">
							<div class="entry clearfix">
	
								<!-- Entry Title
								============================================= -->
								<div class="entry-title">
									<h2>${dto.title}</h2>
								</div><!-- .entry-title end -->

								<!-- Entry Meta
								============================================= -->
								<ul class="entry-meta clearfix">
									<li><i class="icon-calendar3"></i>${dto.write_date}</li>
									<li><a href="#"><i class="icon-user"></i> ${dto.username}</a></li>
									<li><a href="#"><i class="icon-comments"></i> 43 Comments</a></li>
									<c:if test="${board_image}"><li><i class="icon-camera-retro"></i></a></li></c:if>
								</ul><!-- .entry-meta end -->

							<%-- 	<c:if test="${board_image}">
								<!-- Entry Image 첨부 이미지가 있을 경우
								============================================= -->
								<div class="entry-image">
									<img src="images/blog/full/1.jpg" alt="Blog Single"></a>
								</div><!-- .entry-image end -->
								</c:if> --%>

								<!-- Entry Content
								============================================= -->
								<div class="entry-content notopmargin">

									<p>${dto.content}</p>

									

								</div>
							</div><!-- .entry end -->
							
							<!-- 작성자와 접속자가 동일할 때 수정/삭제 가능 -->
							<%-- <c:if test="${sessionScope.username == dto.username}">  --%>
								<div style="float: right;">
								<button type="button" class="btn btn-outline-info" id="bUpdate">수정</button>
								<button type="button" class="btn btn-outline-info" id="bDelete">삭제</button>
								</div>
							<%-- </c:if> --%>
						</form>	
							<br><br>
							
							<!-- Post Navigation
							============================================= -->
							<div class="post-navigation clearfix">

								<div class="col_half nobottommargin">
									<a href="#">&lArr; 이전 글</a>
								</div>
								
								<div>
									<a href="boardList">목록</a>
								</div>

								<div class="col_half col_last tright nobottommargin">
									<a href="#">다음 글 &rArr;</a>
								</div>

							</div><!-- .post-navigation end -->


							<!-- Comments
							============================================= -->
							<div id="comments" class="clearfix">

								<h3 id="comments-title"><span>${commentCnt}</span> Comments</h3>

								<!-- Comment Form
								============================================= -->
								<div id="respond" class="clearfix">

									<h3>Leave a <span>Comment</span></h3>

									<form name="form3" class="clearfix" action="#" method="GET" id="commentform">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
										<div class="clear"></div>

										<div class="col_full">
											<label for="comment">Comment</label>
											<textarea name="comment" cols="58" rows="7" tabindex="4" class="sm-form-control" id="comment"></textarea>
										</div>

										<div class="col_full nobottommargin">
											<button name="submit" type="submit" id="submit-button" tabindex="5" value="Submit" class="button button-3d nomargin">Submit Comment</button>
										</div>

									</form>

								</div><!-- #respond end -->
								
								<form name="form2" action="post">

								<!-- Comments List
								============================================= -->
								<ol class="commentlist clearfix" id="commentlist">
									<%@ include file="../Users/commentList.jsp" %>
								</ol><!-- .commentlist end -->
								
								</form>
								<div class="clear"></div>

							</div><!-- #comments end -->

						</div>
						
					</div><!-- .postcontent end -->

				</div>

			</div>

		</section><!-- #content end -->

	<!-- Footer
	============================================= -->
	<%@ include file="../include/footer.jsp" %>

	</div><!-- #wrapper end -->

	<%@ include file="../include/footerScript.jsp" %>
	
		<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>

	<!-- External JavaScripts
	============================================= -->
	<script src="resources/js/jquery.js"></script>
	<script src="resources/js/plugins.js"></script>

	<!-- DatePicker JS -->
	<script src="resources/js/components/datepicker.js"></script>

	<!-- Bootstrap File Upload Plugin -->
	<script src="resources/js/components/bs-filestyle.js"></script>

	<!-- TinyMCE Plugin -->
	<script src="resources/js/components/tinymce/tinymce.min.js"></script>

	<!-- Footer Scripts
	============================================= -->
	<script src="resources/js/functions.js"></script>

	<script>
		jQuery(document).ready( function(){
			$('.dobpicker').datepicker({
				autoclose: true,
			});

			$("#jobs-application-resume").fileinput({
				required: true,
				browseClass: "btn btn-secondary",
				browseIcon: "",
				removeClass: "btn btn-danger",
				removeLabel: "",
				removeIcon: "<i class='icon-trash-alt1'></i>",
				showUpload: false
			});

			tinymce.init({
				selector: '#jobs-application-message',
				menubar: false,
				setup: function(editor) {
					editor.on('change', function(e) {
						editor.save();
					});
				}
			});
		})
	</script>
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			commentList();
			
			//댓글 쓰기 버튼 클릭 이벤트(ajax)
			$("#submit-button").click(function(){
				var comment = $("#comment").val();
				var board_code = "${dto.board_code}"
				var param = "comment=" + comment + "&board_code=" + board_code;
				
				$.ajax({
					type:"GET",
					url:"${pageContext.request.contextPath}/commentIn",
					data:param,
					success:function(){
						console.log("success");
						alert("댓글등록");
						commentList();
					}
				});
			});
		
			//게시글 삭제 버튼 클릭 이벤트
			$("#bDelete").click(function(){
				if(confirm("삭제하시겠습니까?")){
					document.form1.action = "${pageContext.request.contextPath}/boardDelete";
					document.form1.submit();
				}
			});
			
			//게시글 수정 버튼 이벤트
			$("#bUpdate").click(function(){
				document.form1.action = "${pageContext.request.contextPath}/boardUpdate";
			});
			
			//댓글 삭제 버튼 클릭 이벤트
			$("#cDelete").click(function(){
				if(confirm("삭제하시겠습니까?")){
					document.form2.action = "${pageContext.request.contextPath}/commentDelete";
					document.form2.submit();
				}
			});
			
			//댓글 수정 버튼 이벤트
			$("#cUpdate").click(function(){
				var content = $("#content").val();
				
				if(content == ""){
					alert("내용을 입력하세요");
					document.form2.content.focus();
					return;
				}
				
				document.form2.action="${pageContext.request.contextPath}/commentUpdate";
				document.form2.submit();
			});
			
			function commentList(){
				$.ajax({
					type:"GET",
					url:"${pageContext.request.contextPath}/commentList?board_code=${dto.board_code}",
					success:function(result){
						
						console.log(result);
						
						/* var html = "";
						var cnt = result.length;
						
						if(cnt > 0){
							for(var i=0; i <cnt; i++){
								html += '<li class="comment even thread-even depth-1" id="li-comment-1">';
								html += '<div class="comment-meta">';
								html += '<div class="comment-author vcard">';
								html += '<span class="comment-avatar clearfix">';
								html += "<img alt='' src='http://0.gravatar.com/avatar/ad516503a11cd5ca435acc9bb6523536?s=60' class='avatar avatar-60 photo avatar-default' height='60' width='60' />"+"</span>";
								html += "</div>";
								html += "</div>";
								html += '<div class="comment-content clearfix" id="commentList">';
								html += '<div class="comment-author">' + result[i].username + "<span>" + '<a href="#" title="Permalink to this comment">' + result[i].comment_date + "</a>" + "</span>" + "</div>";
								html += '<textarea name="content" id="content">';
								html += result[i].content;
								html += "</textarea>"
								html += "<a class='comment-reply-link' href='#'>" + '<i class="icon-reply">' + "</i>" + "</a>";
								html += '<div style="float: right;">';
								html += '<button type="button" class="btn btn-secondary btn-sm" id="cUpdate">' + "수정" + "</button>";
								html += '<button type="button" class="btn btn-secondary btn-sm" id="cDelete">'+ '삭제' + '</button>';
								html += "</div>";
								html += "</div>";
								html += '<div class="clear">' + "</div>";
								html += "</div>";
								html += "</li>"; 
							}
							
						}else {
							html += "<h6>등록된 댓글이 없습니다.</h6>"
						} */
						 /* for(var i in result){
							 output += '<li class="comment even thread-even depth-1" id="li-comment-1">';
							output += '<div class="comment-meta">';
							output += '<div class="comment-author vcard">';
							output += '<span class="comment-avatar clearfix">';
							output += "<img alt='' src='http://0.gravatar.com/avatar/ad516503a11cd5ca435acc9bb6523536?s=60' class='avatar avatar-60 photo avatar-default' height='60' width='60' />"+"</span>";
							output += "</div>";
							output += "</div>";
							output += '<div class="comment-content clearfix" id="commentList">';
							output += '<div class="comment-author">' + result[i].username + "<span>" + '<a href="#" title="Permalink to this comment">' + result[i].comment_date + "</a>" + "</span>" + "</div>";
							output += '<textarea name="content" id="content">';
							output += result[i].content;
							output += "</textarea>"
							output += "<a class='comment-reply-link' href='#'>" + '<i class="icon-reply">' + "</i>" + "</a>";
							output += '<div style="float: right;">';
							output += '<button type="button" class="btn btn-secondary btn-sm" id="cUpdate">' + "수정" + "</button>";
							output += '<button type="button" class="btn btn-secondary btn-sm" id="cDelete">'+ '삭제' + '</button>';
							output += "</div>";
							output += "</div>";
							output += '<div class="clear">' + "</div>";
							output += "</div>";
							output += "</li>"; 
							output += result[0].username;
							
						}  */
						$("#commentlist").html(result);
					}
				});
			}
		
		});
	</script>
	

</body>
</html>
