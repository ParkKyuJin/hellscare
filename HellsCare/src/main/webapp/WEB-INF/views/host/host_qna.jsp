<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ include file="../include/h_sidebarMenu.jsp" %>
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
    
    <!--sidebar end-->
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
   <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i>QnA 관리</h3>
        <div class="row mb" >
          <!-- page start-->
          <div class="content-panel" >
            <div class="adv-table" >
              <table cellpadding="0" cellspacing="0" border="0" class="display table table-bordered" id="hidden-table-info" style="width:100%;">
                <thead>
                  <tr>
                    <th>No.</th>
                    <th>Date.</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>조회수</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach var="qto" items="${qtos}" >
                 <tr>
                    <td>${qto.rNum}</td>
                    <td>${qto.qna_write_date}</td>
                    <td><a href="host_qnaContent?qna_code=${qto.qna_code}">${qto.title}</a></td>
                    <td>${qto.username}</td>
                    <td>${qto.readCnt}</td>
                  </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
          <!-- page end-->
        </div>
        <!-- /row -->
      </section>
      <!-- /wrapper -->
    </section>

    <!--main content end-->
    <!--footer start-->
    <footer class="site-footer">
      <div class="text-center">
        <p>
          &copy; Copyrights <strong>Dashio</strong>. All Rights Reserved
        </p>
        
        <a href="index.html#" class="go-top">
          <i class="fa fa-angle-up"></i>
          </a>
      </div>
    </footer>
    <!--footer end-->
  </section>
  

</body>
</html>