 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 


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
function refresh() {
	$("#disease_name").val("");
	$("#disease_code").val("");
}


function disease_Search() {
	var disease_code = $('#disease_code').val();
	var disease_name = $('#disease_name').val();
	
	//alert(drug_name+entp_name);
	
	$.ajax({
		url : '${pageContext.request.contextPath}/disease_sub', // 컨트롤러/disease_sub
		type : 'GET',
		data: 'disease_code=' + disease_code + '&disease_name=' + disease_name,
		
		success : function(result) { // 콜백함수 - 정상적으로 처리되었을 때의 결과가 result에 들어간다.
			// 변수명이 반드시 .html(result)일 필요는 없으나 위 콜백함수와의 변수명과 일치해야 한다.
			$('#result').html(result);
		},
		error : function() {
			alert("오류");	
		}		
	});	
}

//질병명 엔터로 검색
function searchEnter1() {
	if(event.keyCode == 13){  // enter 누르면
		//alert($("#disease_name").val());

		if($("#disease_name").val() == ""){
			alert("질병명을 입력해주세요.");
			return false;
		}else{
			disease_Search();
		}
	}
}

//질병코드 엔터로 검색
function searchEnter2() {
	if(event.keyCode == 13){  // enter 누르면
		
		if($("#disease_code").val() == ""){
			alert("질병코드를 입력해주세요.");
			return false;
		}else{
			disease_Search();
		}
	}
}

</script>

</head>

<body class="stretched">

<!-- Document Wrapper
	============================================= -->
	<%@ include file="../include/header.jsp" %>
	<div>
	
	<section id="page-title">

         <div class="container clearfix">
            <h1>질병 정보</h1>
            <span>Disease Information Search</span>
            <ol class="breadcrumb">
               <li class="breadcrumb-item"><a href="main">Home</a></li>
               <li class="breadcrumb-item">Disease</li>
               
            </ol>
         </div>
      </section><!-- #page-title end -->
	
<!-- 컨텐츠 영역 -->
<section id="content">

	<div class="content-wrap">
	   <div class="container clearfix">
	   
	   
		<!-- 약품검색 -->
			<h2>질병정보검색</h2>
			
			<div >
				
				<p>질병명 또는 상병코드를 입력하여 상세정보를 검색할 수 있습니다.</p>
			</div>

			<form id="diseaseSearchForm" action="" method="post">
			<div class="row">
			<div class="col-lg-6">

			
				<div style="max-width: 30rem;">
					<label for="drug_name">질병명  </label>
					<input type="text" class="form-control form-control-lg mb-2"  id="disease_name" name="disease_name" placeholder="질병명을 입력하세요" value="" onkeydown="searchEnter1()">
					
					<label for="entp_name">상병코드 </label>
					<input type="text" class="form-control form-control-lg mb-2" id="disease_code" name="disease_code" placeholder="상병코드를 입력하세요"  value="" onkeydown="searchEnter2()">
								
				</div>
				
				<br>
			
				<div id="btns">
					<a onclick="refresh();" class="button button-border button-rounded button-aqua"><i class="icon-repeat"></i>재작성</a>
					<a onclick="disease_Search();" class="button button-border button-rounded button-aqua" id="btn_idfysearch"><i class="icon-line-search"></i>검  색</a>
					
				</div>
			</div>
			<div class="col-lg-6 pl-lg-4">
				<img src="/hellscare/resources/images/disease/disease001.jpg">
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
	
	
	
	







	<!-- Footer
	============================================= -->
	<%@ include file="../include/footer.jsp" %>

	</div><!-- #wrapper end -->

	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>
	<div id="gotoTop" class="icon-angle-up"></div>

	<%@ include file="../include/footerScript.jsp" %>

</body>
</html>
