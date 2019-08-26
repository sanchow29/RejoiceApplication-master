<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Nurse.aspx.cs" Inherits="RejoiceApplication.Details.Nurse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-inner" style="min-height: 1050px;">
        <!-- start page inner div-->
        <div class="row right_side nurse">
            <!-- start dashboard content div-->
            <noscript>
                <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
            </noscript>
            <!-- POP up code -->
            <div class="popup-bg" style="min-height: 1631px !important">
                <div class="overlay-content">
                    <div class="modal-content">
                        <div class="category_list">
                        </div>

                    </div>
                </div>
            </div>
            <!-- End POP-UP Code -->
            <script type="text/javascript">
                jQuery(document).ready(function($) {
                    jQuery('#nurse_list').DataTable({
                        "responsive": true,
                        "order": [[1, "asc"]],
                        "aoColumns": [
                            { "bSortable": false },
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
                    $('#tax_charge').multiselect({
                        nonSelectedText: 'Select Tax',
                        includeSelectAllOption: true,
                        selectAllText: 'Select all'
                    });
                });
            </script>
            <div class="panel-body panel-white">
                <!-- START PANEL BODY DIV-->
                <ul class="nav nav-tabs panel_tabs" role="tablist">
                    <li class="active">
                        <a href="../Details/Nurse.aspx" class="tab ">
                            <i class="fa fa-align-justify"></i>Nurse List
                        </a>

                    </li>
                    <li class=""></li>
                </ul>
                <div class="tab-content">
                    <!-- START TAB CONTENT DIV-->
                    <div class="panel-body">
                        <!-- START PANEL BODY DIV-->
                        <div class="table-responsive">
                            <!-- START TALE RESPONSIVE DIV-->
                            <table id="nurse_list" class="display dataTable " cellspacing="0" width="100%">
                                <!-- START NURSE LIST TABLE-->
                                <thead>
                                <tr>
                                    <th style="width: 50px; height: 50px;">Photo</th>
                                    <th class="sorting_asc">Nurse Name</th>
                                    <th>Department</th>
                                    <th>Mobile Number</th>
                                    <th>Nurse Email</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>Photo</th>
                                    <th>Nurse Name</th>
                                    <th>Department</th>
                                    <th>Mobile Number</th>
                                    <th>Nurse Email</th>
                                    <th>Action</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <tr>
                                    <td class="user_image">
                                        <img src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/useriamge/nurse.png" height="50px" width="50px" class="img-circle"/>
                                    </td>
                                    <td class="name">
                                        <a href="?dashboard=user&page=nurse&tab=addnurse&action=edit&nurse_id=OQ==">Cristi Abeita</a>
                                    </td>
                                    <td class="department">Cardiology</td>
                                    <td class="phone">
                                        949-210-0982
                                    </td>

                                    <td class="email">cristi@gmail.com</td>


                                    </td>
                                    <td class="action"></td>
                                </tr>

                                </tbody>
                            </table>
                            <!-- END NURSE LIST TABLE-->
                        </div>
                        <!-- END TABLE RESPONSIVE DIV-->
                    </div>
                    <!-- END PANEL BODY DIV-->
                </div>
                <!-- END TABLE CONTENT DIV-->

            </div>
            <!-- START PANEL BODY DIV-->

        </div>
    </div>
</asp:Content>