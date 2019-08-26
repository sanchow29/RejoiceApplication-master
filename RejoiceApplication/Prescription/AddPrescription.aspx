<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddPrescription.aspx.cs" Inherits="RejoiceApplication.Prescription.AddPrescription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="page-inner" style="min-height: 1050px;">
<!-- start page inner div-->
<div class="row right_side prescription">
<!-- start dashboard content div-->
<noscript>
    <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
</noscript>
<!-- POP up code -->
<div class="popup-bg" style="z-index: 100000 !important;">
    <div class="overlay-content">
        <div class="modal-content">
            <div class="category_list"></div>
            <div class="prescription_content"></div>
        </div>
    </div>
</div>
<!-- End POP-UP Code -->
<script type="text/javascript">
    jQuery(document).ready(function($) {
        jQuery('#prescription_list').DataTable({
            "responsive": true,
            "order": [[0, "Desc"]],
            "aoColumns": [
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
    });
</script>
<div class="panel-body panel-white">
<!-- START PANEL BODY DIV-->
<ul class="nav nav-tabs panel_tabs" role="tablist">
    <li class="">
        <a href="Prescription.aspx">
            <i class="fa fa-align-justify"></i>Prescription List
        </a>

    </li>
    <li class="active">
        <a href="AddPrescription.aspx" class="tab active">
            <i class="fa fa-plus-circle"></i>Add Prescription
        </a>

    </li>
</ul>
<div class="tab-content">
<!-- START TAB CONTENT DIV-->

<script type="text/javascript">
    jQuery(document).ready(function($) {
        jQuery('#prescription_form')
            .validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });
        jQuery('#doctor_form_outpatient_popup_form_percription')
            .validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });
        jQuery('#medication_id').select2();
        jQuery(".medication_listss").select2();
        $('#symptoms').multiselect({
            nonSelectedText: 'Select Symptoms',
            includeSelectAllOption: true,
            selectAllText: 'Select all'
        });

        $('#report_type').multiselect({
            nonSelectedText: 'Select Report Name',
            includeSelectAllOption: true,
            selectAllText: 'Select all'
        });

        //username not  allow space validation
        $('#username').keypress(function(e) {
            if (e.which === 32)
                return false;
        });

        //birth date validation
        $.fn.datepicker.defaults.format = " yyyy-mm-dd";
        $('.birth_date').datepicker({
            endDate: '+0d',
            autoclose: true

        });

        //add outpatient pop up//

        $('#doctor_form_outpatient_popup_form_percription').on('submit',
            function(e) {
                e.preventDefault();

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
                                if (data == 2) {
                                    alert(
                                        'Sorry, only JPG,JPEG,PNG,GIF,DOC,PDF and ZIP files are allowed.');
                                } else {
                                    var json_obj = $.parseJSON(data);

                                    $('#doctor_form_outpatient_popup_form_percription')
                                        .trigger("reset");
                                    $('#patient_id').append(json_obj[0]);
                                    $('#upload_user_avatar_preview')
                                        .html(
                                            '<img alt="" src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/useriamge/patient.png">');
                                    $('#hmgt_user_avatar_url').val('');

                                    $('.modal').modal('hide');
                                }
                            }
                        },
                        error: function(data) {
                        }
                    });

                }
            });
        $("body").on("click",
            ".remove_cirtificate",
            function() {
                alert("Do you really want to delete this record ?");
                $(this).parent().parent().remove();
            });
        $(".symptoms_alert").click(function() {
            checked = $(".multiselect_validation_symtoms .dropdown-menu input:checked").length;
            if (!checked) {
                alert("Please select atleast one Symptoms");
                return false;
            }
        });
    });
</script>

<div class="tab-pane fade active in" id="add_Prescription">
<!-- START TAB PANE DIV-->

