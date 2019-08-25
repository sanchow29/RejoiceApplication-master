<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LabBilling.aspx.cs" Inherits="RejoiceApplication.LabBilling" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="row">
        <div class="col-md-12">

            <div class="col-md-6">
                <div>
                    <label for="txtuserid" class="form-control label label-primary">UserId:</label>
                    <asp:TextBox ID="txtuserid" CssClass="form-control input-sm" runat="server" TextMode="SingleLine"></asp:TextBox>
                </div>
                <div>
                    <label for="txtpid" class="form-control label label-primary">Patient Id:</label>
                    <asp:TextBox ID="txtpid" CssClass="form-control input-sm" runat="server" TextMode="SingleLine"></asp:TextBox>
                </div>
                <div>
                    <label for="txtpname" class="form-control label label-primary">Patient Name:</label>
                    <asp:TextBox ID="txtpname" CssClass="form-control input-sm" runat="server" TextMode="SingleLine"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-6">

                <div>
                    <label for="txttestnae" class="form-control label label-primary">Test Name:</label>
                    <asp:TextBox ID="txttestname" CssClass="form-control input-sm" runat="server" TextMode="SingleLine"></asp:TextBox>
                </div>
                 <div>
                    <label for="ddltestdetails" class="form-control label label-primary">Type of Test:</label>
                    <asp:DropDownList ID="ddltestdetails" CssClass="form-control input-sm" runat="server"></asp:DropDownList>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
