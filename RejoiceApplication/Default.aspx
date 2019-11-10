<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RejoiceApplication._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<div class="container-fluid">
<div class="page-inner" style="min-height: 1050px;">
<!-- start page inner div-->
<div class="row right_side ">
<!-- start dashboard content div-->
<!--start new dashboard-->

<div class="row">
<div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
    <a href="Details/InPatientList.aspx">
        <div class="panel info-box panel-white">
            <div class="panel-body patient">
                <div class="info-box-stats">
                    <p class="counter">86</p>

                    <span class="info-box-title">Patient</span>
                </div>
                <img src="../Images/dashboard/patient.png" class="dashboard_background">
            </div>
        </div>
    </a>
</div>

<div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
    <a href="Details/DoctorList.aspx">
        <div class="panel info-box panel-white">
            <div class="panel-body doctor">
                <div class="info-box-stats">
                    <p class="counter">1</p>
                    <span class="info-box-title">Doctor</span>
                </div>
                <img src="../Images/dashboard/doctor.png" class="dashboard_background">
            </div>
        </div>
    </a>
</div>

<div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
    <a href="Details/Nurse.aspx">
        <div class="panel info-box panel-white">
            <div class="panel-body nurse">
                <div class="info-box-stats">
                    <p class="counter">1</p>
                    <span class="info-box-title">Nurse</span>
                </div>
                <img src="../Images/dashboard/nurse.png" class="dashboard_background">
            </div>
        </div>
    </a>
</div>

<div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
    <a href="Details/SupportStaff.aspx">
        <div class="panel info-box panel-white">
            <div class="panel-body receptionist">
                <div class="info-box-stats">
                    <p class="counter">1</p>

                    <span class="info-box-title">Support Staff</span>
                </div>
                <img src="../Images/dashboard/support-staft.png" class="dashboard_background">
            </div>
        </div>
    </a>
</div>


<div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
    <a href="Message/Messages.aspx">
        <div class="panel info-box panel-white">
            <div class="panel-body message">
                <div class="info-box-stats">
                    <p class="counter">0</p>

                    <span class="info-box-title">Message</span>
                </div>
                <img src="../Images/dashboard/message.png" class="dashboard_background">
            </div>
        </div>
    </a>
</div>

<div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
    <a href="Details/Accountant.aspx">
        <div class="panel info-box panel-white">
            <div class="panel-body setting">
                <div class="info-box-stats">
                    <p class="counter">&nbsp;</p>
                    <span class="info-box-title">Setting</span>
                </div>
                <img src="../Images/dashboard/setting-image.png" class="dashboard_background">
            </div>
        </div>
    </a>
</div>

<div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
    <a href="Appointments/Appoitnments.aspx">
        <div class="panel info-box panel-white">
            <div class="panel-body appointment">
                <div class="info-box-stats">
                    <p class="counter">45</p>
                    <span class="info-box-title">Appointment</span>
                </div>
                <img src="Images/dashboard/appointment-image.png" class="dashboard_background">
            </div>
        </div>
    </a>
</div>
<div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
    <a href="Prescription/Prescription.aspx">
        <div class="panel info-box panel-white">
            <div class="panel-body prescription">
                <div class="info-box-stats">
                    <p class="counter">97</p>

                    <span class="info-box-title">Prescription</span>
                </div>
                <img src="Images/dashboard/preseription-image.png" class="dashboard_background">
            </div>
        </div>
    </a>
</div>
<div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
    <a href="Details/BedAllotment.aspx">
        <div class="panel info-box panel-white">
            <div class="panel-body assignbed">
                <div class="info-box-stats">
                    <p class="counter">5</p>

                    <span class="info-box-title">
                        Assign
                        <br>
                        Bed/Nurse
                    </span>
                </div>
                <img src="Images/dashboard/assign-bed-image.png" class="dashboard_background">
            </div>
        </div>
    </a>
</div>
<div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
    <a href="Treatment/treatment.aspx">
        <div class="panel info-box panel-white">
            <div class="panel-body treatment">
                <div class="info-box-stats">
                    <p class="counter">19</p>

                    <span class="info-box-title">Treatment</span>
                </div>
                <img src="Images/dashboard/tretment-image.png" class="dashboard_background">
            </div>
        </div>
    </a>
