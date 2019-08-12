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

</head>

<body class="stretched">

<!-- Document Wrapper
	============================================= -->
		<%@ include file="../include/header.jsp"%>
		
	<div>
	
	
	<section id="page-title">

         <div class="container clearfix">
            <h1>의약품 정보</h1>
            <span>Drug Information</span>
            <ol class="breadcrumb">
               <li class="breadcrumb-item"><a href="main">Home</a></li>
               <li class="breadcrumb-item"><a href="drugInfo">DrugInfo</a></li>
               <li class="breadcrumb-item"><a href="drugInfo">DrugView</a></li>
            </ol>
         </div>
      </section><!-- #page-title end -->
	
	
	<div align="center">
	<img src="/hellscare/resources/images/drug/drugview1.png"> <br>
	<img src="/hellscare/resources/images/drug/drugview2.png"> <br>
	</div>






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
