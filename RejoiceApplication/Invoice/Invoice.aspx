<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="RejoiceApplication.Invoice.Invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="page-inner" style="min-height: 1050px;">
<!-- start page inner div-->
<div class="row right_side invoice">
<!-- start dashboard content div-->
<noscript>
    <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
</noscript>

<script type="text/javascript">
    jQuery(document).ready(function($) {
        $('#invoice_form').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });
        $('#income_form').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });
        $('#expense_form').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });

        $.fn.datepicker.defaults.format = " yyyy-mm-dd";
        $('#invoice_date').datepicker({
            autoclose: true
        });
    });
</script>

<style>
    select { padding: 6px; }
</style>
<!-- START POP up code -->
<div class="popup-bg">
    <div class="overlay-content">
        <div class="modal-content">
            <div class="invoice_data">
            </div>

        </div>
    </div>

</div>
<!-- End POP-UP Code -->
<div class="panel-body panel-white">
<!-- START PANEL BODY DIV -->
<ul class="nav nav-tabs panel_tabs" role="tablist">
    <li class="active">
        <a href="Invoice.aspx" class="tab active">
            <i class="fa fa-align-justify"></i>Invoice List
        </a>

    </li>
    <li class=""></li>

    <li class="">
        <a href="IncomeList.aspx" class="tab ">
            <i class="fa fa-align-justify"></i>Income List
        </a>

    </li>

    <li class=""></li>

    <li class="">
        <a href="ExpensiveList.aspx" class="tab ">
            <i class="fa fa-align-justify"></i>Expense List
        </a>

    </li>

    <li class=""></li>
