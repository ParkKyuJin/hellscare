<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


				<div class="container clearfix">
					<h4>검색결과</h4>
					<div class="table-responsive">
						<table id="datatable1" class="table table-striped table-bordered" cellspacing="0" width="100%">
							<thead>
								<tr>
									
									<th>제품명</th>
									<th>업체명</th>
									<th>제형</th>
									<th>모양</th>
									<th>색상</th>
									<th>장축</th>
									<th>단축</th>
									<th>두께</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="drug_dto" items="${drugDtos}">
								<tr>
									
									<td style="width:40%"><a href="https://nedrug.mfds.go.kr/pbp/CCBBB01/getItemDetail?itemSeq=${drug_dto.item_seq }" 
									target="_blank" onclick="window.open('https://nedrug.mfds.go.kr/pbp/CCBBB01/getItemDetail?itemSeq=${drug_dto.item_seq }', '의약품상세정보', 'width=1200'); return false;">${drug_dto.item_name}</a></td>
									<td>${drug_dto.entp_name}</td>
									<td>${drug_dto.form_code_name}</td>
									<td>${drug_dto.drug_shape}</td>
									<td>${drug_dto.color_class1}</td>
									<td>${drug_dto.leng_long}</td>
									<td>${drug_dto.leng_short}</td>
									<td>${drug_dto.thick}</td>
								</tr>
							</c:forEach>
								

							</tbody>
						</table>
					</div>
				</div>
	
	<!-- Bootstrap Data Table Plugin -->
	<script src="resources/js/components/bs-datatable.js"></script>		
			
	<script>

		$(document).ready(function() {
			$('#datatable1').dataTable();
		});

	</script>


