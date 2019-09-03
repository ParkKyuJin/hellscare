<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	
	<div class="content-wrap">
				<div class="container clearfix">
				
					<div class="row grid-container" data-layout="masonry" style="overflow: visible">
						<c:forEach var="dto" items="${dtos}">
						<div class="col-lg-4 mb-4">
							<div class="flip-card text-center">
								<div class="flip-card-front dark" style="background-image: url('/hellscare/resources/eventimg/${dto.challenge_img}')">
									<div class="flip-card-inner">
										<div class="card nobg noborder text-center">
											<div class="card-body">
												<i class="icon-line2-camera h1"></i>
												<h3 class="card-title">${dto.challenge_name}</h3>
												<p class="card-text t400">${dto.challenge_content}</p>
											</div>
										</div>
									</div>
								</div>
								<div class="flip-card-back bg-danger no-after">
									<div class="flip-card-inner">
										<p class="mb-2 text-white">${dto.challenge_content}</p>
										<a href="challengedetail?code=${dto.challenge_code}"><button type="button"class="btn btn-outline-light mt-2">자세히보기</button></a>
									</div>
								</div>
							</div>
						</div>
							</c:forEach>
					</div>
			
				</div>
	</div>