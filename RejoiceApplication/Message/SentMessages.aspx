<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SentMessages.aspx.cs" Inherits="RejoiceApplication.Message.SentMessages" %>

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
                        Sent Item

                    </h2>
                </div>

            </div>
            <!-- END MAIL BOX HEADER DIV-->
            <div class="col-md-2">
                <ul class="list-unstyled mailbox-nav">
                    <li>
                        <a href="Messages.aspx">
                            <i class="fa fa-inbox">

                            </i>Inbox<span class="badge badge-success pull-right">0</span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="SentMessages.aspx">
                            <i class="fa fa-sign-out"></i>Sent
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-md-10">
                <div class="mailbox-content sendbox">
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
                            </tr>
                            <tr>
                                <td class="hidden-xs message_for">
                                    <span>Nurse</span>
                                </td>
                                <td class="message_title">
                                    <a href="?dashboard=user&page=message&tab=view_message&from=sendbox&id=191">Alloh</a>
                                </td>
                                <td class="messsage_body">
                                    Tous dans mon bureau dans 30<br>
                                    Minutes
                                </td>
                            </tr>
                            <tr>
                                <td class="hidden-xs message_for">
                                    <span></span>
                                </td>
                                <td class="message_title">
                                    <a href="?dashboard=user&page=message&tab=view_message&from=sendbox&id=170">xcvbn</a>
                                </td>
                                <td class="messsage_body">
                                    zxfg
                                </td>
                            </tr>
                            <tr>
                                <td class="hidden-xs message_for">
                                    <span></span>
                                </td>
                                <td class="message_title">
                                    <a href="?dashboard=user&page=message&tab=view_message&from=sendbox&id=169">xcvbn</a>
                                </td>
                                <td class="messsage_body">
                                    zxfg
                                </td>
                            </tr>
                            <tr>
                                <td class="hidden-xs message_for">
                                    <span></span>
                                </td>
                                <td class="message_title">
                                    <a href="?dashboard=user&page=message&tab=view_message&from=sendbox&id=168">xcvbn</a>
                                </td>
                                <td class="messsage_body">
                                    zxfg
                                </td>
                            </tr>
                            <tr>
                                <td class="hidden-xs message_for">
                                    <span>Patient</span>
                                </td>
                                <td class="message_title">
                                    <a href="?dashboard=user&page=message&tab=view_message&from=sendbox&id=167">xcvbn</a>
                                </td>
                                <td class="messsage_body">
                                    zxfg
                                </td>
                            </tr>
                            <tr>
                                <td class="hidden-xs message_for">
                                    <span>aaannnnn bbb</span>
                                </td>
                                <td class="message_title">
                                    <a href="?dashboard=user&page=message&tab=view_message&from=sendbox&id=141">hello</a>
                                </td>
                                <td class="messsage_body">
                                    is working
                                </td>
                            </tr>
                            <tr>
                                <td class="hidden-xs message_for">
                                    <span>Patient</span>
                                </td>
                                <td class="message_title">
                                    <a href="?dashboard=user&page=message&tab=view_message&from=sendbox&id=133">
                                        this is a<br>
                                        test bla<br>
                                        bla ceva
                                    </a>
                                </td>
                                <td class="messsage_body">
                                    this is a test bla bla<br>
                                    cevathis is a test bla bla<br>
                                    cevathis is a test bla bla<br>
                                    cevathis is a test bla bla<br>
                                    cevathis is a test bla bla<br>
                                    cevathis is a test
                                </td>
                            </tr>
                            <tr>
                                <td class="hidden-xs message_for">
                                    <span>Patient</span>
                                </td>
                                <td class="message_title">
                                    <a href="?dashboard=user&page=message&tab=view_message&from=sendbox&id=122">sdsdfsfsf</a>
                                </td>
                                <td class="messsage_body">
                                    sfddfssfdfd
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