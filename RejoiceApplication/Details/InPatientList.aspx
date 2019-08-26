<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InPatientList.aspx.cs" Inherits="RejoiceApplication.Details.InPatient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="page-inner" style="min-height: 1050px;">
<!-- start page inner div-->
<div class="row right_side patient">
<!-- start dashboard content div-->
<noscript>
    <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
</noscript>
<!-- POP up code -->
<div class="popup-bg">
    <div class="overlay-content">
        <div class="modal-content">
            <div class="patient_data">
            </div>
        </div>
    </div>
</div>
<!-- End POP-UP Code -->
<script type="text/javascript">
    $(document).ready(function() {
        $('#guardian_form').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });
        $('#symptoms').multiselect({
            nonSelectedText: 'Select Symptoms',
            includeSelectAllOption: true,
            selectAllText: 'Select all'
        });
        $('#patient_form').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });
        jQuery('#patient_list').DataTable({
            "responsive": true,
            "order": [[1, "asc"]],
            "aoColumns": [
                { "bSortable": false },
                { "bSortable": true },
                { "bSortable": true },
                { "bSortable": true },
                { "bVisible": true },
                { "bVisible": true },
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

        $.fn.datepicker.defaults.format = " yyyy-mm-dd";
        $('#birth_date').datepicker({
            endDate: '+0d',
            autoclose: true
        });
        $('#admit_form').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });
        $('.timepicker').timepicki({
            show_meridian: false,
            min_hour_value: 0,
            max_hour_value: 23,
            step_size_minutes: 15,
            overflow_minutes: true,
            increase_direction: 'up',
            disable_keyboard_mobile: true
        });
        //username not  allow space validation
        $('#username').keypress(function(e) {
            if (e.which === 32)
                return false;
        });

        var date = new Date();
        date.setDate(date.getDate() - 0);
        $('#admit_date').datepicker({
            startDate: date
        });
        $(".symptoms_alert").click(function() {
            checked = $(".multiselect_validation_symtoms .dropdown-menu input:checked").length;
            if (!checked) {
                alert("Please select atleast one Symtoms");
                return false;
            }
        });
    });
</script>

<div class="panel-body panel-white">
<!-- START panel body DIV-->
<ul class="nav nav-tabs panel_tabs" role="tablist">
    <li class="active">

        <a href="../Details/InPatientList.aspx" class="tab active">
            <i class="fa fa-align-justify"></i>Patient List
        </a>

    </li>

    <li class=""></li>
    <li class=""></li>
    <li class=""></li>
</ul>
<div class="tab-content">
<!-- START TAB CONTENT DIV-->
<div class="panel-body">
<!-- START PANEL BODY DIV-->
<div class="table-responsive">
<!-- START TABLE RESPONSIVE DIV-->
<table id="patient_list" class="display dataTable " cellspacing="0">
<!-- START PATIENT LIST TABLR-->
<thead>
<tr>
    <th style="width: 50px; height: 50px;">Photo</th>
    <th>Patient Name</th>
    <th>Patient Id</th>
    <th>Phone</th>
    <th>Status</th>
    <th>Blood Group</th>
    <th>Assigned Doctor Name</th>
    <th>Admitted Date</th>
    <th>Action</th>
</tr>
</thead>
<tfoot>
<tr>
    <th>Photo</th>
    <th>Patient Name</th>
    <th>Patient Id</th>
    <th>Phone</th>
    <th>Status</th>
    <th>Blood Group</th>
    <th>Assigned Doctor Name</th>
    <th>Admitted Date</th>
    <th>Action</th>
</tr>
</tfoot>
<tbody>
<tr>
    <td class="user_image">
        <img src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/uploads/hospital_assets/1566411445-pimg-in.png" height="50px" width="50px" class="img-circle"/>
    </td>
    <td class="name">
        <a href="#">Jose Figueroa</a>
    </td>
    <td class="patient_id">
        P10319
    </td>
    <td class="phone">7878789787</td>
    <td class="email">Discharged</td>
    <td class="bldgroup">O+</td>
    <td class="">Fernando Therrien</td>
    <td class="">2019-03-16</td>
    <td class="action">
        <a href="?dashboard=user&page=patient&action=view_status&patient_id=3" class="show-popup btn btn-default" idtest="3"><i class="fa fa-eye"></i>View Detail</a>
        <a href="?dashboard=user&page=patient&action=view_status&patient_id=3" class="show-charges-popup btn btn-default" idtest="3">
            <i class="fa fa-money"></i>Charges
        </a>

    </td>
