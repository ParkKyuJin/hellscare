<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>Dr.Care_HostMode</title>

</head>

<body>
    <%@ include file="../include/h_sidebarMenu.jsp"%>
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
      
      <div class="row">
          <div class="col-lg-9 main-chart">
            
            <div class="border-head">
              <h2>관리자 메인 페이지</h2>
            </div>
        <div class="row">
        
              <!-- WEATHER PANEL -->
   <!--            <div class="col-md-4 mb">
                <div class="weather pn">
                  <i class="fa fa-cloud fa-4x"></i>
                  <h2>25º C</h2>
                  <h4>금천구</h4>
                </div>
              </div> -->
              <!-- /col-md-4 -->
               <!--   SERVER STATUS PANELS -->
              <div class="col-md-6 col-sm-6 mb">
                <div class="grey-panel pn donut-chart">
                  <div class="grey-header">
                    <h5>SERVER LOAD</h5>
                  </div>
                  <canvas id="serverstatus01" height="120" width="120"></canvas>
                  <script>
                    var doughnutData = [{
                        value: 21,
                        color: "#FF6B6B"
                      },
                      {
                        value: 79,
                        color: "#fdfdfd"
                      }
                    ];
                    var myDoughnut = new Chart(document.getElementById("serverstatus01").getContext("2d")).Doughnut(doughnutData);
                  </script>
                  <div class="row">
                    <div class="col-sm-6 col-xs-6 goleft">
                      <p>Usage<br/>Increase:</p>
                    </div>
                    <div class="col-sm-6 col-xs-6">
                      <h2>21%</h2>
                    </div>
                  </div>
                </div>
                <!-- /grey-panel -->
              </div>
              <!-- /col-md-4 -->
              
              <div class="col-md-6 col-sm-6 mb">
                <div class="green-panel pn">
                  <div class="green-header">
                    <h5>DISK SPACE</h5>
                  </div>
                  <canvas id="serverstatus03" height="120" width="120"></canvas>
                  <script>
                    var doughnutData = [{
                        value: 40,
                        color: "#2b2b2b"
                      },
                      {
                        value: 60,
                        color: "#fffffd"
                      }
                    ];
                    var myDoughnut = new Chart(document.getElementById("serverstatus03").getContext("2d")).Doughnut(doughnutData);
                  </script>
                  <h3>40% USED</h3>
                </div>
              </div>
              <!-- /col-md-4 -->
            </div>
              
              
              
              <div class="row">
              <!-- DIRECT MESSAGE PANEL -->
              <div class="col-md-12 mb">
              <div class="content-panel">
				
              <table class="table table-striped table-advance table-hover">
                <h4><i class="fa fa-angle-right"></i> 최근 가입 회원 목록  </h4>
              
                <thead>
                 <tr>
					<td colspan="4" align="left" style="height:25px"> 
					 	총회원수 : ${cnt}		
					</td>				
				</tr>
                  <tr>
                  	<th style="width:25%">아이디</th>
                    <th style="width:25%">회원명 </th>
                    <th style="width:25%">생년월일</th>
                    <th style="width:25%">가입일</th>
                  </tr>
                </thead>
                <tbody>
           <!-- 가입회원이 있으면 -->
	<c:if test="${cnt > 0}">
		<c:forEach var="dto" items="${dtos}" begin="0" end="4" varStatus="status">
		
		<tr>
			<td>${dto.username }</td>
            <td>${dto.name } </td>
            <td>${dto.birth }</td>  
            <td>${dto.reg_date }</td>
		</tr>
			
		</c:forEach>
	</c:if>
	
	<!-- 상품이 없으면 -->
	<c:if test="${cnt == 0}">
		<tr>
			<td colspan="4" align="center">
				가입된 회원정보가 없습니다..!!
			</td>			
		</tr>
	</c:if> 

    </tbody>
  </table>
    
            </div>
            <!-- /content-panel -->
              
              </div>
        	<!-- /col-md-8 -->
        	</div> 
            </div>
      </div>
  <!-- <!--       <div class="row">
          <div class="col-lg-9 main-chart">
            CUSTOM CHART START
            <div class="border-head">
              <h3>USER VISITS</h3>
            </div>
            <div class="custom-bar-chart" >
              <ul class="y-axis">
                <li><span>10.000</span></li>
                <li><span>8.000</span></li>
                <li><span>6.000</span></li>
                <li><span>4.000</span></li>
                <li><span>2.000</span></li>
                <li><span>0</span></li>
              </ul>
              <div class="bar">
                <div class="title">JAN</div>
                <div class="value tooltips" data-original-title="8.500" data-toggle="tooltip" data-placement="top">85%</div>
              </div>
              <div class="bar ">
                <div class="title">FEB</div>
                <div class="value tooltips" data-original-title="5.000" data-toggle="tooltip" data-placement="top">50%</div>
              </div>
              <div class="bar ">
                <div class="title">MAR</div>
                <div class="value tooltips" data-original-title="6.000" data-toggle="tooltip" data-placement="top">60%</div>
              </div>
              <div class="bar ">
                <div class="title">APR</div>
                <div class="value tooltips" data-original-title="4.500" data-toggle="tooltip" data-placement="top">45%</div>
              </div>
              <div class="bar">
                <div class="title">MAY</div>
                <div class="value tooltips" data-original-title="3.200" data-toggle="tooltip" data-placement="top">32%</div>
              </div>
              <div class="bar ">
                <div class="title">JUN</div>
                <div class="value tooltips" data-original-title="6.200" data-toggle="tooltip" data-placement="top">62%</div>
              </div>
              <div class="bar">
                <div class="title">JUL</div>
                <div class="value tooltips" data-original-title="7.500" data-toggle="tooltip" data-placement="top">75%</div>
              </div>
            </div>
            custom chart end
            <div class="row mt">
           
              <div class="col-md-4 col-sm-4 mb">
                <div class="darkblue-panel pn">
                  <div class="darkblue-header">
                    <h5>DROPBOX STATICS</h5>
                  </div>
                  <canvas id="serverstatus02" height="120" width="120"></canvas>
                  <script>
                    var doughnutData = [{
                        value: 60,
                        color: "#1c9ca7"
                      },
                      {
                        value: 40,
                        color: "#f68275"
                      }
                    ];
                    var myDoughnut = new Chart(document.getElementById("serverstatus02").getContext("2d")).Doughnut(doughnutData);
                  </script>
                  <p>April 17, 2014</p>
                  <footer>
                    <div class="pull-left">
                      <h5><i class="fa fa-hdd-o"></i> 17 GB</h5>
                    </div>
                    <div class="pull-right">
                      <h5>60% Used</h5>
                    </div>
                  </footer>
                </div>
                 /darkblue panel
              </div>
              /col-md-4
              <div class="col-md-4 col-sm-4 mb">
                REVENUE PANEL
                <div class="green-panel pn">
                  <div class="green-header">
                    <h5>REVENUE</h5>
                  </div>
                  <div class="chart mt">
                    <div class="sparkline" data-type="line" data-resize="true" data-height="75" data-width="90%" data-line-width="1" data-line-color="#fff" data-spot-color="#fff" data-fill-color="" data-highlight-line-color="#fff" data-spot-radius="4" data-data="[200,135,667,333,526,996,564,123,890,464,655]"></div>
                  </div>
                  <p class="mt"><b>$ 17,980</b><br/>Month Income</p>
                </div>
              </div>
              /col-md-4
            </div>
            /row
           
            
            <div class="row">
              TWITTER PANEL
              <div class="col-md-4 mb">
                <div class="twitter-panel pn">
                  <i class="fa fa-twitter fa-4x"></i>
                  <p>Dashio is here! Take a look and enjoy this new Bootstrap Dashboard theme.</p>
                  <p class="user">@Alvrz_is</p>
                </div>
              </div>
              /col-md-4
              <div class="col-md-4 mb">
                WHITE PANEL - TOP USER
                <div class="white-panel pn">
                  <div class="white-header">
                    <h5>TOP USER</h5>
                  </div>
                  <p><img src="resources/img/ui-zac.jpg" class="img-circle" width="50"></p>
                  <p><b>Zac Snider</b></p>
                  <div class="row">
                    <div class="col-md-6">
                      <p class="small mt">MEMBER SINCE</p>
                      <p>2012</p>
                    </div>
                    <div class="col-md-6">
                      <p class="small mt">TOTAL SPEND</p>
                      <p>$ 47,60</p>
                    </div>
                  </div>
                </div>
              </div>
              /col-md-4
              <div class="col-md-4 mb">
                INSTAGRAM PANEL
                <div class="instagram-panel pn">
                  <i class="fa fa-instagram fa-4x"></i>
                  <p>@THISISYOU<br/> 5 min. ago
                  </p>
                  <p><i class="fa fa-comment"></i> 18 | <i class="fa fa-heart"></i> 49</p>
                </div>
              </div>
              /col-md-4
            </div>
            /row
            <div class="row">
              <div class="col-lg-4 col-md-4 col-sm-4 mb">
                <div class="product-panel-2 pn">
                  <div class="badge badge-hot">HOT</div>
                  <img src="resources/img/product.jpg" width="200" alt="">
                  <h5 class="mt">Flat Pack Heritage</h5>
                  <h6>TOTAL SALES: 1388</h6>
                  <button class="btn btn-small btn-theme04">FULL REPORT</button>
                </div>
              </div>
              /col-md-4
               PROFILE 02 PANEL
              <div class="col-lg-4 col-md-4 col-sm-4 mb">
                <div class="content-panel pn">
                  <div id="profile-02">
                    <div class="user">
                      <img src="resources/img/friends/fr-06.jpg" class="img-circle" width="80">
                      <h4>DJ SHERMAN</h4>
                    </div>
                  </div>
                  <div class="pr2-social centered">
                    <a href="#"><i class="fa fa-twitter"></i></a>
                    <a href="#"><i class="fa fa-facebook"></i></a>
                    <a href="#"><i class="fa fa-dribbble"></i></a>
                  </div>
                </div>
                /panel
              </div>
              / col-md-4
              
            /row
          </div> --> 
          <!-- /col-lg-9 END SECTION MIDDLE -->
  
         
    </section>
    <!--main content end-->
    <!--footer start-->
    <footer class="site-footer">
      <div class="text-center">
        <p>
          &copy; Copyrights <strong>Healthcare</strong>. All Rights Reserved
        </p>
        <div class="credits">
          <!--
            You are NOT allowed to delete the credit link to TemplateMag with free version.
            You can delete the credit link only if you bought the pro version.
            Buy the pro version with working PHP/AJAX contact form: https://templatemag.com/dashio-bootstrap-admin-template/
            Licensing information: https://templatemag.com/license/
          -->
          <!-- Created with Healthcare template by <a href="https://templatemag.com/">TemplateMag</a> -->
        </div>
        <a href="host_main#" class="go-top">
          <i class="fa fa-angle-up"></i>
          </a>
      </div>
    </footer>
    <!--footer end-->
  </section>
  <!-- js placed at the end of the document so the pages load faster -->
  
 

  
  
	<script type="application/javascript">
		
    $(document).ready(function() {
      $("#date-popover").popover({
        html: true,
        trigger: "manual"
      });
      $("#date-popover").hide();
      $("#date-popover").click(function(e) {
        $(this).hide();
      });

      $("#my-calendar").zabuto_calendar({
        action: function() {
          return myDateFunction(this.id, false);
        },
        action_nav: function() {
          return myNavFunction(this.id);
        },
        ajax: {
          url: "show_data.php?action=1",
          modal: true
        },
        legend: [{
            type: "text",
            label: "Special event",
            badge: "00"
          },
          {
            type: "block",
            label: "Regular event",
          }
        ]
      });
    });

    function myNavFunction(id) {
      $("#date-popover").hide();
      var nav = $("#" + id).data("navigation");
      var to = $("#" + id).data("to");
      console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
    }
  
	</script>

</body>
</html>