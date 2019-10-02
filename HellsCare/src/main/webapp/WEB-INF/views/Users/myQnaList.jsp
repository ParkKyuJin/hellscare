<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<form method="POST" name="commentform">
		<table class="table">
			<thead>
				<tr>
					<th>#</th>
					<th>질문</th>
					<th>제목</th>
					<th>답변여부</th>
				</tr>
			</thead>
			<tbody>

				<c:if test="${cnt > 0}">
					<c:forEach var="dtoq" items="${dtoqs}">
						<tr>
							<td>${dtoq.rNum}</td>
							<td>${dtoq.kind}</td>
							<td><a href="qna_pwdconfirm?qna_code=${dtoq.qna_code}">${dtoq.title}</a></td>
							<td>
								<c:if test="${dtoq.state==0}">답변없음</c:if> 
								<c:if test="${dtoq.state!=0}">답변있음</c:if>
							</td>

						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>

		
	</form>

