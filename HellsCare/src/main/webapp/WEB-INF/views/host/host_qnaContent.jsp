<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/h_sidebarMenu.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
<!--   <meta name="author" content="Dashboard"> -->
<!--   <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina"> -->
  <title>Dr.Care_HostMode</title>

  

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
        <h3><i class="fa fa-angle-right"></i> QNA 답변</h3>
        <!-- BASIC FORM ELELEMNTS -->
        <div class="row mt">
          <div class="col-lg-12 col-md-12 col-sm-12">
            <h4 class="title">글 제목</h4>
            <div id="message"></div>
            <form class="contact-fo	rm php-mail-form" role="form" action="QnAAnswer" method="POST">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type="hidden" name="qna_code" value="${dto.qna_code}">
              <div class="form-group">
                <div class="form-control"  id="contact-message">${dto.title}</div>
                <div class="validate"></div>
              </div>
               <h4 class="title">작성자</h4>
               <div class="form-group">
                <div class="form-control"  id="contact-message">${dto.username}</div>
                <div class="validate"></div>
                
              </div> 
               <h4 class="title">문의 내용</h4>
              <div class="form-group">
              	<div class="form-control"  id="contact-message">${dto.content}</div>
                <div class="validate"></div>
				</div>
				<h2>답변작성</h2>
              <div class="form-group">
                <textarea class="form-control" name="message" id="contact-message"  rows="5" data-rule="required" data-msg="Please write something for us"></textarea>
                <div class="validate"></div>
              </div>

              <div class="loading"></div>
              <div class="error-message"></div>
              <div class="sent-message">답변을 입력하기 전에 다시한번 확인해주세요!</div>
              <div class="form-send">
                <button type="submit" class="btn btn-large btn-primary">답글 작성</button>
               <button type="button" class="btn btn-large btn-primary" onclick="window.history.back();">취소</a></button>
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
 


</body>
</html>