</div>
<div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
    <a href="Events.aspx">
        <div class="panel info-box panel-white">
            <div class="panel-body eventnotice">
                <div class="info-box-stats">
                    <p class="counter">
                        2
                    </p>

                    <span class="info-box-title">
                        Events/
                        <br>
                        Notice
                    </span>
                </div>
                <img src="Images/dashboard/notice-event-image.png" class="dashboard_background">
            </div>
        </div>
    </a>
</div>
<div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
    <a href="Reports/BedOccupation.aspx">
        <div class="panel info-box panel-white">
            <div class="panel-body operation_report">
                <div class="info-box-stats">
                    <p class="counter">&nbsp;</p>

                    <span class="info-box-title">Report</span>
                </div>
                <img src="Images/dashboard/report.png" class="dashboard_background">
            </div>
        </div>
    </a>
</div>
<div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
    <a href="Details/Pharmacist.aspx">
        <div class="panel info-box panel-white">
            <div class="panel-body pharmacist">
                <div class="info-box-stats">
                    <p class="counter">1</p>

                    <span class="info-box-title">Pharmacist</span>
                </div>
                <img src="Images/dashboard/pharmacist.png" class="dashboard_background">
            </div>
        </div>
    </a>
</div>
<div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
    <a href="Details/LaboratoryStaff.aspx">
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
                <img src="Images/dashboard/laboratorist.png" class="dashboard_background">
            </div>
        </div>
    </a>
</div>
<div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
    <a href="Diagnosis/Diagnosis.aspx">
        <div class="panel info-box panel-white">
            <div class="panel-body diagnosis">
                <div class="info-box-stats">
                    <p class="counter">26</p>

                    <span class="info-box-title">
                        Diagnosis
                        <br>
                        Report
                    </span>
                </div>
                <img src="Images/dashboard/diagnosis-image.png" class="dashboard_background">
            </div>
        </div>
    </a>
</div>
<div class="col-lg-2 col-md-2 col-xs-6 col-sm-3">
    <a href="Details/Accountant.aspx">
        <div class="panel info-box panel-white">
            <div class="panel-body accountant">
                <div class="info-box-stats">
                    <p class="counter">2</p>
                    <span class="info-box-title">Accountant</span>
                </div>
                <img src="Images/dashboard/accountant.png" class="dashboard_background">
            </div>
        </div>
    </a>
</div>
</div>

