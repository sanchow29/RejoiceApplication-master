<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddTreatment.aspx.cs" Inherits="RejoiceApplication.Treatment.AddTreatment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-inner" style="min-height: 1050px;">
        <!-- start page inner div-->
        <div class="row right_side treatment">
            <!-- start dashboard content div-->
            <noscript>
                <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
            </noscript>
            <script type="text/javascript">
                jQuery(document).ready(function ($) {
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
                            { "bSortable": false }],
                        language: { "sEmptyTable": "No data available in table", "sInfo": "Showing _START_ to _END_ of _TOTAL_ entries", "sInfoEmpty": "Showing 0 to 0 of 0 entries", "sInfoFiltered": "(filtered from _MAX_ total entries)", "sInfoPostFix": "", "sInfoThousands": ",", "sLengthMenu": "Show _MENU_ entries", "sLoadingRecords": "Loading...", "sProcessing": "Processing...", "sSearch": "Search:", "sZeroRecords": "No matching records found", "oPaginate": { "sFirst": "First", "sLast": "Last", "sNext": "Next", "sPrevious": "Previous" }, "oAria": { "sSortAscending": ": activate to sort column ascending", "sSortDescending": ": activate to sort column descending" } }
                    });
                });
            </script>

            <div class="panel-body panel-white">
                <!-- START PANEL BODY DIV-->
                <ul class="nav nav-tabs panel_tabs" role="tablist">
                    <li class="">
                        <a href="Treatment.aspx">
                            <i class="fa fa-align-justify"></i>Treatment List
                        </a>

                    </li>
                    <li class="active">
                        <a href="AddTreatment.aspx" class="tab active">
                            <i class="fa fa-plus-circle"></i>Add Treatment
                        </a>

                    </li>

                </ul>
                <div class="tab-content">
                    <!-- START TAB CONTENT DIV-->

                    <div class="panel-body">
                        <!-- START PANEL BODY DIV-->
                        <form name="treatment_form" action="" method="post" class="form-horizontal" id="treatment_form">
                            <!-- START Treatment FORM-->
                            <input type="hidden" name="action" value="insert">
                            <input type="hidden" name="treatment_id" value="" />

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="med_category_name">Treatment Name<span class="require-field">*</span></label>
                                <div class="col-sm-6">
                                    <input id="treatment_name" class="form-control validate[required,custom[popup_category_validation]] text-input" maxlength="50" type="text"
                                        value="" name="treatment_name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="treatment_price">Treatment Price (&#36;)</label>
                                <div class="col-sm-6">
                                    <input id="treatment_price" class="form-control " min="0" type="number" onkeypress="if(this.value.length==10) return false;" step="0.01" value="" name="treatment_price">
                                </div>
                            </div>
                            <input type="hidden" id="_wpnonce" name="_wpnonce" value="dfe6d9429e" /><input type="hidden" name="_wp_http_referer" value="/mojoomla/extend/wordpress/hospital/?dashboard=user&amp;page=treatment&amp;tab=addtreatment&amp;action=insert" />
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="visiting_fees">Tax</label>
                                <div class="col-sm-2">
                                    <select class="form-control" id="tax_charge" name="tax[]" multiple="multiple">
                                        <option value="1">GST-9</option>
                                        <option value="2">SGST-8</option>
                                        <option value="3">VAT-5</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-sm-offset-2 col-sm-8">
                                <input type="submit" value="Save" name="save_treatment" class="btn btn-success" />
                                <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-success" />
                            </div>
                        </form>
                        <!-- END Treatment FORM-->
                    </div>
                    <!-- END PANEL BODY DIV-->
                </div>
                <!-- END TAB CONTENT DIV-->
            </div>
            <!-- END PANEL BODY DIV-->
        </div>
    </div>

</asp:Content>
