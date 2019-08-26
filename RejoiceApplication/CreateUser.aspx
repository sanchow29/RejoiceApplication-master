<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateUser.aspx.cs" Inherits="RejoiceApplication.CreateUser" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        doctor,staff creation
    </h1>
    <script type="text/javascript">
        function validate() {
            var Fname = document.getElementById('<%= txtFname.ClientID %>').value;
            var Lname = document.getElementById('<%= txtLname.ClientID %>').value;
            var email = document.getElementById('<%= txtEmail.ClientID %>').value;
            var userid = document.getElementById('<%= txtuserid.ClientID %>').value;
            var pwd = document.getElementById('<%= txtPwd.ClientID %>').value;
            var PhoneNo = document.getElementById('<%= txtPhoneNo.ClientID %>').value;
            var EmailLimit = document.getElementById('<%= txtbldgroup.ClientID %>').value;
            if (Fname == "") {
                alert("please enter First Name!!");
                document.getElementById('<%= txtFname.ClientID %>').focus();
                return false;
            }
            if (Lname == "") {
                alert("please enter Last Name!!");
                document.getElementById('<%= txtLname.ClientID %>').focus();
                return false;
            }
            if (email == "") {
                alert("please enter Email!!");
                document.getElementById('<%= txtEmail.ClientID %>').focus();
                return false;
            }
            if (userid == "") {
                alert("please enter UserId!!");
                document.getElementById('<%= txtuserid.ClientID %>').focus();
                return false;
            }
            if (pwd == "") {
                alert("please enter Password!!");
                document.getElementById('<%= txtPwd.ClientID %>').focus();
                return false;
            }
            if (pwd.length < 8) {
                alert("Password length should be from 8 to 20 !!");
                document.getElementById('<%= txtPwd.ClientID %>').focus();
                return false;
            }

            if (PhoneNo == "") {
                alert("please enter Phone!!");
                document.getElementById('<%= txtPhoneNo.ClientID %>').focus();
                return false;
            }
            if (EmailLimit == "") {
                alert("please enter Email Limit!!");
                document.getElementById('<%= txtbldgroup.ClientID %>').focus();
                return false;
            }
            return true;
        }
    </script>
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-6">
                <div>
                    <label for="txtFname" class="form-control label label-primary">SurName:</label>
                    <asp:TextBox ID="txtFname" CssClass="form-control input-sm" runat="server" TextMode="SingleLine"></asp:TextBox>
                </div>
                <div>
                    <label for="txtLname" class="form-control label label-primary">LastName:</label>
                    <asp:TextBox ID="txtLname" CssClass="form-control input-sm" runat="server" TextMode="SingleLine"></asp:TextBox>
                </div>
                <div>
                    <label for="txtEmail" class="form-control label label-primary">EmailId:</label>
                    <asp:TextBox ID="txtEmail" CssClass="form-control input-sm" runat="server" TextMode="Email"></asp:TextBox>
                </div>
                <div>
                    <label for="txtuserid" class="form-control label label-primary">UserId:</label>
                    <asp:TextBox ID="txtuserid" CssClass="form-control input-sm" runat="server" TextMode="SingleLine"></asp:TextBox>
                </div>
                <div>
                    <label for="txtPwd" class="form-control label label-primary">Password:</label>
                    <asp:TextBox ID="txtPwd" CssClass="form-control input-sm" runat="server" TextMode="Password"></asp:TextBox>
                </div>
                <div>
                    <label for="txtPhoneNo" class="form-control label label-primary">Phone Number:</label>
                    <asp:TextBox ID="txtPhoneNo" CssClass="form-control input-sm" runat="server" TextMode="Phone"></asp:TextBox>
                </div>
                <div>
                    <ajax:CalendarExtender ID="CalendarExtender1" TargetControlID="txtDOBDate" Format="dd/MM/yyyy" PopupButtonID="imgbtnCalendar" runat="server"></ajax:CalendarExtender>
                    <label for="txtDOBDate" class="form-control label label-primary">DOB:</label>
                    <span>

                        <asp:TextBox ID="txtDOBDate" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                        <asp:ImageButton ID="imgbtnCalendar" runat="server" ImageUrl="~/Images/calendar.png"/>
                    </span>
                </div>
                <div>
                    <label for="rblsex" class="form-control label label-primary">Sex:</label>
                    <asp:RadioButtonList ID="rblsex" runat="server" Height="16px" Width="275px">
                        <asp:ListItem Text="Male" Value="Male" Selected="True">
                        </asp:ListItem>
                        <asp:ListItem Text="Female" Value="Female"/>
                    </asp:RadioButtonList>

                </div>
                <div>
                    <label for="ddldesg" class="form-control label label-primary">Desigination:</label>
                    <asp:DropDownList ID="ddldesg" CssClass="form-control input-sm" runat="server"></asp:DropDownList>
                </div>
                <div>
                    <label for="txtbldgroup" class="form-control label label-primary">Blood Group:</label>
                    <asp:TextBox ID="txtbldgroup" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label for="txtEducation" class="form-control label label-primary">Education:</label>
                    <asp:TextBox ID="txtEducation" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-6">
                <div>
                    <label for="txtdno" class="form-control label label-primary">Door No:</label>
                    <asp:TextBox ID="txtdno" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label for="txtadd1" class="form-control label label-primary">Address1:</label>
                    <asp:TextBox ID="txtadd1" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label for="txtadd2" class="form-control label label-primary">Address2:</label>
                    <asp:TextBox ID="txtadd2" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label for="txtCity" class="form-control label label-primary">City:</label>
                    <asp:TextBox ID="txtCity" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label for="txtState" class="form-control label label-primary">State:</label>
                    <asp:TextBox ID="txtState" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label for="txtCountry" class="form-control label label-primary">Country:</label>
                    <asp:TextBox ID="txtCountry" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label for="txtPinCode" class="form-control label label-primary">Pin Code:</label>
                    <asp:TextBox ID="txtPinCode" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label for="txtDepartment" class="form-control label label-primary">Department:</label>
                    <asp:TextBox ID="txtDepartment" CssClass="form-control input-sm" runat="server"></asp:TextBox>

                </div>
                <br/>
                <div>
                    <label for="ddlestatus" class="form-control label label-primary">Status :</label>
                    <asp:DropDownList ID="ddlestatus" CssClass="form-control input-sm" runat="server"></asp:DropDownList>

                </div>
                <br/>

                <div>
                    <label for="ddlrole" class="form-control label label-primary">Role:</label>
                    <asp:DropDownList ID="ddlrole" CssClass="form-control input-sm" runat="server"></asp:DropDownList>

                </div>
                <br/>
                <div>
                    <label for="txtExperience" class="form-control label label-primary">Experience:</label>
                    <asp:TextBox ID="txtExperience" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                </div>
            </div>

            <%-- <asp:Button ID="btncreateuser" runat="server" CssClass="btn btn-primary" Text="Create User" OnClientClick="javascript:return validate()" OnClick="btncreateuser_Click" />--%>
        </div>
    </div>
</asp:Content>