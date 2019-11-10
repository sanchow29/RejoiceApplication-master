<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreatePatient.aspx.cs" Inherits="RejoiceApplication.CreatePatient" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="container-fluid">
<div class="page-inner" style="min-height: 1050px;">

<div class="head col-sm-offset-4">
    <header class="entry-header">
        <div class="titledemo">
            <h2 class="entry-title">Hospital Management Patient Registration Page</h2>
        </div>
    </header>
    <!-- .entry-header -->
</div>
<div class="entry-content">

<style>
    .patient_registraion_form {
        float: left;
        width: 100%;
    }

    .patient_registraion_form .form-group {
        margin-bottom: 10px;
        margin-top: 10px;
    }

    .patient_registraion_form .form-group .form-control { font-size: 16px; }

    .patient_registraion_form .form-group, .patient_registraion_form .form-group .form-control {
        float: left;
        width: 100%
    }

    .patient_registraion_form .form-group .require-field { color: red; }

    .patient_registraion_form select.form-control, .patient_registraion_form input[type="file"] {
        padding: 0.5278em;
        margin-bottom: 5px;
    }

    .patient_registraion_form .radio-inline {
        float: left;
        margin-bottom: 10px;
        margin-top: 10px;
        margin-right: 15px;
    }

    .patient_registraion_form .radio-inline .tog { margin-right: 5px; }

    .patient_registraion_form .col-sm-2.control-label {
        line-height: 48px;
        text-align: right;
    }

    .patient_registraion_form .form-group .col-sm-2 { width: 24.667%; }

    .patient_registraion_form .form-group .col-sm-8 { width: 66.66666667%; }

    .patient_registraion_form .form-group .col-sm-7 { width: 53.33333333%; }

    .patient_registraion_form .form-group .col-sm-1 { width: 13.33333333%; }

    .patient_registraion_form .form-group .col-sm-8, .patient_registraion_form .form-group .col-sm-2, .patient_registraion_form .form-group .col-sm-7, .patient_registraion_form .form-group .col-sm-1 {
        padding-left: 15px;
        padding-right: 15px;
        float: left;
    }

    .patient_registraion_form .form-group .col-sm-8, .patient_registraion_form .form-group .col-sm-2, .patient_registraion_form .form-group .col-sm-7 {
        position: relative;
        min-height: 1px;
    }

    div { margin-bottom: 2px; }

    input { margin-bottom: 4px; }

    .patient_registraion_form .col-sm-offset-2.col-sm-8 {
        float: left;
        margin-left: 35%;
        margin-top: 15px;
    }

    .patient_registraion_form .form-control { line-height: 30px; }

    .student_reg_error .error { color: red; }
</style>

