<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InstrumentList.aspx.cs" Inherits="RejoiceApplication.Instrument.InstrumentList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row right_side instrument">
        <!-- start dashboard content div-->
        <noscript>
            <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
        </noscript>
        <script type="text/javascript">
            jQuery(document).ready(function($) {
                jQuery('#instrument_list').DataTable({
                    "responsive": true,
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
                        "oPaginate": { "sFirst": "First", "sLast": "Last", "sNext": "Next", "sPrevious": "Previous" },
                        "oAria": {
                            "sSortAscending": ": activate to sort column ascending",
                            "sSortDescending": ": activate to sort column descending"
                        }
                    }
                });
            });
        </script>

        <div class="panel-body panel-white">
            <!--START PANEL BODY DIV-->
            <ul class="nav nav-tabs panel_tabs" role="tablist">

                <li class="active">
                    <a href="InstrumentList.aspx" class="tab active">
                        <i class="fa fa-align-justify"></i>Instrument List
                    </a>

                </li>

                <li class="">

                    <a href="AddInstrument.aspx" class="tab ">
                        <i class="fa fa-plus-circle"></i>Add Instrument
                    </a>

                </li>
                <li class="">
                    <a href="AssignedInstrumentList.aspx" class="tab ">
                        <i class="fa fa-align-justify"></i>Assigned Instrument List
                    </a>

                </li>
                <li class="">

                    <a href="AddAssignedInstrumentList.aspx" class="tab ">
                        <i class="fa fa-plus-circle"></i>Assign Instrument
                    </a>

                </li>


            </ul>
            <form name="wcwm_report" action="" method="post">
                <div class="panel-body">
                    <!--START PANEL BODY DIV-->
                    <div class="table-responsive">
                        <!--START TABLE RESPONSIVE DIV-->
                        <table id="instrument_list" class="display" cellspacing="0" width="100%">
                            <!--START Instrument LIST TABLE-->
                            <thead>
                            <tr>
                                <th>Instrument Code</th>
                                <th>Name</th>
                                <th>Charges (<span>&#36;</span>)</th>
                                <th>Tax</th>
                                <th>Charges Type</th>
                                <th>Description</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th>Instrument Code</th>
                                <th>Name</th>
                                <th>Charges (<span>&#36;</span>)</th>
                                <th>Tax</th>
                                <th>Charges Type</th>
                                <th>Description</th>
                                <th>Action</th>
                            </tr>
                            </tfoot>
                            <tbody>
                            <tr>
                                <td class="bed_number">001</td>
                                <td class="bed_type">Verumak</td>
                                <td class="charge">10</td>
                                <td class="tax">-</td>
                                <td class="descrition">Daily</td>
                                <td class="descrition">For the mechanical devices used to impart a force from a pressurized gas, see pneumatic cylinder</td>
                                <td class="action">
                                    <a href="?dashboard=user&page=instrument&tab=addinstrument&&action=edit&instumrnt_id=MQ==" class="btn btn-info">Edit</a>

                                </td>

                            </tr>
                            <tr>
                                <td class="bed_number">002</td>
                                <td class="bed_type">Verumak</td>
                                <td class="charge">10</td>
                                <td class="tax">-</td>
                                <td class="descrition">Daily</td>
                                <td class="descrition">general, surgical instruments a.</td>
                                <td class="action">
                                    <a href="?dashboard=user&page=instrument&tab=addinstrument&&action=edit&instumrnt_id=Mg==" class="btn btn-info">Edit</a>

                                </td>

                            </tr>
                            <tr>
                                <td class="bed_number">10</td>
                                <td class="bed_type">Verumak</td>
                                <td class="charge">10</td>
                                <td class="tax">-</td>
                                <td class="descrition">Daily</td>
                                <td class="descrition"></td>
                                <td class="action">
                                    <a href="?dashboard=user&page=instrument&tab=addinstrument&&action=edit&instumrnt_id=Mw==" class="btn btn-info">Edit</a>

                                </td>

                            </tr>
                            </tbody>
                        </table>
                        <!--END INSTRUMENT LIST TABLE-->
                    </div>
                    <!--END TABLE RESPONSIVE DIV-->
                </div>
                <!--END PANEL BODY DIV-->
            </form>
        </div>
        <!--END PANEL BODY DIV-->
    </div>

</asp:Content>