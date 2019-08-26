<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ambulance.aspx.cs" Inherits="RejoiceApplication.Ambulance.Ambulance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-inner" style="min-height: 1050px;">
        <!-- start page inner div-->
        <div class="row right_side ambulance">
            <!-- start dashboard content div-->
            <noscript>
                <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
            </noscript>

            <script type="text/javascript">
                jQuery(document).ready(function() {
                    $('.request_time').timepicki(
                        {
                            show_meridian: false,
                            min_hour_value: 0,
                            max_hour_value: 23,
                            step_size_minutes: 15,
                            overflow_minutes: true,
                            increase_direction: 'up',
                            disable_keyboard_mobile: true
                        });

                    $('.dispatch_time').timepicki({
                        show_meridian: false,
                        min_hour_value: 0,
                        max_hour_value: 23,
                        step_size_minutes: 15,
                        overflow_minutes: true,
                        increase_direction: 'up',
                        disable_keyboard_mobile: true
                    });
                    var date = new Date();
                    date.setDate(date.getDate() - 0);
                    $.fn.datepicker.defaults.format = " yyyy-mm-dd";
                    $('#request_date').datepicker({
                        startDate: date,
                        autoclose: true
                    });
                    $('#tax_charge').multiselect({
                        nonSelectedText: 'Select Tax',
                        includeSelectAllOption: true,
                        selectAllText: 'Select all'
                    });
                });
            </script>
            <div class="panel-body panel-white">
                <!-- START PANEL BODY DIV -->
                <ul class="nav nav-tabs panel_tabs" role="tablist">
                    <!-- START NAV TAB -->
                    <li class="active">
                        <a href="Ambulance.aspx">
                            <i class="fa fa-align-justify"></i>Request List
                        </a>

                    </li>
                    <li class="">

                        <a href="AmbulanceRequest.aspx" class="tab ">
                            <i class="fa fa-plus-circle"></i>Add Request
                        </a>

                    </li>

                    <li class="">
                        <a href="AmbulanceList.aspx">
                            <i class="fa fa-align-justify"></i>Ambulance List
                        </a>

                    </li>

                    <li class="">

                        <a href="AddNewAmbulance.aspx" class="tab ">
                            <i class="fa fa-plus-circle"></i>Add New Ambulance
                        </a>

                    </li>

                </ul>
                <!-- END NAV TAB -->
                <script type="text/javascript">
                    jQuery(document).ready(function() {
                        jQuery('#ambulance_req_listlist1').DataTable({
                            "responsive": true,
                            "order": [[2, "Desc"]],
                            "aoColumns": [
                                { "bSortable": true },
                                { "bSortable": true },
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
                <div class="tab-content">
                    <!-- START TAB CONTENT DIV-->
                    <div class="tab-pane fade active in" id="prescription">
                        <!-- START TAB FADE DIV -->
                        <div class="panel-body">
                            <!-- START PANEL BODY DIV -->
                            <div class="table-responsive">
                                <!-- START TABLE RESPONSIVE DIV -->
                                <table id="ambulance_req_listlist1" class="display dataTable" cellspacing="0" width="100%">
                                    <!-- START AMBULANCE Request LIST TABLE -->
                                    <thead>
                                    <tr>
                                        <th>Ambulance</th>
                                        <th>Patient</th>
                                        <th>Date</th>
                                        <th>Time</th>
                                        <th>Dispatch Time</th>
                                        <th>Charges (<span>&#36;</span>)</th>
                                        <th>Tax Amount (<span>&#36;</span>)</th>
                                        <th>Total Charges (<span>&#36;</span>)</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tfoot>
                                    <tr>
                                        <th>Ambulance</th>
                                        <th>Patient</th>
                                        <th>Date</th>
                                        <th>Time</th>
                                        <th>Dispatch Time</th>
                                        <th>Charges (<span>&#36;</span>)</th>
                                        <th>Tax Amount (<span>&#36;</span>)</th>
                                        <th>Total Charges (<span>&#36;</span>)</th>
                                        <th>Action</th>
                                    </tr>
                                    </tfoot>

                                    <tbody>
                                    <tr>
                                        <td class="ambulanceid">AMB03161</td>
                                        <td class="patient">Anna Sanz(P50319)</td>
                                        <td class="date">2019-03-19</td>
                                        <td class="">14:41:00</td>
                                        <td class="dispatchtime">20:41:00</td>
                                        <td class="">449.99</td>
                                        <td class="">40.50</td>
                                        <td class="">490.49</td>
                                        <td class="action">
                                        <a href="?dashboard=user&page=ambulance&tab=add_ambulance_req&action=edit&amb_req_id=MQ==" class="btn btn-info">Edit</a>
                                    </tr>
                                    <tr>
                                        <td class="ambulanceid">AMB03162</td>
                                        <td class="patient">Lucas M(P60319)</td>
                                        <td class="date">2019-03-21</td>
                                        <td class="">14:42:00</td>
                                        <td class="dispatchtime">23:42:00</td>
                                        <td class="">499.98</td>
                                        <td class="">85.00</td>
                                        <td class="">584.98</td>
                                        <td class="action">
                                        <a href="?dashboard=user&page=ambulance&tab=add_ambulance_req&action=edit&amb_req_id=Mg==" class="btn btn-info">Edit</a>
                                    </tr>
                                    <tr>
                                        <td class="ambulanceid">AMB03161</td>
                                        <td class="patient">Mario Rossi(P40319)</td>
                                        <td class="date">2019-03-28</td>
                                        <td class="">17:43:00</td>
                                        <td class="dispatchtime">19:43:00</td>
                                        <td class="">500.00</td>
                                        <td class="">0.00</td>
                                        <td class="">500.00</td>
                                        <td class="action">
                                        <a href="?dashboard=user&page=ambulance&tab=add_ambulance_req&action=edit&amb_req_id=Mw==" class="btn btn-info">Edit</a>
                                    </tr>
                                    <tr>
                                        <td class="ambulanceid">AMB03161</td>
                                        <td class="patient">aaannnnn bbb(P500519)</td>
                                        <td class="date">2019-07-12</td>
                                        <td class="">22:42:00</td>
                                        <td class="dispatchtime">22:42:00</td>
                                        <td class="">300.00</td>
                                        <td class="">27.00</td>
                                        <td class="">327.00</td>
                                        <td class="action">
                                        <a href="?dashboard=user&page=ambulance&tab=add_ambulance_req&action=edit&amb_req_id=NA==" class="btn btn-info">Edit</a>
                                    </tr>
                                    <tr>
                                        <td class="ambulanceid">AMB03161</td>
                                        <td class="patient">Treatment Range(P430519)</td>
                                        <td class="date">2019-07-24</td>
                                        <td class="">09:28:00</td>
                                        <td class="dispatchtime">09:28:00</td>
                                        <td class="">90.00</td>
                                        <td class="">12.60</td>
                                        <td class="">102.60</td>
                                        <td class="action">
                                        <a href="?dashboard=user&page=ambulance&tab=add_ambulance_req&action=edit&amb_req_id=NQ==" class="btn btn-info">Edit</a>
                                    </tr>
                                    </tbody>
                                </table>
                                <!-- END Ambulance Request LIST TABLE -->
                            </div>
                            <!-- END TABLE RESPONSIVE DIV -->
                        </div>
                        <!-- END PANEL BODY DIV -->
                    </div>
                    <!-- END TAB FADE DIV -->
                </div>
                <!-- END TAB CONTENT DIV -->
            </div>

        </div>
    </div>


</asp:Content>