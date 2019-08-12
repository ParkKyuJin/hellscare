 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>


<!DOCTYPE html>

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
	<%@ include file="../include/header.jsp" %>
	<div>
	
	<section id="page-title">

         <div class="container clearfix">
            <h1>질병 정보</h1>
            <span>Disease Information</span>
            <ol class="breadcrumb">
               <li class="breadcrumb-item"><a href="main">Home</a></li>
               <li class="breadcrumb-item"><a href="disease">Disease</a></li>
               <li class="breadcrumb-item"><a href="disease">DiseaseView</a></li>
            </ol>
         </div>
      </section><!-- #page-title end -->
	
	
	
	
	
	<div align="center">
	<img src="/hellscare/resources/images/disease/diseaseview1.png"> <br>
	<img src="/hellscare/resources/images/disease/diseaseview2.png"> <br>
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