<div class="panel-body">
<!-- START PANEL BODY DIV-->
<form name="prescription_form" action="" method="post" class="form-horizontal" id="prescription_form">
<!-- STRT Prescription FORM-->
<input type="hidden" name="action" value="insert">
<input type="hidden" name="prescription_id" value=""/>
<input type="hidden" name="doctor_id" value="2">
<div class="form-group">
    <label class="col-sm-2 control-label" for="patient_id">Patient<span class="require-field">*</span></label>
    <div class="col-sm-8 margin_bottom_5px">
        <select name="patient_id" class="form-control validate[required]" id="patient_id">
            <option value="">Select Patient</option>
            <option value="35">Nina Cadela - P160419</option>
            <option value="57">R R - P370519</option>
            <option value="104">rer e - P840819</option>
            <option value="54">aaaa aaa - P340519</option>
            <option value="70">aaannnnn bbb - P500519</option>
            <option value="59">Abhijit Borgohain - P390519</option>
            <option value="64">Apj Kalam - P440519</option>
            <option value="97">ashok kumar - P770719</option>
            <option value="96">ashok kumar - P760719</option>
            <option value="4">Ashish Ranjan - P20319</option>
            <option value="48">Amel Ali - P280419</option>
            <option value="109">Andile Zulu - P890819</option>
            <option value="7">Anna Sanz - P50319</option>
            <option value="63">Treatment Range - P430519</option>
            <option value="95">Adi Nugroho - P750719</option>
            <option value="50">gab girbaci - P300419</option>
            <option value="47">Kristopher Davis - P270419</option>
            <option value="77">claudiu ciubotaru - P570619</option>
            <option value="88">NiftecsPOS Ombachi - P680719</option>
            <option value="110">David Urrego - P900819</option>
            <option value="31">akshay sarwade - P120419</option>
            <option value="34">prayag bhaler - P150419</option>
            <option value="90">damien schuling - P700719</option>
            <option value="83">Favour Isoah - P630619</option>
            <option value="100">fdsfdsf dsfsdfsdf - P800819</option>
            <option value="86">abc def - P660619</option>
            <option value="42">Joshua Altio - P220419</option>
            <option value="41">Joshua Altio - P210419</option>
            <option value="101">Haris Abbas - P810819</option>
            <option value="43">hendra wijaya - P230419</option>
            <option value="89">matthew kargbo - P690719</option>
            <option value="74">jong test - P540619</option>
            <option value="106">Igor Negromonte - P860819</option>
            <option value="105">Emran Imran - P850819</option>
            <option value="107">ahmed ahmed - P870819</option>
            <option value="81">Ilyas Awan - P610619</option>
            <option value="92">Eugene Ciervo - P720719</option>
            <option value="55">pooja chaudhery - P350519</option>
            <option value="62">uu ui - P420519</option>
            <option value="39">king hytrd - P190419</option>
            <option value="87">kkk k - P670619</option>
            <option value="73">Kartik Bhatt - P530519</option>
            <option value="99">kumar singh - P790719</option>
            <option value="98">mark masai manu - P780719</option>
            <option value="82">Johnson Landzro - P620619</option>
            <option value="8">Lucas M - P60319</option>
            <option value="49">Ahmed Ahme - P290419</option>
            <option value="65">testq proba - P450519</option>
            <option value="6">Mario Rossi - P40319</option>
            <option value="69">John Owner - P490519</option>
            <option value="103">maxmuts muutus - P830819</option>
            <option value="51">test test - P310419</option>
            <option value="91">Mustufa Aghadi - P710719</option>
            <option value="32">prayag bhaler - P130419</option>
            <option value="85">Onder Gulec - P650619</option>
            <option value="84">ttttt tt - P640619</option>
            <option value="5">John Mark - P30319</option>
            <option value="3">Jose Figueroa - P10319</option>
            <option value="60">patient p - P400519</option>
            <option value="61">patiente p - P410519</option>
            <option value="68">test SINHA - P480519</option>
            <option value="94">sddsa dassss - P740719</option>
            <option value="108">Renan Remi - P880819</option>
            <option value="58">Nico Alderson - P380519</option>
            <option value="53">abc PANDIT - P330419</option>
            <option value="29">muhammed shameem - P100419</option>
            <option value="46">Carlos Roberto Carlos Roberto - P260419</option>
            <option value="66">mohammad khan - P460519</option>
            <option value="79">juan juanxin - P590619</option>
            <option value="37">stan Ngaguthii - P170419</option>
            <option value="75">tan me - P550619</option>
            <option value="44">Test Test - P240419</option>
            <option value="45">Test Test - P250419</option>
            <option value="71">testaaa testaaa - P510519</option>
            <option value="52">Moses Peter - P320419</option>
            <option value="72">Abd ASb - P520519</option>
            <option value="76">TJ med - P560619</option>
            <option value="102">tiny tim - P820819</option>
            <option value="40">Tony Stark - P200419</option>
            <option value="56">Ulisses Silva - P360519</option>
            <option value="38">AS as - P180419</option>
            <option value="67">Everton Muta - P470519</option>
            <option value="80">Vishal Singh - P600619</option>
            <option value="27">Vivekanand Adkatalwar - P80319</option>
            <option value="93">Le Thanh - P730719</option>
            <option value="78">Zeeshan Asghar - P580619</option>
        </select>

    </div>
    <!--ADD OUT PATIENT POPUP BUTTON -->
    <div class="col-sm-2">

        <a href="#" class="btn btn-default" data-toggle="modal" data-target="#myModal_add_outpatient">Add Outpatient</a>

    </div>
