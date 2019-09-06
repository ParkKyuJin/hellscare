 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>

	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />

	<!-- Stylesheets
	============================================= -->
	<%@ include file="../include/setting.jsp" %>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<!-- DatePicker CSS -->
	<link rel="stylesheet" href="resources/css/components/datepicker.css" type="text/css" />
	<!-- Bootstrap File Upload CSS -->
	<link rel="stylesheet" href="resources/css/components/bs-filestyle.css" type="text/css" />
	<link rel="stylesheet" href="resources/css/responsive.css" type="text/css" />
	<link rel="stylesheet" href="resources/css/custom.css" type="text/css" />
</head>
<body class="stretched">

<!-- Document Wrapper
	============================================= -->
	<%@ include file="../include/header.jsp"%>
	
	<div>
	<section id="page-title">

         <div class="container clearfix">
            <h1>${club_name} 상세페이지</h1>
            <span>Read</span>
         </div>
      </section><!-- #page-title end -->
	
		<section id="content">
			<div class="content-wrap">
				<div class="container clearfix">
					<div class="form-widget">
						<div class="form-result"></div>
						<div class="row">
							<div class="col-lg-12">
									<div class="form-process"></div>
									
									<div class="col-12 form-group">
										<label>제목:</label>
										<input type="text" name="title" id="title" class="form-control required" value="${vo.title}" style="border:none" readonly>
									</div>
							
									<div class="col-12 form-group">
										<div class="row">
											<div class="col-md-4 form-group">
												<label>작성자:</label>
												<input type="text" name="username" id="username" class="form-control required" value="${vo.username}" style="border:none" readonly>
											</div>
											
											<div class="col-md-4 form-group">
												<label>작성일:</label>
												<input type="text" class="form-control dobpicker required" name="writeDate" id="writeDate" value="${vo.write_date}" disabled="disabled" data-date-end-date="-18y" style="border:none">
											</div>
											
											<div class="col-md-4 form-group">
												<label>조회수:</label>
												<input type="text" class="form-control dobpicker required" value="${vo.readCnt}" disabled="disabled" data-date-end-date="-18y" style="border:none">
											</div>
											
											<div class="w-100"></div>
										</div>
										
										<div class="form-group">
											<br>
											<h4>내용:</h4>
											<textarea name="content"  cols="30" rows="10" style="width:800px; height:100px; border:none" readonly>${vo.content}</textarea>
										</div>
										
										<div class="form-group">
											<br><br>
											<a href="clubBoardModify?club_board_code=${vo.club_board_code}"><button type="button" class="btn btn-secondary">수정하기</button></a>
											<button name="jobs-application-cancel" class="btn btn-secondary" style="float:right" onclick="history.back();">뒤로가기</button>
										</div>
									</div>
							</div>
								<div class="clear"></div>
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

</body>
</html>
