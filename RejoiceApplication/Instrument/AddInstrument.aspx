<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddInstrument.aspx.cs" Inherits="RejoiceApplication.Instrument.AddInstrument" %>

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

                    <li class="active">

                        <a href="AddInstrument.aspx" class="tab active">
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
                <script>
                    $(document).ready(function () {
                        $('#instrument_form').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });
                        $('#tax_charge').multiselect({
                            nonSelectedText: 'Select Tax',
                            includeSelectAllOption: true,
                            selectAllText: 'Select all'
                        });
                    });
                </script>
                <div class="panel-body">
                    <!--START PANEL BODY DIV-->
                    <form name="bed_form" action="" method="post" class="form-horizontal" id="instrument_form">
                        <!--START INSTRUMENT FORM-->
                        <input type="hidden" name="action" value="insert">
                        <input type="hidden" name="instrument_id" value="" />
                        <div class="col-sm-6" style="min-height: 400px;">
                            <fieldset>
                                <legend>Instrument Info:</legend>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="instrument_code">Instrument Code<span class="require-field">*</span></label>
                                    <div class="col-sm-9">
                                        <input id="instrument_code" class="form-control validate[required] text-input" min="0" type="number" onkeypress="if(this.value.length==8) return false;"
                                            value="" name="instrument_code">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="instrument_name">Instrument Name<span class="require-field">*</span></label>
                                    <div class="col-sm-9">
                                        <input id="instrument_name" class="form-control validate[required,custom[popup_category_validation]]" type="text" maxlength="50"
                                            value="" name="instrument_name">
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="charge_type">Charges Type<span class="require-field">*</span></label>
                                    <div class="col-sm-9">
                                        <label class="radio-inline">
                                            <input type="radio" value="Daily" class="tog validate[required]" name="charge_type" checked='checked' />Daily
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" value="Hourly" class="tog validate[required]" name="charge_type" />Hourly
                                        </label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="instrument_charge">Instrument charge (&#36;)<span class="require-field">*</span></label>
                                    <div class="col-sm-9">
                                        <input id="instrument_charge" class="form-control validate[required] " min="0" type="number" onkeypress="if(this.value.length==8) return false;" step="0.01"
                                            value="" name="instrument_charge">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="">Tax</label>
                                    <div class="col-sm-9">
                                        <select class="form-control" id="tax_charge" name="tax[]" multiple="multiple">
                                            <option value="1">GST-9</option>
                                            <option value="2">SGST-8</option>
                                            <option value="3">VAT-5</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="instrument_description">Description</label>
                                    <div class="col-sm-9">
                                        <textarea id="instrument_description" class="form-control validate[custom[address_description_validation]]" maxlength="150" name="instrument_description"></textarea>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                        <div class="col-sm-6" style="min-height: 400px;">
                            <fieldset>
                                <legend>Firm Info:</legend>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="code">Code</label>
                                    <div class="col-sm-10">
                                        <input id="code" class="form-control text-input" min="0" type="number" onkeypress="if(this.value.length==8) return false;"
                                            value="" name="code">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="name">Name</label>
                                    <div class="col-sm-10">
                                        <input id="name" class="form-control text-input  validate[custom[popup_category_validation]]" type="text" maxlength="30"
                                            value="" name="name">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="address">Address</label>
                                    <div class="col-sm-10">
                                        <textarea id="address" class="form-control validate[custom[address_description_validation]]" maxlength="150" name="address" cols="29"></textarea>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="contact">Contact</label>
                                    <div class="col-sm-10">
                                        <input id="contact" class="form-control validate[custom[phone_number]] text-input" minlength="6" maxlength="15" type="text" value="" name="contact">
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                        <div class="col-sm-6" style="min-height: 350px;">
                            <fieldset>
                                <legend>Asset Info:</legend>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="description">Description</label>
                                    <div class="col-sm-10">
                                        <textarea name="description" maxlength="150" class="form-control validate[custom[address_description_validation]]"></textarea>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="quantity">Quantity</label>
                                    <div class="col-sm-10">
                                        <input id="quantity" class="form-control  text-input" min="0" type="number" onkeypress="if(this.value.length==4) return false;"
                                            value="" name="quantity">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="price">Price (&#36;)</label>
                                    <div class="col-sm-10">
                                        <input id="price" class="form-control  text-input" min="0" type="number" onkeypress="if(this.value.length==8) return false;" step="0.01"
                                            value="" name="price">
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="class">Class</label>
                                    <div class="col-sm-10">
                                        <input id="class" class="form-control  text-input validate[custom[popup_category_validation]]" type="text" maxlength="30"
                                            value="" name="class">
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                        <input type="hidden" id="_wpnonce" name="_wpnonce" value="752d857fb3" /><input type="hidden" name="_wp_http_referer" value="/mojoomla/extend/wordpress/hospital/?dashboard=user&amp;page=instrument&amp;tab=addinstrument&amp;action=insert" />
                        <div class="col-sm-6" style="min-height: 350px;">
                            <fieldset>
                                <legend>Invoice Info:</legend>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="serial">Serial</label>
                                    <div class="col-sm-10">
                                        <input id="serial" class="form-control  text-input" type="number" min="0" onkeypress="if(this.value.length==6) return false;" value="" name="serial">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="acquire">Acquire</label>
                                    <div class="col-sm-10">
                                        <input id="acquire" class="form-control  text-input" min="0" type="number" onkeypress="if(this.value.length==6) return false;" value="" name="acquire">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="asset_id">Asset ID</label>
                                    <div class="col-sm-10">
                                        <input id="asset_id" class="form-control  text-input" min="0" type="number" onkeypress="if(this.value.length==6) return false;" value="" name="asset_id">
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                        <div class="col-sm-offset-2 col-sm-8">
                            <input type="submit" value="Save" name="save_instrument" class="btn btn-success" />
                        </div>
                    </form>
                    <!--END INSTRUMENT FORM-->
                </div>
                <!--END PANEL BODY DIV-->
            </div>
            <!--END PANEL BODY DIV-->
        </div>
        <!--END PANEL BODY DIV-->
    </div>

</asp:Content>
