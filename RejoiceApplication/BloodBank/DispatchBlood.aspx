<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DispatchBlood.aspx.cs" Inherits="RejoiceApplication.BloodBank.UsedBloodBankList" %>

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
                    <li class="">
                        <a href="BloodDonorList.aspx" class="tab ">
                            <i class="fa fa-align-justify"></i>Blood Donor List
                        </a>
                    </li>

                    <li class="">
                        <a href="AddBloodDonor.aspx" class="tab ">
                            <i class="fa fa-plus-circle"></i>Add Blood Donor
                        </a>
                    </li>
                    <li class="active">
                        <a href="DispatchBloodList.aspx" class="tab active">
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
                    <script type="text/javascript">
                        jQuery(document).ready(function () {
                            jQuery('#dispatch_bood').DataTable({
                                "responsive": true,
                                "aoColumns": [
                                    { "bSortable": true },
                                    { "bSortable": true },
                                    { "bSortable": true },
                                    { "bSortable": true },
                                    { "bSortable": true },
                                    { "bSortable": true },
                                    { "bSortable": true },
                                    { "bSortable": false }
                                ],
                                language: { "sEmptyTable": "No data available in table", "sInfo": "Showing _START_ to _END_ of _TOTAL_ entries", "sInfoEmpty": "Showing 0 to 0 of 0 entries", "sInfoFiltered": "(filtered from _MAX_ total entries)", "sInfoPostFix": "", "sInfoThousands": ",", "sLengthMenu": "Show _MENU_ entries", "sLoadingRecords": "Loading...", "sProcessing": "Processing...", "sSearch": "Search:", "sZeroRecords": "No matching records found", "oPaginate": { "sFirst": "First", "sLast": "Last", "sNext": "Next", "sPrevious": "Previous" }, "oAria": { "sSortAscending": ": activate to sort column ascending", "sSortDescending": ": activate to sort column descending" } }
                            });

                        });
                    </script>
                    <div class="panel-body">
                        <!--START PANEL BODY DIV-->
                        <form name="wcwm_report" action="" method="post">
                            <div class="panel-body">
                                <!--START PANEL BODY DIV-->
                                <div class="table-responsive">
                                    <!--START TABLE RESPONSIVE DIV-->
                                    <table id="dispatch_bood" class="display" cellspacing="0" width="100%">
                                        <!--START Dispatch BLLOD DIV-->
                                        <thead>
                                            <tr>
                                                <th>Patient Name</th>
                                                <th>Blood Group</th>
                                                <th>Number Of Bags</th>
                                                <th>Date</th>
                                                <th>Charges (<span>&#36;</span>)</th>
                                                <th>Tax Amount (<span>&#36;</span>)</th>
                                                <th>Total Charges (<span>&#36;</span>)</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Patient Name</th>
                                                <th>Blood Group</th>
                                                <th>Number Of Bags</th>
                                                <th>Date</th>
                                                <th>Charges (<span>&#36;</span>)</th>
                                                <th>Tax Amount (<span>&#36;</span>)</th>
                                                <th>Total Charges (<span>&#36;</span>)</th>
                                                <th>Action</th>
                                            </tr>
                                        </tfoot>

                                        <tbody>
                                            <tr>
                                                <td class="patient">Anna Sanz(P50319)</td>
                                                <td class="bloodgroup">AB+
                                                </td>
                                                <td class="subject_name">1</td>
                                                <td class="">2019-03-16</td>
                                                <td class="">500</td>
                                                <td class="">85</td>
                                                <td class="">585</td>
                                                <td class="action">
                                                    <a href="?dashboard=user&page=bloodbank&tab=adddispatchblood&action=edit&dispatchblood_id=MQ==" class="btn btn-info">Edit</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="patient">Lucas M(P60319)</td>
                                                <td class="bloodgroup">A+
                                                </td>
                                                <td class="subject_name">5</td>
                                                <td class="">2019-03-13</td>
                                                <td class="">1000</td>
                                                <td class="">170</td>
                                                <td class="">1170</td>
                                                <td class="action">
                                                    <a href="?dashboard=user&page=bloodbank&tab=adddispatchblood&action=edit&dispatchblood_id=Mg==" class="btn btn-info">Edit</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="patient">Ashish Ranjan(P20319)</td>
                                                <td class="bloodgroup">B+
                                                </td>
                                                <td class="subject_name">1</td>
                                                <td class="">2019-06-03</td>
                                                <td class="">100</td>
                                                <td class="">22</td>
                                                <td class="">122</td>
                                                <td class="action">
                                                    <a href="?dashboard=user&page=bloodbank&tab=adddispatchblood&action=edit&dispatchblood_id=Mw==" class="btn btn-info">Edit</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="patient">king hytrd(P190419)</td>
                                                <td class="bloodgroup">B+
                                                </td>
                                                <td class="subject_name">1</td>
                                                <td class="">2019-07-17</td>
                                                <td class="">50</td>
                                                <td class="">4.5</td>
                                                <td class="">54.5</td>
                                                <td class="action">
                                                    <a href="?dashboard=user&page=bloodbank&tab=adddispatchblood&action=edit&dispatchblood_id=NA==" class="btn btn-info">Edit</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="patient">Ashish Ranjan(P20319)</td>
                                                <td class="bloodgroup">O-
                                                </td>
                                                <td class="subject_name">1</td>
                                                <td class="">2019-08-02</td>
                                                <td class="">200</td>
                                                <td class="">10</td>
                                                <td class="">210</td>
                                                <td class="action">
                                                    <a href="?dashboard=user&page=bloodbank&tab=adddispatchblood&action=edit&dispatchblood_id=NQ==" class="btn btn-info">Edit</a>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <!--END Dispatch BLLOD LIST TABLE-->
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
