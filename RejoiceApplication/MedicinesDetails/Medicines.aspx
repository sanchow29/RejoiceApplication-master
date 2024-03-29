﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Medicines.aspx.cs" Inherits="RejoiceApplication.MedicinesDetails.Medicines6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="page-inner" style="min-height: 1050px;">
<!-- start page inner div-->
<div class="row right_side medicine">
<!-- start dashboard content div-->
<noscript>
    <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
</noscript>
<!-- POP up code -->
<div class="popup-bg">
    <div class="overlay-content">
        <div class="modal-content">
            <div class="category_list"></div>
        </div>
    </div>
</div>
<!-- End POP-UP Code -->
<script type="text/javascript">
    jQuery(document).ready(function($) {
        jQuery('#medicine_list').DataTable({
            "responsive": true,
            "aoColumns": [
                { "bSortable": true },
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
        $.fn.datepicker.defaults.format = " yyyy-mm-dd";
        $('#manufactured_date').datepicker({
            endDate: '+0d',
            autoclose: true
        });
        var date = new Date();
        date.setDate(date.getDate() - 0);
        $.fn.datepicker.defaults.format = " yyyy-mm-dd";
        $('#expiry_date').datepicker({
            startDate: date,
            autoclose: true
        });
        $('.tax_charge').multiselect({
            nonSelectedText: 'Select Tax',
            includeSelectAllOption: true,
            selectAllText: 'Select all'
        });
    });
</script>

<div class="panel-body panel-white">
<!-- START PANEL BODY DIV-->
<ul class="nav nav-tabs panel_tabs" role="tablist">

    <li class="active">
        <a href="Medicines6.aspx">
            <i class="fa fa-align-justify"></i>Medicine List
        </a>

    </li>

    <li class="">
        <a href="AddMedicines.aspx">
            <i class="fa fa-plus-circle"></i>Add Medicine
        </a>
    </li>
    <li class="">
        <a href="DispatchedMedicinesList.aspx">
            <i class="fa fa-align-justify"></i>Dispatched Medicine List
        </a>

    </li>


    <li class="">
        <a href="DispatchMedicines.aspx">
            <i class="fa fa-plus-circle"></i>Dispatch Medicine
        </a>
    </li>
</ul>
<div class="tab-content">
<!-- START TAB CONTENT DIV-->
<div class="tab-pane fade active in" id="appointmentlist">
    <!-- START TAB PANE DIV-->
    <div class="panel-body">
        <!-- START PANEL BODY DIV-->
        <div class="table-responsive">
            <!-- START TABLE RESPONSIVE DIV-->
            <table id="medicine_list" class="display dataTable" cellspacing="0" width="100%">
                <!-- START Medicine LIST TABLE-->
                <thead>
                <tr>
                    <th>Medicine Name</th>
                    <th>Category</th>
                    <th>Batch Number</th>
                    <th>Quantity</th>
                    <th>Price (<span>&#36;</span>)</th>
                    <th>Discount</th>
                    <th>Tax</th>
                    <th>Expiry Date</th>
                    <th>Stock</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>Medicine Name</th>
                    <th>Category</th>
                    <th>Batch Number</th>
                    <th>Quantity</th>
                    <th>Price (<span>&#36;</span>)</th>
                    <th>Discount</th>
                    <th>Tax</th>
                    <th>Expiry Date</th>
                    <th>Stock</th>
                    <th>Action</th>
                </tr>
                </tfoot>
                <tbody>
           <%--     <tr>
                    <td class="medicine_name">Pacimol</td>
                    <td class="category">auto test</td>
                    <td class="">003256</td>
                    <td class="">9</td>
                    <td class="price">52</td>
                    <td class="price">
                        5 (%)

                    </td>
                    <td class="">
                        GST-9
                    </td>
                    <td class="price">2020-12-01</td>
                    <td class="medicine_qty">In</td>
                    <td class="action">
                        <a href="?dashboard=user&page=medicine&tab=addmedicine&action=edit&medicine_id=NA==" class="btn btn-info">Edit</a>
                    </td>
                </tr>--%>
              
                </tbody>
            </table>
            <!-- END Medicine LIST TABLE-->
        </div>
        <!-- END TABLE RESPONSIVE DIV-->
    </div>
    <!-- END PANEL BODY DIV-->
</div>
<!-- END TAB PANE DIV-->
<script type="text/javascript">
    $(document).ready(function() {
        $('#medicine_form')
            .validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });
        $('.tax_charge').multiselect({
            nonSelectedText: 'Select Tax',
            includeSelectAllOption: true,
            selectAllText: 'Select all'
        });
    });
</script>
<div class="tab-pane ">
    <!-- START TAB PANE DIV-->
    <div class="panel-body">
        <!-- START PANEL BODY DIV-->
        <form name="medicine_form" action="" method="post" class="form-horizontal" id="medicine_form">
            <!-- START Medicine FORM-->
            <input type="hidden" name="action" value="insert">
            <input type="hidden" class="medicine_id" name="medicine_id" value=""/>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="medicine_category">Category Name<span class="require-field">*</span></label>
                <div class="col-sm-8 margin_bottom_5px">

                    <select class="form-control validate[required]" name="medicine_category" id="category_data">
                        <option value="">Select Category</option>
                        <option value="53">auto test</option>
                        <option value="54">cate</option>
                        <option value="113">Injection</option>
                        <option value="95">qwe</option>
                        <option value="149">tab</option>
                        <option value="130">tablet</option>
                        <option value="165">zofran</option>
                    </select>
                </div>
                <div class="col-sm-2">
                    <button id="addremove" model="medicine">Add Or Remove</button>
                </div>
            </div>

            <div class="main_medicine_div">
                <div class="medicine_div">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="medicine_name">Medicine<span class="require-field">*</span></label>
                        <div class="col-sm-3 margin_bottom_5px">
                            <input id="medicine_name" class="form-control validate[required,custom[popup_category_validation]] text-input medicine_name" maxlength="50" type="text" placeholder="Medicine Name"
                                   value="" name="medicine_name[]">
                        </div>
                        <div class="col-sm-6 margin_bottom_5px">
                            <textarea rows="1" name="description[]" class="form-control validate[custom[address_description_validation]]" id="description" maxlength="150" placeholder="Description"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-3 margin_bottom_5px">
                            <input class="form-control validate[custom[popup_category_validation]]" type="text" maxlength="20" placeholder="Batch Number" value="" name="batch_number[]">
                        </div>
                        <div class="col-sm-2 margin_bottom_5px">
                            <input class="form-control validate[required] text-input" min="0" type="number" onkeypress="if (this.value.length == 6) return false;" placeholder="Quantity" value="" name="med_quantity[]">
                        </div>
                        <div class="col-sm-2 margin_bottom_5px">
                            <input id="med_price" class="form-control validate[required] text-input" min="1" type="number" onkeypress="if (this.value.length == 8) return false;" step="0.01" placeholder="Price (&#36;)" value="" name="med_price[]">
                        </div>
                        <div class="col-sm-2 margin_bottom_5px">
                            <input id="" class="form-control validate[custom[popup_category_validation]] text-input med_uniqueid" maxlength="10" type="text" placeholder="Medicine ID" value="" name="med_uniqueid[]">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-3 margin_bottom_5px">
                            <textarea rows="1" name="note[]" class="form-control validate[custom[address_description_validation]]" maxlength="150" placeholder="Note"></textarea>
                        </div>
                        <div class="col-sm-2 margin_bottom_5px">
                            <input id="med_discount" class="form-control text-input" type="number" onkeypress="if (this.value.length == 10) return false;" step="0.01" placeholder="Discount" value="" name="med_discount[]">
                        </div>
                        <div class="col-sm-2 margin_bottom_5px">
                            <select class="form-control" name="med_discount_in[]">
                                <option value="flat">Flat</option>
                                <option value="percentage">Percentage</option>
                            </select>
                        </div>
                        <div class="col-sm-2 margin_bottom_5px">
                            <select class="form-control tax_charge" name="med_tax[0][]" multiple="multiple">
                                <option value="1">GST-9</option>
                                <option value="2">SGST-8</option>
                                <option value="3">VAT-5</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-3 margin_bottom_5px">
                            <input id="mfg_cmp_name" class="form-control validate[custom[popup_category_validation]]" type="text" maxlength="50" placeholder="Manufacturer Company Name"
                                   value="" name="mfg_cmp_name[]">
                        </div>
                        <div class="col-sm-2 margin_bottom_5px">
                            <input id="manufactured_date" class="form-control validate[required]" type="text" name="manufactured_date[]" placeholder="Manufactured Date"
                                   value="" readonly>
                        </div>
                        <div class="col-sm-2 margin_bottom_5px">
                            <input id="expiry_date" class="form-control validate[required]" type="text" name="expiry_date[]" placeholder="Expiry Date" value="" readonly>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="expense_entry"></label>
                <div class="col-sm-3 margin_bottom_5px">
                    <button id="add_new_entry" class="btn btn-default btn-sm btn-icon icon-left" type="button" name="add_new_entry" onclick="add_entry()">Add More Medicine </button>
                </div>
            </div>
            <input type="hidden" id="_wpnonce" name="_wpnonce" value="6ed3b67173"/><input type="hidden" name="_wp_http_referer" value="/mojoomla/extend/wordpress/hospital/?dashboard=user&amp;page=medicine&amp;tab=medicinelist"/>
            <div class="col-sm-offset-2 col-sm-8">
                <input type="submit" value="Save" name="save_medicine" class="btn btn-success"/>
            </div>
        </form>
        <!-- END Medicine FORM-->
    </div>
    <!-- END PANEL BODY DIV-->
</div>
<!-- END TAB PANE DIV-->
<script>
    var key = 0;

    function add_entry() {
        key++;

        $(".main_medicine_div").append(
            '<div class="medicine_div"><div class="form-group"><label class="col-sm-2 		control-label" for="medicine_name">Medicine<span class="require-field">*</span></label><div class="col-sm-3 margin_bottom_5px"><input id="medicine_name" class="form-control validate[required,custom[popup_category_validation]] text-input  medicine_name" maxlength="50" type="text" placeholder="Medicine Name" value="" name="medicine_name[]"></div><div class="col-sm-6"><textarea rows="1"  name="description[]"  class="form-control validate[custom[address_description_validation]]" id="description" maxlength="150" placeholder="Description"></textarea></div></div><div class="form-group"><div class="col-sm-offset-2 col-sm-3 margin_bottom_5px"><input class="form-control validate[custom[popup_category_validation]]" type="text" maxlength="20" placeholder="Batch Number" value="" name="batch_number[]"></div><div class="col-sm-2 margin_bottom_5px"><input  class="form-control validate[required] text-input" min="0" type="number" onKeyPress="if(this.value.length==6) return false;"  placeholder="Quantity" value="" name="med_quantity[]"></div><div class="col-sm-2 margin_bottom_5px"><input id="med_price" class="form-control validate[required] text-input" min="1" type="number" step="0.01" onKeyPress="if(this.value.length==8) return false;"  placeholder="Price (&#36;)" value="" name="med_price[]"></div><div class="col-sm-2 margin_bottom_5px"><input id="" class="form-control validate[] text-input med_uniqueid validate[custom[popup_category_validation]]" maxlength="10" type="text" placeholder="Medicine ID"	value="" name="med_uniqueid[]"></div></div><div class="form-group"><div class="col-sm-offset-2 col-sm-3 margin_bottom_5px"><textarea rows="1"  name="note[]"  class="form-control validate[custom[address_description_validation]]"  maxlength="150" placeholder="Note"></textarea></div><div class="col-sm-2 margin_bottom_5px"><input id="med_discount" class="form-control text-input" type="number" onKeyPress="if(this.value.length==10) return false;" step="0.01"  placeholder="Discount" value="" name="med_discount[]"></div><div class="col-sm-2 margin_bottom_5px">						<select class="form-control" name="med_discount_in[]"><option value="flat">Flat</option><option value="percentage">Percentage</option></select></div>	<div class="col-sm-2"><select  class="form-control tax_charge"  name="med_tax[' +
            key +
            '][]" multiple="multiple">	<option value="1">GST-9</option> 	<option value="2">SGST-8</option> 	<option value="3">VAT-5</option> </select></div></div><div class="form-group"><div class="col-sm-offset-2 col-sm-3 margin_bottom_5px"><input id="mfg_cmp_name" class="form-control validate[custom[popup_category_validation]]" type="text" maxlength="50" placeholder="Manufacturer Company Name" value="" name="mfg_cmp_name[]"></div><div class="col-sm-2 margin_bottom_5px"><input id="" class="form-control validate[required] medicine_manufactured_date" type="text"  name="manufactured_date[]" placeholder="Manufactured Date" value="" readonly></div><div class="col-sm-2 margin_bottom_5px"><input id="" class="form-control validate[required] medicine_expiry_date" type="text"  name="expiry_date[]" placeholder="Expiry Date" value="" readonly></div><div class="col-sm-offset-2 col-sm-1"><button type="button" class="btn btn-default delete_medicine_div"><i class="entypo-trash">Delete</i></button></div></div></div>');
    }

</script>
</div>
<!-- END TAB CONTEMT DIV-->
</div>
<!-- END PANEL BODY DIV-->
</div>
</div>

</asp:Content>