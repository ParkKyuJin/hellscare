<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/h_sidebarMenu.jsp"%>
<!DOCTYPE html>
 <section id="main-content">
	<section class="wrapper">
		  <h3> <b>이벤트관리</b> <i class="fa fa-angle-right"></i> <b>도전과제 목록</b></h3>
        <!-- BASIC FORM ELELEMNTS -->
        <div class="row mt">
          <div class="col-lg-8" style="margin:0px 0px 0px 300px;">
       
            <div class="form-panel">
            
            <table class="table table-hover">
            <h4><i class="fa fa-angle-right"></i> 도전과제</h4>
             <thead>
                  <tr>
                    <th>이미지</th>
                    <th>도전과제 번호</th>
                    <th>이벤트명</th>
                    <th>내용</th>
                    <th>포인트</th>
                  </tr>
                </thead>
            <c:forEach var="dto" items="${dtos}"> 
           
				  <tbody>
                  <tr>
                    <th> <img src="/hellscare/resources/eventimg/${dto.challenge_img}" style="width:100px; height:100px;"></th>
                    <th>${dto.challenge_code}</th>
                    <th>${dto.challenge_name}</th>
                    <th>${dto.challenge_content}</th>
                    <th>${dto.challenge_gift} Points</th>
                    
                  </tr>
                </tbody>
					
			</c:forEach>
            
            
              
              </table>
			<table style="width:100%; text-aling:center;">
			<tr >
			<th >
				<!-- 게시글이 있는 경우 -->
				<c:if test="${cnt>0}">
					<!-- 처음[◀◀]과 이전[◀] 블럭 만들기 -->
					<c:if test="${startPage>PageBlock}">
						<a href="Board">[◀◀]</a>
						<a href="Board?pageNum=${startPage-PageBlock}">[◀]</a>
					</c:if>
					<!-- 블록 내의 페이지 번호 -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i==currentPage}">
								<span ><b>[${i}]</b></span>
							</c:if>
							<c:if test="${i != currentPage}">
								<span ><b><a href="Board.hi?pageNum=${i}">[${i}]</a></b></span>
							</c:if>
					</c:forEach>
					<!-- 맨 끝[▶▶]과 다음[▶] -->
					<c:if test="${pageCount>endPage}">
						<a href="Board?pageNum=${startPage+PageBlock}">[▶]</a>
						<a href="Board?pageNum=${pageCount}">[▶▶]</a>
					</c:if>
				</c:if>
			</th>
		</tr>
	</table>		
		
				</div>
            <div style="float:right">
		<a href="host_challengeReg"><button type="button" class="btn btn-round btn-success">새로등록하기</button></a>
		<button type="button" class="btn btn-round btn-danger">삭제하기</button>
		</div>
		
          </div>
          
          <!-- col-lg-12-->
        </div>
		<!--/ row -->
		
	</section>
	
	<!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
    <!--footer start-->
    <footer class="site-footer">
      <div class="text-center">
        <p>
          &copy; Copyrights <strong>Dashio</strong>. All Rights Reserved
        </p>
        <div class="credits">
          <!--
            You are NOT allowed to delete the credit link to TemplateMag with free version.
            You can delete the credit link only if you bought the pro version.
            Buy the pro version with working PHP/AJAX contact form: https://templatemag.com/dashio-bootstrap-admin-template/
            Licensing information: https://templatemag.com/license/
          -->
          Created with Dashio template by <a href="https://templatemag.com/">TemplateMag</a>
        </div>
        <a href="general.html#" class="go-top">
          <i class="fa fa-angle-up"></i>
          </a>
      </div>
    </footer>
    <!--footer end-->
  </section>