</tr>
<tr>
    <td class="user_image">
        <img src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/uploads/2019/03/driver-old.jpg" height="50px" width="50px" class="img-circle"/>
    </td>
    <td class="name">
        <a href="#">Ashish Ranjan</a>
    </td>
    <td class="patient_id">
        P20319
    </td>
    <td class="phone">1234567890</td>
    <td class="email"></td>
    <td class="bldgroup">B+</td>
    <td class="">Fernando Therrien</td>
    <td class="">-</td>
    <td class="action">
        <a href="?dashboard=user&page=patient&action=view_status&patient_id=4" class="show-popup btn btn-default" idtest="4"><i class="fa fa-eye"></i>View Detail</a>
        <a href="?dashboard=user&page=patient&action=view_status&patient_id=4" class="show-charges-popup btn btn-default" idtest="4">
            <i class="fa fa-money"></i>Charges
        </a>

    </td>
</tr>
<tr>
    <td class="user_image">
        <img src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/uploads/2019/03/PS_Frame1.jpg" height="50px" width="50px" class="img-circle"/>
    </td>
    <td class="name">
        <a href="#">Anna Sanz</a>
    </td>
    <td class="patient_id">
        P50319
    </td>
    <td class="phone">840157448</td>
    <td class="email">Admitted</td>
    <td class="bldgroup">O+</td>
    <td class="">Fernando Therrien</td>
    <td class="">2019-03-16</td>
    <td class="action">
        <a href="?dashboard=user&page=patient&action=view_status&patient_id=7" class="show-popup btn btn-default" idtest="7"><i class="fa fa-eye"></i>View Detail</a>
        <a href="?dashboard=user&page=patient&action=view_status&patient_id=7" class="show-charges-popup btn btn-default" idtest="7">
            <i class="fa fa-money"></i>Charges
        </a>

    </td>
</tr>
<tr>
    <td class="user_image">
        <img src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/useriamge/patient.png" height="50px" width="50px" class="img-circle"/>
    </td>
    <td class="name">
        <a href="#">Lucas M</a>
    </td>
    <td class="patient_id">
        P60319
    </td>
    <td class="phone">8401571436</td>
    <td class="email">Under Treatment</td>
    <td class="bldgroup">O+</td>
    <td class="">Fernando Therrien</td>
    <td class="">2019-03-16</td>
    <td class="action">
        <a href="?dashboard=user&page=patient&action=view_status&patient_id=8" class="show-popup btn btn-default" idtest="8"><i class="fa fa-eye"></i>View Detail</a>
        <a href="?dashboard=user&page=patient&action=view_status&patient_id=8" class="show-charges-popup btn btn-default" idtest="8">
            <i class="fa fa-money"></i>Charges
        </a>

    </td>
</tr>
<tr>
    <td class="user_image">
        <img src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/useriamge/patient.png" height="50px" width="50px" class="img-circle"/>
    </td>
    <td class="name">
        <a href="#">Vivekanand Adkatalwar</a>
    </td>
    <td class="patient_id">
        P80319
    </td>
    <td class="phone">9209203637</td>
    <td class="email">Admitted</td>
    <td class="bldgroup">O+</td>
    <td class="">Fernando Therrien</td>
    <td class="">2019-03-30</td>
    <td class="action">
        <a href="?dashboard=user&page=patient&action=view_status&patient_id=27" class="show-popup btn btn-default" idtest="27"><i class="fa fa-eye"></i>View Detail</a>
        <a href="?dashboard=user&page=patient&action=view_status&patient_id=27" class="show-charges-popup btn btn-default" idtest="27">
            <i class="fa fa-money"></i>Charges
        </a>

    </td>