<div class="patient_registraion_form">
<form action="/mojoomla/extend/wordpress/hospital/hospital-management-patient-registration-page/" method="post" id="registration_form" enctype="multipart/form-data">
    <script type="text/javascript" src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/js/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/lib/validationEngine/css/validationEngine.jquery.css"/>
    <link rel="stylesheet" type="text/css" href="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/css/datepicker.min.css"/>
    <script type="text/javascript" src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/lib/validationEngine/js/languages/jquery.validationEngine-en.js"></script>
    <script type="text/javascript" src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/lib/validationEngine/js/jquery.validationEngine.js"></script>
    <script type="text/javascript" src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function() {
            $('#registration_form')
                .validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });

            $.fn.datepicker.defaults.format = "yyyy-mm-dd";
            $('.birth_date').datepicker({
                endDate: '+0d',
                autoclose: true

            });
            /*    $('#symptoms').multiselect({
                   nonSelectedText :'Select Symptoms',
                   includeSelectAllOption: true,
                   selectAllText : 'Select all'
                }); */
            $("body").on("click",
                ".add_more_report",
                function() {
                    $(".diagnosissnosis_div").append(
                        '<div class="form-group"><label class="col-sm-2 control-label" for="diagnosis">Diagnosis Report</label><div class="col-sm-8"><input type="file" class="dignosisreport form-control file" name="diagnosis[]"></div><div class="col-sm-2"><input type="button" value="Delete" onclick="deleteParentElement(this)" class="remove_cirtificate btn btn-default"></div></div>');
                });
            $("body").on("click",
                ".remove_cirtificate",
                function() {
                    alert("Do you really want to delete this record ?");
                    $(this).parent().parent().remove();
                });
        });
    </script>
    <input type="hidden" name="action" value="insert"/>
    <input type="hidden" name="role" value="patient"/>
    <input type="hidden" name="patient_type" value="outpatient"/>
    <input type="hidden" name="user_id" value=""/>
    <input type="hidden" name="doctor" value="">
    <div class="col-md-12">
        <div class="col-md-6">
            <div class="form-group">
                <label class="col-sm-2 control-label" for="first_name">First Name<span class="require-field">*</span></label>
                <div class="col-sm-8">
                    <input id="first_name" class="form-control validate[required,custom[onlyLetter_specialcharacter]] text-input" maxlength="50" type="text" value="" name="first_name">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="middle_name">Middle Name</label>
                <div class="col-sm-8">
                    <input id="middle_name" class="form-control validate[custom[onlyLetter_specialcharacter]]" maxlength="50" type="text" value="" name="middle_name">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="last_name">Last Name<span class="require-field">*</span></label>
                <div class="col-sm-8">
                    <input id="last_name" class="form-control validate[required,custom[onlyLetter_specialcharacter]] text-input" maxlength="50" type="text" value="" name="last_name">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label" for="gender">Gender<span class="require-field">*</span></label>
                <div class="col-sm-8">
                    <label class="radio-inline">
                        <input type="radio" value="male" class="tog validate[required]" name="gender" checked="checked"/>Male
                    </label>
                    <label class="radio-inline">
                        <input type="radio" value="female" class="tog validate[required]" name="gender"/>Female
                    </label>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label" for="birth_date">Date of birth<span class="require-field">*</span></label>
                <div class="col-sm-8">
                    <input id="birth_date" class="form-control validate[required] birth_date" type="text" name="birth_date"
                           value="" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="blood_group">Blood Group<span class="require-field">*</span></label>
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
                <label class="col-sm-2 control-label" for="symptoms">Symptoms<span class="require-field">*</span></label>
                <div class="col-sm-8">
                    <select class="form-control symptoms_list validate[required]" multiple="multiple" name="symptoms[]" id="symptoms">
                        <option value="16">backpain</option>
                        <option value="20">fever</option>
                        <option value="119">fever</option>
                        <option value="123">gh</option>
                        <option value="21">headache</option>
                        <option value="104">hhh</option>
                        <option value="17">Lower Back Pain</option>
                        <option value="22">lower back pain</option>
                        <option value="112">mathabetha</option>
                        <option value="18">mifupa inauma</option>
                        <option value="103">nausea</option>
                        <option value="98">Swollen Toe</option>
                        <option value="69">Tester</option>
                        <option value="92">Vacancies</option>

                    </select>
                    <br>
                </div>
            </div>
            <div class="diagnosissnosis_div">
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="diagnosis">Diagnosis Report</label>
                    <div class="col-sm-8">
                        <input type="file" class="form-control file dignosisreport" name="diagnosis[]">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-2">
                </div>
                <div class="col-sm-8">
                    <input type="button" value="Add More Report" name="add_more_report" class="add_more_report btn btn-default">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="photo">Image</label>

                <div class="col-sm-8">
                    <input type="file" class="form-control file" name="hmgt_user_avatar">
                </div>

            </div>

        </div>

        <div class="col-md-6">
            <div class="form-group">
                <label class="col-sm-2 control-label" for="address">Address<span class="require-field">*</span></label>
                <div class="col-sm-8">
                    <input id="address" class="form-control validate[required,custom[address_description_validation]]" type="text" maxlength="150" name="address"
                           value="">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label" for="city_name">City<span class="require-field">*</span></label>
                <div class="col-sm-8">
                    <input id="city_name" class="form-control validate[required,custom[city_state_country_validation]]" type="text" name="city_name" maxlength="50"
                           value="">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="state_name">State</label>
                <div class="col-sm-8">
                    <input id="state_name" class="form-control validate[custom[city_state_country_validation]]" type="text" name="state_name" maxlength="50"
                           value="">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="state_name">Country</label>
                <div class="col-sm-8">
                    <input id="country_name" class="form-control validate[custom[city_state_country_validation]]" type="text" name="country_name" maxlength="50"
                           value="">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="zip_code">Zip Code<span class="require-field">*</span></label>
                <div class="col-sm-8">
                    <input id="zip_code" class="form-control  validate[required,custom[onlyLetterNumber]]" type="text" maxlength="15" name="zip_code"
                           value="">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label " for="mobile">Mobile<span class="require-field">*</span></label>
                <div class="col-sm-1" style="padding-right: 0px;">
                    <input type="text" value="+91" class="form-control  validate[required] onlynumber_and_plussign" name="phonecode" maxlength="5">
                </div>
                <div class="col-sm-7">
                    <input id="mobile" class="form-control validate[required,custom[phone_number]] text-input" minlength="6" maxlength="15" type="text" value="" name="mobile">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label " for="phone">Phone</label>
                <div class="col-sm-8">
                    <input id="phone" class="form-control validate[custom[phone_number]] text-input" minlength="6" maxlength="15" type="text" value="" name="phone">
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
                <label class="col-sm-2 control-label" for="username">User Name<span class="require-field">*</span></label>
                <div class="col-sm-8">
                    <input id="username" class="form-control validate[required,custom[username_validation]]" type="text" name="username" maxlength="30"
                           value="">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label" for="password">Password<span class="require-field">*</span></label>
                <div class="col-sm-8">
                    <input id="password" class="form-control validate[required,minSize[8]]" type="password" name="password" maxlength="12" value="">
                </div>
            </div>
        </div>
    </div>


    <div class="col-sm-offset-2 col-sm-8">

        <input type="submit" value="Patient Registration" name="registration_front_patient" class="btn btn-success"/>
    </div>
