<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BedOccupation.aspx.cs" Inherits="RejoiceApplication.Reports.BedOccupation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-inner" style="min-height: 1050px;">
        <!-- start page inner div-->
        <div class="row right_side report">
            <!-- start dashboard content div-->
            <script type="text/javascript">
                $(document).ready(function() {
                    $('#occupancy_report').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });
                    var start = new Date();
                    var end = new Date(new Date().setYear(start.getFullYear() + 1));
                    $.fn.datepicker.defaults.format = " yyyy-mm-dd";
                    $('.sdate').datepicker({
                        //startDate : start,
                        endDate: end,
                        autoclose: true
                    }).on('changeDate',
                        function(selected) {
                            var minDate = new Date(selected.date.valueOf());
                            $('.edate').datepicker('setStartDate', minDate);
                        });
                    $.fn.datepicker.defaults.format = " yyyy-mm-dd";
                    $('.edate').datepicker({
                        //startDate : start,
                        endDate: end,
                        autoclose: true
                    }).on('changeDate',
                        function(selected) {
                            var maxDate = new Date(selected.date.valueOf());
                            $('.sdate').datepicker('setEndDate', maxDate);
                        });
                });
            </script>
            <div class="panel-body panel-white">
                <!-- START PANEL BODY DIV-->
                <ul class="nav nav-tabs panel_tabs" role="tablist">
                    <li class="active">
                        <a href="BedOccupation.aspx">
                            <i class="fa fa-align-justify"></i>Bed Occupation Report
                        </a>
                        =
                    </li>
                    <li class="">
                        <a href="OperationReports.aspx">
                            <i class="fa fa-align-justify"></i>Operation Report
                        </a>

                    </li>
                    <li class="">
                        <a href="OperationFailReports.aspx">
                            <i class="fa fa-align-justify"></i>Operation Fail Report
                        </a>

                    </li>

                </ul>
                <div class="tab-content">
                    <!-- START TAB CONTENT DIV-->
                    <div class="tab-pane fade active in" id="birthreport">
                        <!-- START TAB PANE DIV-->
                        <div class="panel-body">
                            <!-- START PANEL BODY DIV-->
                            <%--<form name="occupancy_report" id="occupancy_report" action="" method="post">--%>
                            <!-- STRAT Occupancy FORM-->
                            <div class="form-group col-md-3">
                                <label for="sdate">Start Date</label>
                                <input type="text" class="form-control sdate validate[required]" name="sdate" value="">
                            </div>
                            <div class="form-group col-md-3">
                                <label for="edate">End Date</label>
                                <input type="text" class="form-control edate validate[required]" name="edate" value="">
                            </div>
                            <div class="form-group col-md-3 button-possition">
                                <label for="subject_id">&nbsp;</label>
                                <input type="submit" name="view_occupancy" value="Go" class="btn btn-info"/>
                                <asp:Button ID="btnSubmit" runat="server" Text="GetReport" class="btn btn-info"/>
                            </div>
                            <%--</form>--%>
                            <div class="clearfix"></div>
                        </div>
                        <!-- END PANEL BODY DIV-->
                    </div>
                    <!-- END TAB PANE DIV-->
                </div>
                <!-- END TAB CONTENT BODY DIV-->
            </div>
            <!-- END PANEL BODY DIV-->
        </div>
    </div>

</asp:Content>