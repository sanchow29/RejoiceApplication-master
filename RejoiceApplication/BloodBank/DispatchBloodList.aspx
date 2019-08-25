<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DispatchBloodList.aspx.cs" Inherits="RejoiceApplication.BloodBank.DispatchBloodList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-inner" style="min-height: 1050px;">
        <!-- start page inner div-->
        <div class="row right_side bloodbank">
            <!-- start dashboard content div-->
            <noscript>
                <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
            </noscript>
            <script type="text/javascript">
                jQuery(document).ready(function ($) {

                    $('#blooddonor_form').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });
                    $('#bloodgroup_form').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });
                    $.fn.datepicker.defaults.format = " yyyy-mm-dd";
                    $('#last_donate_date').datepicker({
                        endDate: '+0d',
                        autoclose: true,
                    });
                });
            </script>
            <script type="text/javascript">
                jQuery(document).ready(function () {
                    jQuery('#bloodgroup_list').DataTable({
                        "responsive": true,
                        language: { "sEmptyTable": "No data available in table", "sInfo": "Showing _START_ to _END_ of _TOTAL_ entries", "sInfoEmpty": "Showing 0 to 0 of 0 entries", "sInfoFiltered": "(filtered from _MAX_ total entries)", "sInfoPostFix": "", "sInfoThousands": ",", "sLengthMenu": "Show _MENU_ entries", "sLoadingRecords": "Loading...", "sProcessing": "Processing...", "sSearch": "Search:", "sZeroRecords": "No matching records found", "oPaginate": { "sFirst": "First", "sLast": "Last", "sNext": "Next", "sPrevious": "Previous" }, "oAria": { "sSortAscending": ": activate to sort column ascending", "sSortDescending": ": activate to sort column descending" } }
                    });
                    jQuery('#blooddonor_list').DataTable({
                        "responsive": true,
                        language: { "sEmptyTable": "No data available in table", "sInfo": "Showing _START_ to _END_ of _TOTAL_ entries", "sInfoEmpty": "Showing 0 to 0 of 0 entries", "sInfoFiltered": "(filtered from _MAX_ total entries)", "sInfoPostFix": "", "sInfoThousands": ",", "sLengthMenu": "Show _MENU_ entries", "sLoadingRecords": "Loading...", "sProcessing": "Processing...", "sSearch": "Search:", "sZeroRecords": "No matching records found", "oPaginate": { "sFirst": "First", "sLast": "Last", "sNext": "Next", "sPrevious": "Previous" }, "oAria": { "sSortAscending": ": activate to sort column ascending", "sSortDescending": ": activate to sort column descending" } }
                    });


                });
            </script>

            <div class="panel-body panel-white">
                <!-- START PANEL BODY DIV-->
                <ul class="nav nav-tabs panel_tabs" role="tablist">
                    <li class="">
                        <a href="BloodBankList.aspx" class="tab ">
                            <i class="fa fa-align-justify"></i>Blood Manage
                        </a>
                    </li>
                    <li class="">
                        <a href="AddBloodGroup.aspx" class="tab ">
                            <i class="fa fa-plus-circle"></i>Add Blood Group
                        </a>
                    </li>
                    <li class="">
                        <a href="BloodDonorList.aspx" class="tab ">
                            <i class="fa fa-align-justify"></i>Blood Donor List
                        </a>
                    </li>

                    <li class="">
                        <a href="AddBloodDonor.aspx" class="tab ">
                            <i class="fa fa-plus-circle"></i>Add Blood Donor
                        </a>
                    </li>
                    <li class="">
                        <a href="DispatchBloodList.aspx" class="tab ">
                            <i class="fa fa-align-justify"></i>Dispatch Blood List
                        </a>
                    </li>

                    <li class="active">
                        <a href="DispatchBlood.aspx" class="tab active">
                            <i class="fa fa-plus-circle"></i>Dispatch Blood
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <!--START TAB CONTENT DIV-->
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $('#dispatch_blood_form').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });
                            $.fn.datepicker.defaults.format = " yyyy-mm-dd";
                            $('#date').datepicker({
                                endDate: '+0d',
                                autoclose: true,
                            });
                            $('#tax_charge').multiselect({
                                nonSelectedText: 'Select Tax',
                                includeSelectAllOption: true,
                                selectAllText: 'Select all'
                            });
                        });
                    </script>
                    <div class="panel-body">
                        <!--START PANEL BODY DIV-->
                        <form name="dispatch_blood_form" action="" method="post" class="form-horizontal" id="dispatch_blood_form">
                            <!--START Dispatch BLOOD FORM-->
                            <input type="hidden" name="action" value="insert">
                            <input type="hidden" name="old_blood_group" value="">
                            <input type="hidden" name="old_blood_status" value="">
                            <input type="hidden" name="dispatchblood_id" value="" />

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="patient">Patient<span class="require-field">*</span></label>
                                <div class="col-sm-8">
                                    <select name="patient_id" id="" class="form-control validate[required] ">
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
                                        <option value="51">P310419 - test  test</option>
                                        <option value="32">P130419 - prayag bhaler</option>
                                        <option value="85">P650619 - Onder Gulec</option>
                                        <option value="84">P640619 - ttttt tt</option>
                                        <option value="3">P10319 - Jose Figueroa</option>
                                        <option value="68">P480519 - test SINHA</option>
                                        <option value="53">P330419 - abc PANDIT</option>
                                        <option value="46">P260419 - Carlos Roberto Carlos Roberto</option>
                                        <option value="79">P590619 - juan juanxin</option>
                                        <option value="56">P360519 - Ulisses  Silva</option>
                                        <option value="80">P600619 - Vishal Singh</option>
                                        <option value="27">P80319 - Vivekanand Adkatalwar</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="bloodgruop">Blood Group<span class="require-field">*</span></label>
                                <div class="col-sm-8">
                                    <select id="blood_group" class="form-control validate[required] selected_blood_group" name="blood_group">
                                        <option value="">Select Blood Group</option>
                                        <option value="O+">O+ </option>
                                        <option value="O-">O- </option>
                                        <option value="A+">A+ </option>
                                        <option value="B+">B+ </option>
                                        <option value="A-">A- </option>
                                        <option value="B-">B- </option>
                                        <option value="AB+">AB+ </option>
                                        <option value="AB-">AB- </option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="blood_status">Number Of Bags<span class="require-field">*</span></label>
                                <div class="col-sm-8">
                                    <input id="blood_status" class="form-control validate[required] text-input dispatch_blood_status_check" type="number" min="1" onkeypress="if(this.value.length==1) return false;" value="" name="blood_status">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="">Charge (&#36;)<span class="require-field">*</span></label>
                                <div class="col-sm-8">
                                    <input id="" class="form-control validate[required]" min="0" type="number" onkeypress="if(this.value.length==8) return false;" step="0.01" value="" name="blood_charge">
                                </div>
                            </div>
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
                            <input type="hidden" id="_wpnonce" name="_wpnonce" value="fda0f20c1d" /><input type="hidden" name="_wp_http_referer" value="/mojoomla/extend/wordpress/hospital/?dashboard=user&amp;page=bloodbank&amp;tab=adddispatchblood&amp;action=insert" />
                            <div class="form-group margin_bottom_5px">
                                <label class="col-sm-2 control-label" for="last_donet_date">Date<span class="require-field">*</span></label>
                                <div class="col-sm-8">
                                    <input id="date" class="form-control validate[required]" type="text" value="" name="date">
                                </div>
                            </div>
                            <div class="col-sm-offset-2 col-sm-8">
                                <input type="submit" value="Save" name="save_dispatch_blood" class="btn btn-success" />
                            </div>
                        </form>
                        <!--END Dispatch BLOOD FORM-->
                    </div>
                    <!--END PANEL BODY DIV-->
                </div>
                <!--END PANEL BODY DIV-->

            </div>
            <!--END TAB CONTENT DIV-->

        </div>
    </div>

</asp:Content>
