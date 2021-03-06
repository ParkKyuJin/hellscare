<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="../include/h_sidebarMenu.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>Dashio - Bootstrap Admin Template</title>

  

  <!-- =======================================================
    Template Name: Dashio
    Template URL: https://templatemag.com/dashio-bootstrap-admin-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
</head>

<body>
  <section id="container">
   
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
        <div class="col-md-12">
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
                <c:forEach var="dto" items="${dtos}" >
                  <tr>
                    <td>${dto.board_code}</td>
                    <td>${dto.write_date}</td>
                    <td><a href="host_boardContent?board_code=${dto.board_code}">${dto.content}</a></td>
                    <td>${dto.username}</td>
                    <td>${dto.readCnt}</td>
                  </tr>
                  </c:forEach>
               
                </tbody>
              </table>
            </div>
          </div>
          <!-- page end-->
        </div>
        </div>
        <!-- /row -->
      </section>
      <!-- /wrapper -->
    </section>

    <!--main content end-->
    <!--footer start-->
   
    <!--footer end-->
  </section>
  <!--   <script src="resources/host_style/lib/jquery/jquery.min.js"></script> -->
  <script type="text/javascript" language="javascript" src="resources/host_style/lib/advanced-datatable/js/jquery.js"></script>

  <script class="include" type="text/javascript" src="resources/host_style/lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="resources/host_style/lib/jquery.scrollTo.min.js"></script>
  <script src="resources/host_style/lib/jquery.nicescroll.js" type="text/javascript"></script>
  <script type="text/javascript" language="javascript" src="resources/host_style/lib/advanced-datatable/js/jquery.dataTables.js"></script>
  <script type="text/javascript" src="resources/host_style/lib/advanced-datatable/js/DT_bootstrap.js"></script>
  <!--common script for all pages-->
<!--   <script src="resources/host_style/lib/common-scripts.js"></script> -->
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