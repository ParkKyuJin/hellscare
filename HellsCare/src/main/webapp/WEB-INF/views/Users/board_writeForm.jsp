 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<head>

	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<!-- 	<meta name="author" content="SemiColonWeb" /> -->

	<!-- Stylesheets
	============================================= -->


	<!-- Document Title
	============================================= -->
	

	<!-- Document Title
	============================================= -->
	<title>Canvas | The Multi-Purpose HTML5 Template</title>

</head>
<!-- class="stretched" -->
<body >

<!-- Document Wrapper
	============================================= -->
		<%@ include file="../include/header.jsp"%>
		
	<div>
	
	
	<section id="page-title">

         <div class="container clearfix">
            <h1>게시글 작성</h1>
            <span>WRITE</span>
         </div>
      </section><!-- #page-title end -->
	
	<section id="content">

			<div class="content-wrap">

				<div class="container clearfix">

					<div>


						<div class="row">
							<div class="col-lg-12">
							<!-- class="row" -->
								<form  action="writePro" method="post" >
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
									<div class="form-process"></div>
									
									<div class="col-12 form-group">
										<label>제목:</label>
										<input type="text" name="title" id="title" class="form-control required" value="" placeholder="제목 입력">
									</div>
							
									<div class="col-12 form-group">
										<div class="row">
											<div class="col-md-6 form-group">
												<label>작성자:</label>
												<!-- <input type="text" name="username" id="username" class="form-control required" value="" disabled="disabled" placeholder=""> -->
												<input type="text" name="username" id="username" class="form-control required" value="${sessionScope.memId}" disabled="disabled">
											</div>
											
											<div class="col-md-6 form-group">
												<label>작성일:</label>
												<input type="text" class="form-control dobpicker required" name="writeDate" id="writeDate" value="${serverTime}" disabled="disabled" data-date-end-date="-18y">
											</div>
											
											<div class="w-100"></div>
										</div>
										
										<div class="form-group">
											<label>내용:</label>
											<textarea name="jobs-application-message"  class="form-control required" cols="30" rows="10"></textarea>
										</div>
									<!-- 	id="jobs-application-message" -->
										<!-- <div class="form-group">
											<label>파일 업로드:</label>
											<input type="file" id="jobs-application-resume" name="jobs-application-resume" class="file-loading" data-show-preview="false" />
										</div> -->
									</div>
									<!-- <div class="col-12 hidden">
										<input type="text" id="jobs-application-botcheck" name="jobs-application-botcheck" value="" />
									</div>  -->
									<div class="col-12">
									<!-- name="jobs-application-submit"  -->
										<button type="submit" class="btn btn-secondary">글쓰기 완료</button>
										<button  class="btn btn-secondary" onclick="window.history.back();">글쓰기 취소</button>
									</div>
<!-- 
									<input type="hidden" name="prefix" value="jobs-application-"> -->
								</form>
							</div>

							

								<div class="clear"></div>

							</div>

						</div>

					</div>

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
	

	<!-- Footer Scripts
	============================================= -->
<!-- 	<script src="resources/js/functions.js"></script> -->

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
	

</body>
</html>
