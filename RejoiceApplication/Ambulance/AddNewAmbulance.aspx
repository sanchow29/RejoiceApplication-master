<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddNewAmbulance.aspx.cs" Inherits="RejoiceApplication.Ambulance.AddNewAmbulance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-inner" style="min-height: 1050px;">
        <!-- start page inner div-->
        <div class="row right_side ambulance">
            <!-- start dashboard content div-->
            <noscript>
                <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
            </noscript>
            <script type="text/javascript">
                jQuery(document).ready(function () {
                    $('.request_time').timepicki(
                        {
                            show_meridian: false,
                            min_hour_value: 0,
                            max_hour_value: 23,
                            step_size_minutes: 15,
                            overflow_minutes: true,
                            increase_direction: 'up',
                            disable_keyboard_mobile: true
                        });

                    $('.dispatch_time').timepicki({
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
                    $('#request_date').datepicker({
                        startDate: date,
                        autoclose: true
                    });
                    $('#tax_charge').multiselect({
                        nonSelectedText: 'Select Tax',
                        includeSelectAllOption: true,
                        selectAllText: 'Select all'
                    });
                });
            </script>
            <div class="panel-body panel-white">
                <!-- START PANEL BODY DIV -->
                <ul class="nav nav-tabs panel_tabs" role="tablist">
                    <!-- START NAV TAB -->
                    <li class="">
                        <a href="Ambulance.aspx">
                            <i class="fa fa-align-justify"></i>Request List
                        </a>
                        
                    </li>
                    <li class="">

                        <a href="AmbulanceRequest.aspx" class="tab ">
                            <i class="fa fa-plus-circle"></i>Add Request
                        </a>

                    </li>

                    <li class="">
                        <a href="AmbulanceList.aspx">
                            <i class="fa fa-align-justify"></i>Ambulance List
                        </a>
                        
                    </li>

                    <li class="active">

                        <a href="AddNewAmbulance.aspx" class="tab active">
                            <i class="fa fa-plus-circle"></i>Add New Ambulance
                        </a>

                    </li>

                </ul>
                <!-- END NAV TAB -->
                <script type="text/javascript">
                    jQuery(document).ready(function ($) {
                        $('#patient_form').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });

                    });
                </script>
                <div class="panel-body">
                    <!-- START PANEL BODY DIV -->
                    <form name="patient_form" action="" method="post" class="form-horizontal" id="patient_form" enctype="multipart/form-data">
                        <!-- START Ambulance FORM -->
                        <input type="hidden" name="action" value="insert">
                        <input type="hidden" name="amb_id" value="" />

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="ambulance_id">Ambulance Id<span class="require-field">*</span></label>
                            <div class="col-sm-8">
                                <input id="ambulance_id" class="form-control validate[required]" type="text" readonly value="AMB08245" name="ambulance_id">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="amb_Reg_number">Registration Number<span class="require-field">*</span></label>
                            <div class="col-sm-8">
                                <input id="amb_Reg_number" class="form-control validate[required]" min="0" type="number" onkeypress="if(this.value.length==6) return false;" value="" name="registerd_no">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="amb_driver_name">Driver Name<span class="require-field">*</span></label>
                            <div class="col-sm-8">
                                <input id="amb_driver_name" class="form-control validate[required,custom[onlyLetter_specialcharacter]]" type="text" maxlength="50" value="" name="driver_name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="amb_driver_address">Driver Address<span class="require-field">*</span></label>
                            <div class="col-sm-8">
                                <input id="amb_driver_address" class="form-control validate[required,custom[address_description_validation]]" type="text" maxlength="150" value="" name="driver_address">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="amb_phone_number">Driver Phone Number<span class="require-field">*</span></label>
                            <div class="col-sm-8">
                                <input id="amb_phone_number" class="form-control validate[required,custom[phone_number]] text-input" minlength="6" maxlength="15" type="text" value="" name="driver_phoneno">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="discription">Description</label>
                            <div class="col-sm-8">
                                <input id="discription" class="form-control validate[custom[address_description_validation]]" maxlength="150" type="text" value="" name="description">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="photo">Driver Image</label>
                            <div class="col-sm-2 margin_bottom_5px">
                                <input type="text" id="hmgt_user_avatar_url" class="form-control" name="hmgt_user_avatar_url"
                                    value="" readonly />
                            </div>
                            <div class="col-sm-3">
                                <input type="hidden" name="hidden_upload_user_avatar_image"
                                    value="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/useriamge/patient.png">
                                <input id="upload_user_avatar_image" name="upload_user_avatar_image" type="file" class="form-control file" value="Upload image" />
                            </div>
                            <div class="clearfix"></div>

                            <div class="col-sm-offset-2 col-sm-8">
                                <div id="upload_user_avatar_preview">
                                    <img class="image_preview_css" alt="" src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/useriamge/patient.png">
                                </div>
                            </div>
                        </div>
                        <input type="hidden" id="_wpnonce" name="_wpnonce" value="09803c5dd0" />
                        <input type="hidden" name="_wp_http_referer" value="/mojoomla/extend/wordpress/hospital/?dashboard=user&amp;page=ambulance&amp;tab=add_ambulance&amp;action=insert" />
                        <div class="col-sm-offset-2 col-sm-8">
                            <input type="submit" value="Save" name="save_ambulance" class="btn btn-success" />
                        </div>
                    </form>
                    <!-- END Ambulance FROM-->
                </div>
                <!-- END PANEL BODY DIV -->
            </div>
        </div>
    </div>
</asp:Content>
