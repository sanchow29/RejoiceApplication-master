<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AmbulanceList.aspx.cs" Inherits="RejoiceApplication.Ambulance.AmbulanceList" %>

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
                    <li class="">
                        <a href="Ambulance.aspx">
                            <i class="fa fa-align-justify"></i>Request List
                        </a>

                    </li>
                    <li class="">

                        <a href="AmbulanceRequest.aspx" class="tab ">
                            <i class="fa fa-plus-circle"></i>Add Request
                        </a>

                    </li>

                    <li class="active">
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
                        jQuery('#ambulance_list').DataTable({
                            "responsive": true,
                            "order": [[1, "asc"]],
                            "aoColumns": [
                                { "bSortable": false },
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
                <div class="panel-body">
                    <!-- START PANEL BODY DIV -->
                    <div class="table-responsive">
                        <!-- START TABLE RESPONSIVE DIV -->
                        <table id="ambulance_list" class="display" cellspacing="0" width="100%">
                            <!-- START Ambulance LIST FORM -->
                            <thead>
                            <tr>
                                <th style="width: 50px; height: 50px;">Image</th>
                                <th>Ambulance ID</th>
                                <th>Reg NO</th>
                                <th>Driver Name</th>

                                <th>Action</th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th>Image</th>
                                <th>Ambulance ID</th>
                                <th>Reg NO</th>
                                <th>Driver Name</th>

                                <th>Action</th>
                            </tr>
                            </tfoot>

                            <tbody>
                            <tr>
                                <td class="driver_image">
                                    <img src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/useriamge/driver.jpg" height="50px" width="50px" class="img-circle"/>
                                </td>
                                <td class="amb_id">AMB03161</td>
                                <td class="regno">001</td>
                                <td class="driver_name">Clair Mcneil</td>

                                <td class="action">
                                <a href="?dashboard=user&page=ambulance&tab=add_ambulance&action=edit&amb_id=MQ==" class="btn btn-info">Edit</a>
                            </tr>
                            <tr>
                                <td class="driver_image">
                                    <img src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/uploads/2019/03/driver-old.jpg" height="50px" width="50px" class="img-circle"/>
                                </td>
                                <td class="amb_id">AMB03162</td>
                                <td class="regno">002</td>
                                <td class="driver_name">Reid Hyman</td>

                                <td class="action">
                                <a href="?dashboard=user&page=ambulance&tab=add_ambulance&action=edit&amb_id=Mg==" class="btn btn-info">Edit</a>
                            </tr>
                            <tr>
                                <td class="driver_image">
                                    <img src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/uploads/2019/03/patient-man-pain-14255893.jpg" height="50px" width="50px" class="img-circle"/>
                                </td>
                                <td class="amb_id">AMB03223</td>
                                <td class="regno">67890</td>
                                <td class="driver_name">gmasilbhai</td>

                                <td class="action">
                                <a href="?dashboard=user&page=ambulance&tab=add_ambulance&action=edit&amb_id=Mw==" class="btn btn-info">Edit</a>
                            </tr>
                            <tr>
                                <td class="driver_image">
                                    <img src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/useriamge/patient.png" height="50px" width="50px" class="img-circle"/>
                                </td>
                                <td class="amb_id">AMB03224</td>
                                <td class="regno">4321</td>
                                <td class="driver_name">johny bestrio</td>

                                <td class="action">
                                <a href="?dashboard=user&page=ambulance&tab=add_ambulance&action=edit&amb_id=NA==" class="btn btn-info">Edit</a>
                            </tr>

                            </tbody>
                        </table>
                        <!-- END Ambulance LIST DIV -->
                    </div>
                    <!-- END TABLE RESPONSIVE DIV -->
                </div>
                <!-- END PANEL BODY DIV -->
            </div>
        </div>
    </div>

</asp:Content>