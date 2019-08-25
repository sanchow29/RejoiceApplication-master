<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DispatchMedicines.aspx.cs" Inherits="RejoiceApplication.MedicinesDetails.DispatchMedicines" %>

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
                jQuery(document).ready(function ($) {
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
                            { "bSortable": false }],
                        language: { "sEmptyTable": "No data available in table", "sInfo": "Showing _START_ to _END_ of _TOTAL_ entries", "sInfoEmpty": "Showing 0 to 0 of 0 entries", "sInfoFiltered": "(filtered from _MAX_ total entries)", "sInfoPostFix": "", "sInfoThousands": ",", "sLengthMenu": "Show _MENU_ entries", "sLoadingRecords": "Loading...", "sProcessing": "Processing...", "sSearch": "Search:", "sZeroRecords": "No matching records found", "oPaginate": { "sFirst": "First", "sLast": "Last", "sNext": "Next", "sPrevious": "Previous" }, "oAria": { "sSortAscending": ": activate to sort column ascending", "sSortDescending": ": activate to sort column descending" } }
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

                    <li class="">
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


                    <li class="active">
                        <a href="DispatchMedicines.aspx">
                            <i class="fa fa-plus-circle"></i>Dispatch  Medicine
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <!-- START TAB CONTENT DIV-->
                    <div class="tab-pane " id="appointmentlist">
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
                                        <tr>
                                            <td class="medicine_name">Pacimol</td>
                                            <td class="category">auto test</td>
                                            <td class="">003256</td>
                                            <td class="">9</td>
                                            <td class="price">52</td>
                                            <td class="price">5										(%)

                                            </td>
                                            <td class="">GST-9
                                            </td>
                                            <td class="price">2020-12-01</td>
                                            <td class="medicine_qty">In</td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=medicine&tab=addmedicine&action=edit&medicine_id=NA==" class="btn btn-info">Edit</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="medicine_name">Pacimol</td>
                                            <td class="category">auto test</td>
                                            <td class="">003256</td>
                                            <td class="">24</td>
                                            <td class="price">52</td>
                                            <td class="price">5										(%)

                                            </td>
                                            <td class="">GST-9
                                            </td>
                                            <td class="price">2020-12-01</td>
                                            <td class="medicine_qty">In</td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=medicine&tab=addmedicine&action=edit&medicine_id=NQ==" class="btn btn-info">Edit</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="medicine_name">bodrek</td>
                                            <td class="category">cate</td>
                                            <td class="">123</td>
                                            <td class="">3</td>
                                            <td class="price">1.12</td>
                                            <td class="price">-0.02										(%)

                                            </td>
                                            <td class="">VAT-5
                                            </td>
                                            <td class="price">2019-04-30</td>
                                            <td class="medicine_qty">In</td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=medicine&tab=addmedicine&action=edit&medicine_id=Ng==" class="btn btn-info">Edit</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="medicine_name">Ibuprofeno</td>
                                            <td class="category">cate</td>
                                            <td class="">5886</td>
                                            <td class="">230</td>
                                            <td class="price">20</td>
                                            <td class="price">-
                                            </td>
                                            <td class="">-
                                            </td>
                                            <td class="price">2019-09-11</td>
                                            <td class="medicine_qty">In</td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=medicine&tab=addmedicine&action=edit&medicine_id=Nw==" class="btn btn-info">Edit</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="medicine_name">abc</td>
                                            <td class="category">cate</td>
                                            <td class="">123</td>
                                            <td class="">1</td>
                                            <td class="price">1</td>
                                            <td class="price">-
                                            </td>
                                            <td class="">-
                                            </td>
                                            <td class="price">2019-05-31</td>
                                            <td class="medicine_qty">In</td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=medicine&tab=addmedicine&action=edit&medicine_id=OA==" class="btn btn-info">Edit</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="medicine_name">kkk</td>
                                            <td class="category">Injection</td>
                                            <td class="">kk</td>
                                            <td class="">10</td>
                                            <td class="price">10000</td>
                                            <td class="price">10										(<span>&#36;</span>)

                                            </td>
                                            <td class="">-
                                            </td>
                                            <td class="price">2019-07-31</td>
                                            <td class="medicine_qty">In</td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=medicine&tab=addmedicine&action=edit&medicine_id=MTA=" class="btn btn-info">Edit</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="medicine_name">ewwe</td>
                                            <td class="category">auto test</td>
                                            <td class="">ewe</td>
                                            <td class="">121</td>
                                            <td class="price">11</td>
                                            <td class="price">21										(<span>&#36;</span>)

                                            </td>
                                            <td class="">-
                                            </td>
                                            <td class="price">2019-08-16</td>
                                            <td class="medicine_qty">In</td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=medicine&tab=addmedicine&action=edit&medicine_id=MTQ=" class="btn btn-info">Edit</a>
                                            </td>
                                        </tr>
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
                        $(document).ready(function () {
                            $('#medicine_form').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });
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
                                <input type="hidden" class="medicine_id" name="medicine_id" value="" />
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
                                                <input class="form-control validate[required] text-input" min="0" type="number" onkeypress="if(this.value.length==6) return false;" placeholder="Quantity" value="" name="med_quantity[]">
                                            </div>
                                            <div class="col-sm-2 margin_bottom_5px">
                                                <input id="med_price" class="form-control validate[required] text-input" min="1" type="number" onkeypress="if(this.value.length==8) return false;" step="0.01" placeholder="Price (&#36;)" value="" name="med_price[]">
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
                                                <input id="med_discount" class="form-control text-input" type="number" onkeypress="if(this.value.length==10) return false;" step="0.01" placeholder="Discount" value="" name="med_discount[]">
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
                                        <button id="add_new_entry" class="btn btn-default btn-sm btn-icon icon-left" type="button" name="add_new_entry" onclick="add_entry()">Add More Medicine						</button>
                                    </div>
                                </div>
                                <input type="hidden" id="_wpnonce" name="_wpnonce" value="f8907b3008" /><input type="hidden" name="_wp_http_referer" value="/mojoomla/extend/wordpress/hospital/?dashboard=user&amp;page=medicine&amp;tab=adddismedicine&amp;action=insert" />
                                <div class="col-sm-offset-2 col-sm-8">
                                    <input type="submit" value="Save" name="save_medicine" class="btn btn-success" />
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

                            $(".main_medicine_div").append('<div class="medicine_div"><div class="form-group"><label class="col-sm-2 		control-label" for="medicine_name">Medicine<span class="require-field">*</span></label><div class="col-sm-3 margin_bottom_5px"><input id="medicine_name" class="form-control validate[required,custom[popup_category_validation]] text-input  medicine_name" maxlength="50" type="text" placeholder="Medicine Name" value="" name="medicine_name[]"></div><div class="col-sm-6"><textarea rows="1"  name="description[]"  class="form-control validate[custom[address_description_validation]]" id="description" maxlength="150" placeholder="Description"></textarea></div></div><div class="form-group"><div class="col-sm-offset-2 col-sm-3 margin_bottom_5px"><input class="form-control validate[custom[popup_category_validation]]" type="text" maxlength="20" placeholder="Batch Number" value="" name="batch_number[]"></div><div class="col-sm-2 margin_bottom_5px"><input  class="form-control validate[required] text-input" min="0" type="number" onKeyPress="if(this.value.length==6) return false;"  placeholder="Quantity" value="" name="med_quantity[]"></div><div class="col-sm-2 margin_bottom_5px"><input id="med_price" class="form-control validate[required] text-input" min="1" type="number" step="0.01" onKeyPress="if(this.value.length==8) return false;"  placeholder="Price (&#36;)" value="" name="med_price[]"></div><div class="col-sm-2 margin_bottom_5px"><input id="" class="form-control validate[] text-input med_uniqueid validate[custom[popup_category_validation]]" maxlength="10" type="text" placeholder="Medicine ID"	value="" name="med_uniqueid[]"></div></div><div class="form-group"><div class="col-sm-offset-2 col-sm-3 margin_bottom_5px"><textarea rows="1"  name="note[]"  class="form-control validate[custom[address_description_validation]]"  maxlength="150" placeholder="Note"></textarea></div><div class="col-sm-2 margin_bottom_5px"><input id="med_discount" class="form-control text-input" type="number" onKeyPress="if(this.value.length==10) return false;" step="0.01"  placeholder="Discount" value="" name="med_discount[]"></div><div class="col-sm-2 margin_bottom_5px">						<select class="form-control" name="med_discount_in[]"><option value="flat">Flat</option><option value="percentage">Percentage</option></select></div>	<div class="col-sm-2"><select  class="form-control tax_charge"  name="med_tax[' + key + '][]" multiple="multiple">	<option value="1">GST-9</option> 	<option value="2">SGST-8</option> 	<option value="3">VAT-5</option> </select></div></div><div class="form-group"><div class="col-sm-offset-2 col-sm-3 margin_bottom_5px"><input id="mfg_cmp_name" class="form-control validate[custom[popup_category_validation]]" type="text" maxlength="50" placeholder="Manufacturer Company Name" value="" name="mfg_cmp_name[]"></div><div class="col-sm-2 margin_bottom_5px"><input id="" class="form-control validate[required] medicine_manufactured_date" type="text"  name="manufactured_date[]" placeholder="Manufactured Date" value="" readonly></div><div class="col-sm-2 margin_bottom_5px"><input id="" class="form-control validate[required] medicine_expiry_date" type="text"  name="expiry_date[]" placeholder="Expiry Date" value="" readonly></div><div class="col-sm-offset-2 col-sm-1"><button type="button" class="btn btn-default delete_medicine_div"><i class="entypo-trash">Delete</i></button></div></div></div>');
                        }

                    </script>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $('#dipatch_medicine_form').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });
                        });
                    </script>
                    <div class="panel-body">
                        <!-- START PANEL BODY DIV-->
                        <form name="medicine_form" action="" method="post" class="form-horizontal" id="dipatch_medicine_form">
                            <!-- START Dispatch Medicine FORM-->
                            <input type="hidden" name="action" value="insert">
                            <input type="hidden" name="dispatch_id" value="" />

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="patient">Patient<span class="require-field">*</span></label>
                                <div class="col-sm-8">
                                    <select name="patient" class="form-control" id="patient_id">
                                        <option value="">select Patient</option>
                                        <option value="35">P160419 - Nina Cadela</option>
                                        <option value="57">P370519 - R R</option>
                                        <option value="104">P840819 - rer e</option>
                                        <option value="54">P340519 - aaaa aaa</option>
                                        <option value="70">P500519 - aaannnnn bbb</option>
                                        <option value="59">P390519 - Abhijit Borgohain</option>
                                        <option value="64">P440519 - Apj Kalam</option>
                                        <option value="97">P770719 - ashok kumar</option>
                                        <option value="96">P760719 - ashok kumar</option>
                                        <option value="4">P20319 - Ashish Ranjan</option>
                                        <option value="48">P280419 - Amel Ali</option>
                                        <option value="109">P890819 - Andile Zulu</option>
                                        <option value="7">P50319 - Anna Sanz</option>
                                        <option value="63">P430519 - Treatment Range</option>
                                        <option value="95">P750719 - Adi Nugroho</option>
                                        <option value="50">P300419 - gab girbaci</option>
                                        <option value="47">P270419 - Kristopher Davis</option>
                                        <option value="77">P570619 - claudiu ciubotaru</option>
                                        <option value="88">P680719 - NiftecsPOS Ombachi</option>
                                        <option value="110">P900819 - David Urrego</option>
                                        <option value="31">P120419 - akshay sarwade</option>
                                        <option value="34">P150419 - prayag bhaler</option>
                                        <option value="90">P700719 - damien schuling</option>
                                        <option value="83">P630619 - Favour Isoah</option>
                                        <option value="100">P800819 - fdsfdsf dsfsdfsdf</option>
                                        <option value="86">P660619 - abc def</option>
                                        <option value="42">P220419 - Joshua Altio</option>
                                        <option value="41">P210419 - Joshua Altio</option>
                                        <option value="101">P810819 - Haris Abbas</option>
                                        <option value="43">P230419 - hendra wijaya</option>
                                        <option value="89">P690719 - matthew kargbo</option>
                                        <option value="74">P540619 - jong test</option>
                                        <option value="106">P860819 - Igor Negromonte</option>
                                        <option value="105">P850819 - Emran  Imran</option>
                                        <option value="107">P870819 - ahmed ahmed</option>
                                        <option value="81">P610619 - Ilyas Awan</option>
                                        <option value="92">P720719 - Eugene Ciervo</option>
                                        <option value="55">P350519 - pooja chaudhery</option>
                                        <option value="62">P420519 - uu ui</option>
                                        <option value="39">P190419 - king hytrd</option>
                                        <option value="87">P670619 - kkk k</option>
                                        <option value="73">P530519 - Kartik Bhatt</option>
                                        <option value="99">P790719 - kumar singh</option>
                                        <option value="98">P780719 - mark masai manu</option>
                                        <option value="82">P620619 - Johnson  Landzro</option>
                                        <option value="8">P60319 - Lucas M</option>
                                        <option value="49">P290419 - Ahmed Ahme</option>
                                        <option value="65">P450519 - testq proba</option>
                                        <option value="6">P40319 - Mario Rossi</option>
                                        <option value="69">P490519 - John Owner</option>
                                        <option value="103">P830819 - maxmuts muutus</option>
                                        <option value="51">P310419 - test  test</option>
                                        <option value="91">P710719 - Mustufa Aghadi</option>
                                        <option value="32">P130419 - prayag bhaler</option>
                                        <option value="85">P650619 - Onder Gulec</option>
                                        <option value="84">P640619 - ttttt tt</option>
                                        <option value="5">P30319 - John Mark</option>
                                        <option value="3">P10319 - Jose Figueroa</option>
                                        <option value="60">P400519 - patient p</option>
                                        <option value="61">P410519 - patiente p</option>
                                        <option value="68">P480519 - test SINHA</option>
                                        <option value="94">P740719 - sddsa dassss</option>
                                        <option value="108">P880819 - Renan Remi</option>
                                        <option value="58">P380519 - Nico Alderson</option>
                                        <option value="53">P330419 - abc PANDIT</option>
                                        <option value="29">P100419 - muhammed shameem</option>
                                        <option value="46">P260419 - Carlos Roberto Carlos Roberto</option>
                                        <option value="66">P460519 - mohammad khan</option>
                                        <option value="79">P590619 - juan juanxin</option>
                                        <option value="37">P170419 - stan Ngaguthii</option>
                                        <option value="75">P550619 - tan me</option>
                                        <option value="44">P240419 - Test Test</option>
                                        <option value="45">P250419 - Test Test</option>
                                        <option value="71">P510519 - testaaa testaaa</option>
                                        <option value="52">P320419 - Moses Peter</option>
                                        <option value="72">P520519 - Abd ASb</option>
                                        <option value="76">P560619 - TJ med</option>
                                        <option value="102">P820819 - tiny tim</option>
                                        <option value="40">P200419 - Tony Stark</option>
                                        <option value="56">P360519 - Ulisses  Silva</option>
                                        <option value="38">P180419 - AS as</option>
                                        <option value="67">P470519 - Everton  Muta</option>
                                        <option value="80">P600619 - Vishal Singh</option>
                                        <option value="27">P80319 - Vivekanand Adkatalwar</option>
                                        <option value="93">P730719 - Le Thanh</option>
                                        <option value="78">P580619 - Zeeshan Asghar</option>
                                    </select>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="patient">Prescription<span class="require-field">*</span></label>
                                <div class="col-sm-8">
                                    <select name="prescription_id" class="form-control" id="prescription">
                                        <option>Select Prescription</option>
                                    </select>
                                </div>
                            </div>

                            <div id="madicinedata"></div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="med_price">Total Price Amount (&#36;)<span class="require-field">*</span></label>
                                <div class="col-sm-8">
                                    <input id="dispatch_medicine_price" class="form-control validate[required] text-input" type="text"
                                        value="" name="med_price" readonly>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="discount">Total Discount Amount (&#36;)</label>
                                <div class="col-sm-8">
                                    <input id="discount" class="form-control discount text-input" min="0" type="number" onkeypress="if(this.value.length==8) return false;" step="0.01" value="" name="discount" readonly>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="med_price">Total Tax Amount (&#36;)</label>
                                <div class="col-sm-8">
                                    <input id="med_tax" class="form-control text-input" type="text"
                                        value="" name="total_tax_amount" readonly>
                                </div>
                            </div>
                            <input type="hidden" id="_wpnonce" name="_wpnonce" value="a44c868c26" /><input type="hidden" name="_wp_http_referer" value="/mojoomla/extend/wordpress/hospital/?dashboard=user&amp;page=medicine&amp;tab=adddismedicine&amp;action=insert" />
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="sub_total">Sub Total (&#36;)</label>
                                <div class="col-sm-8">
                                    <input id="sub_total" class="form-control  text-input" type="text" value="" name="sub_total" readonly>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="description">Description</label>
                                <div class="col-sm-8">
                                    <textarea name="description" id="description" maxlength="150" class="form-control validate[custom[address_description_validation]]"></textarea>

                                </div>
                            </div>

                            <div class="col-sm-offset-2 col-sm-8">
                                <input type="submit" value="Save" name="save_dispatch_medicine" class="btn btn-success" />
                            </div>
                        </form>
                        <!-- END Dispatch Medicine FORM-->
                    </div>
                    <!-- END PANEL BODY DIV-->
                </div>
                <!-- END TAB CONTEMT DIV-->
            </div>
            <!-- END PANEL BODY DIV-->
        </div>
    </div>
</asp:Content>
