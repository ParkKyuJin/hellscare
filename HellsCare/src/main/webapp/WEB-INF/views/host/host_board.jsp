<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>Dashio - Bootstrap Admin Template</title>

  <!-- Favicons -->
  <link href="resources/img/favicon.png" rel="icon">
  <link href="resources/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="resources/css2/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="resources/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="resources/css2/zabuto_calendar.css">
  <link rel="stylesheet" type="text/css" href="resources/lib/gritter/css/jquery.gritter.css" />
  <!-- Custom styles for this template -->
  <link href="resources/css2/style.css" rel="stylesheet">
  <link href="resources/css2/style-responsive.css" rel="stylesheet">

  <!-- =======================================================
    Template Name: Dashio
    Template URL: https://templatemag.com/dashio-bootstrap-admin-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
</head>

<body>
  <section id="container">
    <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
      <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
      </div>
      <!--logo start-->
      <a href="index.html" class="logo"><b>HEALTH<span>CARE</span></b></a>
      <!--logo end-->
      <div class="top-menu">
        <ul class="nav pull-right top-menu">
          <li><a class="logout" href="login.html">Logout</a></li>
        </ul>
      </div>
    </header>
    <!--header end-->
    <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
          <p class="centered"><a href="profile.html"><img src="resources/img/ui-sam.jpg" class="img-circle" width="80"></a></p>
          <h5 class="centered">쀼팀장</h5>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-dashboard"></i>
              <span>정보관리</span>
              </a>
              <ul class="sub">
              <li><a href="general.html">운동관리</a></li>
              <li><a href="buttons.html">질병관리</a></li>
              <li><a href="panels.html">약 관리</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-desktop"></i>
              <span>회원관리</span>
              </a>
            <ul class="sub">
              <li><a href="general.html">이용자관리</a></li>
              <li><a href="buttons.html">이용자통계</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-cogs"></i>
              <span>식단관리</span>
              </a>
            <ul class="sub">
              <li><a href="grids.html">음식 조회</a></li>
              <li><a href="calendar.html">음식 등록</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-book"></i>
              <span>게시판 관리</span>
              </a>
            <ul class="sub">
              <li><a href="host_notice">공지사항 관리</a></li>
              <li><a href="host_board">게시글 관리</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-tasks"></i>
              <span>동호회 관리</span>
              </a>
            <ul class="sub">
              <li><a href="form_component.html">동호회 가입승인/거절</a></li>
              <li><a href="advanced_form_components.html">동호회 해체승인</a></li>
              <li><a href="form_validation.html">동호회 결산</a></li>
            </ul>
          </li>
          <li>
            <a href="host_qna">
              <i class="fa fa-th"></i>
              <span>QnA 관리</span>
            </a>
          </li>
        </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
    <!--sidebar end-->
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
   <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> 게시글 관리</h3>
        <div class="row mb">
          <!-- page start-->
          <div class="content-panel">
            <div class="adv-table">
              <table cellpadding="0" cellspacing="0" border="0" class="display table table-bordered" id="hidden-table-info">
                <thead>
                  <tr>
                    <th>No.</th>
                    <th>Date.</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>조회수</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td>2019/07/12</td>
                    <td><a href="host_boardContent">키자루랑 원장썜이랑 싸우면 누가 이기냐</a></td>
                    <td>짱구</td>
                    <td>3453</td>
                  </tr>
                  <tr>
                    <td>11110</td>
                    <td>2019/07/11</td>
                    <td>안녕</td>
                    <td>짱구</td>
                    <td>23</td>
                  </tr>
                  <tr>
                    <td>11110</td>
                    <td>2019/07/11</td>
                    <td>안녕</td>
                    <td>짱구</td>
                    <td>23</td>
                  </tr>
                  <tr>
                    <td>11110</td>
                    <td>2019/07/11</td>
                    <td>안녕</td>
                    <td>짱구</td>
                    <td>23</td>
                  </tr>
                  <tr>
                    <td>11110</td>
                    <td>2019/07/11</td>
                    <td>안녕</td>
                    <td>짱구</td>
                    <td>23</td>
                  </tr>
                  <tr>
                    <td>11110</td>
                    <td>2019/07/11</td>
                    <td>안녕</td>
                    <td>짱구</td>
                    <td>23</td>
                  </tr>
                  <tr>
                    <td>11110</td>
                    <td>2019/07/11</td>
                    <td>안녕</td>
                    <td>짱구</td>
                    <td>23</td>
                  </tr>
                  <tr>
                    <td>11110</td>
                    <td>2019/07/11</td>
                    <td>안녕</td>
                    <td>짱구</td>
                    <td>23</td>
                  </tr>
                  <tr>
                    <td>11110</td>
                    <td>2019/07/11</td>
                    <td>안녕</td>
                    <td>짱구</td>
                    <td>23</td>
                  </tr>
                  <tr>
                    <td>11110</td>
                    <td>2019/07/11</td>
                    <td>안녕</td>
                    <td>짱구</td>
                    <td>23</td>
                  </tr>
                  <tr>
                    <td>11110</td>
                    <td>2019/07/11</td>
                    <td>안녕</td>
                    <td>짱구</td>
                    <td>23</td>
                  </tr>
                  <tr>
                    <td>11110</td>
                    <td>2019/07/11</td>
                    <td>안녕</td>
                    <td>짱구</td>
                    <td>23</td>
                  </tr>
                 <tr>
                    <td>11110</td>
                    <td>2019/07/11</td>
                    <td>안녕</td>
                    <td>짱구</td>
                    <td>23</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <!-- page end-->
        </div>
        <!-- /row -->
      </section>
      <!-- /wrapper -->
    </section>

    <!--main content end-->
    <!--footer start-->
    <footer class="site-footer">
      <div class="text-center">
        <p>
          &copy; Copyrights <strong>Dashio</strong>. All Rights Reserved
        </p>
        
        <a href="index.html#" class="go-top">
          <i class="fa fa-angle-up"></i>
          </a>
      </div>
    </footer>
    <!--footer end-->
  </section>
    <script src="resources/lib/jquery/jquery.min.js"></script>
  <script type="text/javascript" language="javascript" src="resources/lib/advanced-datatable/js/jquery.js"></script>
  <script src="lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="resources/lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="resources/lib/jquery.scrollTo.min.js"></script>
  <script src="resources/lib/jquery.nicescroll.js" type="text/javascript"></script>
  <script type="text/javascript" language="javascript" src="resources/lib/advanced-datatable/js/jquery.dataTables.js"></script>
  <script type="text/javascript" src="resources/lib/advanced-datatable/js/DT_bootstrap.js"></script>
  <!--common script for all pages-->
  <script src="resources/lib/common-scripts.js"></script>
  <!--script for this page-->
  <script type="text/javascript">
    /* Formating function for row details */
    function fnFormatDetails(oTable, nTr) {
      var aData = oTable.fnGetData(nTr);
      var sOut = '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">';
      sOut += '<tr><td>Rendering engine:</td><td>' + aData[1] + ' ' + aData[4] + '</td></tr>';
      sOut += '<tr><td>Link to source:</td><td>Could provide a link here</td></tr>';
      sOut += '<tr><td>Extra info:</td><td>And any further details here (images etc)</td></tr>';
      sOut += '</table>';

      return sOut;
    }

  $(document).ready(function() {
      /*
       * Insert a 'details' column to the table
       */
      var nCloneTh = document.createElement('th');
      var nCloneTd = document.createElement('td');
      /* nCloneTd.innerHTML = '<img src="resources/lib/advanced-datatable/images/details_open.png">'; */
      nCloneTd.className = "center";

      $('#hidden-table-info thead tr').each(function() {
        this.insertBefore(nCloneTh, this.childNodes[0]);
      });

      $('#hidden-table-info tbody tr').each(function() {
        this.insertBefore(nCloneTd.cloneNode(true), this.childNodes[0]);
      });

      /*
       * Initialse DataTables, with no sorting on the 'details' column
       */
      var oTable = $('#hidden-table-info').dataTable({
        "aoColumnDefs": [{
          "bSortable": false,
          "aTargets": [0]
        }],
        "aaSorting": [
          [1, 'asc']
        ]
      });

      /* Add event listener for opening and closing details
       * Note that the indicator for showing which row is open is not controlled by DataTables,
       * rather it is done here
       */
      /* $('#hidden-table-info tbody td img').live('click', function() {
        var nTr = $(this).parents('tr')[0];
        if (oTable.fnIsOpen(nTr)) {
          /* This row is already open - close it
          this.src = "resources/lib/advanced-datatable/media/images/details_open.png";
          oTable.fnClose(nTr);
        } else {
          /* Open this row 
          this.src = "resources/lib/advanced-datatable/images/details_close.png";
          oTable.fnOpen(nTr, fnFormatDetails(oTable, nTr), 'details');
        }
      }); */
    });
  </script>

</body>
</html>