 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<body>
<!-- Document Wrapper
	============================================= -->
	<%@ include file="../include/header.jsp"%>
	<div>
	<section id="page-title">
         <div class="container clearfix">
            <h1>${club_name} 게시글 작성</h1>
            <span>WRITE</span>
         </div>
      </section><!-- #page-title end -->
	
		<section id="content">
			<div class="content-wrap">
				<div class="container clearfix">
					<div>
						<div class="col-lg-12">
							<form action="club_BoardWritePro" method="post">
								<input type="hidden" name="club_name" value="${club_name}">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								
								<div class="col-12 form-group">
									<h4>제목:</h4>
									<input type="text" name="title" id="title" class="form-control required" placeholder="제목 입력">
								</div>
						
								<div class="col-12 form-group">
									<div class="row">
										<div class="col-md-6 form-group">
											<h4>작성자:</h4>
											<input type="text" name="username" id="username" class="form-control required" value="${memId}" readonly>
										</div>
									</div>
									<br><br>
									<div class="form-group" style="vertical-align: middel">
										<h4>내용:</h4>
										<textarea name="content"  cols="30" rows="10" style="width:800px; height:200px;"></textarea>
									</div>
								</div>
								
								<div class="col-12">
									<br>
									<button type="submit" class="btn btn-secondary">글쓰기 완료</button>
									<button type="button" name="jobs-application-cancel" class="btn btn-secondary" style="float:right" onclick="history.back();">뒤로가기</button>
								</div>
							</form>
						</div>
							<div class="clear"></div>
						</div>
					</div>
				</div>
		</section><!-- #content end -->
		</div>

	<!-- Footer
	============================================= -->
	<%@ include file="../include/footer.jsp" %>
	<%@ include file="../include/footerScript.jsp" %>
</body>
</html>
