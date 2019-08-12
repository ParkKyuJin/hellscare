 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>



<head>

	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />

	<!-- Stylesheets
	============================================= -->
	<%@ include file="../include/setting.jsp" %>
	<meta name="viewport" content="width=device-width, initial-scale=1" />

	<!-- Document Title
	============================================= -->
	<title>Canvas | The Multi-Purpose HTML5 Template</title>

<script type="text/javascript">
function idfySend() {
	$("#div_result").css("display", "");	
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
               <li class="breadcrumb-item"><a href="disease">Disease</a></li>
               
            </ol>
         </div>
      </section><!-- #page-title end -->
	
	
	
	
	<div align="center">
	<img src="/hellscare/resources/images/disease/diseasepage.png">
	</div>
	
	
	<div id="btns" align="center">
		<a onclick="refreshIdfy();" class="button button-border button-rounded button-aqua"><i class="icon-repeat"></i>재작성</a>
		<!-- <button type="button" title="다시입력" class="refresh ico" onclick="refreshIdfy();">다시 입력</button> -->
		
		<a onclick="idfySend();" class="button button-border button-rounded button-aqua" id="btn_idfysearch"><i class="icon-search1"></i>검  색</a>
		<!-- <button type="button" title="검색" class="button button-border button-rounded button-blue" id="btn_idfysearch" onclick="idfySend();">검 색</button> -->
	</div>
	
	<div id="div_result" align="center" style="display:none;">
	<a href="diseaseView"><img src="/hellscare/resources/images/disease/diseaselist.png"></a>
	</div>
	<br><br>






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
