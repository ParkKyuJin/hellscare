<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="../include/h_sidebarMenu.jsp"%>
<!DOCTYPE html>


<section id="main-content">
      <section class="wrapper">
        <h3> <b>이벤트관리</b> <i class="fa fa-angle-right"></i> <b>이벤트 등록</b></h3>
        <!-- BASIC FORM ELELEMNTS -->
        <div class="row mt">
          <div class="col-md-12">
            <div class="form-panel">
              <h4 class="mb"><i class="fa fa-angle-right"></i> <b>이벤트 등록</b></h4>
              <form class="form-horizontal style-form" action="host_challengeRegpro?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
                 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label" style="text-align:center;"><b>이벤트명</b></label>
                  <div class="col-sm-4">
                    <input type="text" class="form-control" size="10" name="c_name" required>
                     <span class="help-block"><b>이벤트명을 입력해주세요</b></span>
                  </div>
                </div>
                <div class="form-group" >
                  <label class="col-sm-2 col-sm-2 control-label" style="text-align:center;"><b>이벤트 내용</b></label>
                 <div class="col-sm-4">
                    <textarea  class="form-control"  style="height:150px;" name="c_content" required></textarea>
                     <span class="help-block"><b>이벤트 내용을 입력해주세요</b></span>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label" style="text-align:center;"><b>보상포인트</b></label>
                  <div class="col-sm-1">
                    <input type="number" class="form-control" size="10" name="c_point" required><p>points</p>
                     
                  </div>
                </div>
						<div class="form-group last">
							<label class="col-sm-2 col-sm-2 control-label"
								style="text-align: center;"><b>이벤트 이미지</b></label>
							<div class="col-md-9">
								<div class="fileupload fileupload-new"
									data-provides="fileupload">
									<div class="fileupload-new thumbnail"
										style="width: 200px; height: 150px;">
										<img
											src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&text=no+image"
											alt="" />
									</div>
									<div class="fileupload-preview fileupload-exists thumbnail"
										style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
									<div>
										<span class="btn btn-theme02 btn-file"> <span
											class="fileupload-new"><i class="fa fa-paperclip"></i>
												Select image</span><span class="fileupload-exists"><i
												class="fa fa-undo"></i> Change</span> <input type="file"
											class="default" name="c_img" id="c_img" required />
									
										</span>
										
									<div id="map" style="width:100%;height:350px;"></div>
									
									<input type="text" id="clickLatlng" name="lat" value="" readonly="readonly" required="required">
									<input type="text" id="clickLatlng2" name="lng" readonly="readonly" required="required">
									</div> 
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f11ce067be0e4302a3047b3e2f5dbe9"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {  
        center: new kakao.maps.LatLng(37.478736, 126.878700), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도를 클릭한 위치에 표출할 마커입니다
var marker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 마커를 표시합니다
marker.setMap(map);

// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    // 클릭한 위도, 경도 정보를 가져옵니다 
    var latlng = mouseEvent.latLng; 
    
    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng);
    
    var message =latlng.getLat();
    var message2 =latlng.getLng();
    /*  + ' 이고, ';
    message += '경도는 ' + latlng.getLng() + ' 입니다'; */
    /* alert(message+"    "+message2); */
    document.getElementById('clickLatlng').value = message;
    
    document.getElementById('clickLatlng2').value = message2;
   	/* var resultDiv = document.getElementById('clickLatlng2').value; 
   	resultDiv = message +"        "+message2 ; */
    
});




</script>
									<div style="float: right; margin: 0px 50px 0px 0px;">
										<a href="#"><button type="submit"
												class="btn btn-round btn-success">확인</button></a> <a
											href="host_challenge"><button type="button"
												class="btn btn-round btn-danger">돌아가기</button></a>
									</div>
									
								</div>

							</div>
						</div>


					</form>
            </div>
            
          </div>
            
          <!-- col-lg-12-->
        </div>
        <!-- /row -->
        <!-- INLINE FORM ELELEMNTS -->
        
     
       
      </section>
      <!-- /wrapper -->
      
    </section>
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
        <a href="advanced_form_components.html#" class="go-top">
          <i class="fa fa-angle-up"></i>
          </a>
      </div>
    </footer>
</section>

