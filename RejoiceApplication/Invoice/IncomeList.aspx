<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IncomeList.aspx.cs" Inherits="RejoiceApplication.Invoice.IncomeList" %>

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
                    <li class="">
                        <a href="Invoice.aspx" class="tab ">
                            <i class="fa fa-align-justify"></i>Invoice List
                        </a>

                    </li>
                    <li class=""></li>

                    <li class="active">
                        <a href="IncomeList.aspx" class="tab active">
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
                        jQuery('#tblincome').DataTable({
                            "responsive": true,
                            "order": [[3, "Desc"]],
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
                <div class="panel-body">
                    <!-- START PANEL BODY DIV -->
                    <div class="table-responsive">
                        <!-- START TABLE REPONSIVE DIV -->
                        <table id="tblincome" class="display dataTable" cellspacing="0" width="100%">
                            <!-- START Income LIST TABLE-->
                            <thead>
                            <tr>
                                <th>Invoice ID</th>
                                <th>Patient Id</th>
                                <th>Patient Name</th>
                                <th>Amount (<span>&#36;</span>)</th>
                                <th>Date</th>
                                <th>Payment Method</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th>Invoice ID</th>
                                <th>Patient Id</th>
                                <th>Patient Name</th>
                                <th>Amount (<span>&#36;</span>)</th>
                                <th>Date</th>
                                <th>Payment Method</th>
                                <th>Action</th>
                            </tr>
                            </tfoot>
                            <tbody>
                            <tr>
                                <td class="">-</td>
                                <td class="patient">P50319</td>
                                <td class="patient_name">Anna Sanz</td>
                                <td class="income_amount">250000</td>
                                <td class="status">2019-03-16</td>
                                <td class="">Cash</td>
                                <td class="action">
                                    <a href="#" class="show-invoice-popup btn btn-default" idtest="1" invoice_type="income">
                                        <i class="fa fa-eye"></i>View Income
                                    </a>

                                </td>
                            </tr>
                            <tr>
                                <td class="">-</td>
                                <td class="patient">P60319</td>
                                <td class="patient_name">Lucas M</td>
                                <td class="income_amount">10000</td>
                                <td class="status">2019-03-16</td>
                                <td class="">Cheque</td>
                                <td class="action">
                                    <a href="#" class="show-invoice-popup btn btn-default" idtest="2" invoice_type="income">
                                        <i class="fa fa-eye"></i>View Income
                                    </a>

                                </td>
                            </tr>
                            <tr>
                                <td class="">-</td>
                                <td class="patient">P50319</td>
                                <td class="patient_name">Anna Sanz</td>
                                <td class="income_amount">123</td>
                                <td class="status">2019-04-17</td>
                                <td class="">Credit Card Or Debit Card</td>
                                <td class="action">
                                    <a href="#" class="show-invoice-popup btn btn-default" idtest="10" invoice_type="income">
                                        <i class="fa fa-eye"></i>View Income
                                    </a>

                                </td>
                            </tr>
                            <tr>
                                <td class="">1905106</td>
                                <td class="patient">P80319</td>
                                <td class="patient_name">Vivekanand Adkatalwar</td>
                                <td class="income_amount">9276</td>
                                <td class="status">2019-05-21</td>
                                <td class="">Cash</td>
                                <td class="action">
                                    <a href="#" class="show-invoice-popup btn btn-default" idtest="15" invoice_type="income">
                                        <i class="fa fa-eye"></i>View Income
                                    </a>

                                </td>
                            </tr>
                            <tr>
                                <td class="">-</td>
                                <td class="patient">P500519</td>
                                <td class="patient_name">aaannnnn bbb</td>
                                <td class="income_amount">7996.31</td>
                                <td class="status">2019-07-12</td>
                                <td class="">Cash</td>
                                <td class="action">
                                    <a href="#" class="show-invoice-popup btn btn-default" idtest="26" invoice_type="income">
                                        <i class="fa fa-eye"></i>View Income
                                    </a>

                                </td>
                            </tr>
                            <tr>
                                <td class="">-</td>
                                <td class="patient">P530519</td>
                                <td class="patient_name">Kartik Bhatt</td>
                                <td class="income_amount">3000</td>
                                <td class="status">2019-08-17</td>
                                <td class="">Cash</td>
                                <td class="action">
                                    <a href="#" class="show-invoice-popup btn btn-default" idtest="28" invoice_type="income">
                                        <i class="fa fa-eye"></i>View Income
                                    </a>

                                </td>
                            </tr>

                            </tbody>
                        </table>
                        <!-- END INCOME LIST TABLE -->
                    </div>
                    <!-- EMD TABLE REPONSIVE DIV -->
                </div>
                <!-- END PANEL BODY DIV -->
            </div>
            <!-- END PANEL BODY DIV -->
        </div>
        <!-- END TAB CONTENT DIV -->
    </div>

</asp:Content>