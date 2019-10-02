<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/h_sidebarMenu.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>Dashio - Bootstrap Admin Template</title>

  <!-- =======================================================
    Template Name: Dashio
    Template URL: https://templatemag.com/dashio-bootstrap-admin-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
</head>

<body>
  <section id="container">
    <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
   
    <!--sidebar end-->
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
   <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> 게시글</h3>
        <!-- BASIC FORM ELELEMNTS -->
        <div class="row mt">
          <div class="col-lg-12 col-md-12 col-sm-12">
            <h4 class="title">게시글</h4>
            <div id="message"></div>
            <form class="contact-form php-mail-form" name="form1" role="form" action="#" method="POST">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
             	<input type="hidden" name="board_code" value="${dto.board_code}">
             	 <div class="form-group">
                <input type="text" name="subject" class="form-control" id="contact-subject" value="${dto.title}" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject">
                <div class="validate"></div>
              </div>

              <div class="form-group">
                <textarea class="form-control" name="message" id="contact-message"  rows="5" data-rule="required" data-msg="Please write something for us">${dto.content}</textarea>
                <div class="validate"></div>
              </div>

              <div class="loading"></div>
              <div class="error-message"></div>
              <div class="sent-message">Your message has been sent. Thank you!</div>

              <div class="form-send">
                <button type="submit" class="btn btn-large btn-primary">댓글</button>
                <button type="submit" id="bDelete" class="btn btn-large btn-primary">삭제</button>
               <button type="submit" class="btn btn-large btn-primary"><a href="host_board">취소</a></button>
              </div>

            </form>
          </div>

         
        </div>
        <!-- /row -->


        <!-- /row -->
      </section>
      <!-- /wrapper -->
    </section>

    <!--main content end-->
    <!--footer start-->
   
    <!--footer end-->
  </section>
   <!-- js placed at the end of the document so the pages load faster -->
   
   <script type="text/javascript">
   	$(document).ready(function(){
   		
   	//게시글 삭제 버튼 클릭 이벤트
		$("#bDelete").click(function(){
			if(confirm("삭제하시겠습니까?")){
				document.form1.action = "${pageContext.request.contextPath}/hboard_delete";
				document.form1.submit();
			}
		});
   		
   	});
   
   </script>
  

</body>
</html>