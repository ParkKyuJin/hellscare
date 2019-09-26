 <%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




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
            <span>password confirm</span>
         </div>
      </section><!-- #page-title end -->
	
	<!-- Content
		============================================= -->
		<section id="content">

			<div class="content-wrap">

				<div class="container clearfix">
				<c:if test="${pwdconfirm == 0}">
					<script type="text/javascript">
						alert("비밀번호가 틀렸습니다!");
						window.history.back();
					</script>
				</c:if>
				<c:if test="${pwdconfirm==1}">
					<!-- Post Content
					============================================= -->
					<div class="postcontent nobottommargin clearfix">

						<div class="single-post nobottommargin">

							<!-- Single Post
							============================================= -->
							
						<form name="form1" action="qna_modi" method="post">	
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<input type="hidden" name="qna_code" value="${dto.qna_code}">
							<div class="entry clearfix">
	
								<!-- Entry Title
								============================================= -->
								<div class="entry-title">
									<h2>${dto.title}</h2>
								</div><!-- .entry-title end -->

								<!-- Entry Meta
								============================================= -->
								<ul class="entry-meta clearfix">
									<li><i class="icon-calendar3"></i>${dto.qna_write_date}</li>
									<li><a href="#"><i class="icon-user"></i> ${dto.username}</a></li>
									<li><a href="#"><i class="icon-comments"></i> 43 Comments</a></li>
									<li><a href="#"><i class="icon-comments"></i> ${dto.kind}</a></li>
									<c:if test="${board_image}"><li><i class="icon-camera-retro"></i></a></li></c:if>
								</ul><!-- .entry-meta end -->


								<!-- Entry Content
								============================================= -->
								<div class="entry-content notopmargin">

									<p>${dto.content}</p>

									

								</div>
							</div><!-- .entry end -->
							
							<!-- 작성자와 접속자가 동일할 때 수정/삭제 가능 -->
							<%-- <c:if test="${sessionScope.username == dto.username}">  --%>
								<div style="float: right;">
								<button type="submit" class="btn btn-outline-info" id="qUpdate" onclick="javascript:form.action='qna_modi?qna_code=${dto.qna_code}'">수정</button>
								<button type="submit" class="btn btn-outline-info" id="qDelete" onclick="javascript:form.action='qna_delete?qna_code=${dto.qna_code}'">삭제</button>
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

								
								<form name="form2" action="post">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								<!-- Comments List 댓글목록
								============================================= -->
								<ol class="commentlist clearfix" id="commentlist">
									<%@ include file="../Users/commentList.jsp" %>
								</ol><!-- .commentlist end -->
								
								</form>
								<div class="clear"></div>

							</div><!-- #comments end -->

						</div>
						
					</div><!-- .postcontent end -->
					</c:if>
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

<!-- 	<script src="../include/test.js"></script> -->
	
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
		
		/* 	//게시글 삭제 버튼 클릭 이벤트
			$("#bDelete").click(function(){
				if(confirm("삭제하시겠습니까?")){
					document.form1.action = "${pageContext.request.contextPath}/board_delete";
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
			}); */
			
			function commentList(){
				$.ajax({
					type:"GET",
					url:"${pageContext.request.contextPath}/QnAHosts?qna_code=${dto.qna_code}",
					success:function(result){
						
						console.log(result);
						
						
						$("#commentlist").html(result);
					}
				});
			}
		
		});
	</script>


</body>
</html>
