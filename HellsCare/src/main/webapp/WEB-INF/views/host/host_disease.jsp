<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />

	<!-- Stylesheets
	============================================= -->

	<meta name="viewport" content="width=device-width, initial-scale=1" />


  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>HealthCare Admin Page</title>

  <!-- Favicons -->
  <link href="resources/img/favicon.png" rel="icon">
  <link href="resources/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="resources/css2/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="resources/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="resources/css2/zabuto_calendar.css">
  <link rel="stylesheet" type="text/css" href="resources/lib/gritter/css/jquery.gritter.css" />
  <!-- Custom styles for this template -->
  <link href="resources/css2/style.css" rel="stylesheet">
  <link href="resources/css2/style-responsive.css" rel="stylesheet">
  <script src="resources/lib/chart-master/Chart.js"></script>

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
     h_sidebarMenu.jsp:
        TOP BAR CONTENT & NOTIFICATIONS
        & MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
  	<%@ include file="../include/h_sidebarMenu.jsp" %>
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
  

    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
    	<h3> <b>질병정보관리</b> <i class="fa fa-angle-right"></i> <b>질병정보목록</b></h3>
        <!-- row -->
        <div class="row">
          <div class="col-md-12">
            <div class="content-panel">
            <form action=""  method="post" name="diseaseform">
				<input type="hidden" name="pageNum" value="${pageNum}">
              <table class="table table-striped table-advance table-hover">
                <h4><i class="fa fa-angle-right"></i> 질병 정보   </h4>
              
                <thead>
                 <tr>
					<td colspan="6" align="left" style="height:25px"> 
					 	등록된 질병수 : ${cnt}		
					</td>				
				</tr>
                  <tr>
                  	<th><input type="checkbox" id="selectAll" name="selelctAll"></th>
                  	<th>순번</th>
                  	<th>분류</th>
                    <th>질병명 </th>
                    <th>질병코드</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
           <!-- 재고 있으면 -->
	<c:if test="${cnt > 0}">
		<c:forEach var="dto" items="${dtos}">
		
		<tr>
			<td><input type="checkbox" class="select" name="check" value="${dto.disease_code}"></td>
			<td>
				${number}
				<c:set var="number" value="${number-1}"/>
			</td>
			<td>${dto.d_category }
            <td>
              <a href="host_diseaseModify?pageNum=${pageNum}&disease_code=${dto.disease_code }'">${dto.disease_name }</a>
            </td>
            <td>${dto.disease_code }</td>
            <td>                     
              <button type="button" class="btn btn-warning btn-xs" onclick="location.href='host_diseaseModify?pageNum=${pageNum}&disease_code=${dto.disease_code }' ">수정</button>
              <!-- <button class="btn btn-light btn-xs" onclick="diseaseDelete()">삭제</button> -->
            </td>    
		</tr>
			
		</c:forEach>
	</c:if>
	
	<!-- 상품이 없으면 -->
	<c:if test="${cnt == 0}">
		<tr>
			<td colspan="9" align="center">
				등록된 질병정보가 없습니다..!!
			</td>			
		</tr>
	</c:if> 

           </tbody>
         </table>
              
              
              	<!-- 페이지 컨트롤 -->
<table align="center">
	<tr>
		<th align="center">
		
			<!-- 상품이 있으면 -->
			<c:if test="${cnt > 0}">
				<!-- 처음[◀◀] / 이전블록[◀] -->
				<c:if test="${startPage > pageBlock}">
					<a href="host_disease">[◀◀]</a>
					<a href="host_disease?pageNum=${startPage - pageBlock}">[◀]</a>					
				</c:if>
				
				<!-- 블록내의 페이지 번호 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == currentPage}">
						<span class="label label-info">[${i}]</span>
					</c:if>
					<c:if test="${i != currentPage}">
						<span ><a href="host_disease?pageNum=${i}">[${i}]</a></span>
					</c:if>
				</c:forEach>
				
				<!-- 다음블록[▶] / 끝[▶▶] -->
				<c:if test="${pageCount > endPage}">
					<a href="host_disease?kind=all&pageNum=${startPage + pageBlock}">[▶]</a>
					<a href="host_disease?kind=all&pageNum=${pageCount}">[▶▶]</a>
				</c:if>
			</c:if>
			
		</th>
	</tr>

</table>
   </form>            
            </div>
            <!-- /content-panel -->
		</div>
	</div>
	
	


		
	<!--  BUTTONS -->
     <div class="showback">
         <button type="button" class="btn btn-primary btn-lg" onclick="location.href='host_diseaseReg'">질병정보 등록하기</button>
         <button type="button" class="btn btn-default btn-lg" onclick="selectDiseaseDel();">삭제</button>
     </div>
     <!-- /showback -->
    
	</section><!-- #content end -->
  
      </section>
    </section>
    <!--main content end-->
    
 <!-- #wrapper end -->

<script type="text/javascript">
//선택 기능
$(function () { 
	$("#selectAll").change(function() { // 전체선택
		var is_check = $(this).is(":checked");
		$(".select").prop("checked", is_check);
	});
	
	$(".select").click(function() {  // 개별선택
		$("#selectAll").prop("checked", false);
	});
	
});

//체크 박스 선택 삭제
function selectDiseaseDel() { 	 
	var f = document.diseaseform;
	var count=0;
	var v_id = f.check.value;
	// alert(id);
	for(var i=0; i<f.check.length; i++){
		if(f.check[i].checked){
			count++;
	    }
    }
    if(count > 0){
        if(confirm("선택된 항목을 삭제하시겠습니까?")){
        	diseaseform.action="host_diseaseDeletePro";
        	diseaseform.submit();
        }
    } else {
        alert("선택된 항목이 없습니다.");
    }
}

</script>

</body>
</html>