</div>
<div class="form-group convert_patient">
</div>
<div class="form-group">
    <label class="col-sm-2 control-label" for="patient_id">Type<span class="require-field">*</span></label>
    <div class="col-sm-8">
        <label class="radio-inline">
            <input type="radio" value="treatment" class="tog validate[required]" name="prescription_type" checked="checked"/>Treatment
        </label>
        <label class="radio-inline">
            <input type="radio" value="report" class="tog validate[required]" name="prescription_type"/>Report
        </label>
    </div>
</div>
<div id="tretment_div">
    <div class="form-group">
        <label class="col-sm-2 control-label" for="treatment_id">Treatment<span class="require-field">*</span></label>
        <div class="col-sm-8">

            <select name="treatment_id" class="form-control validate[required]" name="treatment_id">
                <option value="">Select Treatment</option>
                <option value="1">Ankle Surgery</option>
                <option value="2">asghar najafi</option>
                <option value="3">Hepatology</option>
                <option value="4">ICD10</option>
                <option value="5">Liver and kidney test</option>
                <option value="6">malaria therapy</option>
                <option value="7">test</option>
                <option value="8">EXODONTIA</option>
                <option value="9">kabsool</option>
                <option value="10">reegerg</option>
                <option value="11">asdasd</option>
                <option value="12">dkjfhsdghfsjkdhfks</option>
                <option value="13">hyperbaric </option>
                <option value="14">3 sesiiones 123</option>
                <option value="15">qwerty</option>
                <option value="16">qwerty</option>
                <option value="17">defribillation</option>
                <option value="18">Ortodoncia</option>
                <option value="19">Exodoncia</option>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label" for="case_history">Case History<span class="require-field">*</span></label>
        <div class="col-sm-8">
            <textarea id="case_history" maxlength="150" class="form-control validate[required,custom[address_description_validation]]" name="case_history"></textarea>
        </div>
    </div>
    <div id="invoice_medicine_entry">
        <div class="form-group">
            <label class="col-sm-2 control-label" for="medication">Medication<span class="require-field">*</span></label>
            <div class="col-sm-3">
                <select name="medication[]" id="medication_id" class="form-control">
                    <option data-tokens="Augmentine" value="1">Augmentine</option>
                    <option data-tokens="Docefrez" value="2">Docefrez</option>
                    <option data-tokens="Pacimol" value="4">Pacimol</option>
                    <option data-tokens="Pacimol" value="5">Pacimol</option>
                    <option data-tokens="bodrek" value="6">bodrek</option>
                    <option data-tokens="Ibuprofeno" value="7">Ibuprofeno</option>
                    <option data-tokens="abc" value="8">abc</option>
                    <option data-tokens="555" value="9">555</option>
                    <option data-tokens="kkk" value="10">kkk</option>
                    <option data-tokens="vcgcfgvcgc" value="11">vcgcfgvcgc</option>
                    <option data-tokens="asdasd" value="12">asdasd</option>
                    <option data-tokens="peracip" value="13">peracip</option>
                    <option data-tokens="ewwe" value="14">ewwe</option>
                </select>
            </div>
            <div class="col-sm-1 margin_bottom_5px padding_left_right_15px" style="padding: 0px">
                <select name="times1[]" class="form-control validate[required]">
                    <option value="">Frequency</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                </select>
            </div>
            <div class="col-sm-1 margin_bottom_5px width_50_per" style="padding-right: 0px;">
                <input id="days" class="form-control validate[required]" type="number" step="1" maxlength="2" min="0" value="" name="days[]" placeholder="No Of">
            </div>
            <div class="col-sm-1 margin_bottom_5px width_50_per" style="padding-right: 0px;">
                <select name="time_period[]" class="form-control validate[required]">
                    <option value="day">Day</option>
                    <option value="week">Week</option>
                    <option value="month">Month</option>
                    <option value="hour">Hour</option>
                </select>
            </div>
            <div class="col-sm-2">
                <select name="takes_time[]" class="form-control validate[required]">
                    <option value="">When to take</option>
                    <option value="before_breakfast">Before Breakfast</option>
                    <option value="after_meal">After Meal</option>
                    <option value="before_meal">Before Meal</option>
                    <option value="night">Night </option>
                </select>
            </div>
            <div class="col-sm-1">
            </div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="invoice_entry"></label>
        <div class="col-sm-3">
            <p id="add_new_medicine_entry" class="btn btn-default btn-sm btn-icon icon-left" name="add_new_entry">
                Add Medicine Data
            </p>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="note">Note</label>
        <div class="col-sm-8">
            <textarea id="note" class="form-control validate[custom[address_description_validation]]" maxlength="150" name="note"> </textarea>
        </div>
    </div>
    <div id="custom_label">
        <div class="form-group">
            <label class="col-sm-2 control-label" for="income_entry">Custom Field</label>
            <div class="col-sm-2 margin_bottom_5px">
                <input id="income_amount" class="form-control text-input validate[custom[onlyLetter_specialcharacter]]" maxlength="30" type="text" value="" name="custom_label[]" placeholder="Field lable">
            </div>
            <div class="col-sm-4 margin_bottom_5px">
                <input id="income_entry" class="form-control text-input validate[custom[address_description_validation]]" type="text" maxlength="50" value="" name="custom_value[]" placeholder="Field value">
            </div>
            <div class="col-sm-2 margin_bottom_5px">
                <button type="button" class="btn btn-default" onclick="deleteParentElement(this)">
                    <i class="entypo-trash">Delete</i>
                </button>
            </div>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label" for="income_entry"></label>
        <div class="col-sm-3">

            <button id="add_new_entry" class="btn btn-default btn-sm btn-icon icon-left" type="button" name="add_new_entry" onclick="add_custom_label()">Add More Field </button>
        </div>
    </div>
