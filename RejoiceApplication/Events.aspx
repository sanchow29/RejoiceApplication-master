<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="RejoiceApplication.Events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-inner" style="min-height: 1050px;">
        <!-- start page inner div-->
        <div class="row right_side event">
            <!-- start dashboard content div-->
            <noscript>
                <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
            </noscript>
            <script type="text/javascript">
                jQuery(document).ready(function() {
                    jQuery('#hmgt_event').DataTable({
                        "responsive": true,
                        "aoColumns": [
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
            <!--START POPUP CODE-->
            <div class="popup-bg">
                <div class="overlay-content">

                    <div class="notice_content"></div>
                </div>
            </div>
            <!--END POPUP CODE-->
            <div class="panel-body panel-white">
                <!--START PANEL BODY DIV-->
                <ul class="nav nav-tabs panel_tabs" role="tablist">
                    <li class="active">
                        <a href="Events.aspx">
                            <i class="fa fa-align-justify"></i>Event List
                        </a>

                    </li>
                    <li class=""></li>
                </ul>
                <div class="tab-content">
                    <!--START TAB CONTENT DIV-->
                    <div class="tab-pane fade active in" id="eventlist">
                        <!--START TAB PANE DIV-->
                        <div class="panel-body">
                            <!--START PANEL BODY DIV-->
                            <div class="table-responsive">
                                <!--START TABLE ReSPONSIVE DIV-->
                                <table id="hmgt_event" class="display dataTable " cellspacing="0" width="100%">
                                    <!--START EVENT LIST TABLE-->
                                    <thead>
                                    <tr>
                                        <th width="190px">Title</th>
                                        <th>Comment</th>
                                        <th>Start Date</th>
                                        <th>End Date</th>
                                        <th>For</th>
                                        <th width="185px">Action</th>
                                    </tr>
                                    </thead>
                                    <tfoot>
                                    <tr>
                                        <th width="190px">Title</th>
                                        <th>Comment</th>
                                        <th>Start Date</th>
                                        <th>End Date</th>
                                        <th>For</th>
                                        <th width="185px">Action</th>
                                    </tr>
                                    </tfoot>
                                    <tbody>
                                    <tr>
                                        <td>event 1</td>
                                        <td>event 1</td>
                                        <td>2019-03-26</td>
                                        <td>2019-03-30</td>
                                        <td>
                                            Patient,Doctor,Nurse,Support Staff,Pharmacist,Laboratory Staff,Accountant
                                        </td>
                                        <td>
                                            <a href="#" class="btn btn-primary view-notice" id="78">View</a>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Vacancies</td>
                                        <td>Comes</td>
                                        <td>2019-04-29</td>
                                        <td>2019-04-30</td>
                                        <td>
                                            Patient
                                        </td>
                                        <td>
                                            <a href="#" class="btn btn-primary view-notice" id="93">View</a>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>holiday</td>
                                        <td></td>
                                        <td>2019-03-27</td>
                                        <td>2019-03-31</td>
                                        <td>
                                            Patient,Doctor,Nurse,Support Staff,Pharmacist,Laboratory Staff,Accountant
                                        </td>
                                        <td>
                                            <a href="#" class="btn btn-primary view-notice" id="80">View</a>

                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <!--END NOTICE LIST TABLE-->
                            </div>
                            <!--END TABLE RESPONSIVE DIV-->
                        </div>
                        <!--END PANEL BODY DIV-->
                    </div>
                    <!--END TAB PANE DIV-->
                </div>
                <!--END TAB CONTENT DIV-->

            </div>
            <!--END PANEL BODY DIV-->

        </div>
    </div>
</asp:Content>