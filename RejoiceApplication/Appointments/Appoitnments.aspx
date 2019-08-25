<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Appoitnments.aspx.cs" Inherits="RejoiceApplication.Appointments.Appoitnments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-inner" style="min-height: 1050px;">
        <!-- start page inner div-->
        <div class="row right_side appointment">
            <!-- start dashboard content div-->
            <noscript>
                <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
            </noscript>
            <script type="text/javascript">
                jQuery(document).ready(function ($) {
                    $('.apointment_times_form').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });

                    var date = new Date();
                    date.setDate(date.getDate() - 0);
                    $.fn.datepicker.defaults.format = " yyyy-mm-dd";

                    $('#appointment_date').datepicker({
                        startDate: date,
                        autoclose: true
                    });

                    $('.appointmet_sdate').datepicker({
                        startDate: date,
                        autoclose: true
                    }).on('changeDate', function () {
                        $('#appointment_time_enddate').datepicker('setStartDate', new Date($(this).val()));
                    });

                    $('#appointment_time_enddate').datepicker({
                        startDate: date,
                        autoclose: true
                    }).on('changeDate', function () {
                        $('.appointmet_sdate').datepicker('setEndDate', new Date($(this).val()));
                    });

                    $("#appointment_time_startdate").change(function () {

                        var apointment_date = $('#appointment_time_startdate').val();

                        if (apointment_date == "") {
                            var already_appointment_set_time = $('#already_appointment_set_time').val();

                            var apointment_date = $('#appointment_time_startdate').val(already_appointment_set_time);
                        }
                        else {


                            $('.checked .avilable_time').prop('checked', false);
                            $('.checked').removeClass('checked');
                            $('.appointment_note').css("display", "none");

                            var curr_data = {
                                action: 'MJ_hmgt_onchage_gate_apointment_time_avilability',
                                apointment_date: apointment_date,
                                dataType: 'json'
                            };

                            $.post(hmgt.ajax, curr_data, function (response) {

                                var json_obj = $.parseJSON(response);

                                var dateformate_value = json_obj['dateformate'];

                                if (dateformate_value == 'Y-m-d') {
                                    var dateformate = 'YYYY-MM-DD';
                                }
                                if (dateformate_value == 'm/d/Y') {
                                    var dateformate = 'MM/DD/YYYY';
                                }
                                if (dateformate_value == 'd/m/Y') {
                                    var dateformate = 'DD/MM/YYYY';
                                }
                                if (dateformate_value == 'F j, Y') {
                                    var dateformate = 'MMMM DD,YYYY';
                                }

                                var result = json_obj['result'];

                                if (result != "") {

                                    var date = json_obj['date'];
                                    var sdate = moment(date.apointment_startdate).format(dateformate);
                                    var appstartdate = sdate;
                                    var edate = moment(date.apointment_enddate).format(dateformate);
                                    var enddate = edate;
                                    $('.appointment_note').css("display", "block");
                                    $('.appointment_msg').html('You have Allready Appointment Time Set ' + appstartdate + ' to ' + edate + ' You Want To Edit It...');

                                    $('#already_appointment_set_time').val('');
                                    $('#already_appointment_set_time').val(appstartdate);

                                    var apointment_date = $('#appointment_time_startdate');
                                    apointment_date.datepicker('setEndDate', edate);
                                    var enddate = $('#appointment_time_enddate');
                                    enddate.datepicker('option', 'minDate', appstartdate);
                                    enddate.datepicker('setDate', edate);

                                    for (var i in result) {
                                        var apointment_startdate = result[i].apointment_startdate;
                                        var apointment_enddate = result[i].apointment_enddate;
                                        var time = result[i].apointment_time;
                                        var day = result[i].day;
                                        var apointment_sdate = moment(apointment_startdate).format(dateformate);
                                        $('#appointment_time_startdate').val(apointment_sdate);
                                        var apointment_edate = moment(apointment_enddate).format(dateformate);
                                        $('#appointment_time_enddate').val(apointment_edate);
                                        var time = time.replace(":", "_");
                                        var day = day;

                                        $('.selected_' + time + '_' + day).addClass("checked");

                                        $('.checked .avilable_time').prop('checked', true);

                                    }
                                    return true;
                                }
                                else {

                                    $('.appointment_note').css("display", "none");

                                    var enddate = $('#appointment_time_enddate');
                                    var startDate = $('.appointmet_sdate').datepicker('getDate');

                                    startDate.setDate(startDate.getDate() + 7);
                                    enddate.datepicker('option', 'minDate', startDate);
                                    enddate.datepicker('setDate', startDate);

                                }
                            });
                        }
                    });
                    $("#appointment_date").change(function () {

                        $('.removeselect').css("background", "#FFFFFF");
                        $('.removeselect').removeClass("select");
                        $('.removeselect .time').css('visibility', 'hidden');
                        $('.removeselect').removeClass("checked");
                        $('.removeselect .time').prop('checked', false);

                        var apointment_date = $('#appointment_date').val();
                        var doctor_id = $('#doctor').val();
                        var patient_id = $('#patient').val();

                        var date1 = $('#appointment_date').datepicker('getDate');
                        var day = date1.getDay();
                        if (day == 1) {
                            var dayofweek = "monday";
                        }
                        if (day == 2) {
                            var dayofweek = "tuesday";
                        }
                        if (day == 3) {
                            var dayofweek = "wednesday";
                        }
                        if (day == 4) {
                            var dayofweek = "thursday";
                        }
                        if (day == 5) {
                            var dayofweek = "friday";
                        }
                        if (day == 6) {
                            var dayofweek = "saturday";
                        }
                        if (day == 7) {
                            var dayofweek = "sunday";
                        }
                        var curr_data = {
                            action: 'Mj_hmgt_onchage_gate_apointment_time',
                            apointment_date: apointment_date,
                            doctor_id: doctor_id,
                            patient_id: patient_id,
                            dayofweek: dayofweek,
                            dataType: 'json'
                        };

                        $.post(hmgt.ajax, curr_data, function (response) {

                            var json_obj = $.parseJSON(response);

                            var new_val = "";
                            $.each(json_obj, function (i, val) {


                                new_val = val.replace(":", "_");


                                $('.selected_' + new_val).css("background", "#4CAF50");
                                $('.selected_' + new_val).addClass("select");
                                $('.select .time').css("visibility", "visible");

                            });
                            return true;
                        });
                    });

                    $('.appointment_date').change(function () {

                        $('.removeselect').css("background", "#FFFFFF");
                        $('.removeselect').removeClass("select_apointment");
                        $('.removeselect .time').css('visibility', 'hidden');

                        var apointment_date = $('#appointment_date').val();
                        var edit_apointment_date = $('#hide_date_value').val();
                        var edit_apointment_time = $('#hide_time_value').val();
                        var doctor_id = $('#doctor').val();
                        var patient_id = $('#patient').val();

                        var curr_data = {
                            action: 'MJ_hmgt_onchage_gate_apointment',
                            apointment_date: apointment_date,
                            doctor_id: doctor_id,
                            edit_apointment_date: edit_apointment_date,
                            edit_apointment_time: edit_apointment_time,
                            patient_id: patient_id,
                            dataType: 'json'
                        };
                        $.post(hmgt.ajax, curr_data, function (response) {

                            var json_obj = jQuery.parseJSON(response);
                            var new_val = "";
                            $.each(json_obj['book_appointment_time'], function (i, val) {
                                new_val = val.replace(":", "_");
                                $('.selected_' + new_val).css("background", "#008CBA");
                                $('.selected_' + new_val).addClass("select_apointment");
                                $('.select_apointment .time').css("visibility", "hidden");
                            });
                            $.each(json_obj['edit_appointment_time'], function (i, val) {

                                time = val.replace(":", "_");

                                $('.selected_' + time).css("background", "#4CAF50");
                                $('.selected_' + time).addClass("edited_select");
                                $('.edited_select .time').css("visibility", "visible");
                                $('.selected_' + time).addClass("checked");
                                $('.checked .time').prop('checked', true);
                            });
                            return true;
                        });
                    });
                });

            </script>

            <script type="text/javascript">
                $(document).ready(function () {
                    jQuery('#appointment_list').DataTable({
                        "responsive": true,
                        "order": [[0, "Desc"]],
                        language: { "sEmptyTable": "No data available in table", "sInfo": "Showing _START_ to _END_ of _TOTAL_ entries", "sInfoEmpty": "Showing 0 to 0 of 0 entries", "sInfoFiltered": "(filtered from _MAX_ total entries)", "sInfoPostFix": "", "sInfoThousands": ",", "sLengthMenu": "Show _MENU_ entries", "sLoadingRecords": "Loading...", "sProcessing": "Processing...", "sSearch": "Search:", "sZeroRecords": "No matching records found", "oPaginate": { "sFirst": "First", "sLast": "Last", "sNext": "Next", "sPrevious": "Previous" }, "oAria": { "sSortAscending": ": activate to sort column ascending", "sSortDescending": ": activate to sort column descending" } }
                    });

                });
            </script>
            <div class="panel-body panel-white">
                <!-- START PANEL BODY DIV -->
                <ul class="nav nav-tabs panel_tabs" role="tablist">
                    <!-- START NAV TABS-->
                    <li class="active">

                        <a href="Appoitnments.aspx">
                            <i class="fa fa-align-justify"></i>Appointment List
                        </a>
                       
                    </li>
                    <li class="">

                        <a href="AddAppoitnment.aspx" class="tab ">
                            <i class="fa fa-plus-circle"></i>Add Appointment
                        </a>

                    </li>
                    <li class="">
                        <a href="AppoitnmentTime.aspx">
                            <i class="fa fa-align-justify"></i>Appointment Time
                        </a>
                        
                    </li>
                </ul>
                <!-- END NAV TABS -->
                <div class="tab-content">
                    <!-- SRAER TAB CONTENT DIV -->
                    <div class="tab-pane fade active in" id="appointmentlist">
                        <!-- END TAB PANE DIV-->
                        <div class="panel-body">
                            <!-- STAR PANEL BODY DIV -->
                            <div class="table-responsive">
                                <!--TABLE RESPONSIVE DIV -->
                                <table id="appointment_list" class="display dataTable " cellspacing="0" width="100%">
                                    <!-- START Appointment LIST TABLE -->
                                    <thead>
                                        <tr>
                                            <th>Date</th>
                                            <th>Patient </th>
                                            <th>Doctor</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Date</th>
                                            <th>Patient </th>
                                            <th>Doctor</th>
                                            <th>Action</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td class="appointment_time">2019-08-20(12:45PM)</td>
                                            <td class="patient">Nina Cadela
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=NTY=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=NTY=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-08-19(10:00AM)</td>
                                            <td class="patient">aaaa aaa
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=NTU=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=NTU=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-08-09(06:00PM)</td>
                                            <td class="patient">Nina Cadela
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=NTM=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=NTM=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-08-09(06:15PM)</td>
                                            <td class="patient">R R
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=NTQ=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=NTQ=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-08-08(10:00AM)</td>
                                            <td class="patient">Abhijit Borgohain
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=NTI=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=NTI=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-08-05(10:30AM)</td>
                                            <td class="patient">aaaa aaa
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=NDk=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=NDk=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-08-05(10:00AM)</td>
                                            <td class="patient">Nina Cadela
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=NTA=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=NTA=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-08-05(10:15AM)</td>
                                            <td class="patient">R R
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=NTE=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=NTE=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-07-25(04:45PM)</td>
                                            <td class="patient">AS as
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=NDQ=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=NDQ=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-07-18(10:30AM)</td>
                                            <td class="patient">Nina Cadela
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=NDY=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=NDY=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-07-18(02:30PM)</td>
                                            <td class="patient">Ashish Ranjan
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=NDc=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=NDc=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-07-17(10:15AM)</td>
                                            <td class="patient">Jose Figueroa
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=Mzg=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=Mzg=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-07-17(10:30AM)</td>
                                            <td class="patient">Jose Figueroa
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=NDA=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=NDA=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-07-12(11:15AM )</td>
                                            <td class="patient">Jose Figueroa
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=NDE=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=NDE=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-07-10(10:00AM)</td>
                                            <td class="patient">Jose Figueroa
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=Mzc=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=Mzc=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-06-24(11:45AM)</td>
                                            <td class="patient">Jose Figueroa
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=MzI=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=MzI=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-06-24(11:00AM)</td>
                                            <td class="patient">R R
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=MzQ=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=MzQ=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-06-24(10:45AM)</td>
                                            <td class="patient">Nina Cadela
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=MzY=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=MzY=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-06-17(10:15AM)</td>
                                            <td class="patient">claudiu ciubotaru
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=MzM=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=MzM=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-06-03(10:30AM)</td>
                                            <td class="patient">R R
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=Mjk=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=Mjk=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-06-03(11:15AM )</td>
                                            <td class="patient">Jose Figueroa
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=MzA=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=MzA=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-05-20(02:15PM)</td>
                                            <td class="patient">R R
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=MjM=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=MjM=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-05-20(11:00AM)</td>
                                            <td class="patient">Nina Cadela
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=MjQ=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=MjQ=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-05-20(10:45AM)</td>
                                            <td class="patient">Nina Cadela
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=MjU=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=MjU=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-05-14(10:00AM)</td>
                                            <td class="patient">Nina Cadela
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=MjA=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=MjA=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-05-14(10:15AM)</td>
                                            <td class="patient">Jose Figueroa
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=MjE=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=MjE=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-05-13(11:45AM)</td>
                                            <td class="patient">R R
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=MTg=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=MTg=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-05-13(11:00AM)</td>
                                            <td class="patient">Abhijit Borgohain
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=MTk=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=MTk=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-05-13(10:15AM)</td>
                                            <td class="patient">Nina Cadela
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=MjI=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=MjI=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-04-22(10:30AM)</td>
                                            <td class="patient">Jose Figueroa
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=MTQ=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=MTQ=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-04-22(10:00AM)</td>
                                            <td class="patient">Jose Figueroa
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=MTU=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=MTU=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-04-22(10:15AM)</td>
                                            <td class="patient">Jose Figueroa
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=MTY=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=MTY=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-04-18(10:30AM)</td>
                                            <td class="patient">Mario Rossi
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=MTI=" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=MTI=" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-03-30(10:00AM)</td>
                                            <td class="patient">Ashish Ranjan
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=OQ==" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=OQ==" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-03-23(08:00PM)</td>
                                            <td class="patient">Ashish Ranjan
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=Mw==" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=Mw==" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-03-22(02:00PM)</td>
                                            <td class="patient">Anna Sanz
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=NA==" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=NA==" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-03-22(04:45PM)</td>
                                            <td class="patient">Jose Figueroa
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=Ng==" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=Ng==" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-03-18(10:45AM)</td>
                                            <td class="patient">Mario Rossi
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=NQ==" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=NQ==" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="appointment_time">2019-03-16(10:00AM)</td>
                                            <td class="patient">Ashish Ranjan
                                            </td>
                                            <td class="doctor">Fernando Therrien
                                            </td>
                                            <td class="action">
                                                <a href="?dashboard=user&page=appointment&tab=addappoint&action=edit&appointment_id=MQ==" class="btn btn-info">Edit
                                                </a>
                                                <a href="?dashboard=user&page=appointment&tab=appointmentlist&action=delete&appointment_id=MQ==" class="btn btn-danger"
                                                    onclick="return confirm('Are you sure you want to delete this record?');">Delete
                                                </a>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>
                                <!-- END Appointment LIST TABLE -->
                            </div>
                            <!-- END TABLE RESPONSIVE DIV -->
                        </div>
                        <!-- END PANEL BODY DIV -->
                    </div>
                    <!-- END PANE TAB DIV -->
                    <script type="text/javascript">
                        $(document).ready(function () {

                            $('#patient_form').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });
                        });
                    </script>
                    <div class="tab-pane " id="add_appointment">
                        <!-- STAR TAB PANE DIV -->
                        <div class="panel-body">
                            <!-- STAR PANEL BODY DIV -->
                            <form name="patient_form" action="" method="post" class="form-horizontal " id="patient_form">
                                <!-- STAR Appointment FORM-->
                                <input type="hidden" name="action" value="insert">
                                <input type="hidden" name="appointment_id" value="" />

                                <div class="form-group">

                                    <label class="col-sm-2 control-label" for="middle_name">Select Patient<span class="require-field">*</span></label>
                                    <div class="col-sm-8">
                                        <select name="patient_id" id="patient" class="form-control validate[required] ">
                                            <option value="">Select Patient</option>
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
                                <input type="hidden" name="doctor_id" value="2">
                                <div class="apointment_time_reset form-group">
                                    <label class="col-sm-2 control-label" for="bed_number">Date<span class="require-field">*</span></label>
                                    <div class="col-sm-6">
                                        <input id="appointment_date" class="form-control validate[required] text-input appointment_date"
                                            type="text" value=""
                                            name="appointment_date">
                                        <input type="hidden" value="" id="hide_date_value">
                                        <input type="hidden" value="" id="hide_time_value">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="Note">Note<span class="require-field">*</span></label>
                                    <div class="col-sm-6">
                                        <note>
                                                        <p>
                                                            <h3 style="color:#4CAF50;">Green box is available appointments </h3>
                                                        </p>
                                                        <p>
                                                            <h3 style="color:#008CBA;">Blue box is already Booked appointments </h3>
                                                        </p>
                                                    </note>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="time">Select Appointment Time<span class="require-field">*</span></label>
                                    <div class="col-sm-8">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">
                                            Morning
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:00AM
                                                </span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_10_00" style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time align_time" value="10:00AM"></input>
                                                        <input type="hidden" name="timeabc[10:00AM]" class="time" value="10:00AM"></input>
                                                        <input type="hidden" name="time[10:00AM]" value="10:00  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:15AM
                                                </span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_10_15" style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time align_time" value="10:15AM"></input>
                                                        <input type="hidden" name="timeabc[10:15AM]" class="time" value="10:15AM"></input>
                                                        <input type="hidden" name="time[10:15AM]" value="10:15  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:30AM
                                                </span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_10_30" style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time align_time" value="10:30AM"></input>
                                                        <input type="hidden" name="timeabc[10:30AM]" class="time" value="10:30AM"></input>
                                                        <input type="hidden" name="time[10:30AM]" value="10:30  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:45AM
                                                </span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_10_45" style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time align_time" value="10:45AM"></input>
                                                        <input type="hidden" name="timeabc[10:45AM]" class="time" value="10:45AM"></input>
                                                        <input type="hidden" name="time[10:45AM]" value="10:45  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:00AM
                                                </span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_11_00" style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time align_time" value="11:00AM"></input>
                                                        <input type="hidden" name="timeabc[11:00AM]" class="time" value="11:00AM"></input>
                                                        <input type="hidden" name="time[11:00AM]" value="11:00  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:15AM
                                                </span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_11_15" style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time align_time" value="11:15AM "></input>
                                                        <input type="hidden" name="timeabc[11:15AM ]" class="time" value="11:15AM "></input>
                                                        <input type="hidden" name="time[11:15AM ]" value="11:15  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:30AM
                                                </span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_11_30" style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time align_time" value="11:30AM"></input>
                                                        <input type="hidden" name="timeabc[11:30AM]" class="time" value="11:30AM"></input>
                                                        <input type="hidden" name="time[11:30AM]" value="11:30  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:45AM
                                                </span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_11_45" style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time align_time" value="11:45AM"></input>
                                                        <input type="hidden" name="timeabc[11:45AM]" class="time" value="11:45AM"></input>
                                                        <input type="hidden" name="time[11:45AM]" value="11:45  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">
                                            Afternoon
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:00PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_12_00 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="12:00PM"></input>
                                                        <input type="hidden" name="timeabc[12:00PM]" class="time" value="12:00PM"></input>
                                                        <input type="hidden" name="time[12:00PM]" value="12:00  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:15PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_12_15 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="12:15PM"></input>
                                                        <input type="hidden" name="timeabc[12:15PM]" class="time" value="12:15PM"></input>
                                                        <input type="hidden" name="time[12:15PM]" value="12:15  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:30PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_12_30 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="12:30PM"></input>
                                                        <input type="hidden" name="timeabc[12:30PM]" class="time" value="12:30PM"></input>
                                                        <input type="hidden" name="time[12:30PM]" value="12:30  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:45PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_12_45 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="12:45PM"></input>
                                                        <input type="hidden" name="timeabc[12:45PM]" class="time" value="12:45PM"></input>
                                                        <input type="hidden" name="time[12:45PM]" value="12:45  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:00PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_01_00 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="01:00PM"></input>
                                                        <input type="hidden" name="timeabc[01:00PM]" class="time" value="01:00PM"></input>
                                                        <input type="hidden" name="time[01:00PM]" value="01:00  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:15PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_01_15 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="01:15PM"></input>
                                                        <input type="hidden" name="timeabc[01:15PM]" class="time" value="01:15PM"></input>
                                                        <input type="hidden" name="time[01:15PM]" value="01:15  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:30PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_01_30 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="01:30PM"></input>
                                                        <input type="hidden" name="timeabc[01:30PM]" class="time" value="01:30PM"></input>
                                                        <input type="hidden" name="time[01:30PM]" value="01:30  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:45PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_01_45 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="01:45PM"></input>
                                                        <input type="hidden" name="timeabc[01:45PM]" class="time" value="01:45PM"></input>
                                                        <input type="hidden" name="time[01:45PM]" value="01:45  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:00PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_02_00 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="02:00PM"></input>
                                                        <input type="hidden" name="timeabc[02:00PM]" class="time" value="02:00PM"></input>
                                                        <input type="hidden" name="time[02:00PM]" value="02:00  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:15PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_02_15 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="02:15PM"></input>
                                                        <input type="hidden" name="timeabc[02:15PM]" class="time" value="02:15PM"></input>
                                                        <input type="hidden" name="time[02:15PM]" value="02:15  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:30PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_02_30 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="02:30PM"></input>
                                                        <input type="hidden" name="timeabc[02:30PM]" class="time" value="02:30PM"></input>
                                                        <input type="hidden" name="time[02:30PM]" value="02:30  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:45PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_02_45 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="02:45PM"></input>
                                                        <input type="hidden" name="timeabc[02:45PM]" class="time" value="02:45PM"></input>
                                                        <input type="hidden" name="time[02:45PM]" value="02:45  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:00PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_03_00 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="03:00PM"></input>
                                                        <input type="hidden" name="timeabc[03:00PM]" class="time" value="03:00PM"></input>
                                                        <input type="hidden" name="time[03:00PM]" value="03:00  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:15PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_03_15 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="03:15PM"></input>
                                                        <input type="hidden" name="timeabc[03:15PM]" class="time" value="03:15PM"></input>
                                                        <input type="hidden" name="time[03:15PM]" value="03:15  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:30PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_03_30 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="03:30PM"></input>
                                                        <input type="hidden" name="timeabc[03:30PM]" class="time" value="03:30PM"></input>
                                                        <input type="hidden" name="time[03:30PM]" value="03:30  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:45PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_03_45 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="03:45PM"></input>
                                                        <input type="hidden" name="timeabc[03:45PM]" class="time" value="03:45PM"></input>
                                                        <input type="hidden" name="time[03:45PM]" value="03:45  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:00PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_04_00 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="04:00PM"></input>
                                                        <input type="hidden" name="timeabc[04:00PM]" class="time" value="04:00PM"></input>
                                                        <input type="hidden" name="time[04:00PM]" value="04:00  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:15PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_04_15 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="04:15PM"></input>
                                                        <input type="hidden" name="timeabc[04:15PM]" class="time" value="04:15PM"></input>
                                                        <input type="hidden" name="time[04:15PM]" value="04:15  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:30PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_04_30 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="04:30PM"></input>
                                                        <input type="hidden" name="timeabc[04:30PM]" class="time" value="04:30PM"></input>
                                                        <input type="hidden" name="time[04:30PM]" value="04:30  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:45PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_04_45 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="04:45PM"></input>
                                                        <input type="hidden" name="timeabc[04:45PM]" class="time" value="04:45PM"></input>
                                                        <input type="hidden" name="time[04:45PM]" value="04:45  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:00PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_05_00 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="05:00PM"></input>
                                                        <input type="hidden" name="timeabc[05:00PM]" class="time" value="05:00PM"></input>
                                                        <input type="hidden" name="time[05:00PM]" value="05:00  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:15PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_05_15 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="05:15PM"></input>
                                                        <input type="hidden" name="timeabc[05:15PM]" class="time" value="05:15PM"></input>
                                                        <input type="hidden" name="time[05:15PM]" value="05:15  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:30PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_05_30 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="05:30PM"></input>
                                                        <input type="hidden" name="timeabc[05:30PM]" class="time" value="05:30PM"></input>
                                                        <input type="hidden" name="time[05:30PM]" value="05:30  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:45PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_05_45 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="05:45PM"></input>
                                                        <input type="hidden" name="timeabc[05:45PM]" class="time" value="05:45PM"></input>
                                                        <input type="hidden" name="time[05:45PM]" value="05:45  "></input>
                                                    </span>
                                                </span>
                                        </div>

                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">
                                            Evening
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:00PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_06_00 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="06:00PM"></input>
                                                        <input type="hidden" name="timeabc[06:00PM]" class="time" value="06:00PM"></input>
                                                        <input type="hidden" name="time[06:00PM]" value="06:00  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:15PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_06_15 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="06:15PM"></input>
                                                        <input type="hidden" name="timeabc[06:15PM]" class="time" value="06:15PM"></input>
                                                        <input type="hidden" name="time[06:15PM]" value="06:15  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:30PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_06_30 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="06:30PM"></input>
                                                        <input type="hidden" name="timeabc[06:30PM]" class="time" value="06:30PM"></input>
                                                        <input type="hidden" name="time[06:30PM]" value="06:30  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:45PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_06_45 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="06:45PM"></input>
                                                        <input type="hidden" name="timeabc[06:45PM]" class="time" value="06:45PM"></input>
                                                        <input type="hidden" name="time[06:45PM]" value="06:45  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:00PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_07_00 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="07:00PM"></input>
                                                        <input type="hidden" name="timeabc[07:00PM]" class="time" value="07:00PM"></input>
                                                        <input type="hidden" name="time[07:00PM]" value="07:00  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:15PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_07_15 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="07:15PM"></input>
                                                        <input type="hidden" name="timeabc[07:15PM]" class="time" value="07:15PM"></input>
                                                        <input type="hidden" name="time[07:15PM]" value="07:15  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:30PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_07_30 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="07:30PM"></input>
                                                        <input type="hidden" name="timeabc[07:30PM]" class="time" value="07:30PM"></input>
                                                        <input type="hidden" name="time[07:30PM]" value="07:30  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:45PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_07_45 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="07:45PM"></input>
                                                        <input type="hidden" name="timeabc[07:45PM]" class="time" value="07:45PM"></input>
                                                        <input type="hidden" name="time[07:45PM]" value="07:45  "></input>
                                                    </span>
                                                </span>
                                        </div>
                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">08:00PM</span>
                                                <span style="text-align: center; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                    <span class="removeselect selected_08_00 " style="float: left; width: 100%; padding: 0px;">
                                                        <input type="radio" name="realtime" class="time" value="08:00PM"></input>
                                                        <input type="hidden" name="timeabc[08:00PM]" class="time" value="08:00PM"></input>
                                                        <input type="hidden" name="time[08:00PM]" value="08:00  "></input>
                                                    </span>
                                                </span>
                                        </div>

                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label " for="enable">Send SMS</label>
                                    <div class="col-sm-8">
                                        <div class="checkbox">
                                            <label>
                                                <input id="chk_sms_sent11" type="checkbox" value="1" name="hmgt_sms_service_enable">
                                            </label>
                                        </div>

                                    </div>
                                </div>
                                <input type="hidden" id="_wpnonce" name="_wpnonce" value="3e52a8e2b2" /><input type="hidden" name="_wp_http_referer" value="/mojoomla/extend/wordpress/hospital/?dashboard=user&amp;page=appointment" />
                                <div class="col-sm-offset-2 col-sm-8">
                                    <input type="submit" value="Save" name="save_appointment" class="btn btn-success" />
                                </div>
                            </form>
                            <!-- END Appointment FORM-->
                        </div>
                        <!-- END PANEL BODY DIV -->
                    </div>
                    <!-- END TAB PANE  DIV -->
                    <!-- doctor side  -->
                    <!---   start add time tab -->
                    <div class="tab-pane " id="add_appointment">
                        <!-- STAR TAB PANE DIV -->
                        <div class="panel-body">
                            <!-- STAR PANEL BODY DIV -->
                            <form name="apintment_time_form" action="" method="post" class="form-horizontal apointment_times_form" id="patient_form">
                                <!--- START Appointment TIME FORM -->
                                <div class="form-group appointment_note" style="display: none;">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <note>
                                                        <p>
                                                            <h3 style="color:#e21313fc;" class="appointment_msg"></h3>
                                                            <input type="hidden" name="already_appointment_set_time" id="already_appointment_set_time" value="">
                                                        </p>
                                                    </note>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="notice_content">Start Date<span class="require-field">*</span></label>

                                    <div class="col-sm-8">
                                        <input id="appointment_time_startdate" class="appointment_start_date appointmet_sdate datepicker form-control validate[required] text-input" type="text" value="" name="appointment_time_startdate" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="notice_content">End Date<span class="require-field">*</span></label>

                                    <div class="col-sm-8">
                                        <input id="appointment_time_enddate" class="datepicker form-control validate[required] text-input" type="text" value="" name="appointment_time_enddate" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="time">Add Appointment Time<span class="require-field">*</span></label>
                                </div>
                                <div class="form-group">


                                    <div class="col-sm-offset-2 col-sm-8">
                                        <div id="accordion" class="panel-group" aria-multiselectable="true" role="tablist">
                                            <div class="panel panel-default">
                                                <div id="heading_monday" class="panel-heading" role="tab">
                                                    <h4 class="panel-title">
                                                        <a class="collapsed" aria-controls="collapse_monday" aria-expanded="false" href="#collapse_monday" data-parent="#accordion" data-toggle="collapse">Monday
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapse_monday" class="panel-collapse collapse" aria-labelledby="heading_monday" role="tabpanel" aria-expanded="false" style="height: 0px;">
                                                    <div class="panel-body">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">
                                                            Morning
                                                        </div>


                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:00AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_10_00_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[10:00][monday]" value="10:00"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:15AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_10_15_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[10:15][monday]" value="10:15"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:30AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_10_30_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[10:30][monday]" value="10:30"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:45AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_10_45_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[10:45][monday]" value="10:45"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:00AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_11_00_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[11:00][monday]" value="11:00"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:15AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_11_15_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[11:15][monday]" value="11:15"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:30AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_11_30_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[11:30][monday]" value="11:30"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:45AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_11_45_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[11:45][monday]" value="11:45"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">
                                                            Afternoon
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_12_00_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[12:00][monday]" value="12:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_12_15_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[12:15][monday]" value="12:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_12_30_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[12:30][monday]" value="12:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_12_45_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[12:45][monday]" value="12:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_01_00_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[01:00][monday]" value="01:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_01_15_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[01:15][monday]" value="01:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_01_30_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[01:30][monday]" value="01:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_01_45_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[01:45][monday]" value="01:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_02_00_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[02:00][monday]" value="02:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_02_15_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[02:15][monday]" value="02:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_02_30_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[02:30][monday]" value="02:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_02_45_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[02:45][monday]" value="02:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_03_00_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[03:00][monday]" value="03:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_03_15_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[03:15][monday]" value="03:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_03_30_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[03:30][monday]" value="03:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_03_45_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[03:45][monday]" value="03:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_04_00_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[04:00][monday]" value="04:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_04_15_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[04:15][monday]" value="04:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_04_30_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[04:30][monday]" value="04:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_04_45_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[04:45][monday]" value="04:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_05_00_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[05:00][monday]" value="05:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_05_15_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[05:15][monday]" value="05:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_05_30_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[05:30][monday]" value="05:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_05_45_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[05:45][monday]" value="05:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">
                                                            Evening
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_06_00_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[06:00][monday]" value="06:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_06_15_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[06:15][monday]" value="06:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_06_30_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[06:30][monday]" value="06:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_06_45_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[06:45][monday]" value="06:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_07_00_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[07:00][monday]" value="07:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_07_15_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[07:15][monday]" value="07:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_07_30_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[07:30][monday]" value="07:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_07_45_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[07:45][monday]" value="07:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">08:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_08_00_monday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[08:00][monday]" value="08:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-sm-offset-2 col-sm-8">
                                        <div id="accordion" class="panel-group" aria-multiselectable="true" role="tablist">
                                            <div class="panel panel-default">
                                                <div id="heading_tuesday" class="panel-heading" role="tab">
                                                    <h4 class="panel-title">
                                                        <a class="collapsed" aria-controls="collapse_tuesday" aria-expanded="false" href="#collapse_tuesday" data-parent="#accordion" data-toggle="collapse">Tuesday
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapse_tuesday" class="panel-collapse collapse" aria-labelledby="heading_tuesday" role="tabpanel" aria-expanded="false" style="height: 0px;">
                                                    <div class="panel-body">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">
                                                            Morning
                                                        </div>


                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:00AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_10_00_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[10:00][tuesday]" value="10:00"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:15AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_10_15_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[10:15][tuesday]" value="10:15"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:30AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_10_30_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[10:30][tuesday]" value="10:30"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:45AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_10_45_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[10:45][tuesday]" value="10:45"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:00AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_11_00_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[11:00][tuesday]" value="11:00"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:15AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_11_15_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[11:15][tuesday]" value="11:15"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:30AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_11_30_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[11:30][tuesday]" value="11:30"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:45AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_11_45_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[11:45][tuesday]" value="11:45"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">
                                                            Afternoon
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_12_00_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[12:00][tuesday]" value="12:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_12_15_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[12:15][tuesday]" value="12:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_12_30_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[12:30][tuesday]" value="12:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_12_45_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[12:45][tuesday]" value="12:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_01_00_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[01:00][tuesday]" value="01:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_01_15_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[01:15][tuesday]" value="01:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_01_30_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[01:30][tuesday]" value="01:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_01_45_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[01:45][tuesday]" value="01:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_02_00_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[02:00][tuesday]" value="02:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_02_15_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[02:15][tuesday]" value="02:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_02_30_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[02:30][tuesday]" value="02:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_02_45_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[02:45][tuesday]" value="02:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_03_00_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[03:00][tuesday]" value="03:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_03_15_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[03:15][tuesday]" value="03:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_03_30_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[03:30][tuesday]" value="03:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_03_45_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[03:45][tuesday]" value="03:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_04_00_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[04:00][tuesday]" value="04:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_04_15_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[04:15][tuesday]" value="04:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_04_30_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[04:30][tuesday]" value="04:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_04_45_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[04:45][tuesday]" value="04:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_05_00_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[05:00][tuesday]" value="05:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_05_15_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[05:15][tuesday]" value="05:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_05_30_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[05:30][tuesday]" value="05:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_05_45_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[05:45][tuesday]" value="05:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">
                                                            Evening
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_06_00_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[06:00][tuesday]" value="06:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_06_15_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[06:15][tuesday]" value="06:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_06_30_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[06:30][tuesday]" value="06:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_06_45_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[06:45][tuesday]" value="06:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_07_00_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[07:00][tuesday]" value="07:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_07_15_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[07:15][tuesday]" value="07:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_07_30_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[07:30][tuesday]" value="07:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_07_45_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[07:45][tuesday]" value="07:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">08:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_08_00_tuesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[08:00][tuesday]" value="08:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-sm-offset-2 col-sm-8">
                                        <div id="accordion" class="panel-group" aria-multiselectable="true" role="tablist">
                                            <div class="panel panel-default">
                                                <div id="heading_wednesday" class="panel-heading" role="tab">
                                                    <h4 class="panel-title">
                                                        <a class="collapsed" aria-controls="collapse_wednesday" aria-expanded="false" href="#collapse_wednesday" data-parent="#accordion" data-toggle="collapse">Wednesday
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapse_wednesday" class="panel-collapse collapse" aria-labelledby="heading_wednesday" role="tabpanel" aria-expanded="false" style="height: 0px;">
                                                    <div class="panel-body">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">
                                                            Morning
                                                        </div>


                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:00AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_10_00_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[10:00][wednesday]" value="10:00"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:15AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_10_15_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[10:15][wednesday]" value="10:15"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:30AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_10_30_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[10:30][wednesday]" value="10:30"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:45AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_10_45_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[10:45][wednesday]" value="10:45"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:00AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_11_00_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[11:00][wednesday]" value="11:00"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:15AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_11_15_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[11:15][wednesday]" value="11:15"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:30AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_11_30_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[11:30][wednesday]" value="11:30"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:45AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_11_45_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[11:45][wednesday]" value="11:45"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">
                                                            Afternoon
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_12_00_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[12:00][wednesday]" value="12:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_12_15_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[12:15][wednesday]" value="12:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_12_30_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[12:30][wednesday]" value="12:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_12_45_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[12:45][wednesday]" value="12:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_01_00_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[01:00][wednesday]" value="01:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_01_15_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[01:15][wednesday]" value="01:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_01_30_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[01:30][wednesday]" value="01:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_01_45_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[01:45][wednesday]" value="01:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_02_00_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[02:00][wednesday]" value="02:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_02_15_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[02:15][wednesday]" value="02:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_02_30_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[02:30][wednesday]" value="02:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_02_45_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[02:45][wednesday]" value="02:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_03_00_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[03:00][wednesday]" value="03:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_03_15_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[03:15][wednesday]" value="03:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_03_30_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[03:30][wednesday]" value="03:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_03_45_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[03:45][wednesday]" value="03:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_04_00_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[04:00][wednesday]" value="04:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_04_15_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[04:15][wednesday]" value="04:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_04_30_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[04:30][wednesday]" value="04:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_04_45_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[04:45][wednesday]" value="04:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_05_00_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[05:00][wednesday]" value="05:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_05_15_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[05:15][wednesday]" value="05:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_05_30_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[05:30][wednesday]" value="05:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_05_45_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[05:45][wednesday]" value="05:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">
                                                            Evening
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_06_00_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[06:00][wednesday]" value="06:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_06_15_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[06:15][wednesday]" value="06:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_06_30_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[06:30][wednesday]" value="06:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_06_45_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[06:45][wednesday]" value="06:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_07_00_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[07:00][wednesday]" value="07:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_07_15_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[07:15][wednesday]" value="07:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_07_30_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[07:30][wednesday]" value="07:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_07_45_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[07:45][wednesday]" value="07:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">08:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_08_00_wednesday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[08:00][wednesday]" value="08:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-sm-offset-2 col-sm-8">
                                        <div id="accordion" class="panel-group" aria-multiselectable="true" role="tablist">
                                            <div class="panel panel-default">
                                                <div id="heading_thursday" class="panel-heading" role="tab">
                                                    <h4 class="panel-title">
                                                        <a class="collapsed" aria-controls="collapse_thursday" aria-expanded="false" href="#collapse_thursday" data-parent="#accordion" data-toggle="collapse">Thursday
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapse_thursday" class="panel-collapse collapse" aria-labelledby="heading_thursday" role="tabpanel" aria-expanded="false" style="height: 0px;">
                                                    <div class="panel-body">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">
                                                            Morning
                                                        </div>


                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:00AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_10_00_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[10:00][thursday]" value="10:00"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:15AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_10_15_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[10:15][thursday]" value="10:15"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:30AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_10_30_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[10:30][thursday]" value="10:30"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:45AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_10_45_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[10:45][thursday]" value="10:45"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:00AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_11_00_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[11:00][thursday]" value="11:00"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:15AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_11_15_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[11:15][thursday]" value="11:15"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:30AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_11_30_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[11:30][thursday]" value="11:30"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:45AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_11_45_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[11:45][thursday]" value="11:45"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">
                                                            Afternoon
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_12_00_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[12:00][thursday]" value="12:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_12_15_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[12:15][thursday]" value="12:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_12_30_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[12:30][thursday]" value="12:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_12_45_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[12:45][thursday]" value="12:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_01_00_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[01:00][thursday]" value="01:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_01_15_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[01:15][thursday]" value="01:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_01_30_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[01:30][thursday]" value="01:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_01_45_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[01:45][thursday]" value="01:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_02_00_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[02:00][thursday]" value="02:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_02_15_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[02:15][thursday]" value="02:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_02_30_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[02:30][thursday]" value="02:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_02_45_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[02:45][thursday]" value="02:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_03_00_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[03:00][thursday]" value="03:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_03_15_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[03:15][thursday]" value="03:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_03_30_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[03:30][thursday]" value="03:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_03_45_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[03:45][thursday]" value="03:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_04_00_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[04:00][thursday]" value="04:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_04_15_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[04:15][thursday]" value="04:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_04_30_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[04:30][thursday]" value="04:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_04_45_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[04:45][thursday]" value="04:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_05_00_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[05:00][thursday]" value="05:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_05_15_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[05:15][thursday]" value="05:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_05_30_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[05:30][thursday]" value="05:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_05_45_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[05:45][thursday]" value="05:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">
                                                            Evening
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_06_00_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[06:00][thursday]" value="06:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_06_15_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[06:15][thursday]" value="06:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_06_30_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[06:30][thursday]" value="06:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_06_45_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[06:45][thursday]" value="06:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_07_00_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[07:00][thursday]" value="07:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_07_15_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[07:15][thursday]" value="07:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_07_30_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[07:30][thursday]" value="07:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_07_45_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[07:45][thursday]" value="07:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">08:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_08_00_thursday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[08:00][thursday]" value="08:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-sm-offset-2 col-sm-8">
                                        <div id="accordion" class="panel-group" aria-multiselectable="true" role="tablist">
                                            <div class="panel panel-default">
                                                <div id="heading_friday" class="panel-heading" role="tab">
                                                    <h4 class="panel-title">
                                                        <a class="collapsed" aria-controls="collapse_friday" aria-expanded="false" href="#collapse_friday" data-parent="#accordion" data-toggle="collapse">Friday
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapse_friday" class="panel-collapse collapse" aria-labelledby="heading_friday" role="tabpanel" aria-expanded="false" style="height: 0px;">
                                                    <div class="panel-body">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">
                                                            Morning
                                                        </div>


                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:00AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_10_00_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[10:00][friday]" value="10:00"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:15AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_10_15_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[10:15][friday]" value="10:15"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:30AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_10_30_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[10:30][friday]" value="10:30"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:45AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_10_45_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[10:45][friday]" value="10:45"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:00AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_11_00_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[11:00][friday]" value="11:00"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:15AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_11_15_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[11:15][friday]" value="11:15"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:30AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_11_30_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[11:30][friday]" value="11:30"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:45AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_11_45_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[11:45][friday]" value="11:45"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">
                                                            Afternoon
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_12_00_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[12:00][friday]" value="12:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_12_15_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[12:15][friday]" value="12:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_12_30_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[12:30][friday]" value="12:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_12_45_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[12:45][friday]" value="12:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_01_00_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[01:00][friday]" value="01:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_01_15_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[01:15][friday]" value="01:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_01_30_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[01:30][friday]" value="01:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_01_45_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[01:45][friday]" value="01:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_02_00_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[02:00][friday]" value="02:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_02_15_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[02:15][friday]" value="02:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_02_30_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[02:30][friday]" value="02:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_02_45_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[02:45][friday]" value="02:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_03_00_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[03:00][friday]" value="03:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_03_15_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[03:15][friday]" value="03:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_03_30_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[03:30][friday]" value="03:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_03_45_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[03:45][friday]" value="03:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_04_00_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[04:00][friday]" value="04:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_04_15_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[04:15][friday]" value="04:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_04_30_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[04:30][friday]" value="04:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_04_45_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[04:45][friday]" value="04:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_05_00_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[05:00][friday]" value="05:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_05_15_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[05:15][friday]" value="05:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_05_30_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[05:30][friday]" value="05:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_05_45_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[05:45][friday]" value="05:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">
                                                            Evening
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_06_00_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[06:00][friday]" value="06:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_06_15_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[06:15][friday]" value="06:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_06_30_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[06:30][friday]" value="06:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_06_45_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[06:45][friday]" value="06:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_07_00_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[07:00][friday]" value="07:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_07_15_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[07:15][friday]" value="07:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_07_30_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[07:30][friday]" value="07:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_07_45_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[07:45][friday]" value="07:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">08:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_08_00_friday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[08:00][friday]" value="08:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-sm-offset-2 col-sm-8">
                                        <div id="accordion" class="panel-group" aria-multiselectable="true" role="tablist">
                                            <div class="panel panel-default">
                                                <div id="heading_saturday" class="panel-heading" role="tab">
                                                    <h4 class="panel-title">
                                                        <a class="collapsed" aria-controls="collapse_saturday" aria-expanded="false" href="#collapse_saturday" data-parent="#accordion" data-toggle="collapse">Saturday
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapse_saturday" class="panel-collapse collapse" aria-labelledby="heading_saturday" role="tabpanel" aria-expanded="false" style="height: 0px;">
                                                    <div class="panel-body">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">
                                                            Morning
                                                        </div>


                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:00AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_10_00_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[10:00][saturday]" value="10:00"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:15AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_10_15_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[10:15][saturday]" value="10:15"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:30AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_10_30_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[10:30][saturday]" value="10:30"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:45AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_10_45_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[10:45][saturday]" value="10:45"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:00AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_11_00_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[11:00][saturday]" value="11:00"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:15AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_11_15_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[11:15][saturday]" value="11:15"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:30AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_11_30_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[11:30][saturday]" value="11:30"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:45AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_11_45_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[11:45][saturday]" value="11:45"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">
                                                            Afternoon
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_12_00_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[12:00][saturday]" value="12:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_12_15_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[12:15][saturday]" value="12:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_12_30_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[12:30][saturday]" value="12:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_12_45_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[12:45][saturday]" value="12:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_01_00_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[01:00][saturday]" value="01:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_01_15_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[01:15][saturday]" value="01:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_01_30_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[01:30][saturday]" value="01:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_01_45_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[01:45][saturday]" value="01:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_02_00_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[02:00][saturday]" value="02:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_02_15_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[02:15][saturday]" value="02:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_02_30_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[02:30][saturday]" value="02:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_02_45_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[02:45][saturday]" value="02:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_03_00_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[03:00][saturday]" value="03:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_03_15_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[03:15][saturday]" value="03:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_03_30_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[03:30][saturday]" value="03:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_03_45_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[03:45][saturday]" value="03:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_04_00_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[04:00][saturday]" value="04:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_04_15_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[04:15][saturday]" value="04:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_04_30_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[04:30][saturday]" value="04:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_04_45_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[04:45][saturday]" value="04:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_05_00_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[05:00][saturday]" value="05:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_05_15_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[05:15][saturday]" value="05:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_05_30_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[05:30][saturday]" value="05:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_05_45_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[05:45][saturday]" value="05:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">
                                                            Evening
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_06_00_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[06:00][saturday]" value="06:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_06_15_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[06:15][saturday]" value="06:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_06_30_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[06:30][saturday]" value="06:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_06_45_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[06:45][saturday]" value="06:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_07_00_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[07:00][saturday]" value="07:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_07_15_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[07:15][saturday]" value="07:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_07_30_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[07:30][saturday]" value="07:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_07_45_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[07:45][saturday]" value="07:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">08:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_08_00_saturday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[08:00][saturday]" value="08:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-sm-offset-2 col-sm-8">
                                        <div id="accordion" class="panel-group" aria-multiselectable="true" role="tablist">
                                            <div class="panel panel-default">
                                                <div id="heading_sunday" class="panel-heading" role="tab">
                                                    <h4 class="panel-title">
                                                        <a class="collapsed" aria-controls="collapse_sunday" aria-expanded="false" href="#collapse_sunday" data-parent="#accordion" data-toggle="collapse">Sunday
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapse_sunday" class="panel-collapse collapse" aria-labelledby="heading_sunday" role="tabpanel" aria-expanded="false" style="height: 0px;">
                                                    <div class="panel-body">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">
                                                            Morning
                                                        </div>


                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:00AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_10_00_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[10:00][sunday]" value="10:00"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:15AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_10_15_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[10:15][sunday]" value="10:15"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:30AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_10_30_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[10:30][sunday]" value="10:30"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">10:45AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_10_45_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[10:45][sunday]" value="10:45"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:00AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_11_00_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[11:00][sunday]" value="11:00"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:15AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_11_15_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[11:15][sunday]" value="11:15"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:30AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_11_30_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[11:30][sunday]" value="11:30"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">11:45AM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_11_45_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[11:45][sunday]" value="11:45"> </input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">
                                                            Afternoon
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_12_00_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[12:00][sunday]" value="12:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_12_15_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[12:15][sunday]" value="12:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_12_30_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[12:30][sunday]" value="12:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">12:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_12_45_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[12:45][sunday]" value="12:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_01_00_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[01:00][sunday]" value="01:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_01_15_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[01:15][sunday]" value="01:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_01_30_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[01:30][sunday]" value="01:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">01:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_01_45_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[01:45][sunday]" value="01:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_02_00_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[02:00][sunday]" value="02:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_02_15_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[02:15][sunday]" value="02:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_02_30_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[02:30][sunday]" value="02:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">02:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_02_45_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[02:45][sunday]" value="02:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_03_00_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[03:00][sunday]" value="03:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_03_15_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[03:15][sunday]" value="03:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_03_30_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[03:30][sunday]" value="03:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">03:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_03_45_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[03:45][sunday]" value="03:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_04_00_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[04:00][sunday]" value="04:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_04_15_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[04:15][sunday]" value="04:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_04_30_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[04:30][sunday]" value="04:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">04:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_04_45_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[04:45][sunday]" value="04:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_05_00_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[05:00][sunday]" value="05:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_05_15_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[05:15][sunday]" value="05:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_05_30_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[05:30][sunday]" value="05:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">05:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_05_45_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[05:45][sunday]" value="05:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 appointment_padding_border" align="center">
                                                            Evening
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_06_00_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[06:00][sunday]" value="06:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_06_15_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[06:15][sunday]" value="06:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_06_30_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[06:30][sunday]" value="06:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">06:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_06_45_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[06:45][sunday]" value="06:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_07_00_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[07:00][sunday]" value="07:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:15PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_07_15_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[07:15][sunday]" value="07:15"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:30PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_07_30_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[07:30][sunday]" value="07:30"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">07:45PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_07_45_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[07:45][sunday]" value="07:45"></input>
                                                                    </span>
                                                                </span>
                                                        </div>
                                                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-4 appointment_padding_border col_xs_4_css">
                                                            <span style="border: 1px solid #000; padding: 0;" class="appointment_col_md_12 col-md-12">
                                                                <span style="padding: 5px; border-bottom: 1px solid #000; text-align: center; background: #f2f2f2;" class="appointment_col_md_12 col-md-12 time_font_size">08:00PM</span>
                                                                <span style="text-align: center" class="appointment_col_md_12 col-md-12">
                                                                    <span class="selected_08_00_sunday" style="float: left; width: 100%; padding: 0px;">
                                                                        <input type="checkbox" class="avilable_time" id="chktime" name="time[08:00][sunday]" value="08:00"></input>
                                                                    </span>
                                                                </span>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" id="_wpnonce" name="_wpnonce" value="00f7c36cf5" /><input type="hidden" name="_wp_http_referer" value="/mojoomla/extend/wordpress/hospital/?dashboard=user&amp;page=appointment" />
                                <div class="col-sm-offset-2 col-sm-8">
                                    <input type="submit" id="btnsavetime" value="Save" name="save_appointment_time" class="btn btn-success" />
                                </div>
                            </form>
                            <!-- end appointment time form-->
                        </div>
                        <!-- end PANEL BODY DIV-->
                    </div>
                    <!-- end TAB PANE DIV-->
                </div>
                <!-- end PANEL WHITE DIV-->
            </div>
            <!-- end PANEL BODY DIV-->
        </div>
    </div>

</asp:Content>
