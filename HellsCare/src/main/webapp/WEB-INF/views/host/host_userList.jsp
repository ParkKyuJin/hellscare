<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
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
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
    	<h3> <b>회원관리</b> <i class="fa fa-angle-right"></i> <b>회원정보</b></h3>
        <!-- row -->
        <div class="row">
          <div class="col-md-12">
            <div class="content-panel">
            <form action=""  method="post" name="memberlistform">
            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<input type="hidden" name="pageNum" value="${pageNum}">
				
              <table class="table table-striped table-advance table-hover">
                <h4><i class="fa fa-angle-right"></i> 회원 목록   </h4>
              
                <thead>
                 <tr>
					<td colspan="6" align="left" style="height:25px"> 
					 	가입회원수 : ${cnt}		
					</td>				
				</tr>
                  <tr>
                  	<th><input type="checkbox" id="selectAll" name="selelctAll"></th>
                  	<th>순번</th>
                  	<th>아이디</th>
                    <th>회원명 </th>
                    <th>주소</th>
                    <th>전화번호</th>
                    <th>생년월일</th>
                    <th>이메일</th>
                    <th>가입일</th>
                    <th>활동여부</th>
                  </tr>
                </thead>
                <tbody>
           <!-- 회원이 있으면 -->
	<c:if test="${cnt > 0}">
		<c:forEach var="dto" items="${dtos}">
		
		<tr>
			<td><input type="checkbox" class="select" name="check" value="${dto.username}"></td>
			<td>
				${number}
				<c:set var="number" value="${number-1}"/>
			</td>
			<td>${dto.username }
            <td>
              ${dto.name }
            </td>
            <td>${dto.address }</td>
            <td>${dto.phone_number }</td>
            <td>${dto.birth }</td>
            <td>${dto.email}</td>
            <td>${dto.reg_date }</td>
            <td>${dto.enabled }</td>  
		</tr>
			
		</c:forEach>
	</c:if>
	
	<!-- 상품이 없으면 -->
	<c:if test="${cnt == 0}">
		<tr>
			<td colspan="9" align="center">
				가입된 회원정보가 없습니다..!!
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
         
         <button type="button" class="btn btn-danger btn-lg" onclick="selectUserDel();">강제탈퇴</button>
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
function selectUserDel() { 	 
	var f = document.memberlistform;
	var count=0;
	var v_id = f.check.value;
	// alert(id);
	for(var i=0; i<f.check.length; i++){
		if(f.check[i].checked){
			count++;
	    }
    }
    if(count > 0){
        if(confirm("선택된 회원을 강제탈퇴 처리하시겠습니까?")){
        	memberlistform.action="host_userDel";
        	memberlistform.submit();
        }
    } else {
        alert("선택된 항목이 없습니다.");
    }
}

</script>

</body>
</html>