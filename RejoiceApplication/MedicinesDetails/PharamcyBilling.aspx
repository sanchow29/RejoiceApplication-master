<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PharamcyBilling.aspx.cs" Inherits="RejoiceApplication.MedicinesDetails.PharamcyBillinng" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-6">
                <div>
                    <label for="txtPname" class="form-control label label-primary">Patient Id:</label>
                    <asp:TextBox ID="txtPname" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label for="txtdid" class="form-control label label-primary">Doctor Id:</label>
                    <asp:TextBox ID="txtdid" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </div>
                <div>
                    <ajax:CalendarExtender ID="CalendarExtender1" TargetControlID="txtBDate" Format="dd/MM/yyyy" PopupButtonID="imgbtnCalendar" runat="server"></ajax:CalendarExtender>
                    <label for="txtBDate" class="form-control label label-primary">Bill Date:</label>
                    <asp:TextBox ID="txtBDate" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                    <asp:ImageButton ID="imgbtnCalendar" runat="server" ImageUrl="~/Images/calendar.png"/>

                </div>
                <div>
                    <label for="txtqty" class="form-control label label-primary">Quantity:</label>
                    <asp:TextBox ID="txtqty" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label for="txtprodid" class="form-control label label-primary">Product Id:</label>
                    <asp:TextBox ID="txtprodid" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label for="txtbatchno" class="form-control label label-primary">Batch Number:</label>
                    <asp:TextBox ID="txtbatchno" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label for="txtexpdate" class="form-control label label-primary">Expiery Date:</label>
                    <asp:TextBox ID="txtexpdate" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-6">
                <div>
                    <label for="txtmfgdate" class="form-control label label-primary">Manufacture Date:</label>
                    <asp:TextBox ID="txtmfgdate" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label for="txtrate" class="form-control label label-primary">Rate:</label>
                    <asp:TextBox ID="txtrate" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label for="txtexpdate" class="form-control label label-primary">discount:</label>
                    <asp:TextBox ID="TextBox3" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label for="txtexpdate" class="form-control label label-primary">Type:</label>
                    <asp:TextBox ID="TextBox4" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label for="txtexpdate" class="form-control label label-primary">BillReference No:</label>
                    <asp:TextBox ID="TextBox5" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label for="txtexpdate" class="form-control label label-primary">Payment Type:</label>
                    <asp:TextBox ID="TextBox6" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label for="txtexpdate" class="form-control label label-primary">Expiery Date:</label>
                    <asp:TextBox ID="TextBox7" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>

    </div>
</asp:Content>