</div>

<div id="prescription_report_div">
    <div class="form-group">
        <label class="col-sm-2 control-label" for="patient">Report Type<span class="require-field">*</span></label>
        <div class="col-sm-8 multiselect_validation_Report margin_bottom_5px">
            <select class="form-control reportlist_list report_type" multiple="multiple" name="report_type[]" id="report_type">
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
    <div class="form-group">
        <label class="col-sm-2 control-label">Report Description<span class="require-field">*</span></label>
        <div class="col-sm-8">
            <textarea id="" maxlength="150" class="form-control validate[required,custom[address_description_validation]]" name="report_description"></textarea>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label " for="enable">Doctor Visiting Charge</label>
        <div class="col-sm-8">
            <div class="checkbox">
                <label>
                    <input id="doctor_visiting_charge" type="checkbox" value="1" name="doctor_visiting_charge">
                </label>
            </div>
        </div>
    </div>
    <input type="hidden" id="_wpnonce" name="_wpnonce" value="d2040f40a0"/><input type="hidden" name="_wp_http_referer" value="/mojoomla/extend/wordpress/hospital/?dashboard=user&amp;page=prescription&amp;tab=addprescription&amp;action=insert"/>
    <div class="form-group">
        <label class="col-sm-2 control-label " for="enable">Doctor Consulting Charge</label>
        <div class="col-sm-8">
            <div class="checkbox">
                <label>
                    <input id="doctor_consulting_charge" type="checkbox" value="1" name="doctor_consulting_charge" checked>
                </label>
            </div>
        </div>
    </div>
