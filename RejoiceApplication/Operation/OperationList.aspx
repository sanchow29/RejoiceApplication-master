<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OperationList.aspx.cs" Inherits="RejoiceApplication.Operation.Operation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="page-inner" style="min-height: 1050px;">
<!-- start page inner div-->
<div class="row right_side operation">
<!-- start dashboard content div-->
<noscript>
    <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
</noscript>

<script type="text/javascript">
    jQuery(document).ready(function($) {
        $('#hmgt_operation').DataTable({
            "responsive": true,
            "order": [[3, "Desc"]],
            "aoColumns": [
                { "bSortable": true },
                { "bSortable": true },
                { "bSortable": true },
                { "bSortable": true },
                { "bSortable": true },
                { "bSortable": true },
                { "bSortable": true },
                { "bSortable": true },
                { "bVisible": true },
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
        $('#operation_form').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });

        $('#tax_charge').multiselect({
            nonSelectedText: 'Select Tax',
            includeSelectAllOption: true,
            selectAllText: 'Select all'
        });

        $('.timepicker').timepicki({
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
        $('#operation_date').datepicker({
            startDate: date,
            autoclose: true
        });

        $('#doctor').multiselect({
            nonSelectedText: 'Select Doctor',
            includeSelectAllOption: true,
            selectAllText: 'Select all'
        });


        $(".doctor_submit").click(function() {
            checked = $(".multiselect_validation_doctor .dropdown-menu input:checked").length;
            if (!checked) {
                alert("Please select atleast one doctor");
                return false;
            }
        });
    });
</script>
<!-- POP up code -->
<div class="popup-bg">
    <div class="overlay-content overlay_content_css">
        <div class="modal-content">
            <div class="category_list">
            </div>
        </div>
    </div>
</div>
<!-- End POP-UP Code -->
<div class="panel-body panel-white">
<!-- START PANEL BODY DIV-->
<ul class="nav nav-tabs panel_tabs" role="tablist">
    <li class="active">
        <a href="OperationList.aspx">
            <i class="fa fa-align-justify"></i>Operation List
        </a>

    </li>
    <li class="">
        <a href="AddOperationList.aspx" class="tab ">
            <i class="fa fa-plus-circle"></i>Add Operation
        </a>

    </li>
</ul>
<div class="tab-content">
<!-- START TAB CONTENT DIV-->
<div class="tab-pane fade active in" id="eventlist">
<!-- START TAB PANE DIV-->

<div class="panel-body">
<!-- START PANEL BODY DIV-->
<div class="table-responsive">
<!-- START TABLE RESPONSIVE DIV-->
<table id="hmgt_operation" class="display dataTable " cellspacing="0" width="100%">
<!-- START OPERATION LIST TABLE-->
<thead>
<tr>
    <th>Operation Name</th>
    <th>Patient</th>
    <th>Surgeon</th>
    <th>Date</th>
    <th>Operation Charge (<span>&#36;</span>)</th>
    <th>Tax Amount (<span>&#36;</span>)</th>
    <th>Total Operation Charge (<span>&#36;</span>)</th>
    <th>Operation Status</th>
    <th>Out Come Status</th>
    <th>Action</th>
</tr>
</thead>
<tfoot>
<tr>
    <th>Operation Name</th>
    <th>Patient</th>
    <th>Surgeon</th>
    <th>Date</th>
    <th>Operation Charge (<span>&#36;</span>)</th>
    <th>Tax Amount (<span>&#36;</span>)</th>
    <th>Total Operation Charge (<span>&#36;</span>)</th>
    <th>Operation Status</th>
    <th>Out Come Status</th>
    <th>Action</th>
</tr>
</tfoot>
<tbody>
<tr>
    <td class="operation_name">Brain Surgery</td>
    <td class="patient">Anna Sanz(P50319)</td>
    <td class="surgen">
        Fernando Therrien
    </td>
    <td class="date">2019-03-26</td>
    <td class="">50000.00</td>
    <td class="">8500.00</td>
    <td class="">58500.00</td>
    <td class="">Completed</td>
    <td class="">Success</td>
    <td class="action">
        <a href="?dashboard=user&page=operation&tab=addoperation&action=edit&ot_id=MQ==" class="btn btn-info">Edit</a>

    </td>
</tr>
<tr>
    <td class="operation_name">Cancer Surgery</td>
    <td class="patient">Lucas M(P60319)</td>
    <td class="surgen">
        Fernando Therrien
    </td>
    <td class="date">2019-03-27</td>
    <td class="">100000.00</td>
    <td class="">17000.00</td>
    <td class="">117000.00</td>
    <td class="">Scheduled</td>
    <td class="">-</td>
    <td class="action">
        <a href="?dashboard=user&page=operation&tab=addoperation&action=edit&ot_id=Mg==" class="btn btn-info">Edit</a>

    </td>
</tr>
<tr>
    <td class="operation_name">Brain Surgery</td>
    <td class="patient">Anna Sanz(P50319)</td>
    <td class="surgen">
        Fernando Therrien
    </td>
    <td class="date">2019-05-08</td>
    <td class="">50000.00</td>
    <td class="">8500.00</td>
    <td class="">58500.00</td>
    <td class="">Scheduled</td>
    <td class="">-</td>
    <td class="action">
        <a href="?dashboard=user&page=operation&tab=addoperation&action=edit&ot_id=Mw==" class="btn btn-info">Edit</a>

    </td>
</tr>
<tr>
    <td class="operation_name">Brain Surgery</td>
    <td class="patient">Nina Cadela(P160419)</td>
    <td class="surgen">
        Fernando Therrien
    </td>
    <td class="date">2019-05-13</td>
    <td class="">50000.00</td>
    <td class="">8500.00</td>
    <td class="">58500.00</td>
    <td class="">Completed</td>
    <td class="">Success</td>
    <td class="action">
        <a href="?dashboard=user&page=operation&tab=addoperation&action=edit&ot_id=NA==" class="btn btn-info">Edit</a>

    </td>
</tr>
<tr>
    <td class="operation_name">Brain Surgery</td>
    <td class="patient">aaannnnn bbb(P500519)</td>
    <td class="surgen">
        Fernando Therrien
    </td>
    <td class="date">2019-05-30</td>
    <td class="">50000.00</td>
    <td class="">8500.00</td>
    <td class="">58500.00</td>
    <td class="">Completed</td>
    <td class="">Success</td>
    <td class="action">
        <a href="?dashboard=user&page=operation&tab=addoperation&action=edit&ot_id=NQ==" class="btn btn-info">Edit</a>

    </td>
</tr>
<tr>
    <td class="operation_name">asssss</td>
    <td class="patient">gab girbaci(P300419)</td>
    <td class="surgen">
        Fernando Therrien
    </td>
    <td class="date">2019-06-20</td>
    <td class="">5000.00</td>
    <td class="">450.00</td>
    <td class="">5450.00</td>
    <td class="">Completed</td>
    <td class="">Success</td>
    <td class="action">
        <a href="?dashboard=user&page=operation&tab=addoperation&action=edit&ot_id=Ng==" class="btn btn-info">Edit</a>

    </td>
</tr>
<tr>
    <td class="operation_name">Brain Surgery</td>
    <td class="patient">Nina Cadela(P160419)</td>
    <td class="surgen">
        Fernando Therrien
    </td>
    <td class="date">2019-07-29</td>
    <td class="">50000.00</td>
    <td class="">8500.00</td>
    <td class="">58500.00</td>
    <td class="">Inprogress</td>
    <td class="">-</td>
    <td class="action">
        <a href="?dashboard=user&page=operation&tab=addoperation&action=edit&ot_id=Nw==" class="btn btn-info">Edit</a>

    </td>
</tr>
<tr>
    <td class="operation_name">Cancer Surgery</td>
    <td class="patient">Nina Cadela(P160419)</td>
    <td class="surgen">
        Fernando Therrien
    </td>
    <td class="date">2019-07-23</td>
    <td class="">100000.00</td>
    <td class="">17000.00</td>
    <td class="">117000.00</td>
    <td class="">Scheduled</td>
    <td class="">-</td>
    <td class="action">
        <a href="?dashboard=user&page=operation&tab=addoperation&action=edit&ot_id=OA==" class="btn btn-info">Edit</a>

    </td>
</tr>
<tr>
    <td class="operation_name">Implantes</td>
    <td class="patient">David Urrego(P900819)</td>
    <td class="surgen">
        Fernando Therrien
    </td>
    <td class="date">2019-08-12</td>
    <td class="">800000.00</td>
    <td class="">0.00</td>
    <td class="">800000.00</td>
    <td class="">Completed</td>
    <td class="">Success</td>
    <td class="action">
        <a href="?dashboard=user&page=operation&tab=addoperation&action=edit&ot_id=OQ==" class="btn btn-info">Edit</a>

    </td>
</tr>
<tr>
    <td class="operation_name">Brain Surgery</td>
    <td class="patient">king hytrd(P190419)</td>
    <td class="surgen">
        Fernando Therrien
    </td>
    <td class="date">2019-08-22</td>
    <td class="">50000.00</td>
    <td class="">8500.00</td>
    <td class="">58500.00</td>
    <td class="">Inprogress</td>
    <td class="">-</td>
    <td class="action">
        <a href="?dashboard=user&page=operation&tab=addoperation&action=edit&ot_id=MTA=" class="btn btn-info">Edit</a>

    </td>
</tr>
</tbody>
</table>
<!-- END Operation LIST TABLE-->
</div>
<!-- END TABLE RESPONSIVE DIV-->
</div>
<!-- END PANEL BODY DIV-->
</div>
<!-- END TAB CONTENT DIV-->
</div>
<!-- END TAB CONTENT DIV-->
</div>
<!-- END PANEL BODY DIV-->
</div>
</div>

</asp:Content>