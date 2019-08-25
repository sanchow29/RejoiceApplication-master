<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AssignedInstrumentList.aspx.cs" Inherits="RejoiceApplication.Instrument.AssignedInstrumentList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-inner" style="min-height: 1050px;">
        <!-- start page inner div-->
        <div class="row right_side instrument">
            <!-- start dashboard content div-->
            <noscript>
                <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
            </noscript>
            <script type="text/javascript">
                jQuery(document).ready(function ($) {
                    jQuery('#instrument_list').DataTable({
                        "responsive": true,
                        "aoColumns": [
                            { "bSortable": true },
                            { "bSortable": true },
                            { "bSortable": true },
                            { "bSortable": true },
                            { "bSortable": true },
                            { "bSortable": true },
                            { "bSortable": false }],
                        language: { "sEmptyTable": "No data available in table", "sInfo": "Showing _START_ to _END_ of _TOTAL_ entries", "sInfoEmpty": "Showing 0 to 0 of 0 entries", "sInfoFiltered": "(filtered from _MAX_ total entries)", "sInfoPostFix": "", "sInfoThousands": ",", "sLengthMenu": "Show _MENU_ entries", "sLoadingRecords": "Loading...", "sProcessing": "Processing...", "sSearch": "Search:", "sZeroRecords": "No matching records found", "oPaginate": { "sFirst": "First", "sLast": "Last", "sNext": "Next", "sPrevious": "Previous" }, "oAria": { "sSortAscending": ": activate to sort column ascending", "sSortDescending": ": activate to sort column descending" } }
                    });
                });
            </script>

            <div class="panel-body panel-white">
                <!--START PANEL BODY DIV-->
                <ul class="nav nav-tabs panel_tabs" role="tablist">

                    <li class="">
                        <a href="InstrumentList.aspx" class="tab ">
                            <i class="fa fa-align-justify"></i>Instrument List
                        </a>
                       
                    </li>

                    <li class="">

                        <a href="AddInstrument.aspx" class="tab ">
                            <i class="fa fa-plus-circle"></i>Add Instrument
                        </a>

                    </li>
                    <li class="active">
                        <a href="AssignedInstrumentList.aspx" class="tab active">
                            <i class="fa fa-align-justify"></i>Assigned Instrument List
                        </a>
                        
                    </li>
                    <li class="">

                        <a href="AddAssignedInstrumentList.aspx" class="tab ">
                            <i class="fa fa-plus-circle"></i>Assign Instrument
                        </a>

                    </li>


                </ul>
                <script type="text/javascript">
                    jQuery(document).ready(function ($) {
                        jQuery('#instrument_lists').DataTable({
                            "responsive": true,
                            "aoColumns": [
                                { "bSortable": true },
                                { "bSortable": true },
                                { "bSortable": true },
                                { "bSortable": true },
                                { "bSortable": true },
                                { "bSortable": true },
                                { "bSortable": true },
                                { "bSortable": false }],
                            language: { "sEmptyTable": "No data available in table", "sInfo": "Showing _START_ to _END_ of _TOTAL_ entries", "sInfoEmpty": "Showing 0 to 0 of 0 entries", "sInfoFiltered": "(filtered from _MAX_ total entries)", "sInfoPostFix": "", "sInfoThousands": ",", "sLengthMenu": "Show _MENU_ entries", "sLoadingRecords": "Loading...", "sProcessing": "Processing...", "sSearch": "Search:", "sZeroRecords": "No matching records found", "oPaginate": { "sFirst": "First", "sLast": "Last", "sNext": "Next", "sPrevious": "Previous" }, "oAria": { "sSortAscending": ": activate to sort column ascending", "sSortDescending": ": activate to sort column descending" } }
                        });
                    });
                </script>
                <div class="panel-body">
                    <!--STRAT PANEL BODY DIV-->
                    <div class="table-responsive">
                        <!--START TABLE RESPONSIVE DIV-->
                        <table id="instrument_lists" class="display" cellspacing="0" width="100%">
                            <!--START ASSIGNED Instrument LIST TABLE-->
                            <thead>
                                <tr>
                                    <th>Patient</th>
                                    <th>Instrument</th>
                                    <th>Assigned Date</th>
                                    <th>Expected Return Date</th>
                                    <th>Charges Amount (<span>&#36;</span>)</th>
                                    <th>Tax Amount (<span>&#36;</span>)</th>
                                    <th>Total Charges Amount (<span>&#36;</span>)</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Patient</th>
                                    <th>Instrument</th>
                                    <th>Assigned Date</th>
                                    <th>Expected Return Date</th>
                                    <th>Charges Amount (<span>&#36;</span>)</th>
                                    <th>Tax Amount (<span>&#36;</span>)</th>
                                    <th>Total Charges Amount (<span>&#36;</span>)</th>
                                    <th>Action</th>

                                </tr>
                            </tfoot>
                            <tbody>

                                <tr>

                                    <td class="bed_number"><a href="?dashboard=user&page=instrument&tab=assign_instrument&action=edit&assign_instument_id=1">Anna Sanz</a></td>
                                    <td class="bed_type">Verumak</td>

                                    <td class="descrition">2019-08-05</td>

                                    <td class="descrition">2019-09-05</td>
                                    <td class="charge">9600.00</td>
                                    <td class="charge">1632.00</td>
                                    <td class="charge">11232.00</td>

                                    <td class="action">
                                        <a href="?dashboard=user&page=instrument&tab=assign_instrument&action=edit&assign_instument_id=MQ==" class="btn btn-info">Edit</a>

                                    </td>

                                    <tr>

                                        <td class="bed_number"><a href="?dashboard=user&page=instrument&tab=assign_instrument&action=edit&assign_instument_id=2">Lucas M</a></td>
                                        <td class="bed_type">Verumak</td>

                                        <td class="descrition">2019-03-16</td>

                                        <td class="descrition">2019-03-30</td>
                                        <td class="charge">7500.00</td>
                                        <td class="charge">1275.00</td>
                                        <td class="charge">8775.00</td>

                                        <td class="action">
                                            <a href="?dashboard=user&page=instrument&tab=assign_instrument&action=edit&assign_instument_id=Mg==" class="btn btn-info">Edit</a>

                                        </td>

                                        <tr>

                                            <td class="bed_number"><a href="?dashboard=user&page=instrument&tab=assign_instrument&action=edit&assign_instument_id=6">Nina Cadela</a></td>
                                            <td class="bed_type">Verumak</td>

                                            <td class="descrition">2019-08-06</td>

                                            <td class="descrition">2019-09-06</td>
                                            <td class="charge">320.00</td>
                                            <td class="charge">0.00</td>
                                            <td class="charge">320.00</td>

                                            <td class="action">
                                                <a href="?dashboard=user&page=instrument&tab=assign_instrument&action=edit&assign_instument_id=Ng==" class="btn btn-info">Edit</a>

                                            </td>

                                            <tr>

                                                <td class="bed_number"><a href="?dashboard=user&page=instrument&tab=assign_instrument&action=edit&assign_instument_id=7">Eugene Ciervo</a></td>
                                                <td class="bed_type">Verumak</td>

                                                <td class="descrition">2019-08-07</td>

                                                <td class="descrition">2019-09-07</td>
                                                <td class="charge">320.00</td>
                                                <td class="charge">0.00</td>
                                                <td class="charge">320.00</td>

                                                <td class="action">
                                                    <a href="?dashboard=user&page=instrument&tab=assign_instrument&action=edit&assign_instument_id=Nw==" class="btn btn-info">Edit</a>

                                                </td>

                                                <tr>

                                                    <td class="bed_number"><a href="?dashboard=user&page=instrument&tab=assign_instrument&action=edit&assign_instument_id=8">Lucas M</a></td>
                                                    <td class="bed_type">Verumak</td>

                                                    <td class="descrition">2019-08-16</td>

                                                    <td class="descrition">2019-09-16</td>
                                                    <td class="charge">320.00</td>
                                                    <td class="charge">0.00</td>
                                                    <td class="charge">320.00</td>

                                                    <td class="action">
                                                        <a href="?dashboard=user&page=instrument&tab=assign_instrument&action=edit&assign_instument_id=OA==" class="btn btn-info">Edit</a>

                                                    </td>

                                                </tr>

                            </tbody>
                        </table>
                        <!--END Assign INSTRUMENT LIST TABLE-->
                    </div>
                    <!--END TABLE RESPONSIVE DIV-->
                </div>
                <!--END PANEL BODY DIV-->
            </div>
            <!--END PANEL BODY DIV-->
        </div>
        <!--END PANEL BODY DIV-->
    </div>

</asp:Content>
