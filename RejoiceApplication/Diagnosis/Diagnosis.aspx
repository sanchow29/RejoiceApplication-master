<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Diagnosis.aspx.cs" Inherits="RejoiceApplication.Diagnosis.Diagnosis" %>

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
                jQuery(document).ready(function ($) {
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
                        language: { "sEmptyTable": "No data available in table", "sInfo": "Showing _START_ to _END_ of _TOTAL_ entries", "sInfoEmpty": "Showing 0 to 0 of 0 entries", "sInfoFiltered": "(filtered from _MAX_ total entries)", "sInfoPostFix": "", "sInfoThousands": ",", "sLengthMenu": "Show _MENU_ entries", "sLoadingRecords": "Loading...", "sProcessing": "Processing...", "sSearch": "Search:", "sZeroRecords": "No matching records found", "oPaginate": { "sFirst": "First", "sLast": "Last", "sNext": "Next", "sPrevious": "Previous" }, "oAria": { "sSortAscending": ": activate to sort column ascending", "sSortDescending": ": activate to sort column descending" } }
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
                        language: { "sEmptyTable": "No data available in table", "sInfo": "Showing _START_ to _END_ of _TOTAL_ entries", "sInfoEmpty": "Showing 0 to 0 of 0 entries", "sInfoFiltered": "(filtered from _MAX_ total entries)", "sInfoPostFix": "", "sInfoThousands": ",", "sLengthMenu": "Show _MENU_ entries", "sLoadingRecords": "Loading...", "sProcessing": "Processing...", "sSearch": "Search:", "sZeroRecords": "No matching records found", "oPaginate": { "sFirst": "First", "sLast": "Last", "sNext": "Next", "sPrevious": "Previous" }, "oAria": { "sSortAscending": ": activate to sort column ascending", "sSortDescending": ": activate to sort column descending" } }
                    });


                    $('#diagnosis_form').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });
                    $('#doctor_form_outpatient_popup_form_percription').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });
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

                    $('#doctor_form_outpatient_popup_form_percription').on('submit', function (e) {
                        e.preventDefault();

                        //var form = $(this).serialize();
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
                                        var json_obj = $.parseJSON(data);

                                        $('#doctor_form_outpatient_popup_form_percription').trigger("reset");
                                        $('#patient').append(json_obj[0]);

                                        $('#upload_user_avatar_preview').html('<img alt="" src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/useriamge/patient.png">');
                                        $('#hmgt_user_avatar_url').val('');

                                        $('.modal').modal('hide');
                                    }
                                },
                                error: function (data) {
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

                    $(".symptoms_alert").click(function () {
                        checked = $(".multiselect_validation_symtoms .dropdown-menu input:checked").length;
                        if (!checked) {
                            alert("Please select atleast one Symptoms");
                            return false;
                        }
                    });

                    $('#dagnosis_report_form').on('submit', function (e) {
                        e.preventDefault();
                        var form = $(this).serialize();
                        var valid = $("#dagnosis_report_form").validationEngine('validate');
                        if (valid == true) {
                            $.ajax(
                                {
                                    type: "POST",
                                    url: $(this).attr('action'),
                                    data: form,
                                    success: function (data) {
                                        $('#dagnosis_report_form').trigger("reset");
                                        $('.modal').modal('hide');

                                        window.location.href = window.location.href + "&message=4";
                                    },
                                    error: function (data) {
                                    }
                                })

                        }
                    });

                    $("body").on("click", ".update_dagnosis_report", function (event) {
                        var report_status = $(this).attr('report_status');
                        var pescription_id = $(this).attr('priscription_id');
                        $(".report_status").val(report_status);
                        $(".pescription").val(pescription_id);

                    });
                    $(".save_diagnosis").click(function () {
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
                    <li class="active">
                        <a href="Diagnosis.aspx" class="tab active">
                            <i class="fa fa-align-justify"></i>Diagnosis Report List
                        </a>

                    </li>
                    <li class="">
                        <a href="AddDiagnosis.aspx" class="tab ">
                            <i class="fa fa-plus-circle"></i>Add Diagnosis Report
                        </a>
                    </li>

                </ul>
                <div class="tab-content">
                    <!--START TAB CONTENT DIV-->
                    <div class="panel-body">
                        <!--STRAT PANEL BODY DIV-->
                        <div class="table-responsive">
                            <!--START TABLE RESPONSIVE DIV-->
                            <table id="diagnosis1" class="display dataTable" cellspacing="0" width="100%">
                                <!--START DIGNOSIS LIST TABLE-->
                                <thead>
                                    <tr>
                                        <th>Date</th>
                                        <th>Patient ID-Name</th>
                                        <th>Report Type & Amount</th>
                                        <th>Description</th>
                                        <th>Report</th>
                                        <th>Report Cost (<span>&#36;</span>)</th>
                                        <th>Tax Amount (<span>&#36;</span>)</th>
                                        <th>Total Report Cost (<span>&#36;</span>)</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>Date</th>
                                        <th>Patient ID-Name</th>
                                        <th>Report Type & Amount</th>
                                        <th>Description</th>
                                        <th>Report</th>
                                        <th>Report Cost (<span>&#36;</span>)</th>
                                        <th>Tax Amount (<span>&#36;</span>)</th>
                                        <th>Total Report Cost (<span>&#36;</span>)</th>
                                        <th>Action</th>
                                    </tr>
                                </tfoot>
                                <tbody>
                                    <tr>
                                        <td class="date">2019-03-16</td>
                                        <td class="patient_id">P50319 - Anna Sanz
                                        </td>
                                        <td class="report_type">(1) =>								</br>

                                        </td>
                                        <td class="description">test</td>
                                        <td class="report">
                                            <a href="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/uploads/hospital_assets/1552724976-996331694.pdf" class="btn btn-default" target="_blank"><i class="fa fa-download"></i>Report</a></br>
                                        </td>
                                        <td class="">1000.00</td>
                                        <td class="">90.00</td>
                                        <td class="">1090.00</td>
                                        <td class="action">
                                            <a href="?dashboard=user&page=diagnosis&tab=adddiagnosis&action=edit&diagnosis_id=MQ=="
                                                class="btn btn-info">Edit</a>

                                        </td>

                                    </tr>
                                    <tr>
                                        <td class="date">2019-03-16</td>
                                        <td class="patient_id">P40319 - Mario Rossi
                                        </td>
                                        <td class="report_type">(1) =>								</br>

                                        </td>
                                        <td class="description">malaria report.</td>
                                        <td class="report">
                                            <a href="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/uploads/hospital_assets/1552725036-862309106.pdf" class="btn btn-default" target="_blank"><i class="fa fa-download"></i>Report</a></br>
                                        </td>
                                        <td class="">500.00</td>
                                        <td class="">45.00</td>
                                        <td class="">545.00</td>
                                        <td class="action">
                                            <a href="?dashboard=user&page=diagnosis&tab=adddiagnosis&action=edit&diagnosis_id=Mg=="
                                                class="btn btn-info">Edit</a>

                                        </td>

                                    </tr>
                                    <tr>
                                        <td class="date">2019-03-16</td>
                                        <td class="patient_id">P40319 - Mario Rossi
                                        </td>
                                        <td class="report_type">(1) =>								</br>

                                        </td>
                                        <td class="description">report test</td>
                                        <td class="report">
                                            <a href="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/uploads/hospital_assets/1552725080-1421645219.pdf" class="btn btn-default" target="_blank"><i class="fa fa-download"></i>Report</a></br>
                                        </td>
                                        <td class="">900.00</td>
                                        <td class="">153.00</td>
                                        <td class="">1053.00</td>
                                        <td class="action">
                                            <a href="?dashboard=user&page=diagnosis&tab=adddiagnosis&action=edit&diagnosis_id=Mw=="
                                                class="btn btn-info">Edit</a>

                                        </td>

                                    </tr>
                                    <tr>
                                        <td class="date">2019-04-02</td>
                                        <td class="patient_id">P20319 - Ashish Ranjan
                                        </td>
                                        <td class="report_type">(1) =>								</br>
                                                        (2) =>								</br>

                                        </td>
                                        <td class="description"></td>
                                        <td class="report">
                                            <a href="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/uploads/hospital_assets/1554248623-1889196042.jpg" class="btn btn-default" target="_blank"><i class="fa fa-download"></i>Report</a></br><a href="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/uploads/hospital_assets/1554248624-759907571.jpg" class="btn btn-default" target="_blank"><i class="fa fa-download"></i>  Report</a></br>
                                        </td>
                                        <td class="">1700.00</td>
                                        <td class="">289.00</td>
                                        <td class="">1989.00</td>
                                        <td class="action">
                                            <a href="?dashboard=user&page=diagnosis&tab=adddiagnosis&action=edit&diagnosis_id=OA=="
                                                class="btn btn-info">Edit</a>

                                        </td>

                                    </tr>
                                    <tr>
                                        <td class="date">2019-04-11</td>
                                        <td class="patient_id">P10319 - Jose Figueroa
                                        </td>
                                        <td class="report_type">(1) HB=>30								</br>

                                        </td>
                                        <td class="description">test test    </td>
                                        <td class="report">
                                            <a href="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/uploads/hospital_assets/1566043916-1455249561.png" class="btn btn-default" target="_blank"><i class="fa fa-download"></i>HB Report</a></br>
                                        </td>
                                        <td class="">30.00</td>
                                        <td class="">0.00</td>
                                        <td class="">30.00</td>
                                        <td class="action">
                                            <a href="?dashboard=user&page=diagnosis&tab=adddiagnosis&action=edit&diagnosis_id=MTE="
                                                class="btn btn-info">Edit</a>

                                        </td>

                                    </tr>
                                    <tr>
                                        <td class="date">2019-04-19</td>
                                        <td class="patient_id">P280419 - Amel Ali
                                        </td>
                                        <td class="report_type"></td>
                                        <td class="description"></td>
                                        <td class="report">
                                            <a href="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/uploads/hospital_assets/1555692392-1210962807.jpg" class="btn btn-default" target="_blank"><i class="fa fa-download"></i>Download</a>
                                        </td>
                                        <td class="">0.00</td>
                                        <td class="">0.00</td>
                                        <td class="">0.00</td>
                                        <td class="action"></td>

                                    </tr>
                                    <tr>
                                        <td class="date">2019-04-19</td>
                                        <td class="patient_id">P280419 - Amel Ali
                                        </td>
                                        <td class="report_type"></td>
                                        <td class="description"></td>
                                        <td class="report">
                                            <a href="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/uploads/hospital_assets/1555692392-1832506313.png" class="btn btn-default" target="_blank"><i class="fa fa-download"></i>Download</a>
                                        </td>
                                        <td class="">0.00</td>
                                        <td class="">0.00</td>
                                        <td class="">0.00</td>
                                        <td class="action"></td>

                                    </tr>
                                    <tr>
                                        <td class="date">2019-05-16</td>
                                        <td class="patient_id">P10319 - Jose Figueroa
                                        </td>
                                        <td class="report_type">(1) 150=>60								</br>

                                        </td>
                                        <td class="description">fgsgfseg dsfdefef dfewfew</td>
                                        <td class="report">
                                            <a href="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/uploads/hospital_assets/1557970179-69299995.doc" class="btn btn-default" target="_blank"><i class="fa fa-download"></i>150 Report</a></br>
                                        </td>
                                        <td class="">100.00</td>
                                        <td class="">9.00</td>
                                        <td class="">109.00</td>
                                        <td class="action">
                                            <a href="?dashboard=user&page=diagnosis&tab=adddiagnosis&action=edit&diagnosis_id=MTY="
                                                class="btn btn-info">Edit</a>

                                        </td>

                                    </tr>
                                    <tr>
                                        <td class="date">2019-05-22</td>
                                        <td class="patient_id">P320419 - Moses Peter
                                        </td>
                                        <td class="report_type">(1) HB=>30								</br>

                                        </td>
                                        <td class="description">reporte bebis</td>
                                        <td class="report">
                                            <a href="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/uploads/hospital_assets/1558546772-1909365656.jpg" class="btn btn-default" target="_blank"><i class="fa fa-download"></i>HB Report</a></br>
                                        </td>
                                        <td class="">30.00</td>
                                        <td class="">5.10</td>
                                        <td class="">35.10</td>
                                        <td class="action">
                                            <a href="?dashboard=user&page=diagnosis&tab=adddiagnosis&action=edit&diagnosis_id=MTc="
                                                class="btn btn-info">Edit</a>

                                        </td>

                                    </tr>
                                    <tr>
                                        <td class="date">2019-05-30</td>
                                        <td class="patient_id">P160419 - Nina Cadela
                                        </td>
                                        <td class="report_type">(1) 150=>60								</br>

                                        </td>
                                        <td class="description">klkjljljlkj</td>
                                        <td class="report">No any Report
                                        </td>
                                        <td class="">0.00</td>
                                        <td class="">0.00</td>
                                        <td class="">0.00</td>
                                        <td class="action">
                                            <a href="?dashboard=user&page=diagnosis&tab=adddiagnosis&action=edit&diagnosis_id=MTg="
                                                class="btn btn-info">Edit</a>

                                        </td>

                                    </tr>
                                    <tr>
                                        <td class="date">2019-05-30</td>
                                        <td class="patient_id">P160419 - Nina Cadela
                                        </td>
                                        <td class="report_type">(1) ca=>500								</br>
                                                        (2) HB=>30								</br>
                                                        (3) =>								</br>

                                        </td>
                                        <td class="description"></td>
                                        <td class="report">
                                            <a href="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/uploads/hospital_assets/1559196080-887923330.jpg" class="btn btn-default" target="_blank"><i class="fa fa-download"></i>ca Report</a></br><a href="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/uploads/hospital_assets/1559196080-533622340.jpg" class="btn btn-default" target="_blank"><i class="fa fa-download"></i> HB Report</a></br><a href="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/uploads/hospital_assets/1559196080-1938808727.jpg" class="btn btn-default" target="_blank"><i class="fa fa-download"></i>  Report</a></br>
                                        </td>
                                        <td class="">5530.00</td>
                                        <td class="">255.10</td>
                                        <td class="">5785.10</td>
                                        <td class="action">
                                            <a href="?dashboard=user&page=diagnosis&tab=adddiagnosis&action=edit&diagnosis_id=MTk="
                                                class="btn btn-info">Edit</a>

                                        </td>

                                    </tr>
                                    <tr>
                                        <td class="date">2019-06-17</td>
                                        <td class="patient_id">P600619 - Vishal Singh
                                        </td>
                                        <td class="report_type"></td>
                                        <td class="description"></td>
                                        <td class="report">
                                            <a href="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/uploads/hospital_assets/1560756650-1944111351.jpg" class="btn btn-default" target="_blank"><i class="fa fa-download"></i>Download</a>
                                        </td>
                                        <td class="">0.00</td>
                                        <td class="">0.00</td>
                                        <td class="">0.00</td>
                                        <td class="action"></td>

                                    </tr>
                                    <tr>
                                        <td class="date">2019-06-17</td>
                                        <td class="patient_id">-
                                        </td>
                                        <td class="report_type"></td>
                                        <td class="description"></td>
                                        <td class="report">
                                            <a href="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/uploads/hospital_assets/1560756652-1047328852.jpg" class="btn btn-default" target="_blank"><i class="fa fa-download"></i>Download</a>
                                        </td>
                                        <td class="">0.00</td>
                                        <td class="">0.00</td>
                                        <td class="">0.00</td>
                                        <td class="action"></td>

                                    </tr>
                                    <tr>
                                        <td class="date">2019-06-27</td>
                                        <td class="patient_id">P160419 - Nina Cadela
                                        </td>
                                        <td class="report_type">(1) Sangre=>5								</br>

                                        </td>
                                        <td class="description">test </td>
                                        <td class="report"></td>
                                        <td class="">0.06</td>
                                        <td class="">0.00</td>
                                        <td class="">0.06</td>
                                        <td class="action">
                                            <a href="?dashboard=user&page=diagnosis&tab=adddiagnosis&action=edit&diagnosis_id=MjM="
                                                class="btn btn-info">Edit</a>

                                        </td>

                                    </tr>
                                    <tr>
                                        <td class="date">2019-07-14</td>
                                        <td class="patient_id">P10319 - Jose Figueroa
                                        </td>
                                        <td class="report_type">(1) Sangre=>5								</br>

                                        </td>
                                        <td class="description">diagnosis     </td>
                                        <td class="report">
                                            <a href="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/uploads/hospital_assets/1564723211-1919854928.jpg" class="btn btn-default" target="_blank"><i class="fa fa-download"></i>Sangre Report</a></br>
                                        </td>
                                        <td class="">0.06</td>
                                        <td class="">0.00</td>
                                        <td class="">0.06</td>
                                        <td class="action">
                                            <a href="?dashboard=user&page=diagnosis&tab=adddiagnosis&action=edit&diagnosis_id=MjU="
                                                class="btn btn-info">Edit</a>

                                        </td>

                                    </tr>
                                    <tr>
                                        <td class="date">2019-08-06</td>
                                        <td class="patient_id">P340519 - aaaa aaa
                                        </td>
                                        <td class="report_type">(1) HB=>30								</br>
                                                        (2) Sangre=>5								</br>

                                        </td>
                                        <td class="description">Download lab </td>
                                        <td class="report">
                                            <a href="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/uploads/hospital_assets/1565808104-642012503.jpg" class="btn btn-default" target="_blank"><i class="fa fa-download"></i>HB Report</a></br>
                                        </td>
                                        <td class="">35.00</td>
                                        <td class="">5.75</td>
                                        <td class="">40.75</td>
                                        <td class="action">
                                            <a href="?dashboard=user&page=diagnosis&tab=adddiagnosis&action=edit&diagnosis_id=MjY="
                                                class="btn btn-info">Edit</a>

                                        </td>

                                    </tr>
                                    <tr>
                                        <td class="date">2019-08-06</td>
                                        <td class="patient_id">P760719 - ashok kumar
                                        </td>
                                        <td class="report_type">(1) Sangre=>5								</br>
                                                        (2) 150=>60								</br>
                                                        (3) ca=>500								</br>
                                                        (4) CBP=>500								</br>

                                        </td>
                                        <td class="description"></td>
                                        <td class="report">
                                            <a href="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/uploads/hospital_assets/1565093847-777857472.pdf" class="btn btn-default" target="_blank"><i class="fa fa-download"></i>Sangre Report</a></br><a href="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/uploads/hospital_assets/1565093848-1283935663.pdf" class="btn btn-default" target="_blank"><i class="fa fa-download"></i> 150 Report</a></br><a href="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/uploads/hospital_assets/1565093850-272586297.pdf" class="btn btn-default" target="_blank"><i class="fa fa-download"></i> ca Report</a></br><a href="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/uploads/hospital_assets/1565093850-273128218.pdf" class="btn btn-default" target="_blank"><i class="fa fa-download"></i> CBP Report</a></br>
                                        </td>
                                        <td class="">1100.06</td>
                                        <td class="">54.00</td>
                                        <td class="">1154.06</td>
                                        <td class="action">
                                            <a href="?dashboard=user&page=diagnosis&tab=adddiagnosis&action=edit&diagnosis_id=Mjc="
                                                class="btn btn-info">Edit</a>

                                        </td>

                                    </tr>
                                    <tr>
                                        <td class="date">2019-08-16</td>
                                        <td class="patient_id">P590619 - juan juanxin
                                        </td>
                                        <td class="report_type">(1) 150=>60								</br>
                                                        (2) ca=>500								</br>
                                                        (3) CBP=>500								</br>
                                                        (4) HB=>30								</br>
                                                        (5) =>								</br>
                                                        (6) Sangre=>5								</br>
                                                        (7) visit=>100								</br>
                                                        (8) XYz=>-100								</br>

                                        </td>
                                        <td class="description">sasa</td>
                                        <td class="report">No any Report
                                        </td>
                                        <td class="">6135.00</td>
                                        <td class="">297.75</td>
                                        <td class="">6432.75</td>
                                        <td class="action">
                                            <a href="?dashboard=user&page=diagnosis&tab=adddiagnosis&action=edit&diagnosis_id=Mjk="
                                                class="btn btn-info">Edit</a>

                                        </td>

                                    </tr>
                                    <tr>
                                        <td class="date">2019-08-21</td>
                                        <td class="patient_id">P900819 - David Urrego
                                        </td>
                                        <td class="report_type">(1) HB=>30								</br>

                                        </td>
                                        <td class="description"></td>
                                        <td class="report">
                                            <a href="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/uploads/hospital_assets/1566401968-501578085.png" class="btn btn-default" target="_blank"><i class="fa fa-download"></i>HB Report</a></br>
                                        </td>
                                        <td class="">30.00</td>
                                        <td class="">5.10</td>
                                        <td class="">35.10</td>
                                        <td class="action">
                                            <a href="?dashboard=user&page=diagnosis&tab=adddiagnosis&action=edit&diagnosis_id=MzA="
                                                class="btn btn-info">Edit</a>

                                        </td>

                                    </tr>
                                </tbody>
                            </table>
                            <!--END DIGNOSIS LIST TABLE-->
                        </div>
                        <!--END TABLE RESPONSIVE DIV-->
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

                                <input type="hidden" name="role" value="patient" />
                                <input type="hidden" name="patient_type" value="outpatient" />
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
                                        <button id="addremove" model="symptoms">Add Or Remove</button></div>
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
    </div>

</asp:Content>
