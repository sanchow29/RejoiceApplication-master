<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddBloodDonor.aspx.cs" Inherits="RejoiceApplication.BloodBank.AddBloodDonor" %>

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

                    <li class="active">
                        <a href="AddBloodDonor.aspx" class="tab active">
                            <i class="fa fa-plus-circle"></i>Add Blood Donor
                        </a>
                    </li>
                    <li class="">
                        <a href="DispatchBloodList.aspx" class="tab ">
                            <i class="fa fa-align-justify"></i>Dispatch Blood List
                        </a>
                    </li>

                    <li class="">
                        <a href="DispatchBlood.aspx" class="tab ">
                            <i class="fa fa-plus-circle"></i>Dispatch Blood
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <!--START TAB CONTENT DIV-->

                    <div class="panel-body">
                        <!--START PANEL BODY DIV-->
                        <form name="blooddonor_form" action="" method="post" class="form-horizontal" id="blooddonor_form">
                            <!--START BLOOD DONOR FORM-->
                            <input type="hidden" name="action" value="insert">
                            <input type="hidden" name="old_blood_group" value="">
                            <input type="hidden" name="old_blood_status" value="">
                            <input type="hidden" name="blooddonor_id" value="" />
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="first_name">Full Name<span class="require-field">*</span></label>
                                <div class="col-sm-8">
                                    <input id="bool_dodnor_name" class="form-control validate[required,custom[onlyLetter_specialcharacter]] text-input" maxlength="50" type="text" value="" name="bool_dodnor_name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="gender">Gender<span class="require-field">*</span></label>
                                <div class="col-sm-8">
                                    <label class="radio-inline">
                                        <input type="radio" value="male" class="tog validate[required]" name="gender" checked='checked' />Male
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" value="female" class="tog validate[required]" name="gender" />Female
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="med_category_name">Age<span class="require-field">*</span></label>
                                <div class="col-sm-8">
                                    <input id="dodnor_age" class="form-control validate[required] text-input" min="0" max="99" type="number" onkeypress="if(this.value.length==2) return false;" value="" name="dodnor_age">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label " for="phone">Phone<span class="require-field">*</span></label>
                                <div class="col-sm-8">
                                    <input id="phone" class="form-control validate[required,custom[phone_number]] text-input" minlength="6" maxlength="15" type="text" value="" name="phone">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label " for="email">Email<span class="require-field">*</span></label>
                                <div class="col-sm-8">
                                    <input id="email" class="form-control validate[required,custom[email]] text-input" maxlength="100" type="text" name="email"
                                        value="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="bloodgruop">Blood Group<span class="require-field">*</span></label>
                                <div class="col-sm-8">
                                    <select id="blood_group" class="form-control validate[required]" name="blood_group">
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
                                    <input id="blood_status" class="form-control validate[required] text-input" type="number" min="1" onkeypress="if(this.value.length==1) return false;" value="" name="blood_status">
                                </div>
                            </div>
                            <input type="hidden" id="_wpnonce" name="_wpnonce" value="95aba4ad87" /><input type="hidden" name="_wp_http_referer" value="/mojoomla/extend/wordpress/hospital/?dashboard=user&amp;page=bloodbank&amp;tab=addblooddonor&amp;action=insert" />
                            <div class="form-group margin_bottom_5px">
                                <label class="col-sm-2 control-label" for="last_donet_date">Last Donation Date</label>
                                <div class="col-sm-8">
                                    <input id="last_donate_date" class="form-control " type="text" value="" name="last_donate_date">
                                </div>
                            </div>


                            <div class="col-sm-offset-2 col-sm-8">
                                <input type="submit" value="Save" name="save_blooddonor" class="btn btn-success" />
                            </div>
                        </form>
                        <!--END BLOOD GROUP FORM->
                                    </div><!--END PANEL BODY DIV-->

                    </div>
                    <!--END PANEL BODY DIV-->

                </div>
                <!--END TAB CONTENT DIV-->
            </div>
        </div>
    </div>

</asp:Content>
