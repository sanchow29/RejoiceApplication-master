<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Prescription.aspx.cs" Inherits="RejoiceApplication.Prescription.Prescription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <div class="popup-bg">
            <div class="overlay-content content_width">
                <div class="modal-content" style="border-top: 5px solid #22baa0;">
                    <div class="task_event_list">
                    </div>
                </div>
            </div>
        </div>
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
                    jQuery(document).ready(function ($) {
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
                            language: { "sEmptyTable": "No data available in table", "sInfo": "Showing _START_ to _END_ of _TOTAL_ entries", "sInfoEmpty": "Showing 0 to 0 of 0 entries", "sInfoFiltered": "(filtered from _MAX_ total entries)", "sInfoPostFix": "", "sInfoThousands": ",", "sLengthMenu": "Show _MENU_ entries", "sLoadingRecords": "Loading...", "sProcessing": "Processing...", "sSearch": "Search:", "sZeroRecords": "No matching records found", "oPaginate": { "sFirst": "First", "sLast": "Last", "sNext": "Next", "sPrevious": "Previous" }, "oAria": { "sSortAscending": ": activate to sort column ascending", "sSortDescending": ": activate to sort column descending" } }
                        });
                    });
                </script>
                <div class="panel-body panel-white">
                    <!-- START PANEL BODY DIV-->
                    <ul class="nav nav-tabs panel_tabs" role="tablist">
                        <li class="active">
                            <a href="Prescription.aspx">
                                <i class="fa fa-align-justify"></i>Prescription List
                            </a>

                        </li>
                        <li class="">
                            <a href="AddPrescription.aspx" class="tab ">
                                <i class="fa fa-plus-circle"></i>Add Prescription
                            </a>

                        </li>
                    </ul>
                    <div class="tab-content">
                        <!-- START TAB CONTENT DIV-->
                        <div class="tab-pane fade active in" id="prescription">
                            <!-- START TAB PANE DIV-->
                            <div class="panel-body">
                                <!-- START PANEL BODY DIV-->
                                <div class="table-responsive">
                                    <!-- START TABLE RESPONSIVE DIV-->
                                    <table id="prescription_list" class="display dataTable " cellspacing="0" width="100%">
                                        <!-- START PRESCRIPTION LIST TABLE-->
                                        <thead>
                                            <tr>
                                                <th>Date</th>
                                                <th>Patient ID</th>
                                                <th>Patient Name</th>
                                                <th>Type</th>
                                                <th>Treatment</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Date</th>
                                                <th>Patient ID</th>
                                                <th>Patient Name</th>
                                                <th>Type</th>
                                                <th>Treatment</th>
                                                <th>Action</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <tr>

                                                <td class="name"><a href="?dashboard=user&page=prescription&action=edit&prescription_id=1">2019-04-17</a></td>
                                                <td class="patient">P20319
                                                </td>
                                                <td class="patient">Ashish Ranjan
                                                </td>
                                                <td class="">Treatment </td>
                                                <td class="treatment">Ankle Surgery</td>

                                                <td class="action">
                                                    <a href="#" class="btn btn-primary view-prescription" id="1" prescription_type="treatment">View</a>
                                                    <a href="?dashboard=user&page=prescription&tab=addprescription&action=edit&prescription_id=MQ==" class="btn btn-info">Edit</a>

                                                </td>

                                            </tr>
                                            <tr>

                                                <td class="name"><a href="?dashboard=user&page=prescription&action=edit&prescription_id=2">2019-03-16</a></td>
                                                <td class="patient">P50319
                                                </td>
                                                <td class="patient">Anna Sanz
                                                </td>
                                                <td class="">Treatment </td>
                                                <td class="treatment">asghar najafi</td>

                                                <td class="action">
                                                    <a href="#" class="btn btn-primary view-prescription" id="2" prescription_type="treatment">View</a>
                                                    <a href="?dashboard=user&page=prescription&tab=addprescription&action=edit&prescription_id=Mg==" class="btn btn-info">Edit</a>

                                                </td>

                                            </tr>
                                            <tr>

                                                <td class="name"><a href="?dashboard=user&page=prescription&action=edit&prescription_id=3">2019-03-16</a></td>
                                                <td class="patient">P50319
                                                </td>
                                                <td class="patient">Anna Sanz
                                                </td>
                                                <td class="">Report </td>
                                                <td class="treatment">-</td>

                                                <td class="action">
                                                    <a href="#" class="btn btn-primary view-prescription" id="3" prescription_type="report">View</a>
                                                    <a href="?dashboard=user&page=prescription&tab=addprescription&action=edit&prescription_id=Mw==" class="btn btn-info">Edit</a>

                                                </td>

                                            </tr>
                                            <tr>

                                                <td class="name"><a href="?dashboard=user&page=prescription&action=edit&prescription_id=4">2019-03-16</a></td>
                                                <td class="patient">P40319
                                                </td>
                                                <td class="patient">Mario Rossi
                                                </td>
                                                <td class="">Treatment </td>
                                                <td class="treatment">Liver and kidney test</td>

                                                <td class="action">
                                                    <a href="#" class="btn btn-primary view-prescription" id="4" prescription_type="treatment">View</a>
                                                    <a href="?dashboard=user&page=prescription&tab=addprescription&action=edit&prescription_id=NA==" class="btn btn-info">Edit</a>

                                                </td>

                                            </tr>
                                            <tr>

                                                <td class="name"><a href="?dashboard=user&page=prescription&action=edit&prescription_id=5">2019-03-16</a></td>
                                                <td class="patient">P10319
                                                </td>
                                                <td class="patient">Jose Figueroa
                                                </td>
                                                <td class="">Report </td>
                                                <td class="treatment">-</td>

                                                <td class="action">
                                                    <a href="#" class="btn btn-primary view-prescription" id="5" prescription_type="report">View</a>
                                                    <a href="?dashboard=user&page=prescription&tab=addprescription&action=edit&prescription_id=NQ==" class="btn btn-info">Edit</a>

                                                </td>

                                            </tr>
                                            <tr>

                                                <td class="name"><a href="?dashboard=user&page=prescription&action=edit&prescription_id=7">2019-04-03</a></td>
                                                <td class="patient">P50319
                                                </td>
                                                <td class="patient">Anna Sanz
                                                </td>
                                                <td class="">Report </td>
                                                <td class="treatment">-</td>

                                                <td class="action">
                                                    <a href="#" class="btn btn-primary view-prescription" id="7" prescription_type="report">View</a>
                                                    <a href="?dashboard=user&page=prescription&tab=addprescription&action=edit&prescription_id=Nw==" class="btn btn-info">Edit</a>

                                                </td>

                                            </tr>
                                            <tr>

                                                <td class="name"><a href="?dashboard=user&page=prescription&action=edit&prescription_id=8">2019-04-11</a></td>
                                                <td class="patient">P160419
                                                </td>
                                                <td class="patient">Nina Cadela
                                                </td>
                                                <td class="">Treatment </td>
                                                <td class="treatment">Ankle Surgery</td>

                                                <td class="action">
                                                    <a href="#" class="btn btn-primary view-prescription" id="8" prescription_type="treatment">View</a>
                                                    <a href="?dashboard=user&page=prescription&tab=addprescription&action=edit&prescription_id=OA==" class="btn btn-info">Edit</a>

                                                </td>

                                            </tr>
                                            <tr>

                                                <td class="name"><a href="?dashboard=user&page=prescription&action=edit&prescription_id=9">2019-04-11</a></td>
                                                <td class="patient">P50319
                                                </td>
                                                <td class="patient">Anna Sanz
                                                </td>
                                                <td class="">Report </td>
                                                <td class="treatment">-</td>

                                                <td class="action">
                                                    <a href="#" class="btn btn-primary view-prescription" id="9" prescription_type="report">View</a>
                                                    <a href="?dashboard=user&page=prescription&tab=addprescription&action=edit&prescription_id=OQ==" class="btn btn-info">Edit</a>

                                                </td>

                                            </tr>
                                            <tr>

                                                <td class="name"><a href="?dashboard=user&page=prescription&action=edit&prescription_id=10">2019-04-11</a></td>
                                                <td class="patient">P50319
                                                </td>
                                                <td class="patient">Anna Sanz
                                                </td>
                                                <td class="">Report </td>
                                                <td class="treatment">-</td>

                                                <td class="action">
                                                    <a href="#" class="btn btn-primary view-prescription" id="10" prescription_type="report">View</a>
                                                    <a href="?dashboard=user&page=prescription&tab=addprescription&action=edit&prescription_id=MTA=" class="btn btn-info">Edit</a>

                                                </td>

                                            </tr>
                                            <tr>

                                                <td class="name"><a href="?dashboard=user&page=prescription&action=edit&prescription_id=11">2019-04-11</a></td>
                                                <td class="patient">P50319
                                                </td>
                                                <td class="patient">Anna Sanz
                                                </td>
                                                <td class="">Report </td>
                                                <td class="treatment">-</td>

                                                <td class="action">
                                                    <a href="#" class="btn btn-primary view-prescription" id="11" prescription_type="report">View</a>
                                                    <a href="?dashboard=user&page=prescription&tab=addprescription&action=edit&prescription_id=MTE=" class="btn btn-info">Edit</a>

                                                </td>

                                            </tr>
                                            <tr>

                                                <td class="name"><a href="?dashboard=user&page=prescription&action=edit&prescription_id=12">2019-04-13</a></td>
                                                <td class="patient">P20319
                                                </td>
                                                <td class="patient">Ashish Ranjan
                                                </td>
                                                <td class="">Report </td>
                                                <td class="treatment">-</td>

                                                <td class="action">
                                                    <a href="#" class="btn btn-primary view-prescription" id="12" prescription_type="report">View</a>
                                                    <a href="?dashboard=user&page=prescription&tab=addprescription&action=edit&prescription_id=MTI=" class="btn btn-info">Edit</a>

                                                </td>

                                            </tr>
                                            <tr>

                                                <td class="name"><a href="?dashboard=user&page=prescription&action=edit&prescription_id=13">2019-04-14</a></td>
                                                <td class="patient">P20319
                                                </td>
                                                <td class="patient">Ashish Ranjan
                                                </td>
                                                <td class="">Treatment </td>
                                                <td class="treatment">Ankle Surgery</td>

                                                <td class="action">
                                                    <a href="#" class="btn btn-primary view-prescription" id="13" prescription_type="treatment">View</a>
                                                    <a href="?dashboard=user&page=prescription&tab=addprescription&action=edit&prescription_id=MTM=" class="btn btn-info">Edit</a>

                                                </td>

                                            </tr>
                                            <tr>

                                                <td class="name"><a href="?dashboard=user&page=prescription&action=edit&prescription_id=14">2019-04-16</a></td>
                                                <td class="patient">P170419
                                                </td>
                                                <td class="patient">stan Ngaguthii
                                                </td>
                                                <td class="">Treatment </td>
                                                <td class="treatment">malaria therapy</td>

                                                <td class="action">
                                                    <a href="#" class="btn btn-primary view-prescription" id="14" prescription_type="treatment">View</a>
                                                    <a href="?dashboard=user&page=prescription&tab=addprescription&action=edit&prescription_id=MTQ=" class="btn btn-info">Edit</a>

                                                </td>

                                            </tr>
                                            <tr>

                                                <td class="name"><a href="?dashboard=user&page=prescription&action=edit&prescription_id=15">2019-04-16</a></td>
                                                <td class="patient">P270419
                                                </td>
                                                <td class="patient">Kristopher Davis
                                                </td>
                                                <td class="">Report </td>
                                                <td class="treatment">-</td>

                                                <td class="action">
                                                    <a href="#" class="btn btn-primary view-prescription" id="15" prescription_type="report">View</a>
                                                    <a href="?dashboard=user&page=prescription&tab=addprescription&action=edit&prescription_id=MTU=" class="btn btn-info">Edit</a>

                                                </td>

                                            </tr>
                                            <tr>

                                                <td class="name"><a href="?dashboard=user&page=prescription&action=edit&prescription_id=16">2019-04-17</a></td>
                                                <td class="patient">P160419
                                                </td>
                                                <td class="patient">Nina Cadela
                                                </td>
                                                <td class="">Treatment </td>
                                                <td class="treatment">Hepatology</td>

                                                <td class="action">
                                                    <a href="#" class="btn btn-primary view-prescription" id="16" prescription_type="treatment">View</a>
                                                    <a href="?dashboard=user&page=prescription&tab=addprescription&action=edit&prescription_id=MTY=" class="btn btn-info">Edit</a>

                                                </td>

                                            </tr>
                                            <tr>

                                                <td class="name"><a href="?dashboard=user&page=prescription&action=edit&prescription_id=17">2019-04-17</a></td>
                                                <td class="patient">P50319
                                                </td>
                                                <td class="patient">Anna Sanz
                                                </td>
                                                <td class="">Treatment </td>
                                                <td class="treatment">malaria therapy</td>

                                                <td class="action">
                                                    <a href="#" class="btn btn-primary view-prescription" id="17" prescription_type="treatment">View</a>
                                                    <a href="?dashboard=user&page=prescription&tab=addprescription&action=edit&prescription_id=MTc=" class="btn btn-info">Edit</a>

                                                </td>

                                            </tr>
                                            <tr>

                                                <td class="name"><a href="?dashboard=user&page=prescription&action=edit&prescription_id=18">2019-04-17</a></td>
                                                <td class="patient">P160419
                                                </td>
                                                <td class="patient">Nina Cadela
                                                </td>
                                                <td class="">Treatment </td>
                                                <td class="treatment">Liver and kidney test</td>

                                                <td class="action">
                                                    <a href="#" class="btn btn-primary view-prescription" id="18" prescription_type="treatment">View</a>
                                                    <a href="?dashboard=user&page=prescription&tab=addprescription&action=edit&prescription_id=MTg=" class="btn btn-info">Edit</a>

                                                </td>

                                            </tr>
                                            <tr>

                                                <td class="name"><a href="?dashboard=user&page=prescription&action=edit&prescription_id=19">2019-04-17</a></td>
                                                <td class="patient">P50319
                                                </td>
                                                <td class="patient">Anna Sanz
                                                </td>
                                                <td class="">Treatment </td>
                                                <td class="treatment">ICD10</td>

                                                <td class="action">
                                                    <a href="#" class="btn btn-primary view-prescription" id="19" prescription_type="treatment">View</a>
                                                    <a href="?dashboard=user&page=prescription&tab=addprescription&action=edit&prescription_id=MTk=" class="btn btn-info">Edit</a>

                                                </td>

                                            </tr>
                                            <tr>

                                                <td class="name"><a href="?dashboard=user&page=prescription&action=edit&prescription_id=20">2019-04-18</a></td>
                                                <td class="patient">P190419
                                                </td>
                                                <td class="patient">king hytrd
                                                </td>
                                                <td class="">Treatment </td>
                                                <td class="treatment">ICD10</td>

                                                <td class="action">
                                                    <a href="#" class="btn btn-primary view-prescription" id="20" prescription_type="treatment">View</a>
                                                    <a href="?dashboard=user&page=prescription&tab=addprescription&action=edit&prescription_id=MjA=" class="btn btn-info">Edit</a>

                                                </td>

                                            </tr>

                                        </tbody>
                                    </table>
                                    <!-- END PANEL BODY DIV-->
                                </div>
                                <!-- END TABLE RESPONSIVE DIV-->
                            </div>
                            <!-- END PANEL BODY DIV-->

                        </div>
                        <!-- END TAB PANE DIV-->

                        <script type="text/javascript">
                            jQuery(document).ready(function ($) {
                                jQuery('#prescription_form').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });
                                jQuery('#doctor_form_outpatient_popup_form_percription').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });
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
                                $('#username').keypress(function (e) {
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

                                $('#doctor_form_outpatient_popup_form_percription').on('submit', function (e) {
                                    e.preventDefault();

                                    var valid = $('#doctor_form_outpatient_popup_form_percription').validationEngine('validate');
                                    if (valid == true) {
                                        var form = new FormData(this);

                                        $.ajax({
                                            type: "POST",
                                            url: $(this).attr('action'),
                                            data: form,
                                            cache: false,
                                            contentType: false,
                                            processData: false,
                                            success: function (data) {

                                                if (data != "") {
                                                    if (data == 2) {
                                                        alert('Sorry, only JPG,JPEG,PNG,GIF,DOC,PDF and ZIP files are allowed.');
                                                    }
                                                    else {
                                                        var json_obj = $.parseJSON(data);

                                                        $('#doctor_form_outpatient_popup_form_percription').trigger("reset");
                                                        $('#patient_id').append(json_obj[0]);
                                                        $('#upload_user_avatar_preview').html('<img alt="" src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/useriamge/patient.png">');
                                                        $('#hmgt_user_avatar_url').val('');

                                                        $('.modal').modal('hide');
                                                    }
                                                }
                                            },
                                            error: function (data) {
                                            }
                                        })

                                    }
                                });
                                $("body").on("click", ".remove_cirtificate", function () {
                                    alert("Do you really want to delete this record ?");
                                    $(this).parent().parent().remove();
                                });
                                $(".symptoms_alert").click(function () {
                                    checked = $(".multiselect_validation_symtoms .dropdown-menu input:checked").length;
                                    if (!checked) {
                                        alert("Please select atleast one Symptoms");
                                        return false;
                                    }
                                });
                            });
                        </script>
                    </div>
                    <script>

                        var blank_custom_label = '';
                        $(document).ready(function () {
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
                                        <input type="hidden" name="role" value="patient" />
                                        <input type="hidden" name="patient_type" value="outpatient" />
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
                                                    <input type="radio" value="male" class="tog validate[required]" name="gender" checked='checked' />Male
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" value="female" class="tog validate[required]" name="gender" />Female
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
                                                <input type="hidden" id="hmgt_user_avatar_url" class="form-control" name="hmgt_user_avatar_url" readonly />
                                                <input type="hidden" name="hidden_upload_user_avatar_image">
                                                <input id="upload_user_avatar_image" name="upload_user_avatar_image" type="file" class="form-control file" value="Upload image" />


                                            </div>
                                            <div class="clearfix"></div>

                                            <div class="col-sm-offset-2 col-sm-8">
                                                <div id="upload_user_avatar_preview">

                                                    <img class="image_preview_css" alt="" src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/useriamge/patient.png">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-offset-2 col-sm-8">

                                            <input type="submit" value="Save Patient" name="save_outpatient" class="btn btn-success symptoms_alert" />
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
        </div>
    </div>
</asp:Content>
