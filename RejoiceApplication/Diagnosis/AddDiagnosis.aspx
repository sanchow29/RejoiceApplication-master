<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddDiagnosis.aspx.cs" Inherits="RejoiceApplication.Diagnosis.AddDiagnosis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="page-inner" style="min-height: 1050px;">
<div class="popup-bg">
    <div class="overlay-content content_width">
        <div class="modal-content" style="border-top: 5px solid #22baa0;">
            <div class="task_event_list">
            </div>
        </div>
    </div>
</div>
<!-- start page inner div-->
<div class="row right_side diagnosis">
<!-- start dashboard content div-->
<noscript>
    <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
</noscript>


<script type="text/javascript">
    jQuery(document).ready(function($) {
        $('#diagnosis1').DataTable({
            "responsive": true,
            "order": [[0, "Desc"]],
            "aoColumns": [
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
        $('#diagnosis_request_list').DataTable({
            "responsive": true,
            "order": [[0, "Desc"]],
            "aoColumns": [
                { "bSortable": true },
                { "bSortable": true },
                { "bSortable": true },
                { "bVisible": true },
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


        $('#diagnosis_form').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });
        $('#doctor_form_outpatient_popup_form_percription')
            .validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });
        $('#symptoms').multiselect({
            nonSelectedText: 'Select Symptoms',
            includeSelectAllOption: true,
            selectAllText: 'Select all'
        });
        var date = new Date();
        date.setDate(date.getDate() - 0);
        $.fn.datepicker.defaults.format = " yyyy-mm-dd";
        $('.birth_date').datepicker({
            startDate: date,
            autoclose: true
        });

        //add outpatient pop up//

        $('#doctor_form_outpatient_popup_form_percription').on('submit',
            function(e) {
                e.preventDefault();

                //var form = $(this).serialize();
                var valid = $('#doctor_form_outpatient_popup_form_percription')
                    .validationEngine('validate');
                if (valid == true) {
                    var form = new FormData(this);

                    $.ajax({
                        type: "POST",
                        url: $(this).attr('action'),
                        data: form,
                        cache: false,
                        contentType: false,
                        processData: false,
                        success: function(data) {
                            if (data != "") {
                                var json_obj = $.parseJSON(data);

                                $('#doctor_form_outpatient_popup_form_percription').trigger("reset");
                                $('#patient').append(json_obj[0]);

                                $('#upload_user_avatar_preview')
                                    .html(
                                        '<img alt="" src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/useriamge/patient.png">');
                                $('#hmgt_user_avatar_url').val('');

                                $('.modal').modal('hide');
                            }
                        },
                        error: function(data) {
                        }
                    })

                }
            });
        $('#report_type').multiselect({
            nonSelectedText: 'Select Report Name',
            includeSelectAllOption: true,
            selectAllText: 'Select all'
        });
        $('.tax_charge').multiselect({
            nonSelectedText: 'Select Tax',
            includeSelectAllOption: true,
            selectAllText: 'Select all'
        });

        $(".symptoms_alert").click(function() {
            checked = $(".multiselect_validation_symtoms .dropdown-menu input:checked").length;
            if (!checked) {
                alert("Please select atleast one Symptoms");
                return false;
            }
        });

        $('#dagnosis_report_form').on('submit',
            function(e) {
                e.preventDefault();
                var form = $(this).serialize();
                var valid = $("#dagnosis_report_form").validationEngine('validate');
                if (valid == true) {
                    $.ajax(
                        {
                            type: "POST",
                            url: $(this).attr('action'),
                            data: form,
                            success: function(data) {
                                $('#dagnosis_report_form').trigger("reset");
                                $('.modal').modal('hide');

                                window.location.href = window.location.href + "&message=4";
                            },
                            error: function(data) {
                            }
                        })

                }
            });

        $("body").on("click",
            ".update_dagnosis_report",
            function(event) {
                var report_status = $(this).attr('report_status');
                var pescription_id = $(this).attr('priscription_id');
                $(".report_status").val(report_status);
                $(".pescription").val(pescription_id);

            });
        $(".save_diagnosis").click(function() {
            checked = $(".multiselect_validation_Report .dropdown-menu input:checked").length;
            if (!checked) {
                alert("Please select at least one report type");
                return false;
            }
        });
    });
</script>
<!-- POP up code -->
<div class="popup-bg" style="z-index: 100000 !important;">
    <div class="overlay-content overlay_content_css">
        <div class="modal-content">
            <div class="notice_content"></div>
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
        <a href="Diagnosis.aspx" class="tab ">
            <i class="fa fa-align-justify"></i>Diagnosis Report List
        </a>

    </li>
    <li class="active">
        <a href="AddDiagnosis.aspx" class="tab active">
            <i class="fa fa-plus-circle"></i>Add Diagnosis Report
        </a>
    </li>

</ul>
<div class="panel-body">
    <!--START PANEL BODY DIV-->
    <form name="diagnosis_form" action="" method="post" class="form-horizontal" id="diagnosis_form" enctype="multipart/form-data">
        <!--START DIGNOSIS FORM-->
        <input type="hidden" id="action_name" name="action" value="insert">
        <input type="hidden" id="diagnosisid" name="diagnosisid" value=""/>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="patient_id">Patient<span class="require-field">*</span></label>
            <div class="col-sm-8 margin_bottom_5px">
                <select name="patient_id" id="patient" class="form-control validate[required] ">
                    <option value="">Select Patient</option>
                    <option value="35">Nina Cadela-P160419 </option>
                    <option value="57">R R-P370519 </option>
                    <option value="104">rer e-P840819 </option>
                    <option value="54">aaaa aaa-P340519 </option>
                    <option value="70">aaannnnn bbb-P500519 </option>
                    <option value="59">Abhijit Borgohain-P390519 </option>
                    <option value="64">Apj Kalam-P440519 </option>
                    <option value="97">ashok kumar-P770719 </option>
                    <option value="96">ashok kumar-P760719 </option>
                    <option value="4">Ashish Ranjan-P20319 </option>
                    <option value="48">Amel Ali-P280419 </option>
                    <option value="109">Andile Zulu-P890819 </option>
                    <option value="7">Anna Sanz-P50319 </option>
                    <option value="63">Treatment Range-P430519 </option>
                    <option value="95">Adi Nugroho-P750719 </option>
                    <option value="50">gab girbaci-P300419 </option>
                    <option value="47">Kristopher Davis-P270419 </option>
                    <option value="77">claudiu ciubotaru-P570619 </option>
                    <option value="88">NiftecsPOS Ombachi-P680719 </option>
                    <option value="110">David Urrego-P900819 </option>
                    <option value="31">akshay sarwade-P120419 </option>
                    <option value="34">prayag bhaler-P150419 </option>
                    <option value="90">damien schuling-P700719 </option>
                    <option value="83">Favour Isoah-P630619 </option>
                    <option value="100">fdsfdsf dsfsdfsdf-P800819 </option>
                    <option value="86">abc def-P660619 </option>
                    <option value="42">Joshua Altio-P220419 </option>
                    <option value="41">Joshua Altio-P210419 </option>
                    <option value="101">Haris Abbas-P810819 </option>
                    <option value="43">hendra wijaya-P230419 </option>
                    <option value="89">matthew kargbo-P690719 </option>
                    <option value="74">jong test-P540619 </option>
                    <option value="106">Igor Negromonte-P860819 </option>
                    <option value="105">Emran Imran-P850819 </option>
                    <option value="107">ahmed ahmed-P870819 </option>
                    <option value="81">Ilyas Awan-P610619 </option>
                    <option value="92">Eugene Ciervo-P720719 </option>
                    <option value="55">pooja chaudhery-P350519 </option>
                    <option value="62">uu ui-P420519 </option>
                    <option value="39">king hytrd-P190419 </option>
                    <option value="87">kkk k-P670619 </option>
                    <option value="73">Kartik Bhatt-P530519 </option>
                    <option value="99">kumar singh-P790719 </option>
                    <option value="98">mark masai manu-P780719 </option>
                    <option value="82">Johnson Landzro-P620619 </option>
                    <option value="8">Lucas M-P60319 </option>
                    <option value="49">Ahmed Ahme-P290419 </option>
                    <option value="65">testq proba-P450519 </option>
                    <option value="6">Mario Rossi-P40319 </option>
                    <option value="69">John Owner-P490519 </option>
                    <option value="103">maxmuts muutus-P830819 </option>
                    <option value="51">test test-P310419 </option>
                    <option value="91">Mustufa Aghadi-P710719 </option>
                    <option value="32">prayag bhaler-P130419 </option>
                    <option value="85">Onder Gulec-P650619 </option>
                    <option value="84">ttttt tt-P640619 </option>
                    <option value="5">John Mark-P30319 </option>
                    <option value="3">Jose Figueroa-P10319 </option>
                    <option value="60">patient p-P400519 </option>
                    <option value="61">patiente p-P410519 </option>
                    <option value="68">test SINHA-P480519 </option>
                    <option value="94">sddsa dassss-P740719 </option>
                    <option value="108">Renan Remi-P880819 </option>
                    <option value="58">Nico Alderson-P380519 </option>
                    <option value="53">abc PANDIT-P330419 </option>
                    <option value="29">muhammed shameem-P100419 </option>
                    <option value="46">Carlos Roberto Carlos Roberto-P260419 </option>
                    <option value="66">mohammad khan-P460519 </option>
                    <option value="79">juan juanxin-P590619 </option>
                    <option value="37">stan Ngaguthii-P170419 </option>
                    <option value="75">tan me-P550619 </option>
                    <option value="44">Test Test-P240419 </option>
                    <option value="45">Test Test-P250419 </option>
                    <option value="71">testaaa testaaa-P510519 </option>
                    <option value="52">Moses Peter-P320419 </option>
                    <option value="72">Abd ASb-P520519 </option>
                    <option value="76">TJ med-P560619 </option>
                    <option value="102">tiny tim-P820819 </option>
                    <option value="40">Tony Stark-P200419 </option>
                    <option value="56">Ulisses Silva-P360519 </option>
                    <option value="38">AS as-P180419 </option>
                    <option value="67">Everton Muta-P470519 </option>
                    <option value="80">Vishal Singh-P600619 </option>
                    <option value="27">Vivekanand Adkatalwar-P80319 </option>
                    <option value="93">Le Thanh-P730719 </option>
                    <option value="78">Zeeshan Asghar-P580619 </option>
                </select>

            </div>
            <!--ADD OUT PATIENT POPUP BUTTON -->
            <div class="col-sm-2">
                <!--<a href="?page=gmgt_staff&tab=add_staffmember" class="btn btn-default"> Add Doctor</a>-->
                <a href="#" class="btn btn-default" data-toggle="modal" data-target="#myModal_add_outpatient">Add Outpatient</a>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="patient">Report Type<span class="require-field">*</span></label>
            <div class="col-sm-8 multiselect_validation_Report margin_bottom_5px">
                <select class="form-control reportlist_list report_type dignosis_upload" multiple="multiple" name="report_type[]" id="report_type">

                    <option value="114">150</option>

                    <option value="127">ca</option>

                    <option value="146">CBP</option>

                    <option value="102">HB</option>

                    <option value="182">Liver </option>

                    <option value="120">Sangre</option>

                    <option value="179">visit</option>

                    <option value="174">XYz</option>

                </select>
                <br>
            </div>
            <div class="col-sm-2">
                <button id="addremove" model="report_type">Add Or Remove</button>
            </div>
        </div>

        <div class="add_document_div_main_class">
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="report_cost">Report Total Cost (&#36;)</label>
            <div class="col-sm-8">
                <input type="hidden" name="cost" class="cost" value="">
                <input type="hidden" name="report_tax" class="report_tax" value="">
                <input id="report_cost" class="form-control  text-input report_cost" min="0" type="number" onkeypress="if (this.value.length == 8) return false;" step="0.01" value="" name="report_cost" readonly>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="description">Description</label>
            <div class="col-sm-8">
                <textarea id="diagno_description" class="form-control validate[custom[address_description_validation]]" maxlength="150" name="diagno_description"> </textarea>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label " for="enable">Send Email to Patient </label>
            <div class="col-sm-8">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" value="1" name="hmgt_send_mail_to_patient">
                    </label>
                </div>

            </div>
        </div>
        <input type="hidden" id="_wpnonce" name="_wpnonce" value="1ede8c06d7"/><input type="hidden" name="_wp_http_referer" value="/mojoomla/extend/wordpress/hospital/?dashboard=user&amp;page=diagnosis&amp;tab=adddiagnosis&amp;action=insert"/>
        <div class="form-group">
            <label class="col-sm-2 control-label " for="enable">Send Email to Doctor </label>
            <div class="col-sm-8">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" value="1" name="hmgt_send_mail_to_doctor" checked>
                    </label>
                </div>

            </div>
        </div>
        <div class="col-sm-offset-2 col-sm-8">
            <input type="submit" id="dignosisreport" value="Save" name="save_diagnosis" class="btn btn-success save_diagnosis"/>
        </div>
    </form>
    <!--END DIGNOSI SFORM -->
</div>
<!--END PANEL BODY DIV-->


</div>
</div>
<!----------ADD Outpatient------------->
<div class="modal fade" id="myModal_add_outpatient" role="dialog" style="overflow: scroll;">
<!--START MODAL FADE DIV-->
<div class="modal-dialog modal-lg">
<!--START MODAL DiaLOG DIV-->
<div class="modal-content">
<!--START MODAL CONTENT DIV-->
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">&times;</button>
    <h3 class="modal-title">Add Outpatient</h3>
</div>
<div class="modal-body">
<!--START MODAL BODY DIV-->
<form name="out_patient_form" action="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-admin/admin-ajax.php" method="post" class="form-horizontal" id="doctor_form_outpatient_popup_form_percription" enctype="multipart/form-data">
    <input type="hidden" name="action" value="MJ_hmgt_save_outpatient_popup_form_template">

    <input type="hidden" name="role" value="patient"/>
    <input type="hidden" name="patient_type" value="outpatient"/>
    <div class="header">
        <h3 class="first_hed">Personal Information</h3>
        <hr>
    </div>
    <div class="form-group">
        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="roll_id">Patient Id<span class="require-field">*</span></label>
        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
            <input id="patient_id" class="form-control validate[required]" type="text"
                   value="P910819" readonly name="patient_id">
        </div>
        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="first_name">First Name<span class="require-field">*</span></label>
        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
            <input id="first_name" class="form-control validate[required,custom[onlyLetter_specialcharacter]] text-input" maxlength="50" type="text" value="" name="first_name">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="middle_name">Middle Name</label>
        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
            <input id="middle_name" class="form-control validate[custom[onlyLetter_specialcharacter]]" type="text" maxlength="50" value="" name="middle_name">
        </div>
        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="last_name">Last Name<span class="require-field">*</span></label>
        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
            <input id="last_name" class="form-control validate[required,custom[onlyLetter_specialcharacter]] text-input" maxlength="50" type="text" value="" name="last_name">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="birth_date">Date of birth<span class="require-field">*</span></label>
        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
            <input class="form-control validate[required] birth_date" type="text" name="birth_date"
                   value="" readonly>
        </div>
        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="blood_group">Blood Group</label>
        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">

            <select id="blood_group" class="form-control" name="blood_group">
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
        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="gender">Gender<span class="require-field">*</span></label>
        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
            <label class="radio-inline">
                <input type="radio" value="male" class="tog validate[required]" name="gender" checked='checked'/>Male
            </label>
            <label class="radio-inline">
                <input type="radio" value="female" class="tog validate[required]" name="gender"/>Female
            </label>
        </div>
    </div>
    <div class="header">
        <h3>HomeTown Address Information</h3>
        <hr>
    </div>
    <div class="form-group">
        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="address">Home Town Address<span class="require-field">*</span></label>
        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
            <input id="address" class="form-control validate[required,custom[address_description_validation]]" type="text" maxlength="150" name="address"
                   value="">
        </div>
        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="city_name">City<span class="require-field">*</span></label>
        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
            <input id="city_name" class="form-control validate[required,custom[city_state_country_validation]]" type="text" maxlength="50" name="city_name"
                   value="">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="state_name">State</label>
        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
            <input id="state_name" class="form-control validate[custom[city_state_country_validation]]" type="text" maxlength="50" name="state_name"
                   value="">
        </div>
        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="state_name">Country</label>
        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
            <input id="country_name" class="form-control validate[custom[city_state_country_validation]]" type="text" maxlength="50" name="country_name"
                   value="">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="zip_code">Zip Code<span class="require-field">*</span></label>
        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
            <input id="zip_code" class="form-control  validate[required,custom[onlyLetterNumber]]" type="text" maxlength="15" name="zip_code"
                   value="">
        </div>
    </div>
    <div class="header">
        <h3>Contact Information</h3>
        <hr>
    </div>
    <div class="form-group">
        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label  " for="mobile">Mobile Number<span class="require-field">*</span></label>
        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-12 margin_bottom_5px">
            <input type="text" value="+91" class="form-control  validate[required] onlynumber_and_plussign" name="phonecode" maxlength="5">
        </div>
        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 has-feedback">
            <input id="mobile" class="form-control validate[required,custom[phone_number]] text-input" minlength="6" maxlength="15" type="text" value="" name="mobile">
        </div>
        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label " for="phone">Phone</label>
        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
            <input id="phone" class="form-control validate[custom[phone_number]] text-input" minlength="6" maxlength="15" type="text" value="" name="phone">
        </div>
    </div>
    <div class="header">
        <h3>Login Information</h3>
        <hr>
    </div>
    <div class="form-group">
        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label " for="email">Email<span class="require-field">*</span></label>
        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
            <input id="email" class="form-control validate[required,custom[email]] text-input" maxlength="100" type="text" name="email"
                   value="">
        </div>
        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="username">User Name<span class="require-field">*</span></label>
        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
            <input id="username" class="form-control validate[required,custom[username_validation]]" type="text" maxlength="30" name="username"
                   value="">
        </div>
    </div>
    <div class="form-group">
        <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label" for="password">Password<span class="require-field">*</span></label>
        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 has-feedback">
            <input id="password" class="form-control validate[required,minSize[8]]" type="password" maxlength="12" name="password" value="">
        </div>
    </div>
    <div class="header">
        <h3>Other Information</h3>
        <hr>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="doctor">Assign Doctor</label>
        <div class="col-sm-3">

            <select name="doctor" id="doctor" class="form-control">

                <option>select Doctor</option>
                <option value="2">Fernando Therrien - Cardiologists</option>

            </select>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label" for="symptoms">Symptoms<span class="require-field">*</span></label>
        <div class="col-sm-3 multiselect_validation_symtoms margin_bottom_5px">
            <select class="form-control symptoms_list" multiple="multiple" name="symptoms[]" id="symptoms">
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
        <div class="col-sm-2">
            <button id="addremove" model="symptoms">Add Or Remove</button>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="photo">Image</label>
        <div class="col-sm-3">
            <input type="hidden" id="hmgt_user_avatar_url" class="form-control" name="hmgt_user_avatar_url" readonly/>
            <input type="hidden" name="hidden_upload_user_avatar_image">
            <input id="upload_user_avatar_image" name="upload_user_avatar_image" type="file" class="form-control file" value="Upload image"/>
        </div>
        <div class="clearfix"></div>

        <div class="col-sm-offset-2 col-sm-8">
            <div id="upload_user_avatar_preview">
                <img class="image_preview_css" alt="" src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/useriamge/patient.png">
            </div>
        </div>
    </div>
    <div class="col-sm-offset-2 col-sm-8">

        <input type="submit" value="Save Patient" name="save_outpatient" class="btn btn-success symptoms_alert"/>
    </div>
</form>
</div>
<!--END MODAL BODY DIV-->
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

</div>
</div>
<!--END MODAL CONTENT DIV-->
</div>
<!--END MODAL DiaLOG DIV-->
</div>
<!--END MODAL FADE DIV-->
</div>

</asp:Content>