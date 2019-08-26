<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Messages.aspx.cs" Inherits="RejoiceApplication.Message.Messages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-inner" style="min-height: 1050px;">
        <!-- start page inner div-->
        <div class="row right_side message">
            <!-- start dashboard content div-->
            <noscript>
                <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
            </noscript>

            <div class="row mailbox-header">
                <!-- START MAIL BOX HEADER DIV-->

                <div class="col-md-2">

                    <a class="btn btn-success btn-block" href="?dashboard=user&page=message&tab=compose">Compose</a>

                </div>
                <div class="col-md-6">
                    <h2>
                        Inbox

                    </h2>
                </div>

            </div>
            <!-- END MAIL BOX HEADER DIV-->
            <div class="col-md-2">
                <ul class="list-unstyled mailbox-nav">
                    <li class="active">
                        <a href="Messages.aspx"><i class="fa fa-inbox"></i>Inbox<span class="badge badge-success pull-right">0</span></a>
                    </li>
                    <li>
                        <a href="SentMessages.aspx"><i class="fa fa-sign-out"></i>Sent</a>
                    </li>
                </ul>
            </div>
            <div class="col-md-10">
                <div class="mailbox-content">
                    <!-- START MAIL BOX CONTENT DIV -->
                    <div class="table-responsive">
                        <!-- START TABE RESPONSIVE DIV -->
                        <table class="table">
                            <thead>
                            <tr>
                                <th class="text-right" colspan="5"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th class="hidden-xs">
                                    <span>Message For</span>
                                </th>
                                <th>Subject</th>
                                <th>
                                    Description
                                </th>
                                <th>
                                    Date
                                </th>
                            </tr>
                            <tr>
                                <td>Jose Figueroa</td>
                                <td>
                                    <a href="?dashboard=user&page=message&tab=inbox&tab=view_message&from=inbox&id=205">HDS</a>
                                </td>
                                <td>SHGD </td>
                                <td>
                                    2019-06-14
                                </td>
                            </tr>
                            <tr>
                                <td>Jose Figueroa</td>
                                <td>
                                    <a href="?dashboard=user&page=message&tab=inbox&tab=view_message&from=inbox&id=152">gdfgdf</a>
                                </td>
                                <td>gdfgdfgdfg </td>
                                <td>
                                    2019-06-10
                                </td>
                            </tr>
                            <tr>
                                <td>Joanna Christopher</td>
                                <td>
                                    <a href="?dashboard=user&page=message&tab=inbox&tab=view_message&from=inbox&id=60">as</a>
                                </td>
                                <td>aaaa </td>
                                <td>
                                    2019-05-16
                                </td>
                            </tr>
                            <tr>
                                <td>Jose Figueroa</td>
                                <td>
                                    <a href="?dashboard=user&page=message&tab=inbox&tab=view_message&from=inbox&id=36">csd</a>
                                </td>
                                <td>mhfmfn fgs </td>
                                <td>
                                    2019-04-07
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <a href="?dashboard=user&page=message&tab=inbox&tab=view_message&from=inbox&id=32">Doctor<span class="badge badge-success pull-right">1</span></a>
                                </td>
                                <td>Doctor </td>
                                <td>
                                    2019-03-22
                                </td>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                    <!-- END TABLE RESPONSIVE DIV -->
                </div>
                <!-- END MAIL BOX CONTENT DIV -->
            </div>
        </div>
    </div>
</asp:Content>