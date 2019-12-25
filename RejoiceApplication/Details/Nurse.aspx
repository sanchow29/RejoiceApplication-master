<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Nurse.aspx.cs" Inherits="RejoiceApplication.Details.Nurse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-inner" style="min-height: 1050px;">
        <!-- start page inner div-->
        <div class="row right_side nurse">
            <!-- start dashboard content div-->
            <noscript>
                <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
            </noscript>
            <!-- POP up code -->
            <div class="popup-bg" style="min-height: 1631px !important">
                <div class="overlay-content">
                    <div class="modal-content">
                        <div class="category_list">
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
                        url: "../GetService.asmx/GetNurseList",
                        success: function(data) {
                            var datatableVariable = $('#nurse_list').DataTable({
                                data: data,
                                columns: [
                                    { 'data': 'UserId' },
                                    { 'data': 'UserFirstName' },
                                    { 'data': 'UserLastName' },
                                    { 'data': 'UserDepartment' },
                                    { 'data': 'UserGender' },
                                    { 'data': 'UserEmailId' },
                                    { 'data': 'UserPhoneNumber' },
                                    {
                                        'data': 'UserDob',
                                        'render': function(date) {
                                            var date = new Date(parseInt(date.substr(6)));
                                            var month = date.getMonth() + 1;
                                            return date.getDate() + "/" + month + "/" + date.getFullYear();
                                        }
                                    }
                                ]
                            });
                            $('#nurse_list tfoot th').each(function() {
                                var placeHolderTitle = $('#nurse_list thead th').eq($(this).index()).text();
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
                <!-- START PANEL BODY DIV-->
                <ul class="nav nav-tabs panel_tabs" role="tablist">
                    <li class="active">
                        <a href="../Details/Nurse.aspx" class="tab ">
                            <i class="fa fa-align-justify"></i>Nurse List
                        </a>

                    </li>
                    <li class=""></li>
                </ul>
                <div class="tab-content">
                    <!-- START TAB CONTENT DIV-->
                    <div class="panel-body">
                        <!-- START PANEL BODY DIV-->
                        <div class="table-responsive">
                            <!-- START TALE RESPONSIVE DIV-->
                            <table id="nurse_list" class="display dataTable " cellspacing="0" width="100%">
                                <!-- START NURSE LIST TABLE-->
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


                            <!-- END NURSE LIST TABLE-->
                        </div>
                        <!-- END TABLE RESPONSIVE DIV-->
                    </div>
                    <!-- END PANEL BODY DIV-->
                </div>
                <!-- END TABLE CONTENT DIV-->

            </div>
            <!-- START PANEL BODY DIV-->

        </div>
    </div>
</asp:Content>