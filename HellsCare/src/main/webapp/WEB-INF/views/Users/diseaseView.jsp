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
	<title>Disease Information &amp; Detail | HealthCare</title>

</head>

<body class="stretched">

	<!-- Document Wrapper
	============================================= -->
	
	<div id="wrapper" class="clearfix">

	<%@ include file="../include/header.jsp" %>
		

		<!-- Page Title
		============================================= -->
		<section id="page-title">

			<div class="container clearfix">
            <h1>질병 정보</h1>
            <span>Disease Information</span>
            <ol class="breadcrumb">
               <li class="breadcrumb-item"><a href="main">Home</a></li>
               <li class="breadcrumb-item"><a href="disease">Disease</a></li>
               <li class="breadcrumb-item">DiseaseView</li>
            </ol>
         </div>

		</section><!-- #page-title end -->

		<!-- Content
		============================================= -->
		<section id="content">

			<div class="content-wrap">

				<div class="container clearfix">

					<!-- Post Content
					============================================= -->
					<!-- <div class="postcontent nobottommargin clearfix"> -->

							
						<div class="col_one_sixth nobottommargin">						
							<div class="title-block">
								<h3><span>질병명</span></h3>								
							</div>
						</div>
	
						<div class="col_five_sixth nobottommargin col_last">
							<blockquote>
								<p>${dto.disease_name }</p>
							</blockquote>
						</div>
	
						<div class="line"></div>
						
						<div class="col_one_sixth nobottommargin">						
							<div class="title-block">
								<h3><span>분류</span></h3>								
							</div>
						</div>
	
						<div class="col_five_sixth nobottommargin col_last">
							<blockquote>
								<p>${dto.d_category }</p>
							</blockquote>
						</div>
	
						<div class="line"></div>
						
						<div class="col_one_sixth nobottommargin">						
							<div class="title-block">
								<h3><span>질병코드</span></h3>								
							</div>
						</div>
	
						<div class="col_five_sixth nobottommargin col_last">
							<blockquote>
								<p>${dto.disease_code }</p>
							</blockquote>
						</div>
						
						<div class="line"></div>	
	
						<div class="col_one_sixth nobottommargin">						
							<div class="title-block">
								<h3><span>정의</span></h3>								
							</div>
						</div>
	
						<div class="col_five_sixth nobottommargin col_last">
							<blockquote>
								<p>${dto.definition }</p>
							</blockquote>
						</div>
	
						<div class="line"></div>		
	
						<div class="col_one_sixth nobottommargin">						
							<div class="title-block">
								<h3><span>원인</span></h3>								
							</div>
						</div>
	
						<div class="col_five_sixth nobottommargin col_last">
							<blockquote>
								<p>${dto.cause }</p>
							</blockquote>
						</div>
	
						<div class="line"></div>
						
						<div class="col_one_sixth nobottommargin">						
							<div class="title-block">
								<h3><span>증상</span></h3>								
							</div>
						</div>
	
						<div class="col_five_sixth nobottommargin col_last">
							<blockquote>
								<p>${dto.symptom }</p>
							</blockquote>
						</div>
	
						<div class="line"></div>
						
						<div class="col_one_sixth nobottommargin">						
							<div class="title-block">
								<h3><span>치료</span></h3>								
							</div>
						</div>
	
						<div class="col_five_sixth nobottommargin col_last">
							<blockquote>
								<p>${dto.cure }</p>
							</blockquote>
						</div>				

					<!-- .postcontent end -->

	

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