<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DoctorList.aspx.cs" Inherits="RejoiceApplication.Details.DoctorList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-inner" style="min-height: 1050px;">
        <!-- start page inner div-->
        <div class="row right_side doctor">
            <!-- start dashboard content div-->
            <noscript>
                <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
            </noscript>
            <!--START POPUP CODE-->
            <div class="popup-bg">
                <div class="overlay-content">
                    <div class="modal-content">
                        <div class="category_list">
                        </div>
                    </div>
                </div>
            </div>
            <!-- End POP-UP Code -->
            <script type="text/javascript">
                jQuery(document).ready(function() {
                    jQuery('#doctor_list').DataTable({
                        "responsive": true,
                        "order": [[1, "asc"]],
                        "aoColumns": [
                            { "bSortable": false },
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
                <!--START PANEL BODY DIV-->
                <ul class="nav nav-tabs panel_tabs" role="tablist">
                    <li class="active">
                        <a href="../Details/DoctorList.aspx" class="tab active">
                            <i class="fa fa-align-justify"></i> Doctor List
                        </a>

                    </li>

                    <li class="">

                    </li>
                </ul>
                <div class="tab-content">
                    <!--START TAB CONTENT DIV-->
                    <div class="panel-body">
                        <!--START PANEL BODY DIV-->
                        <div class="table-responsive">
                            <!--START TABLE RESPONSIVE DIV-->
                            <table id="doctor_list" class="display dataTable " cellspacing="0" width="100%">
                                <!--START DoctorLIST TABLE-->
                                <thead>
                                <tr>
                                    <th>Photo</th>
                                    <th>doctor Name</th>
                                    <th>Department</th>
                                    <th> Specialization</th>
                                    <th> Degree</th>
                                    <th> doctor Email</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>Photo</th>
                                    <th>doctor Name</th>
                                    <th>Department</th>
                                    <th>Specialization</th>
                                    <th>Degree</th>
                                    <th>doctor Email</th>
                                    <th>Action</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <tr>
                                    <td class="user_image">
                                        <img src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/useriamge/doctor.png" height="50px" width="50px" class="img-circle"/>
                                    </td>
                                    <td class="name">
                                        <a href="#">Fernando Therrien</a>
                                    </td>
                                    <td class="department">Cardiology</td>

                                    <td class="specialization">Cardiologists</td>

                                    <td class="subject_name">MD</td>
                                    <td class="email">marcosjuniiorx@gmail.com</td>
                                    <td class="action">
                                        <a href="#" class="view-profile btn btn-default" idtest="2"><i class="fa fa-eye"></i> View Profile</a>
                                    </td>

                                </tr>
                                </tbody>
                            </table><!--END Doctor LIST TABLE-->
                        </div><!--END TABLE RESPONSIVE DIV-->
                    </div><!--END PANEL BODY DIV-->
                </div><!--END PANEL CONTENT DIV-->

            </div><!--END PANEL BODY DIV-->
        </div>
    </div>
</asp:Content>