<!--End new dashboard-->
</div>
<!-- end dashboard content div-->
<div class="row dashboard_panel_heading_border">
<div class="col-md-6 no-paddingR">
    <!--  Start Prescription Box -->
    <div class="panel panel-white event priscription">
        <div class="panel-heading ">
            <img src="../Images/dashboard/Prescription.png">
            <h3 class="panel-title">Prescription</h3>
        </div>
        <div class="panel-body">
            <div class="events">

                <div class="calendar-event">
                    <p class="remainder_title_pr Bold viewpriscription show_task_event" id="99" model="Prescription Details">
                        Patient Name :
                        David Urrego
                    </p>
                    <p class="remainder_date_pr">2019-08-21 </p>
                    <p class="remainder_title_pr viewpriscription">Description : ortodoncia</p>
                </div>

                <div class="calendar-event">
                    <p class="remainder_title_pr Bold viewpriscription show_task_event" id="97" model="Prescription Details">
                        Patient Name :
                        aaannnnn bbb
                    </p>
                    <p class="remainder_date_pr">2019-08-18 </p>
                    <p class="remainder_title_pr viewpriscription">Description : Reeeeeeeport</p>
                </div>

                <div class="calendar-event">
                    <p class="remainder_title_pr Bold viewpriscription show_task_event" id="96" model="Prescription Details">
                        Patient Name :
                        Igor Negromonte
                    </p>
                    <p class="remainder_date_pr">2019-08-18 </p>
                    <p class="remainder_title_pr viewpriscription">Description : For Isolation</p>
                </div>

            </div>
        </div>
    </div>
    <!-- End Prescription Box -->
    <!--  Start Operation Box -->
    <div class="panel panel-white event operation">
        <div class="panel-heading ">
            <img src="../Images/dashboard/Operation-List.png">
            <h3 class="panel-title">Operation</h3>
        </div>
        <div class="panel-body">
            <div class="events">
                <div class="calendar-event">
                    <p class="remainder_title_pr Bold viewoperation show_task_event" id="10" model="Operation Details">Patient Name : king hytrd</p>
                    <p class="remainder_date_pr">2019-08-22 </p>

                    <p class="remainder_title_pr  viewoperation">Operation Name: Brain Surgery</p>
                </div>
                <div class="calendar-event">
                    <p class="remainder_title_pr Bold viewoperation show_task_event" id="9" model="Operation Details">Patient Name : David Urrego</p>
                    <p class="remainder_date_pr">2019-08-12 </p>

                    <p class="remainder_title_pr  viewoperation">Operation Name: Implantes</p>
                </div>
                <div class="calendar-event">
                    <p class="remainder_title_pr Bold viewoperation show_task_event" id="8" model="Operation Details">Patient Name : Nina Cadela</p>
                    <p class="remainder_date_pr">2019-07-23 </p>

                    <p class="remainder_title_pr  viewoperation">Operation Name: Cancer Surgery</p>
                </div>

            </div>
        </div>
    </div>
    <!-- End Operation Box -->
    <!-- start calendar Box -->
    <div class="panel panel-white">
        <div class="panel-heading" style="margin-bottom: 15px;">
            <img src="../Images/dashboard/calender.png">
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
            <img src="../Images/dashboard/Appointment.png">
            <h3 class="panel-title">Appointment</h3>

        </div>
        <div class="panel-body">
            <div class="events">

                <div class="calendar-event">
                    <p class="remainder_title Bold save1 show_task_event" id="56" model="Appointment Details">
                        Patient Name : Nina Cadela
                    </p>
                    <p class="remainder_date" style="width: 160px; background-position: 85px;">
                        2019-08-20 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 12:45PM
                    </p>
                </div>

                <div class="calendar-event">
                    <p class="remainder_title Bold save1 show_task_event" id="55" model="Appointment Details">
                        Patient Name : aaaa aaa
                    </p>
                    <p class="remainder_date" style="width: 160px; background-position: 85px;">
                        2019-08-19 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10:00AM
                    </p>
                </div>

                <div class="calendar-event">
                    <p class="remainder_title Bold save1 show_task_event" id="54" model="Appointment Details">
                        Patient Name : R R
                    </p>
                    <p class="remainder_date" style="width: 160px; background-position: 85px;">
                        2019-08-09 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 06:15PM
                    </p>
                </div>
            </div>
        </div>
    </div>

    <!--  End Appoinment box -->
    <!--  Start assigned bed Box -->
    <div class="panel panel-white event assignbed">
        <div class="panel-heading">
            <img src="../Images/dashboard/Assign--Bed-nurse.png">
            <h3 class="panel-title">Assigned Bed</h3>
        </div>
        <div class="panel-body">
            <div class="events">

                <div class="calendar-event">
                    <p class="remainder_title Bold viewbedlist show_task_event" id="4" model="Assigned Bed Details">
                        Patient Name :
                        uu ui
                    </p>
                    <p class="remainder_date">2019-06-15 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2019-06-22 </p>
                </div>

                <div class="calendar-event">
                    <p class="remainder_title Bold viewbedlist show_task_event" id="3" model="Assigned Bed Details">
                        Patient Name :
                        Lucas M
                    </p>
                    <p class="remainder_date">2019-05-10 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2019-05-12 </p>
                </div>

                <div class="calendar-event">
                    <p class="remainder_title Bold viewbedlist show_task_event" id="2" model="Assigned Bed Details">
                        Patient Name :
                        Lucas M
                    </p>
                    <p class="remainder_date">2019-03-21 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2019-07-12 </p>
                </div>

            </div>
        </div>
    </div>
    <!-- End assigned bed Box -->
    <!--  Start Event Box -->
    <div class="panel panel-white event">
        <div class="panel-heading ">
            <img src="../Images/dashboard/event.png">
            <h3 class="panel-title">Events</h3>
        </div>
        <div class="panel-body">
            <div class="events">
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
            <img src="../Images/dashboard/notice1.png">
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

</div>
<!-- end page inner div-->


</div>
</asp:Content>