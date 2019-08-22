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

	<!-- Document Title
	============================================= -->
	<title>Health | For Your Better Life</title>




<script type="text/javascript">
//초기화버튼 클릭시 ============================
function refreshIdfy() {
	$("#drug_name").val("");
	$("#entp_name").val("");
}

function idfySend() {
	var drug_name = $('#drug_name').val();
	var entp_name = $('#entp_name').val();
	
	//alert(drug_name+entp_name);
	
	$.ajax({
		url : '${pageContext.request.contextPath}/drugInfo_sub', // 컨트롤러/drugInfo_sub
		type : 'GET',
		data: 'drug_name=' + drug_name + '&entp_name=' + entp_name,
		
		success : function(result) { // 콜백함수 - 정상적으로 처리되었을 때의 결과가 result에 들어간다.
			// 변수명이 반드시 .html(result)일 필요는 없으나 위 콜백함수와의 변수명과 일치해야 한다.
			$('#result').html(result);
		},
		error : function() {
			alert("오류");	
		}		
	});
	
}

// 제품명 엔터로 검색
function searchEnter1() {
	if(event.keyCode == 13){  // enter 누르면
		//alert($("#drug_name").val());

		if($("#drug_name").val() == ""){
			alert("제품명을 입력해주세요.");
			return false;
		}else{
			idfySend();
		}
	}
}

//제품명 엔터로 검색
function searchEnter2() {
	if(event.keyCode == 13){  // enter 누르면

		if($("#entp_name").val() == ""){
			alert("회사명을 입력해주세요.");
			return false;
		}else{
			idfySend();
		}
	}
}

</script>


</head>


<body class="stretched">

<!-- Document Wrapper
	============================================= -->
	<%@ include file="../include/header.jsp" %>
	

	
	<section id="page-title">

         <div class="container clearfix">
            <h1>의약품 정보</h1>
            <span>Drug Information Search</span>
            <ol class="breadcrumb">
               <li class="breadcrumb-item"><a href="main">Home</a></li>
               <li class="breadcrumb-item">DrugInfo</li>
               
            </ol>
         </div>
      </section><!-- #page-title end -->


	
<!-- 컨텐츠 영역 -->
<section id="content">

	<div class="content-wrap">
	   <div class="container clearfix">
	   
	   
		<!-- 약품검색 -->
			<h2>의약품검색</h2>
			
			<div >
				
				<p>알약의 제품명/성분명, 회사명으로 상세정보를 검색할 수 있습니다.</p> 
			</div>

			<form id="drugSearchForm" action="" method="post">
			<div class="row">
			<div class="col-lg-6">
			
				<div style="max-width: 30rem;">
					<label for="drug_name">제품명 / 성분명  </label>
					<input type="text" class="form-control form-control-lg mb-2"  id="drug_name" name="drug_name" placeholder="제품명/성분명을 입력하세요" value="" onkeydown="searchEnter1()">
					
					<label for="entp_name">회사명 </label>
					<input type="text" class="form-control form-control-lg mb-2" id="entp_name" name="entp_name" placeholder="회사명을 입력하세요"  value="" onkeydown="searchEnter2()">
								
				</div>
				
				<br>
			
				<div id="btns">
					<a onclick="refreshIdfy();" class="button button-border button-rounded button-blue"><i class="icon-repeat"></i>재작성</a>				
					<a onclick="idfySend();" class="button button-border button-rounded button-blue" id="btn_idfysearch"><i class="icon-line-search"></i>검  색</a>
				</div>
			</div>
			<div class="col-lg-6 pl-lg-4">
				<img src="/hellscare/resources/images/drug/drug001.jpg">
			</div>
			</div>
			
			</form>
			
			<div class="line"></div>


	
</div>

<!-- 결과 테이블 -->	
			<div id="result">
			 <!-- 결과가 출력될 위치 -->

				
			</div>
		
	</div>

</section><!-- #content end -->

	<%@ include file="../include/footer.jsp"%>
	<%@ include file="../include/footerScript.jsp"%>
	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>


	
	
</body>
</html>