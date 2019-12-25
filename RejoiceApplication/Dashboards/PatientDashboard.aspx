<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PatientDashboard.aspx.cs" Inherits="RejoiceApplication.Dashboards.PatientDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="page-inner" style="min-height: 1050px;">
<!-- start page inner div-->
<div class="row right_side ">
<!-- start dashboard content div-->
<!---start new dashboard------>

<div class="row">
    <div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
        <a href="../Details/InPatientList.aspx">
            <div class="panel info-box panel-white">
                <div class="panel-body patient">
                    <div class="info-box-stats">
                        <p class="counter">86</p>

                        <span class="info-box-title">Patient</span>
                    </div>
                    <img src="../images/dashboard/patient.png" class="dashboard_background">
                </div>
            </div>
        </a>
    </div>

    <div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
        <a href="../Details/DoctorList.aspx">
            <div class="panel info-box panel-white">
                <div class="panel-body doctor">
                    <div class="info-box-stats">
                        <p class="counter">1</p>
                        <span class="info-box-title">Doctor</span>
                    </div>
                    <img src="../images/dashboard/doctor.png" class="dashboard_background">
                </div>
            </div>
        </a>
    </div>

    <div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
        <a href="../Details/Nurse.aspx">
            <div class="panel info-box panel-white">
                <div class="panel-body nurse">
                    <div class="info-box-stats">
                        <p class="counter">1</p>
                        <span class="info-box-title">Nurse</span>
                    </div>
                    <img src="../images/dashboard/nurse.png" class="dashboard_background">
                </div>
            </div>
        </a>
    </div>

    <div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
        <a href="../Details/SupportStaff.aspx">
            <div class="panel info-box panel-white">
                <div class="panel-body receptionist">
                    <div class="info-box-stats">
                        <p class="counter">1</p>

                        <span class="info-box-title">Support Staff</span>
                    </div>
                    <img src="../images/dashboard/support-staft.png" class="dashboard_background">
                </div>
            </div>
        </a>
    </div>


    <div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
        <a href="../Message/Messages.aspx">
            <div class="panel info-box panel-white">
                <div class="panel-body message">
                    <div class="info-box-stats">
                        <p class="counter">0</p>

                        <span class="info-box-title">Message</span>
                    </div>
                    <img src="../images/dashboard/message.png" class="dashboard_background">
                </div>
            </div>
        </a>
    </div>

    <div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
        <a href="../Account.aspx">
            <div class="panel info-box panel-white">
                <div class="panel-body setting">
                    <div class="info-box-stats">
                        <p class="counter">&nbsp;</p>
                        <span class="info-box-title">Setting</span>
                    </div>
                    <img src="../images/dashboard/setting-image.png" class="dashboard_background">
                </div>
            </div>
        </a>
    </div>

    <div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
        <a href="../Events.aspx">
            <div class="panel info-box panel-white">
                <div class="panel-body eventnotice">
                    <div class="info-box-stats">
                        <p class="counter">
                            3
                        </p>

                        <span class="info-box-title">
                            Events/
                            <br>
                            Notice
                        </span>
                    </div>
                    <img src="../images/dashboard/notice-event-image.png" class="dashboard_background">
                </div>
            </div>
        </a>
    </div>
    <div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
        <a href="../Details/Pharmacist.aspx">
            <div class="panel info-box panel-white">
                <div class="panel-body pharmacist">
                    <div class="info-box-stats">
                        <p class="counter">1</p>

                        <span class="info-box-title">Pharmacist</span>
                    </div>
                    <img src="../images/dashboard/pharmacist.png" class="dashboard_background">
                </div>
            </div>
        </a>
    </div>
    <div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
        <a href="../Details/LaboratoryStaff.aspx">
            <div class="panel info-box panel-white">
                <div class="panel-body laboratorist">
                    <div class="info-box-stats">
                        <p class="counter">1</p>

                        <span class="info-box-title">
                            Laboratory
                            <br>
                            Staff
                        </span>
                    </div>
                    <img src="../images/dashboard/laboratorist.png" class="dashboard_background">
                </div>
            </div>
        </a>
    </div>
    <div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
        <a href="../Details/Accountant.aspx">
            <div class="panel info-box panel-white">
                <div class="panel-body accountant">
                    <div class="info-box-stats">
                        <p class="counter">2</p>
                        <span class="info-box-title">Accountant</span>
                    </div>
                    <img src="../images/dashboard/accountant.png" class="dashboard_background">
                </div>
            </div>
        </a>
    </div>
