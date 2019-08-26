<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Treatment.aspx.cs" Inherits="RejoiceApplication.Treatment.Treatment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="page-inner" style="min-height: 1050px;">
<!-- start page inner div-->
<div class="row right_side treatment">
<!-- start dashboard content div-->
<noscript>
    <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
</noscript>
<script type="text/javascript">
    jQuery(document).ready(function($) {
        $('#treatment_form').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });
        $('#tax_charge').multiselect({
            nonSelectedText: 'Select Tax',
            includeSelectAllOption: true,
            selectAllText: 'Select all'
        });
        jQuery('#hmgt_treatment').DataTable({
            "responsive": true,
            "aoColumns": [
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

<div class="panel-body panel-white">
<!-- START PANEL BODY DIV-->
<ul class="nav nav-tabs panel_tabs" role="tablist">
    <li class="active">
        <a href="Treatment.aspx">
            <i class="fa fa-align-justify"></i>Treatment List
        </a>

    </li>
    <li class="">
        <a href="AddTreatment.aspx" class="tab ">
            <i class="fa fa-plus-circle"></i>Add Treatment
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
                <!-- START TABLE ReSPONSIVE DIV-->
                <table id="hmgt_treatment" class="display dataTable " cellspacing="0" width="100%">
                    <!-- START Treatment LIST TABLE-->
                    <thead>
                    <tr>
                        <th>Treatment Name</th>
                        <th>Price (<span>&#36;</span>)</th>
                        <th>Tax</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>Treatment Name</th>
                        <th>Price (<span>&#36;</span>)</th>
                        <th>Tax</th>
                        <th>Action</th>
                    </tr>
                    </tfoot>

                    <tbody>
                    <tr>
                        <td class="treatment_name">Ankle Surgery</td>
                        <td class="treatment_price">25000</td>
                        <td class="tax">SGST-8,VAT-5</td>
                        <td class="action">

                            <a href="?dashboard=user&page=treatment&tab=addtreatment&action=edit&treatment_id=MQ==" class="btn btn-info">
                                Edit
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="treatment_name">test</td>
                        <td class="treatment_price">10000</td>
                        <td class="tax">GST-9,VAT-5</td>
                        <td class="action">

                            <a href="?dashboard=user&page=treatment&tab=addtreatment&action=edit&treatment_id=Nw==" class="btn btn-info">
                                Edit
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="treatment_name">EXODONTIA</td>
                        <td class="treatment_price">190</td>
                        <td class="tax">GST-9,SGST-8,VAT-5</td>
                        <td class="action">

                            <a href="?dashboard=user&page=treatment&tab=addtreatment&action=edit&treatment_id=OA==" class="btn btn-info">
                                Edit
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="treatment_name">kabsool</td>
                        <td class="treatment_price">1.2</td>
                        <td class="tax">GST-9</td>
                        <td class="action">

                            <a href="?dashboard=user&page=treatment&tab=addtreatment&action=edit&treatment_id=OQ==" class="btn btn-info">
                                Edit
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="treatment_name">reegerg</td>
                        <td class="treatment_price">343</td>
                        <td class="tax">SGST-8,VAT-5</td>
                        <td class="action">

                            <a href="?dashboard=user&page=treatment&tab=addtreatment&action=edit&treatment_id=MTA=" class="btn btn-info">
                                Edit
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="treatment_name">asdasd</td>
                        <td class="treatment_price">123</td>
                        <td class="tax">GST-9</td>
                        <td class="action">

                            <a href="?dashboard=user&page=treatment&tab=addtreatment&action=edit&treatment_id=MTE=" class="btn btn-info">
                                Edit
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="treatment_name">dkjfhsdghfsjkdhfks</td>
                        <td class="treatment_price">50</td>
                        <td class="tax">-</td>
                        <td class="action">

                            <a href="?dashboard=user&page=treatment&tab=addtreatment&action=edit&treatment_id=MTI=" class="btn btn-info">
                                Edit
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="treatment_name">hyperbaric </td>
                        <td class="treatment_price">0</td>
                        <td class="tax">GST-9</td>
                        <td class="action">

                            <a href="?dashboard=user&page=treatment&tab=addtreatment&action=edit&treatment_id=MTM=" class="btn btn-info">
                                Edit
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="treatment_name">3 sesiiones 123</td>
                        <td class="treatment_price">200000</td>
                        <td class="tax">GST-9,VAT-5</td>
                        <td class="action">

                            <a href="?dashboard=user&page=treatment&tab=addtreatment&action=edit&treatment_id=MTQ=" class="btn btn-info">
                                Edit
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="treatment_name">qwerty</td>
                        <td class="treatment_price">121</td>
                        <td class="tax">GST-9,SGST-8,VAT-5</td>
                        <td class="action">

                            <a href="?dashboard=user&page=treatment&tab=addtreatment&action=edit&treatment_id=MTU=" class="btn btn-info">
                                Edit
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="treatment_name">qwerty</td>
                        <td class="treatment_price">12121</td>
                        <td class="tax">GST-9,SGST-8,VAT-5</td>
                        <td class="action">

                            <a href="?dashboard=user&page=treatment&tab=addtreatment&action=edit&treatment_id=MTY=" class="btn btn-info">
                                Edit
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="treatment_name">defribillation</td>
                        <td class="treatment_price">0</td>
                        <td class="tax">-</td>
                        <td class="action">

                            <a href="?dashboard=user&page=treatment&tab=addtreatment&action=edit&treatment_id=MTc=" class="btn btn-info">
                                Edit
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="treatment_name">Ortodoncia</td>
                        <td class="treatment_price">200000</td>
                        <td class="tax">-</td>
                        <td class="action">

                            <a href="?dashboard=user&page=treatment&tab=addtreatment&action=edit&treatment_id=MTg=" class="btn btn-info">
                                Edit
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="treatment_name">Exodoncia</td>
                        <td class="treatment_price">250000</td>
                        <td class="tax">-</td>
                        <td class="action">

                            <a href="?dashboard=user&page=treatment&tab=addtreatment&action=edit&treatment_id=MTk=" class="btn btn-info">
                                Edit
                            </a>
                        </td>
                    </tr>

                    </tbody>
                </table>
                <!-- END Treatment LIST TABLE-->
            </div>
            <!-- END TABLE ReSPONSIVE DIV-->
        </div>
        <!-- END PANEL BODY DIV-->
    </div>
    <!-- END TAB PANE DIV-->
</div>
<!-- END TAB CONTENT DIV-->
</div>
<!-- END PANEL BODY DIV-->
</div>
</div>

</asp:Content>