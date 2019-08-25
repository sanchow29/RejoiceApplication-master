<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AppoitmentBookings.aspx.cs" Inherits="RejoiceApplication.AppoitmentBookings" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-6">
                <div>
                    <label for="txtPname" class="form-control label label-primary">Patient Name:</label>

                    <asp:TextBox ID="txtPname" CssClass="form-control input-sm" runat="server"></asp:TextBox>

                </div>
                <div>
                    <label for="ddldoctorList" class="form-control label label-primary">Doctor:</label>

                    <asp:DropDownList ID="ddldoctorList" CssClass="form-control input-sm" runat="server"></asp:DropDownList>
                </div>
                <div>
                    <label for="rblsex" class="form-control label label-primary">Sex:</label>
                    <asp:RadioButtonList ID="rblsex" runat="server">
                        <asp:ListItem Text="Male" Value="Male" Selected="True">
                        </asp:ListItem>
                        <asp:ListItem Text="Female" Value="Female" />
                    </asp:RadioButtonList>

                </div>
            </div>
            <div class="col-md-6">
                <div>
                    <ajax:CalendarExtender ID="CalendarExtender1" TargetControlID="txtDOBDate" Format="dd/MM/yyyy" PopupButtonID="imgbtnCalendar" runat="server"></ajax:CalendarExtender>
                    <label for="txtDOBDate" class="form-control label label-primary">Appoitment Date:</label>

                    <asp:TextBox ID="txtDOBDate" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                    <asp:ImageButton ID="imgbtnCalendar" runat="server" ImageUrl="~/Images/calendar.png" />

                </div>
                <div>
                    <label for="ddlTime" class="form-control label label-primary">Time:</label>

                    <asp:DropDownList ID="ddlTime" CssClass="form-control input-sm" runat="server"></asp:DropDownList>
                </div>
                <div>
                    <label for="txtPPhoneNo" class="form-control label label-primary">Phone Number:</label>
                    <asp:TextBox ID="txtPPhoneNo" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label for="txtPEmailid" class="form-control label label-primary">Email Id:</label>
                    <asp:TextBox ID="txtPEmailid" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label for="txtAltPPhNo" class="form-control label label-primary">Alternate Phone Number:</label>
                    <asp:TextBox ID="txtAltPPhNo" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label for="ddlAppStatus" class="form-control label label-primary">Appointment Status:</label>

                    <asp:DropDownList ID="ddlAppStatus" CssClass="form-control input-sm" runat="server"></asp:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