</tr>
<tr>
    <td class="user_image">
        <img src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/useriamge/patient.png" height="50px" width="50px" class="img-circle"/>
    </td>
    <td class="name">
        <a href="#">king hytrd</a>
    </td>
    <td class="patient_id">
        P190419
    </td>
    <td class="phone">0556107703</td>
    <td class="email">Operated</td>
    <td class="bldgroup">A-</td>
    <td class="">Fernando Therrien</td>
    <td class="">-</td>
    <td class="action">
        <a href="?dashboard=user&page=patient&action=view_status&patient_id=39" class="show-popup btn btn-default" idtest="39"><i class="fa fa-eye"></i>View Detail</a>
        <a href="?dashboard=user&page=patient&action=view_status&patient_id=39" class="show-charges-popup btn btn-default" idtest="39">
            <i class="fa fa-money"></i>Charges
        </a>

    </td>
</tr>
<tr>
    <td class="user_image">
        <img src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/useriamge/patient.png" height="50px" width="50px" class="img-circle"/>
    </td>
    <td class="name">
        <a href="#">Ahmed Ahme</a>
    </td>
    <td class="patient_id">
        P290419
    </td>
    <td class="phone">8828118</td>
    <td class="email">Admitted</td>
    <td class="bldgroup">Select Blood Group</td>
    <td class="">Fernando Therrien</td>
    <td class="">2019-05-23</td>
    <td class="action">
        <a href="?dashboard=user&page=patient&action=view_status&patient_id=49" class="show-popup btn btn-default" idtest="49"><i class="fa fa-eye"></i>View Detail</a>
        <a href="?dashboard=user&page=patient&action=view_status&patient_id=49" class="show-charges-popup btn btn-default" idtest="49">
            <i class="fa fa-money"></i>Charges
        </a>

    </td>
</tr>
<tr>
    <td class="user_image">
        <img src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/useriamge/patient.png" height="50px" width="50px" class="img-circle"/>
    </td>
    <td class="name">
        <a href="#">Ahmed Ahme</a>
    </td>
    <td class="patient_id">
        P290419
    </td>
    <td class="phone">8828118</td>
    <td class="email">Admitted</td>
    <td class="bldgroup">Select Blood Group</td>
    <td class="">Fernando Therrien</td>
    <td class="">2019-05-23</td>
    <td class="action">
        <a href="?dashboard=user&page=patient&action=view_status&patient_id=49" class="show-popup btn btn-default" idtest="49"><i class="fa fa-eye"></i>View Detail</a>
        <a href="?dashboard=user&page=patient&action=view_status&patient_id=49" class="show-charges-popup btn btn-default" idtest="49">
            <i class="fa fa-money"></i>Charges
        </a>

    </td>
</tr>
<tr>
    <td class="user_image">
        <img src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/useriamge/patient.png" height="50px" width="50px" class="img-circle"/>
    </td>
    <td class="name">
        <a href="#">Ulisses Silva</a>
    </td>
    <td class="patient_id">
        P360519
    </td>
    <td class="phone">991491657</td>
    <td class="email">Admitted</td>
    <td class="bldgroup">O+</td>
    <td class="">Fernando Therrien</td>
    <td class="">2019-05-04</td>
    <td class="action">
        <a href="?dashboard=user&page=patient&action=view_status&patient_id=56" class="show-popup btn btn-default" idtest="56"><i class="fa fa-eye"></i>View Detail</a>
        <a href="?dashboard=user&page=patient&action=view_status&patient_id=56" class="show-charges-popup btn btn-default" idtest="56">
            <i class="fa fa-money"></i>Charges
        </a>

    </td>
</tr>
<tr>
    <td class="user_image">
        <img src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/useriamge/patient.png" height="50px" width="50px" class="img-circle"/>
    </td>
    <td class="name">
        <a href="#">uu ui</a>
    </td>
    <td class="patient_id">
        P420519
    </td>
    <td class="phone">678879809</td>
    <td class="email">Admitted</td>
    <td class="bldgroup">O-</td>
    <td class="">Fernando Therrien</td>
    <td class="">2019-05-08</td>
    <td class="action">
        <a href="?dashboard=user&page=patient&action=view_status&patient_id=62" class="show-popup btn btn-default" idtest="62"><i class="fa fa-eye"></i>View Detail</a>
        <a href="?dashboard=user&page=patient&action=view_status&patient_id=62" class="show-charges-popup btn btn-default" idtest="62">
            <i class="fa fa-money"></i>Charges
        </a>

    </td>