</form>
</div>
</div>
<!-- .entry-content -->

<link rel="stylesheet" id="wcwm-validate-css-css" href="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/lib/validationEngine/css/validationEngine.jquery.css?ver=5.1.1" type="text/css" media="all"/>
<link rel="stylesheet" id="hmgt-bootstrap-timepicker-css-css" href="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/css/datepicker.min.css?ver=5.1.1" type="text/css" media="all"/>
<link rel="stylesheet" id="jquery-style-css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.2/themes/smoothness/jquery-ui.css?ver=5.1.1" type="text/css" media="all"/>
<script type="text/javascript" src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-includes/js/admin-bar.min.js?ver=5.1.1"></script>
<script type="text/javascript" src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/themes/twentyfifteen/js/skip-link-focus-fix.js?ver=20141010"></script>
<script type="text/javascript">
    /* <![CDATA[ */
    var screenReaderText = {
        "expand": "<span class=\"screen-reader-text\">expand child menu<\/span>",
        "collapse": "<span class=\"screen-reader-text\">collapse child menu<\/span>"
    };
/* ]]> */
</script>
<script type="text/javascript" src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/themes/twentyfifteen/js/functions.js?ver=20150330"></script>
<script type="text/javascript" src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-includes/js/wp-embed.min.js?ver=5.1.1"></script>
<script type="text/javascript" src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/js/jquery-1.11.1.min.js?ver=4.1.1"></script>
<script type="text/javascript" src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/lib/validationEngine/js/languages/jquery.validationEngine-en.js?ver=5.1.1"></script>
<script type="text/javascript" src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/lib/validationEngine/js/jquery.validationEngine.js?ver=5.1.1"></script>
<script type="text/javascript" src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/js/bootstrap-datepicker.js?ver=5.1.1"></script>

</div>
</div>
</asp:Content>