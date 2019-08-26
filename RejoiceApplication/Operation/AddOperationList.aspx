<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddOperationList.aspx.cs" Inherits="RejoiceApplication.Operation.AddOperationList" %>

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
        <li class="">
            <a href="OperationList.aspx">
                <i class="fa fa-align-justify"></i>Operation List
            </a>

        </li>
        <li class="active">
            <a href="AddOperationList.aspx" class="tab active">
                <i class="fa fa-plus-circle"></i>Add Operation
            </a>

        </li>
    </ul>
    <div class="tab-content">
        <!-- START TAB CONTENT DIV-->

        <div class="panel-body">
            <!-- START PANEL BODY DIV-->
            <form name="operation_form" action="" method="post" class="form-horizontal" id="operation_form">
                <!-- START Operation FORM-->
                <input type="hidden" name="action" value="insert">
                <input type="hidden" name="operation_id" value=""/>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="patient">Patient<span class="require-field">*</span></label>
                    <div class="col-sm-8">

                        <select name="patient_id" id="patient" class="form-control validate[required] ">
                            <option value="">Select Patient</option>
                            <option value="35">P160419 - Nina Cadela</option>
                            <option value="70">P500519 - aaannnnn bbb</option>
                            <option value="59">P390519 - Abhijit Borgohain</option>
                            <option value="4">P20319 - Ashish Ranjan</option>
                            <option value="7">P50319 - Anna Sanz</option>
                            <option value="50">P300419 - gab girbaci</option>
                            <option value="110">P900819 - David Urrego</option>
                            <option value="90">P700719 - damien schuling</option>
                            <option value="86">P660619 - abc def</option>
                            <option value="42">P220419 - Joshua Altio</option>
                            <option value="89">P690719 - matthew kargbo</option>
                            <option value="92">P720719 - Eugene Ciervo</option>
                            <option value="62">P420519 - uu ui</option>
                            <option value="39">P190419 - king hytrd</option>
                            <option value="8">P60319 - Lucas M</option>
                            <option value="49">P290419 - Ahmed Ahme</option>
                            <option value="51">P310419 - test test</option>
                            <option value="32">P130419 - prayag bhaler</option>
                            <option value="85">P650619 - Onder Gulec</option>
                            <option value="84">P640619 - ttttt tt</option>
                            <option value="3">P10319 - Jose Figueroa</option>
                            <option value="68">P480519 - test SINHA</option>
                            <option value="53">P330419 - abc PANDIT</option>
                            <option value="46">P260419 - Carlos Roberto Carlos Roberto</option>
                            <option value="79">P590619 - juan juanxin</option>
                            <option value="56">P360519 - Ulisses Silva</option>
                            <option value="80">P600619 - Vishal Singh</option>
                            <option value="27">P80319 - Vivekanand Adkatalwar</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="patient_status">Patient Status<span class="require-field">*</span></label>
                    <div class="col-sm-8">
                        <select name="patient_status" class="form-control validate[required]">
                            <option value="">Select Patient Status</option>
                            <option value="Admitted">Admitted</option>
                            <option value="Under Treatment">Under Treatment</option>
                            <option value="Operated">Operated</option>
                            <option value="Recovery">Recovery</option>
                            <option value="Cured">Cured</option>
                            <option value="Discharged">Discharged</option>
                            <option value="Death">Death</option>

                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="patient">Operation<span class="require-field">*</span></label>
                    <div class="col-sm-8 margin_bottom_5px">
                        <select name="operation_title" id="operation" class="form-control validate[required] ">
                            <option value="">Select Operation</option>
                            <option value="109">asssss</option>
                            <option value="36">Brain Surgery</option>
                            <option value="37">Cancer Surgery</option>
                            <option value="190">Implantes</option>
                            <option value="56">jio</option>
                            <option value="136">Operation </option>
                        </select>
                    </div>
                    <div class="col-sm-2">
                        <button id="addremove" model="operation">Add Or Remove</button>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="doctor">Select Doctor<span class="require-field">*</span></label>
                    <div class="col-sm-8 multiselect_validation_doctor">
                        <select name="doctor[]" class="form-control validate[required] " multiple="multiple" id="doctor">
                            <option value="2" selected>Fernando - Cardiologists</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="bedtype">Bed Category<span class="require-field">*</span></label>
                    <div class="col-sm-8">
                        <select name="bed_type_id" class="form-control validate[required]" id="bed_type_id">
                            <option value="">Select Bed Category</option>
                            <option value="33">General</option>
                            <option value="34">ICU</option>
                            <option value="35">Special</option>
                            <option value="55">very spec</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="bednumber">Bed Number<span class="require-field">*</span></label>
                    <div class="col-sm-8">
                        <select name="bed_number" class="form-control validate[required]" id="bednumber">
                            <option>Select Bed Number</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="request_date">Operation Date<span class="require-field">*</span></label>
                    <div class="col-sm-8">
                        <input id="operation_date" class="form-control validate[required]" type="text" value="" name="operation_date">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="operation_time">Operation Time</label>
                    <div class="col-sm-8">
                        <input id="operation_time" class="form-control timepicker" data-show-meridian="false" data-minute-step="15" type="text"
                               value="" name="operation_time">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="ot_description">Description<span class="require-field">*</span></label>
                    <div class="col-sm-8">
                        <textarea id="ot_description" class="form-control validate[required,custom[address_description_validation]]" maxlength="150" name="ot_description"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="operation_charge">Total Opearation Charge (&#36;)<span class="require-field">*</span></label>
                    <div class="col-sm-8">
                        <input type="hidden" name="ot_charge" id="ot_charge" value="">
                        <input type="hidden" name="ot_tax" id="ot_tax" value="">
                        <input id="operation_charge" class="form-control validate[required]" min="0" type="number" onkeypress="if (this.value.length == 10) return false;" step="0.01"
                               value="" name="operation_charge" readonly>
                    </div>
                </div>
                <div class="form-group margin_bottom_5px">
                    <label class="col-sm-2 control-label" for="patient_status">Operation Status<span class="require-field">*</span></label>
                    <div class="col-sm-8">
                        <select name="operation_status" class="form-control validate[required] operation_status">
                            <option value="">Select Operation Status</option>
                            <option value="Inprogress">
                                Inprogress
                            </option>
                            <option value="Completed">
                                Completed
                            </option>
                            <option value="Scheduled">
                                Scheduled
                            </option>
                        </select>
                    </div>
                </div>
                <input type="hidden" id="_wpnonce" name="_wpnonce" value="dffb556690"/><input type="hidden" name="_wp_http_referer" value="/mojoomla/extend/wordpress/hospital/?dashboard=user&amp;page=operation&amp;tab=addoperation&amp;action=insert"/>
                <div class="form-group out_come_status margin_bottom_5px">
                    <label class="col-sm-2 control-label" for="hmgt_currency_code">Out Come Status</label>
                    <div class="col-sm-8">
                        <select name="out_come_status" class="form-control text-input">
                            <option value="Success">
                                Success
                            </option>
                            <option value="Fail">
                                Fail
                            </option>
                        </select>
                    </div>
                </div>
                <div class="col-sm-offset-2 col-sm-8 doctor_submit">
                    <input type="submit" value="Save" name="save_operation" class="btn btn-success"/>
                </div>
            </form>
            <!-- END Operation FORM-->
        </div>
        <!-- END PANEL BODY DIV-->
    </div>
    <!-- END TAB CONTENT DIV-->
</div>
<!-- END PANEL BODY DIV-->
</div>
</div>
</asp:Content>