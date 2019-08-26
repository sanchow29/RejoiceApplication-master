<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BedAllotment.aspx.cs" Inherits="RejoiceApplication.Details.BedAllotment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-inner" style="min-height: 1050px;">
        <!-- start page inner div-->
        <div class="row right_side bedallotment">
            <!-- start dashboard content div-->
            <div class="datas"></div>
            <noscript>
                <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
            </noscript>
            <div class="panel-body panel-white">
                <!-- START PANEL BODY DIV-->
                <ul class="nav nav-tabs panel_tabs" role="tablist">
                    <li class="active">
                        <a href="../Details/BedAllotment.aspx">
                            <i class="fa fa-align-justify"></i>Assigned Bed List
                        </a>

                    </li>
                    <li class=""></li>

                </ul>
                <div class="tab-content">
                    <!-- START TAB CONTENT DIV-->
                    <script type="text/javascript">
                        jQuery(document).ready(function() {
                            jQuery('#bedallotmentlist').DataTable({
                                "responsive": true,
                                "order": [[4, "Desc"]],
                                "aoColumns": [
                                    { "bSortable": true },
                                    { "bSortable": true },
                                    { "bSortable": true },
                                    { "bSortable": true },
                                    { "bSortable": true },
                                    { "bSortable": true },
                                    { "bSortable": false }
                                ],
                                language: {
                                    "sEmptyTable": "No data available in table",
                                    "sInfo": "Showing _START_ to _END_ of _TOTAL_ entries",
                                    "sInfoEmpty": "Showing 0 to 0 of 0 entries",
                                    "sInfoFiltered": "(filtered from _MAX_ total entries)",
                                    "sInfoPostFix": "",
                                    "sInfoThousands": ",",
                                    "sLengthMenu": "Show _MENU_ entries",
                                    "sLoadingRecords": "Loading...",
                                    "sProcessing": "Processing...",
                                    "sSearch": "Search:",
                                    "sZeroRecords": "No matching records found",
                                    "oPaginate": {
                                        "sFirst": "First",
                                        "sLast": "Last",
                                        "sNext": "Next",
                                        "sPrevious": "Previous"
                                    },
                                    "oAria": {
                                        "sSortAscending": ": activate to sort column ascending",
                                        "sSortDescending": ": activate to sort column descending"
                                    }
                                }
                            });
                        });
                    </script>
                    <div class="tab-pane fade active in" id="bedallotlist">
                        <!-- START TAB PANE DIV-->
                        <div class="panel-body">
                            <!-- START PANEL BODY DIV-->
                            <div class="table-responsive">
                                <!-- START TABLE RESPONSIVE DIV-->
                                <table id="bedallotmentlist" class="display dataTable " cellspacing="0" width="100%">
                                    <!-- START BAD Allotment LIST TABLE-->
                                    <thead>
                                    <tr>
                                        <th>Bed Type</th>
                                        <th>Bed Number</th>
                                        <th>Patient</th>
                                        <th>Nurse</th>
                                        <th>Allotment Date</th>
                                        <th>Expected Discharge Date</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tfoot>
                                    <tr>
                                        <th>Bed Type</th>
                                        <th>Bed Number</th>
                                        <th>Patient</th>
                                        <th>Nurse</th>
                                        <th>Allotment Date</th>
                                        <th>Expected Discharge Date</th>
                                        <th>Action</th>
                                    </tr>
                                    </tfoot>
                                    <tbody>
                                    <tr>
                                        <td class="bed_type">Special</td>
                                        <td class="bed_number">02</td>
                                        <td class="patient">Anna Sanz(P50319)</td>
                                        <td class="nurse">
                                            Cristi Abeita,
                                        </td>
                                        <td class="allotment_time">2019-03-16</td>
                                        <td class="discharge_time">2019-03-30</td>
                                        <td class="action"></td>

                                    </tr>
                                    <tr>
                                        <td class="bed_type">General</td>
                                        <td class="bed_number">02</td>
                                        <td class="patient">Lucas M(P60319)</td>
                                        <td class="nurse">
                                            Cristi Abeita,
                                        </td>
                                        <td class="allotment_time">2019-03-21</td>
                                        <td class="discharge_time">2019-07-12</td>
                                        <td class="action"></td>

                                    </tr>
                                    <tr>
                                        <td class="bed_type">General</td>
                                        <td class="bed_number">001</td>
                                        <td class="patient">Lucas M(P60319)</td>
                                        <td class="nurse">
                                            Cristi Abeita,
                                        </td>
                                        <td class="allotment_time">2019-05-10</td>
                                        <td class="discharge_time">2019-05-12</td>
                                        <td class="action"></td>

                                    </tr>
                                    <tr>
                                        <td class="bed_type">General</td>
                                        <td class="bed_number">002</td>
                                        <td class="patient">uu ui(P420519)</td>
                                        <td class="nurse">
                                            Cristi Abeita,
                                        </td>
                                        <td class="allotment_time">2019-06-15</td>
                                        <td class="discharge_time">2019-06-22</td>
                                        <td class="action"></td>

                                    </tr>
                                    </tbody>
                                </table>
                                <!-- END BEDALLOTMENT TABLE-->
                            </div>
                            <!-- END TABLE RESPONSIVE DIV-->
                        </div>
                        <!-- END PANEL BODY DIV-->
                    </div>
                    <!-- END PANE TAB DIV-->
                </div>
                <!-- END TAB CONTENT DIV-->
            </div>
            <!-- END PANE BODY DIV-->
        </div>
    </div>
</asp:Content>