</tr>
<tr>
    <td class="user_image">
        <img src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/useriamge/patient.png" height="50px" width="50px" class="img-circle"/>
    </td>
    <td class="name">
        <a href="#">aaannnnn bbb</a>
    </td>
    <td class="patient_id">
        P500519
    </td>
    <td class="phone">626431611</td>
    <td class="email">Admitted</td>
    <td class="bldgroup">O+</td>
    <td class="">Fernando Therrien</td>
    <td class="">2019-05-27</td>
    <td class="action">
        <a href="?dashboard=user&page=patient&action=view_status&patient_id=70" class="show-popup btn btn-default" idtest="70"><i class="fa fa-eye"></i>View Detail</a>
        <a href="?dashboard=user&page=patient&action=view_status&patient_id=70" class="show-charges-popup btn btn-default" idtest="70">
            <i class="fa fa-money"></i>Charges
        </a>

    </td>
</tr>
<tr>
    <td class="user_image">
        <img src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/useriamge/patient.png" height="50px" width="50px" class="img-circle"/>
    </td>
    <td class="name">
        <a href="#">Vishal Singh</a>
    </td>
    <td class="patient_id">
        P600619
    </td>
    <td class="phone">054225</td>
    <td class="email"></td>
    <td class="bldgroup">O+</td>
    <td class="">Fernando Therrien</td>
    <td class="">-</td>
    <td class="action">
        <a href="?dashboard=user&page=patient&action=view_status&patient_id=80" class="show-popup btn btn-default" idtest="80"><i class="fa fa-eye"></i>View Detail</a>
        <a href="?dashboard=user&page=patient&action=view_status&patient_id=80" class="show-charges-popup btn btn-default" idtest="80">
            <i class="fa fa-money"></i>Charges
        </a>

    </td>
</tr>
<tr>
    <td class="user_image">
        <img src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/useriamge/patient.png" height="50px" width="50px" class="img-circle"/>
    </td>
    <td class="name">
        <a href="#">Onder Gulec</a>
    </td>
    <td class="patient_id">
        P650619
    </td>
    <td class="phone">05057837478</td>
    <td class="email">Under Treatment</td>
    <td class="bldgroup">O+</td>
    <td class="">Fernando Therrien</td>
    <td class="">2019-06-24</td>
    <td class="action">
        <a href="?dashboard=user&page=patient&action=view_status&patient_id=85" class="show-popup btn btn-default" idtest="85"><i class="fa fa-eye"></i>View Detail</a>
        <a href="?dashboard=user&page=patient&action=view_status&patient_id=85" class="show-charges-popup btn btn-default" idtest="85">
            <i class="fa fa-money"></i>Charges
        </a>

    </td>
</tr>
<tr>
    <td class="user_image">
        <img src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/useriamge/patient.png" height="50px" width="50px" class="img-circle"/>
    </td>
    <td class="name">
        <a href="#">Eugene Ciervo</a>
    </td>
    <td class="patient_id">
        P720719
    </td>
    <td class="phone">2669571</td>
    <td class="email">Admitted</td>
    <td class="bldgroup">O+</td>
    <td class="">Fernando Therrien</td>
    <td class="">2019-07-11</td>
    <td class="action">
        <a href="?dashboard=user&page=patient&action=view_status&patient_id=92" class="show-popup btn btn-default" idtest="92"><i class="fa fa-eye"></i>View Detail</a>
        <a href="?dashboard=user&page=patient&action=view_status&patient_id=92" class="show-charges-popup btn btn-default" idtest="92">
            <i class="fa fa-money"></i>Charges
        </a>

    </td>
</tr>
</tbody>
</table>
<!-- END PATIENT LIST TABLE-->
</div>
<!-- END TABLE RESPONSIVE DIV-->
</div>
<!-- START PANEL BODY DIV-->
</div>
<!-- END TAB CONTENT DIV-->
</div>
</div>
</div>
</asp:Content>