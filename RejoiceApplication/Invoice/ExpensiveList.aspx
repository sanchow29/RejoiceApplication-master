<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExpensiveList.aspx.cs" Inherits="RejoiceApplication.Invoice.ExpensiveList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-inner" style="min-height: 1050px;">
        <!-- start page inner div-->
        <div class="row right_side invoice">
            <!-- start dashboard content div-->
            <noscript>
                <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
            </noscript>

            <script type="text/javascript">
                jQuery(document).ready(function ($) {
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
                select {
                    padding: 6px;
                }
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

                    <li class="">
                        <a href="IncomeList.aspx" class="tab ">
                            <i class="fa fa-align-justify"></i>Income List
                        </a>
                       
                    </li>

                    <li class=""></li>

                    <li class="active">
                        <a href="ExpensiveList.aspx" class="tab active">
                            <i class="fa fa-align-justify"></i>Expense List
                        </a>
                        </a>
                    </li>

                    <li class=""></li>
                </ul>
                <script type="text/javascript">
                    jQuery(document).ready(function () {
                        jQuery('#tblexpence').DataTable({
                            "responsive": true,
                            "order": [[2, "Desc"]],
                            "aoColumns": [
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
                    <!-- START PANEL BODY DIV -->
                    <div class="table-responsive">
                        <!-- START TABLE REPONSIVE DIV -->
                        <table id="tblexpence" class="display dataTable" cellspacing="0" width="100%">
                            <!-- START EXPENSE LIST TABLE-->
                            <thead>
                                <tr>
                                    <th>Supplier Name</th>
                                    <th>Amount (<span>&#36;</span>)</th>
                                    <th>Date</th>
                                    <th>Action</th>
                                </tr>
                            </thead>

                            <tfoot>
                                <tr>
                                    <th>Supplier Name</th>
                                    <th>Amount (<span>&#36;</span>)</th>
                                    <th>Date</th>
                                    <th>Action</th>
                                </tr>
                            </tfoot>

                            <tbody></tbody>

                        </table>
                        <!-- END Expense LIST TABLE-->
                    </div>
                    <!-- END TABLE RESPONSIVE DIV -->
                </div>
                <!-- END PANEL BODY DIV -->
            </div>
            <!-- END PANEL BODY DIV -->
        </div>
        <!-- END TAB CONTENT DIV -->
    </div>

</asp:Content>
