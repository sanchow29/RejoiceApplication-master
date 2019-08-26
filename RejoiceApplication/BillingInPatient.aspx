<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BillingInPatient.aspx.cs" Inherits="RejoiceApplication.BillingInPatient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">

            <%-- <div class="col-md-6">--%>
            <h2> search with patient id</h2>
            <div>
                <label for="txtpatientid" class="form-control label label-primary">Patient Id:</label>
                <asp:TextBox ID="txtpatientid" CssClass="form-control input-sm" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="Button1" runat="server" Text="Search Details"/>
            </div>

            <%-- </div>--%>
            <div class="col-md-6">

            </div>
            <asp:GridView runat="server" ID="pbillingdetails">

            </asp:GridView>
        </div>

    </div>
</asp:Content>