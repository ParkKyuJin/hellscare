<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



				<div class="container clearfix">
					<h4>검색결과</h4>
					<div class="table-responsive">
						<table id="datatable1" class="table table-striped table-bordered" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th>분류</th>
									<th>질병명</th>
									<th>질병코드</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="dto" items="${dtos}">
								<tr>
									<td>${dto.d_category}</td>
									<td><a href="diseaseView?disease_code=${dto.disease_code}">${dto.disease_name}</a></td>
									<td><a href="diseaseView?disease_code=${dto.disease_code}">${dto.disease_code}</a></td>
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


