<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RoomData.aspx.cs" Inherits="RejoiceApplication.RoomData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-6">
                <div>

                    <label for="lblRoomNo" class="form-control label label-primary">Room Number:</label>

                    <asp:TextBox ID="txtRoomNo" CssClass="form-control input-sm" runat="server"></asp:TextBox>

                </div>
                <div>
                    <label for="DropDownList1" class="form-control label label-default">Status</label>
                    <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>

                </div>

                <div>
                    <label for="rblRoomType" class="form-control label label-default">Room Type:</label>
                    <asp:RadioButtonList ID="rblRoomType" runat="server">
                        <asp:ListItem Text="AC" Value="AC">
                        </asp:ListItem>
                        <asp:ListItem Text="Non AC" Value="NAC" Selected="True" />
                    </asp:RadioButtonList>

                </div>
                <div>
                    <label for="rblTypeofShare" class="form-control label label-default">Type of Share:</label>
                    <asp:RadioButtonList ID="rblTypeofShare" runat="server">
                        <asp:ListItem Text="Private" Value="Single">
                        </asp:ListItem>
                        <asp:ListItem Text="Two" Value="Two" Selected="True" />
                        <asp:ListItem Text="Three" Value="Three" />
                    </asp:RadioButtonList>

                </div>
                <div>
                    <label for="rblBedType" class="form-control label label-default">Ward Type:</label>
                    <asp:RadioButtonList ID="rblBedType" runat="server">
                        <asp:ListItem Text="General" Value="General">
                        </asp:ListItem>
                        <asp:ListItem Text="Room" Value="Room" Selected="True" />
                        <asp:ListItem Text="ICU" Value="ICU" />
                    </asp:RadioButtonList>

                </div>
            </div>
            <div class="col-md-6">
                <div>
                    <label for="txtBloodGroup" class="form-control label label-default">Blood Group:</label>
                    <asp:TextBox ID="txtBloodGroup" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label for="txtBloodGroup" class="form-control label label-default">PatientId:</label>
                    <asp:TextBox ID="TextBox1" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