</ul>
<script type="text/javascript">
    jQuery(document).ready(function($) {
        jQuery('#tblinvoice').DataTable({
            "responsive": true,
            "order": [[6, "Desc"]],
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
    <!-- START TABLE CONTENT DIV -->

    <div class="panel-body">
        <!-- START PANEL BODY DIV -->
        <div class="table-responsive">
            <!-- START TABLE RESPONSIVE DIV -->
            <table id="tblinvoice" class="display dataTable" cellspacing="0" width="100%">
                <!-- START INVOICE LIST TABLE-->
                <thead>
                <tr>
                    <th>Invoice ID</th>
                    <th>Title</th>
                    <th>Patient</th>
                    <th>Total Amount (<span>&#36;</span>)</th>
                    <th>Adjustment Amount (<span>&#36;</span>)</th>
                    <th>Paid Amount (<span>&#36;</span>)</th>
                    <th>due Amount (<span>&#36;</span>)</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                </thead>

                <tfoot>
                <tr>
                    <th>Invoice ID</th>
                    <th>Title</th>
                    <th>Patient</th>
                    <th>Total Amount (<span>&#36;</span>)</th>
                    <th>Adjustment Amount (<span>&#36;</span>)</th>
                    <th>Paid Amount (<span>&#36;</span>)</th>
                    <th>Due Amount (<span>&#36;</span>)</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                </tfoot>

                <tbody>
                <tr>
                    <td class="title">1903161</td>
                    <td class="title">
                        <a href="?dashboard=user&page=invoice&tab=addinvoice&action=edit&invoice_id=1">ashish invoice</a>
                    </td>
                    <td class="patient">P20319</td>
                    <td class="">29250.00</td>
                    <td class="adjustment_amount">0.25</td>
                    <td class="">0.00</td>
                    <td class="">29249.75</td>
                    <td class="email">Unpaid</td>

                    <td class="action">
                        <a href="#" class="show-invoice-popup btn btn-default" idtest="1" invoice_type="invoice">
                            <i class="fa fa-eye"></i>View Invoice
                        </a>

                        <a href="?dashboard=user&page=invoice&tab=addincome&patient_id=4&due_amount=29249.75&invoice_id=1" class="btn btn-success margin_bottom_5px">Add Income </a>

                    </td>
                </tr>
                <tr>
                    <td class="title">1903162</td>
                    <td class="title">
                        <a href="?dashboard=user&page=invoice&tab=addinvoice&action=edit&invoice_id=2">anna invoice</a>
                    </td>
                    <td class="patient">P50319</td>
                    <td class="">241308.00</td>
                    <td class="adjustment_amount">500.00</td>
                    <td class="">0.00</td>
                    <td class="">240808.00</td>
                    <td class="email">Unpaid</td>

                    <td class="action">
                        <a href="#" class="show-invoice-popup btn btn-default" idtest="2" invoice_type="invoice">
                            <i class="fa fa-eye"></i>View Invoice
                        </a>

                        <a href="?dashboard=user&page=invoice&tab=addincome&patient_id=7&due_amount=240808.00&invoice_id=2" class="btn btn-success margin_bottom_5px">Add Income </a>

                    </td>
                </tr>
                <tr>
                    <td class="title">19062712</td>
                    <td class="title">
                        <a href="?dashboard=user&page=invoice&tab=addinvoice&action=edit&invoice_id=12">Zeeshan Asghar Consultation</a>
                    </td>
                    <td class="patient">P580619</td>
                    <td class="">11400.00</td>
                    <td class="adjustment_amount">0.00</td>
                    <td class="">0.00</td>
                    <td class="">11400.00</td>
                    <td class="email">Unpaid</td>

                    <td class="action">
                        <a href="#" class="show-invoice-popup btn btn-default" idtest="12" invoice_type="invoice">
                            <i class="fa fa-eye"></i>View Invoice
                        </a>

                        <a href="?dashboard=user&page=invoice&tab=addincome&patient_id=78&due_amount=11400.00&invoice_id=12" class="btn btn-success margin_bottom_5px">Add Income </a>

                    </td>
                </tr>
                <tr>
                    <td class="title">19071213</td>
                    <td class="title">
                        <a href="?dashboard=user&page=invoice&tab=addinvoice&action=edit&invoice_id=13"></a>
                    </td>
                    <td class="patient">P500519</td>
                    <td class="">88851.31</td>
                    <td class="adjustment_amount">88852.00</td>
                    <td class="">0.00</td>
                    <td class="">-0.69</td>
                    <td class="email">Unpaid</td>

                    <td class="action">
                        <a href="#" class="show-invoice-popup btn btn-default" idtest="13" invoice_type="invoice">
                            <i class="fa fa-eye"></i>View Invoice
                        </a>

                        <a href="?dashboard=user&page=invoice&tab=addincome&patient_id=70&due_amount=-0.69&invoice_id=13" class="btn btn-success margin_bottom_5px">Add Income </a>

                    </td>
                </tr>
                <tr>
                    <td class="title">19080217</td>
                    <td class="title">
                        <a href="?dashboard=user&page=invoice&tab=addinvoice&action=edit&invoice_id=17">Blood Bath</a>
                    </td>
                    <td class="patient">P20319</td>
                    <td class="">210.00</td>
                    <td class="adjustment_amount">0.00</td>
                    <td class="">0.00</td>
                    <td class="">210.00</td>
                    <td class="email">Unpaid</td>

                    <td class="action">
                        <a href="#" class="show-invoice-popup btn btn-default" idtest="17" invoice_type="invoice">
                            <i class="fa fa-eye"></i>View Invoice
                        </a>

                        <a href="?dashboard=user&page=invoice&tab=addincome&patient_id=4&due_amount=210.00&invoice_id=17" class="btn btn-success margin_bottom_5px">Add Income </a>

                    </td>
                </tr>
                <tr>
                    <td class="title">19081718</td>
                    <td class="title">
                        <a href="?dashboard=user&page=invoice&tab=addinvoice&action=edit&invoice_id=18"></a>
                    </td>
                    <td class="patient">P530519</td>
                    <td class="">44850.20</td>
                    <td class="adjustment_amount">0.00</td>
                    <td class="">0.00</td>
                    <td class="">44850.20</td>
                    <td class="email">Unpaid</td>

                    <td class="action">
                        <a href="#" class="show-invoice-popup btn btn-default" idtest="18" invoice_type="invoice">
                            <i class="fa fa-eye"></i>View Invoice
                        </a>

                        <a href="?dashboard=user&page=invoice&tab=addincome&patient_id=73&due_amount=44850.20&invoice_id=18" class="btn btn-success margin_bottom_5px">Add Income </a>

                    </td>
                </tr>

                </tbody>

            </table>
            <!-- END Invoice LIST TABLE -->
        </div>
        <!-- END TABLE REPONSIVE DIV -->
    </div>
    <!-- END PANEL BODY DIV -->
</div>
<!-- END PANEL BODY DIV -->
</div>
<!-- END TAB CONTENT DIV -->
</div>
</div>

</asp:Content>