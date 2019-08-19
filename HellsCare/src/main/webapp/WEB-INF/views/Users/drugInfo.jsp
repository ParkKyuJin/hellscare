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
	<title>Canvas | The Multi-Purpose HTML5 Template</title>




<script type="text/javascript">
//초기화버튼 클릭시 ============================
function refreshIdfy() {
	//문자
//		$("#drug_print_front").val("");
//		$("#drug_print_back").val("");
		$("#drug_name").val("");
		$("#entp_name").val("");
		
//		$("ul.idty li").removeClass("selected");
//		$("#shapeETC_selected").css("border","");

//		$("ul.idty li").find("[type=checkbox]").prop("checked",false);

//		$(".shapeETC [type=checkbox]").prop("checked",false);
//		$("#shape_etc_text ul").empty();
//		$("#selectMarkList").empty();

//		$("#type_all").addClass("selected");
//		$("#shape_all").addClass("selected");
//		$("#color_all").addClass("selected");
//		$("#line_all").addClass("selected");

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
			<h2>약품검색</h2>
			
			<div >
				
				<p>알약의 제품명/성분명, 회사명으로 상세정보를 검색할 수 있습니다.</p>  <!-- (의약품 식별검색이 안될 경우 식별표시 신고센터로 알려주시기 바랍니다.) -->
			</div>

			<form id="drugSearchForm" action="" method="post">
			<div style="max-width: 30rem;">
				<label for="drug_name">제품명 / 성분명  </label>
				<input type="text" class="form-control form-control-lg mb-2"  id="drug_name" name="drug_name" placeholder="제품명/성분명을 입력하세요" value="" >
				
				<label for="entp_name">회사명 </label>
				<input type="text" class="form-control form-control-lg mb-2" id="entp_name" name="entp_name" placeholder="회사명을 입력하세요"  value="" >
			
				
			</div>
			<br>
			
			<div id="btns">
				<a onclick="refreshIdfy();" class="button button-border button-rounded button-blue"><i class="icon-repeat"></i>재작성</a>				
				<a onclick="idfySend();" class="button button-border button-rounded button-blue" id="btn_idfysearch"><i class="icon-search1"></i>검  색</a>
			</div>
			</form>
			
			<div class="line"></div>

			<!-- 검색테이블 -->
			<article class="search_table">
				
				<!-- 전체,생산Y,생산N 개수 -->
				<!-- 전체 개수 -->
				<input type="hidden" id="idfy_total_cnt" name="idfy_total_cnt">
				<!-- 전체 단일제 개수 -->
				<input type="hidden" id="idfy_total_cnt_item_ingr1" name="idfy_total_cnt_item_ingr1">
				<!-- 전체 복합제 개수 -->
				<input type="hidden" id="idfy_total_cnt_item_ingr2" name="idfy_total_cnt_item_ingr2">
				<!-- 생산Y 개수 -->
				<input type="hidden" id="idfy_produceY_cnt" name="idfy_produceY_cnt">
				<!-- 생산Y 단일제 개수 -->
				<input type="hidden" id="idfy_produceY_cnt_item_ingr1" name="idfy_produceY_cnt_item_ingr1">
				<!-- 생산Y 복합제 개수 -->
				<input type="hidden" id="idfy_produceY_cnt_item_ingr2" name="idfy_produceY_cnt_item_ingr2">
				<!-- 생산N 개수 -->
				<input type="hidden" id="idfy_produceN_cnt" name="idfy_produceN_cnt">
				<!-- 생산N 단일제 개수 -->
				<input type="hidden" id="idfy_produceN_cnt_item_ingr1" name="idfy_produceN_cnt_item_ingr1">
				<!-- 생산N 복합제 개수 -->
				<input type="hidden" id="idfy_produceN_cnt_item_ingr2" name="idfy_produceN_cnt_item_ingr2">

				<form id="result_frm" name="result_frm" action="result.asp" method="post">
					<!-- 식별 IDFY IDX -->
					<input type="hidden" id="select_drug_idx" name="select_drug_idx"> 
					<!-- 정보원 코드 -->
					<input type="hidden" id="select_drug_code" name="select_drug_code"> 
				</form>


				<form id="frm" name="frm" action="searchDrug" method="post">
					<input type="hidden" name="search_detail" value="Y">
					<input type="hidden" id="TabState" name="TabState" value="">				
					<input type="hidden" id="proYN" name="proYN" value=""/>
					<input type="hidden" id="pageNo" name="pageNo" value=""/>	
					<input type="hidden" id="rowLength" name="rowLength" value=""/>
					<input type="hidden" id="printList" name="printList" value=""/>
	
					<!-- 전체,y,n 카운트 고정값 -->
					
					<input type="hidden"  id="fixvalue_all" name="fixvalue_all" value=""/>
					<input type="hidden"  id="fixvalue_y" name="fixvalue_y" value=""/>
					<input type="hidden"  id="fixvalue_n" name="fixvalue_n" value=""/>
	
					<!-- 	단일,복합 -->
					<input type="hidden" id="item_ingr" name="item_ingr">
					<!-- 	 ~줄보기 -->
					<input type="hidden" id="pageSize" name="pageSize">
					<!-- 	현재 페이지 숫자-->
					<input type="hidden" id="pageNum" name="pageNum">

			
				</form>
			</article><!-- //검색테이블 -->
	
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