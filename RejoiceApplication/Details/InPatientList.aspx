<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InPatientList.aspx.cs" Inherits="RejoiceApplication.Details.InPatient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-inner" style="min-height: 1050px;">
        <!-- start page inner div-->
        <div class="row right_side patient">
            <!-- start dashboard content div-->
            <noscript>
                <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
            </noscript>
            <!-- POP up code -->
            <div class="popup-bg">
                <div class="overlay-content">
                    <div class="modal-content">
                        <div class="patient_data">
                        </div>
                    </div>
                </div>
            </div>
            <!-- End POP-UP Code -->
            <script type="text/javascript">
                $(document).ready(function() {
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: "../GetService.asmx/GetInpatientList",
                        success: function(data) {
                            var datatableVariable = $('#patient_list').DataTable({
                                data: data,
                                columns: [
                                    { 'data': 'PatientID' },
                                    { 'data': 'PatientFirstName' },
                                    { 'data': 'PatientLastName' },
                                    { 'data': 'PatientDisease' },
                                    { 'data': 'PatientGender' },
                                    { 'data': 'PatientEmailId' },
                                    { 'data': 'PatientPhoneNumber' },
                                    {
                                        'data': 'PatientDOB',
                                        'render': function(date) {
                                            var date = new Date(parseInt(date.substr(6)));
                                            var month = date.getMonth() + 1;
                                            return date.getDate() + "/" + month + "/" + date.getFullYear();
                                        }
                                    }
                                ]
                            });
                            $('#patient_list tfoot th').each(function() {
                                var placeHolderTitle = $('#patient_list thead th').eq($(this).index()).text();
                                $(this).html(
                                    '<input type="text" class="form-control input input-sm" placeholder = "Search ' +
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
                <!-- START panel body DIV-->
                <ul class="nav nav-tabs panel_tabs" role="tablist">
                    <li class="active">

                        <a href="../Details/InPatientList.aspx" class="tab active">
                            <i class="fa fa-align-justify"></i>InPatient List
                        </a>

                    </li>

                    <li class=""></li>
                    <li class=""></li>
                    <li class=""></li>
                </ul>
                <div class="tab-content">
                    <!-- START TAB CONTENT DIV-->
                    <div class="panel-body">
                        <!-- START PANEL BODY DIV-->
                        <div class="table-responsive">
                            <!-- START TABLE RESPONSIVE DIV-->
                            <table id="patient_list" class="display dataTable " cellspacing="0">
                                <!-- START PATIENT LIST TABLR-->
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

                            <!-- END PATIENT LIST TABLE-->
                        </div>
                        <!-- END TABLE RESPONSIVE DIV-->
                    </div>
                    <!-- START PANEL BODY DIV-->
                </div>
                <!-- END TAB CONTENT DIV-->
            </div>
        </div>
    </div>
</asp:Content>