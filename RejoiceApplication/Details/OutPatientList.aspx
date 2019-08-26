<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OutPatientList.aspx.cs" Inherits="RejoiceApplication.Details.OutPatientList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-inner" style="min-height: 1050px;">
        <!-- start page inner div-->
        <div class="row right_side outpatient">
            <!-- start dashboard content div-->
            <noscript>
                <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
            </noscript>
            <script type="text/javascript">
                jQuery(document).ready(function($) {
                    $('#out_patient_form').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });
                    jQuery('#symptoms').multiselect({
                        nonSelectedText: 'Select Symptoms',
                        includeSelectAllOption: true,
                        selectAllText: 'Select all'
                    });
                    jQuery('#outpatient_list').DataTable({
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

                    //user name not  allow space validation
                    $('#username').keypress(function(e) {
                        if (e.which === 32)
                            return false;
                    });

                });
            </script>

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
                jQuery(document).ready(function($) {
                    var tempval = 0;
                    if (tempval != 0) {
                        swal({
                                title: "Outpatient successfully converted to inpatient!",
                                text: "Do you Want to Admit this patient?",
                                type: "warning",
                                showCancelButton: true,
                                confirmButtonColor: '#22baa0',
                                confirmButtonText: 'Yes',
                                cancelButtonText: "No",
                                closeOnConfirm: false,
                                closeOnCancel: true
                            },
                            function(isConfirm) {
                                if (isConfirm) {
                                    window.location.href =
                                        "http://pushnifty.com/mojoomla/extend/wordpress/hospital?dashboard=user&page=patient&tab=addpatient_step2&action=edit&patient_id=0";
                                } else {
                                    tempval = 0;
                                    window.location.href =
                                        "http://pushnifty.com/mojoomla/extend/wordpress/hospital?dashboard=user&page=outpatient&tab=outpatientlist&message=2";
                                }
                            });
                    }
                    $("body").on("click",
                        ".remove_cirtificate",
                        function() {
                            alert("Do you really want to delete this record ?");
                            $(this).parent().parent().remove();
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
                <!-- START PANEL BODY DIV-->
                <ul class="nav nav-tabs panel_tabs" role="tablist">

                    <li class="active">

                        <a href="../Details/OutPatientList.aspx" class="tab active">
                            <i class="fa fa-align-justify"></i>Outpatient List
                        </a>

                    </li>

                    <li class="">


                    </li>


                </ul>
                <div class="tab-content">
                    <!-- START TAB CONTENT DIV-->
                    <div class="panel-body">
                        <!-- START PANEL BODY DIV-->
                        <div class="table-responsive">
                            <!-- START TABLE RESPONSIVE DIV-->
                            <table id="outpatient_list" class="display dataTable " cellspacing="0">
                                <!-- START Outpatient LIST TABLE-->
                                <thead>
                                <tr>
                                    <th style="width: 50px; height: 50px;">Photo</th>
                                    <th>Patient Name</th>
                                    <th>Patient Id</th>
                                    <th>Phone</th>
                                    <th>Blood Group</th>
                                    <th>Email</th>
                                    <th>Assigned Doctor Name</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>Photo</th>
                                    <th>Patient Name</th>
                                    <th>Patient Id</th>
                                    <th>Phone</th>
                                    <th>Blood Group</th>
                                    <th>Email</th>
                                    <th>Assigned Doctor Name</th>
                                    <th>Action</th>
                                </tr>
                                </tfoot>

                                <tbody></tbody>

                            </table>
                            <!-- END Outpatient LIST TABLE-->
                        </div>
                        <!-- END TABLE RESPONSIVE DIV-->
                    </div>
                    <!-- END PANEL BODY DIV-->

                </div>
                <!-- END TAB CONTENT DIV-->
            </div>
        </div>
    </div>
</asp:Content>