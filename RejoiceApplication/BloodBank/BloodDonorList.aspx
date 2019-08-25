<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BloodDonorList.aspx.cs" Inherits="RejoiceApplication.BloodBank.BloodDonorList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-inner" style="min-height: 1050px;">
        <!-- start page inner div-->
        <div class="row right_side bloodbank">
            <!-- start dashboard content div-->
            <noscript>
                <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
            </noscript>
            <script type="text/javascript">
                jQuery(document).ready(function ($) {

                    $('#blooddonor_form').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });
                    $('#bloodgroup_form').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });
                    $.fn.datepicker.defaults.format = " yyyy-mm-dd";
                    $('#last_donate_date').datepicker({
                        endDate: '+0d',
                        autoclose: true,
                    });
                });
            </script>
            <script type="text/javascript">
                jQuery(document).ready(function () {
                    jQuery('#bloodgroup_list').DataTable({
                        "responsive": true,
                        language: { "sEmptyTable": "No data available in table", "sInfo": "Showing _START_ to _END_ of _TOTAL_ entries", "sInfoEmpty": "Showing 0 to 0 of 0 entries", "sInfoFiltered": "(filtered from _MAX_ total entries)", "sInfoPostFix": "", "sInfoThousands": ",", "sLengthMenu": "Show _MENU_ entries", "sLoadingRecords": "Loading...", "sProcessing": "Processing...", "sSearch": "Search:", "sZeroRecords": "No matching records found", "oPaginate": { "sFirst": "First", "sLast": "Last", "sNext": "Next", "sPrevious": "Previous" }, "oAria": { "sSortAscending": ": activate to sort column ascending", "sSortDescending": ": activate to sort column descending" } }
                    });
                    jQuery('#blooddonor_list').DataTable({
                        "responsive": true,
                        language: { "sEmptyTable": "No data available in table", "sInfo": "Showing _START_ to _END_ of _TOTAL_ entries", "sInfoEmpty": "Showing 0 to 0 of 0 entries", "sInfoFiltered": "(filtered from _MAX_ total entries)", "sInfoPostFix": "", "sInfoThousands": ",", "sLengthMenu": "Show _MENU_ entries", "sLoadingRecords": "Loading...", "sProcessing": "Processing...", "sSearch": "Search:", "sZeroRecords": "No matching records found", "oPaginate": { "sFirst": "First", "sLast": "Last", "sNext": "Next", "sPrevious": "Previous" }, "oAria": { "sSortAscending": ": activate to sort column ascending", "sSortDescending": ": activate to sort column descending" } }
                    });


                });
            </script>

            <div class="panel-body panel-white">
                <!-- START PANEL BODY DIV-->
                <ul class="nav nav-tabs panel_tabs" role="tablist">
                    <li class="">
                        <a href="BloodBankList.aspx" class="tab ">
                            <i class="fa fa-align-justify"></i>Blood Manage
                        </a>
                    </li>
                    <li class="">
                        <a href="AddBloodGroup.aspx" class="tab ">
                            <i class="fa fa-plus-circle"></i>Add Blood Group
                        </a>
                    </li>
                    <li class="active">
                        <a href="BloodDonorList.aspx" class="tab active">
                            <i class="fa fa-align-justify"></i>Blood Donor List
                        </a>
                    </li>

                    <li class="">
                        <a href="AddBloodDonor.aspx" class="tab ">
                            <i class="fa fa-plus-circle"></i>Add Blood Donor
                        </a>
                    </li>
                    <li class="">
                        <a href="DispatchBloodList.aspx" class="tab ">
                            <i class="fa fa-align-justify"></i>Dispatch Blood List
                        </a>
                    </li>

                    <li class="">
                        <a href="DispatchBlood.aspx" class="tab ">
                            <i class="fa fa-plus-circle"></i>Dispatch Blood
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <!--START TAB CONTENT DIV-->
                    <div class="panel-body">
                        <!--START PANEL BODY DIV-->
                        <form name="wcwm_report" action="" method="post">
                            <div class="panel-body">
                                <!--START PANEL BODY DIV-->
                                <div class="table-responsive">
                                    <!--START TABLE RESPONSIVE DIV-->
                                    <table id="blooddonor_list" class="display dataTable" cellspacing="0" width="100%">
                                        <!--START BLOOD DONOR LIST TABLE-->
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>Blood Group</th>
                                                <th>Age</th>
                                                <th>Gender</th>
                                                <th>Number Of Bags</th>
                                                <th>Last Donation Date</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Name</th>
                                                <th>Blood Group</th>
                                                <th>Age</th>
                                                <th>Gender</th>
                                                <th>Number Of Bags</th>
                                                <th>Last Donation Date</th>
                                                <th>Action</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <tr>
                                                <td class="name"><a href="#">xxx</a></td>
                                                <td class="bloodgroup">O+
                                                </td>
                                                <td class="age">12</td>
                                                <td class="age">male</td>
                                                <td class="subject_name">9</td>
                                                <td class="lastdonate_date">2019-07-29</td>

                                                <td class="action">
                                                    <a href="?dashboard=user&page=bloodbank&tab=addblooddonor&action=edit&blooddonor_id=Mw==" class="btn btn-info">Edit</a>

                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <!--END BLLOD DONOR LIST TABLE -->
                                </div>
                                <!--END TABLE RESPONSIVE DIV-->
                            </div>
                            <!--END PANEL BODY DIV-->

                        </form>
                    </div>
                    <!--END PANEL BODY DIV-->
                </div>
                <!--END PANEL BODY DIV-->

            </div>
            <!--END TAB CONTENT DIV-->
        </div>
    </div>

</asp:Content>
