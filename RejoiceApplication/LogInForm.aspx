﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogInForm.aspx.cs" Inherits="RejoiceApplication.LogInForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LoginForm</title>
       <style type="text/css">
        #div_loginContainer {
            border: 2px solid grey;
            border-radius: 5px;
            /*max-width: 700px;*/
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
    </style>
    <script type="text/javascript">

        function validate() {

            var Fname = document.getElementById('<%= UserName.ClientID %>').value;
            var Lname = document.getElementById('<%= Password.ClientID %>').value;
            if (Fname == "") {
                alert("please enter User Id to proceed!!");
                document.getElementById('<%= UserName.ClientID %>').focus();
                return false;
            }
            if (Lname == "") {
                alert("please enter Password to proceed!!");
                document.getElementById('<%= Password.ClientID %>').focus();
                return false;
            }

            return true;

        }

    </script>
</head>
<body>
<form id="form1" runat="server">
    <div>
        <h1>
            login details
        </h1>
        <div class="container" id="div_loginContainer">

            <div class="row">

                <div class="col-md-12" style="text-align: center;">

                    <h1 style="background-color: #101010; color: #9d9d9d; padding: 10px; border: 2px solid #101010; border-radius: 5px;">Please Login</h1>
                    <hr/>

                </div>

            </div>

            <div class="row">

                <div class="col-md-12" style="text-align: center;">

                    <asp:TextBox ID="UserName" runat="server" CssClass="form-control input-lg"
                                 placeholder="User Id">
                    </asp:TextBox>


                </div>

            </div>

            <div class="row" style="margin-top: 15px;">

                <div class="col-md-12" style="text-align: center;">

                    <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="form-control input-lg"
                                 placeholder="Password">
                    </asp:TextBox>


                </div>

            </div>

            <div class="row" style="margin-bottom: 10px; margin-top: 15px;">

                <div class="col-md-12">

                    <asp:Button ID="LoginButton" runat="server" CommandName="Login"
                                Text="Log In" OnClientClick="javascript:return validate();" OnClick="LoginButton_Click" ValidationGroup="Login1" CssClass="btn btn-primary form-control"/>

                </div>

            </div>

        </div>


    </div>
</form>
</body>
</html>