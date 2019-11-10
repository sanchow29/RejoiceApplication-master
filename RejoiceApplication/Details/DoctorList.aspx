<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DoctorList.aspx.cs" Inherits="RejoiceApplication.Details.DoctorList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-inner" style="min-height: 1050px;">
        <!-- start page inner div-->
        <div class="row right_side doctor">
            <!-- start dashboard content div-->
            <noscript>
                <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
            </noscript>
            <!--START POPUP CODE-->
            <div class="popup-bg">
                <div class="overlay-content">
                    <div class="modal-content">
                        <div class="category_list">
                        </div>
                    </div>
                </div>
            </div>
            <!-- End POP-UP Code -->
      
                <script src="../DataTables/jQuery-3.3.1/jquery-3.3.1.js"></script>
    <script src="../DataTables/DataTables-1.10.20/js/jquery.dataTables.js"></script>
    <link href="../DataTables/DataTables-1.10.20/css/jquery.dataTables.css" rel="stylesheet"/>


    <script type="text/javascript">
        $(document).ready(function() {
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "../GetService.asmx/GetDoctorList",
                success: function(data) {
                    var datatableVariable = $('#doctor_list').DataTable({
                        data: data,
                        columns: [
                            { 'data': 'UserID' },
                            { 'data': 'UserFirstName' },
                            { 'data': 'UserLastName' },
                            {'data': 'UserDepartment'},
                            { 'data': 'UserGender' },
                            { 'data': 'UserEmailId' },
                            { 'data': 'UserPhoneNumber' },
                            {
                                'data': 'UserDOB',
                                'render': function(date) {
                                    var date = new Date(parseInt(date.substr(6)));
                                    var month = date.getMonth() + 1;
                                    return date.getDate() + "/" + month + "/" + date.getFullYear();
                                }
                            }
                        ]
                    });
                    $('#doctor_list tfoot th').each(function() {
                        var placeHolderTitle = $('#doctor_list thead th').eq($(this).index()).text();
                        $(this).html('<input type="text" class="form-control input input-sm" placeholder = "Search ' +
                            placeHolderTitle +
                            '" />');
                    });
                    datatableVariable.columns().every(function() {
                        var column = this;
                        $(this.footer()).find('input').on('keyup change',
                            function() {
                                column.search(this.value).draw();
                            });
                    });
                    $('.showHide').on('click',
                        function() {
                            var tableColumn = datatableVariable.column($(this).attr('data-columnindex'));
                            tableColumn.visible(!tableColumn.visible());
                        });
                }
            });

        });
    </script>
            <div class="panel-body panel-white">
                <!--START PANEL BODY DIV-->
                <ul class="nav nav-tabs panel_tabs" role="tablist">
                    <li class="active">
                        <a href="../Details/DoctorList.aspx" class="tab active">
                            <i class="fa fa-align-justify"></i> Doctor List
                        </a>

                    </li>

                    <li class="">

                    </li>
                </ul>
                <div class="tab-content">
                    <!--START TAB CONTENT DIV-->
                    <div class="panel-body">
                        <!--START PANEL BODY DIV-->
                        <div class="table-responsive">
                            <!--START TABLE RESPONSIVE DIV-->

                            <div style="padding: 10px; margin-top: 50px" class="container-fluid">


                                <table id="doctor_list" class="dataTable" cellspacing="0" width="100%">
                                    <thead>
                                    <tr>
                                        <th>UserID</th>
                                        <th>UserFirstName</th>
                                        <th>UserLastName</th>
                                        <th>UserDepartment</th>
                                        <th>UserGender</th>
                                        <th>UserEmailId</th>
                                        <th>UserPhoneNumber</th>
                                        <th>UserDOB</th>
                                    </tr>
                                    </thead>
                                    <tfoot>
                                    <tr>
                                        <th>UserID</th>
                                        <th>UserFirstName</th>
                                        <th>UserLastName</th>
                                        <th>UserDepartment</th>
                                        <th>UserGender</th>
                                        <th>UserEmailId</th>
                                        <th>UserPhoneNumber</th>
                                        <th>UserDOB</th>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                           
                            <!--END Doctor LIST TABLE-->
                        </div><!--END TABLE RESPONSIVE DIV-->
                    </div><!--END PANEL BODY DIV-->
                </div><!--END PANEL CONTENT DIV-->

            </div><!--END PANEL BODY DIV-->
        </div>
    </div>

</asp:Content>