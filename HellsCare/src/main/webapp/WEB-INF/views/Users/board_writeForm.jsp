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
            <h1>게시글 작성</h1>
            <span>WRITE</span>
         </div>
      </section><!-- #page-title end -->
	
	<section id="content">

			<div class="content-wrap">

				<div class="container clearfix">

					<div class="form-widget">

						<div class="form-result"></div>

						<div class="row">
							<div class="col-lg-12">
								<form class="row" action="writePro" method="post" enctype="multipart/form-data">
									<div class="form-process"></div>
									
									<div class="col-12 form-group">
										<label>제목:</label>
										<input type="text" name="title" id="title" class="form-control required" value="" placeholder="제목 입력">
									</div>
							
									<div class="col-12 form-group">
										<div class="row">
											<div class="col-md-6 form-group">
												<label>작성자:</label>
												<input type="text" name="username" id="username" class="form-control required" value="" disabled="disabled" placeholder="보라돌이">
											</div>
											
											<div class="col-md-6 form-group">
												<label>작성일:</label>
												<input type="text" class="form-control dobpicker required" name="writeDate" id="writeDate" value="${serverTime}" disabled="disabled" data-date-end-date="-18y">
											</div>
											
											<div class="w-100"></div>
										</div>
										
										<div class="form-group">
											<label>내용:</label>
											<textarea name="jobs-application-message" id="jobs-application-message" class="form-control required" cols="30" rows="10"></textarea>
										</div>
										<div class="form-group">
											<label>파일 업로드:</label>
											<input type="file" id="jobs-application-resume" name="jobs-application-resume" class="file-loading" data-show-preview="false" />
										</div>
									</div>
									<div class="col-12 hidden">
										<input type="text" id="jobs-application-botcheck" name="jobs-application-botcheck" value="" />
									</div> 
									<div class="col-12">
										<button type="submit" name="jobs-application-submit" class="btn btn-secondary">글쓰기 완료</button>
										<button  name="jobs-application-cancel" class="btn btn-secondary">글쓰기 취소</button>
									</div>

									<input type="hidden" name="prefix" value="jobs-application-">
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
	

</body>
</html>