</div>
<div class="row dashboard_panel_heading_border">
    <div class="col-md-6 no-paddingR">
        <!--  Start Prescription Box -->
        <div class="panel panel-white event priscription">
            <div class="panel-heading ">
                <img src="../images/dashboard/Prescription.png">
                <h3 class="panel-title">Prescription</h3>
            </div>
            <div class="panel-body">
                <div class="events">
                </div>
            </div>
        </div>
        <!-- End Prescription Box -->
        <!--  Start Operation Box -->
        <div class="panel panel-white event operation">
            <div class="panel-heading ">
                <img src="../images/dashboard/Operation-List.png">
                <h3 class="panel-title">Operation</h3>
            </div>
            <div class="panel-body">
                <div class="events">
                </div>
            </div>
        </div>
        <!-- End Operation Box -->
        <!-- start calendar Box -->
        <div class="panel panel-white">
            <div class="panel-heading" style="margin-bottom: 15px;">
                <img src="../images/dashboard/calender.png">
                <h3 class="panel-title">Calendar</h3>
            </div>
            <div class="panel-body">
                <div id="calendar"></div>
            </div>
        </div>
        <!-- end calendar Box -->
    </div>
    <div class="col-md-6">
        <!-- Start Appointment Box -->
        <div class="panel panel-white Appoinment">
            <div class="panel-heading">
                <img src="../images/dashboard/Appointment.png">
                <h3 class="panel-title">Appointment</h3>

                <a href="?dashboard=user&page=appointment&tab=addappoint&&action=insert" class="btn btn-default" style="float: right; margin-right: 10px;"><i class="fa fa-plus-circle"></i>Add Appointment</a>

            </div>
            <div class="panel-body">
                <div class="events">

                    <div class="calendar-event">
                        <p class="remainder_title Bold save1 show_task_event" id="41" model="Appointment Details">
                            Patient Name : Jose Figueroa
                        </p>
                        <p class="remainder_date" style="width: 160px; background-position: 85px;">
                            2019-07-12 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11:15AM
                        </p>
                    </div>

                    <div class="calendar-event">
                        <p class="remainder_title Bold save1 show_task_event" id="40" model="Appointment Details">
                            Patient Name : Jose Figueroa
                        </p>
                        <p class="remainder_date" style="width: 160px; background-position: 85px;">
                            2019-07-17 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10:30AM
                        </p>
                    </div>

                    <div class="calendar-event">
                        <p class="remainder_title Bold save1 show_task_event" id="38" model="Appointment Details">
                            Patient Name : Jose Figueroa
                        </p>
                        <p class="remainder_date" style="width: 160px; background-position: 85px;">
                            2019-07-17 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10:15AM
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <!--  End Appoinment box -->
        <!--  Start assigned bed Box -->
        <div class="panel panel-white event assignbed">
            <div class="panel-heading">
                <img src="../images/dashboard/Assign--Bed-nurse.png">
                <h3 class="panel-title">Assigned Bed</h3>
            </div>
            <div class="panel-body">
                <div class="events">
                </div>
            </div>
        </div>
        <!-- End assigned bed Box -->
        <!--  Start Event Box -->
        <div class="panel panel-white event">
            <div class="panel-heading ">
                <img src="../images/dashboard/event.png">
                <h3 class="panel-title">Events</h3>
            </div>
            <div class="panel-body">
                <div class="events">
                    <div class="calendar-event">
                        <p class="remainder_title Bold viewdetail show_task_event" id="93" model="Event Details">
                            Vacancies
                        </p>
                        <p class="remainder_date">
                            2019-04-29 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2019-04-30
                        </p>
                        <p class="remainder_title viewdetail">
                            Comes
                        </p>
                    </div>
                    <div class="calendar-event">
                        <p class="remainder_title Bold viewdetail show_task_event" id="78" model="Event Details">
                            event 1
                        </p>
                        <p class="remainder_date">
                            2019-03-26 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2019-03-30
                        </p>
                        <p class="remainder_title viewdetail">
                            event 1
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Event Box -->
        <!--  Start Notice box -->
        <div class="panel panel-white nt">
            <div class="panel-heading">
                <img src="../images/dashboard/notice1.png">
                <h3 class="panel-title">Notice</h3>
            </div>
            <div class="panel-body">
                <div class="events">

                    <div class="calendar-event">
                        <p class="remainder_title Bold viewdetail show_task_event" id="80" model="Notice Details">
                            holiday
                        </p>
                        <p class="remainder_date">2019-03-27 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2019-03-31</p>
                        <p class="remainder_title viewdetail"></p>
                    </div>

                </div>
            </div>
        </div>
        <!--  End Notice box -->
    </div>
</div>
<!---End new dashboard------>
</div>
<!-- end dashboard content div-->
</div>
</asp:Content>