</div>
<div class="col-sm-offset-2 col-sm-8">
    <input type="submit" value="Create Prescription" name="save_prescription" class="btn btn-success"/>
</div>

</form>
<!-- END Prescription FORM-->
</div>
<!-- END PANEL BODY DIV-->
</div>
<!-- END TAB PANE DIV-->
</div>
<!-- END TAB CONTENTDIV-->
</div>
<script>

    var blank_custom_label = '';
    $(document).ready(function() {
        blank_custom_label = $('#custom_label').html();

    });

    function add_custom_label() {
        $("#custom_label").append(blank_custom_label);

    }

    function deleteParentElement(n) {
        alert("Do you really want to delete this record");
        n.parentNode.parentNode.parentNode.removeChild(n.parentNode.parentNode);
    }

</script>

<!----------ADD Outpatient------------->
<div class="modal fade" id="myModal_add_outpatient" role="dialog" style="overflow: scroll;">
<!-- START MODAL FADE DIV-->

<div class="modal-dialog modal-lg">
<<!-- START MODAL DIALOG DIV-->
<div class="modal-content">
<!-- START MODAL CONTENT DIV-->
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">&times;</button>
    <h3 class="modal-title">Add Outpatient</h3>
</div>
<div id="message" class="updated below-h2 show_msg">
    <p>
        Sorry, only JPG, JPEG, PNG & GIF And BMP files are allowed.
    </p>
</div>
<div class="modal-body">
<!-- START MODAL BODY DIV-->
<form name="out_patient_form" action="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-admin/admin-ajax.php" method="post" class="form-horizontal" id="doctor_form_outpatient_popup_form_percription" enctype="multipart/form-data">
<!-- START Outpatient FORM-->
<input type="hidden" name="action" value="MJ_hmgt_save_outpatient_popup_form_template">

<div class="header">
    <h3 class="first_hed">Personal Information</h3>
    <hr>
</div>
<input type="hidden" name="role" value="patient"/>
<input type="hidden" name="patient_type" value="outpatient"/>
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
        <input class="form-control validate[required] birth_date " type="text" name="birth_date"
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
            <input type="radio" value="male" class="tog validate[required]" name="gender" checked="checked"/>Male
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
        <input id="zip_code" class="form-control validate[required,custom[onlyLetterNumber]]" type="text" maxlength="15" name="zip_code"
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
        <input id="username" class="form-control validate[required,custom[username_validation]]" maxlength="30" type="text" name="username"
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
    <div class="col-sm-3 margin_bottom_5px">

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
<!--<div class="form-group">
    <label class="col-sm-2 control-label" for="medicine">Medicine<span class="require-field">*</span></label>
    <div class="col-sm-8">
        <textarea id="medicine" class="form-control validate[required]" name="medicine"> </textarea>
    </div>
</div>-->
<div class="diagnosissnosis_div">
    <div class="form-group">
        <label class="col-sm-2 control-label" for="diagnosis">Diagnosis Report</label>
        <div class="col-sm-3">
            <input type="file" class="form-control file dignosisreport" name="diagnosis[]">
        </div>
    </div>
</div>
<div class="form-group">
    <div class="col-sm-2">
    </div>
    <div class="col-sm-2">
        <input type="button" value="Add More Report" name="add_more_report" class="add_more_report_fronted btn btn-default">
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
<!-- END Outpatient FORM-->

</div>
<!-- END MODAL BODY DIV-->
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

</div>
</div>
<!-- END MODAL CONTENT DIV-->
</div>
<!-- START MODAL DIAGLOG DIV-->
</div>
<!-- END MODAL FADE DIV-->
</div>
</div>
</asp:Content>