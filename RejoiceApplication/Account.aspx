<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="RejoiceApplication.Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="page-inner" style="min-height: 1050px;">
<!-- start page inner div-->
<div class="row right_side account">
<!-- start dashboard content div-->
<noscript>
    <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
</noscript>

<style>
    .profile-cover { background: url("http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/hospital_background.png") repeat scroll 0 0/cover rgba(0, 0, 0, 0); }
</style>
<script type="text/javascript">
    jQuery(document).ready(function($) {
        $('#acountform').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });
        $('#doctor_form').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });

        $.fn.datepicker.defaults.format = " yyyy-mm-dd";
        $('#birth_date').datepicker({
            endDate: '+0d',
            autoclose: true
        });
    });
</script>
<!-- POP up code -->
<div class="popup-bg">
    <div class="overlay-content">
        <div class="modal-content">
            <div class="profile_picture">
            </div>
        </div>
    </div>
</div>
<!-- End POP-UP Code -->
<div>
<div class="profile-cover">
    <!-- START PROFILE COVER DIV -->
    <div class="row">
        <!-- START ROW DIV -->
        <div class="col-md-3 profile-image">
            <!-- START Profile IMAGE DIV -->
            <div class="profile-image-container">
                <img src="http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/assets/images/useriamge/doctor.png" height="150px" width="150px" class="img-circle" id="profile_pic"/>
            </div>
            <div class="col-md-1 update_dp">
                <button class="btn btn-default btn-file" type="file" name="profile_change" id="profile_change">Update Profile</button>

            </div>
        </div>
    </div>
    <!-- END ROW DIV -->
</div>
<!-- END PROFILE COVER DIV -->
<div id="main-wrapper">
<!-- START MAIN WRAPPER DIV -->
<div class="row">
<!-- START ROW DIV -->
<div class="col-md-3 user-profile">
    <!-- START USER PROFILE DIV -->
    <h3 class="text-center">
        Fernando Therrien
    </h3>
    <hr>
    <ul class="list-unstyled text-center">
        <li>
            <p>
                <i class="fa fa-map-marker m-r-xs"></i>
                <a href="#">162 Platinum Drive,</a>
            </p>
        </li>
        <li>
            <i class="fa fa-envelope m-r-xs"></i>
            <a href="#">marcosjuniiorx@gmail.com</a>

        </li>
    </ul>
</div>
<!-- END USER PROFILE DIV -->

<div class="col-md-8 m-t-lg">
<div class="panel panel-white">
    <!-- START PANEL WHITE DIV -->
    <div class="panel-heading">
        <div class="panel-title">Account Settings </div>
    </div>
    <div class="panel-body">
        <!-- START PANEL BODY DIV -->
        <form class="form-horizontal" id="acountform" name="acountform" action="#" method="post">
            <!-- START ACCOUNT FORM -->

            <div class="form-group">
                <label class="control-label col-xs-2"></label>
                <div class="col-xs-10">
                    <p>
                        <h4 class="bg-danger"></h4>
                    </p>
                </div>
            </div>
            <div class="form-group">

                <label for="inputEmail" class="control-label col-sm-2">Name</label>

                <div class="col-sm-10">

                    <input type="Name" class="form-control  validate[custom[onlyLetter_specialcharacter]]" id="name" name="first_name" placeholder="Full Name" maxlength="50" value="Fernando Therrien" readonly>
                </div>

            </div>
            <div class="form-group">

                <label for="inputEmail" class="control-label col-sm-2">Username</label>

                <div class="col-sm-10">

                    <input type="username" class="form-control validate[custom[username_validation]" id="name" placeholder="Full Name" maxlength="30" value="doctor" readonly>
                </div>

            </div>

            <!--
            <div class="form-group">

                <label for="inputPassword" class="control-label col-sm-2 ">Current Password</label>

                <div class="col-sm-10">

                    <input type="password" class="form-control validate[required]" id="inputPassword" placeholder="Password" name="current_pass">

                </div>

            </div>
            <input type="hidden" id="_wpnonce" name="_wpnonce" value="58b065f24b" /><input type="hidden" name="_wp_http_referer" value="/mojoomla/extend/wordpress/hospital/?dashboard=user&amp;page=account" />						<div class="form-group">

                <label for="inputPassword" class="control-label col-sm-2">New Password</label>

                <div class="col-sm-10">

                    <input type="password" class="validate[required,minSize[8]] form-control" id="new_pass" placeholder="New Password" maxlength="12" name="new_pass">

                </div>

            </div>
            <div class="form-group">

                <label for="inputPassword" class="control-label col-sm-2">Confirm Password</label>

                <div class="col-sm-10">

                    <input type="password" class="validate[required,equals[new_pass],minSize[8]] form-control" id="inputPassword"  maxlength="12" placeholder="Confirm Password" name="conform_pass">

                </div>
            </div>

            -->
            <div class="form-group">

                <div class="col-xs-offset-2 col-sm-10">

                    <button type="submit" class="btn btn-success" name="save_change">Save</button>

                </div>

            </div>

        </form>
        <!-- END ACCOUNT FORM -->
    </div>
    <!-- END PANEL BODY DIV -->
</div>


<div class="panel panel-white">
    <!-- START PANEL WHITE DIV -->
    <div class="panel-heading">
        <div class="panel-title">Other Information </div>
    </div>
    <div class="panel-body">
        <!-- START PANEL BODY DIV -->
        <form class="form-horizontal" action="#" method="post" id="doctor_form">
            <!-- START USER INORMATION FORM -->
            <input type="hidden" value="edit" name="action">
            <input type="hidden" value="doctor" name="role">
            <input type="hidden" value="2" name="user_id">
            <div class="form-group">
                <label class="col-sm-2 control-label" for="birth_date">Date of birth<span class="require-field">*</span></label>
                <div class="col-sm-10">
                    <input id="birth_date" class="form-control validate[required]" type="text" type="text" name="birth_date"
                           value="2019-03-16" readonly>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="department">Department</label>
                <div class="col-sm-10">
                    <select name="department" class="form-control" id="category_data">
                        <option>select Department</option>
                        <option value="7" selected="selected">Cardiology</option>
                        <option value="8">General surgery</option>
                        <option value="9">Haematology</option>
                        <option value="10">Neurology</option>
                    </select>
                </div>

            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="birth_date">Specialization<span class="require-field">*</span></label>
                <div class="col-sm-10">

                    <select class="form-control validate[required]"
                            id="specialization" name="specialization">
                        <option>Select Specialization</option>
                        <option value="11" selected="selected">Cardiologists</option>
                        <option value="12">Emergency Medicine Specialists</option>
                        <option value="13">Family Physicia</option>
                        <option value="14">Neurologists</option>
                    </select>
                </div>

            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="birth_date">Degree<span class="require-field">*</span></label>
                <div class="col-sm-10">
                    <input id="doc_degree" class="form-control validate[required,custom[popup_category_validation]]" maxlength="50" type="text" name="doc_degree"
                           value="MD">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="visiting_fees">Visting Charge</label>
                <div class="col-sm-10">
                    <input id="doc_degree" class="form-control" type="number" min="0" onkeypress="if (this.value.length == 8) return false;" step="0.01" name="visiting_fees"
                           value="7000">
                </div>
            </div>
            <div class="form-group">

                <label for="inputEmail" class="control-label col-sm-2">Home Town Address<span class="require-field">*</span></label>

                <div class="col-sm-10">

                    <input id="address" class="form-control validate[required,custom[address_description_validation]]" maxlength="150" type="text" name="address" maxlength="150" value="162  Platinum Drive">
                </div>

            </div>
            <div class="form-group">

                <label for="inputEmail" class="control-label col-sm-2">City<span class="require-field">*</span></label>

                <div class="col-sm-10">

                    <input id="address" class="form-control validate[required,custom[city_state_country_validation]]" type="text" name="home_city_name" maxlength="50" value="ENCARNACION">
                </div>

            </div>
            <div class="form-group">

                <label for="inputEmail" class="control-label col-sm-2">State</label>

                <div class="col-sm-10">

                    <input id="address" class="form-control validate[custom[city_state_country_validation]]" type="text" name="home_state_name" maxlength="50" value="ITAPUA">
                </div>

            </div>
            <div class="form-group">

                <label for="inputEmail" class="control-label col-sm-2">Country</label>

                <div class="col-sm-10">

                    <input id="address" class="form-control validate[custom[city_state_country_validation]]" type="text" name="home_country_name" maxlength="50" value="PARAGUAY">
                </div>

            </div>
            <div class="form-group">

                <label for="inputEmail" class="control-label col-sm-2">Office Address<span class="require-field">*</span></label>

                <div class="col-sm-10">

                    <input id="" class="form-control validate[required,custom[address_description_validation]]" type="text" name="office_address" maxlength="150" value="Rua Rio Jari">
                </div>

            </div>
            <div class="form-group">

                <label for="inputEmail" class="control-label col-sm-2">City<span class="require-field">*</span></label>

                <div class="col-sm-10">

                    <input id="" class="form-control validate[required,custom[city_state_country_validation]]" maxlength="50" type="text" name="city_name" value="Barra do Corda">
                </div>

            </div>
            <div class="form-group">

                <label for="inputstate" class="control-label col-sm-2">State</label>

                <div class="col-sm-10">

                    <input id="" class="form-control validate[custom[city_state_country_validation]]" maxlength="50" type="text" name="state_name" value="Ma">
                </div>

            </div>
            <div class="form-group">

                <label for="inputstate" class="control-label col-sm-2">Country</label>

                <div class="col-sm-10">

                    <input id="" class="form-control validate[custom[city_state_country_validation]]" type="text" name="country_name" maxlength="50" value="Brasil">
                </div>
            </div>
            <div class="form-group">
                <label for="inputEmail" class="control-label col-sm-2">Phone</label>

                <div class="col-sm-10">
                    <input id="phone" class="form-control validate[custom[phone_number]] text-input" minlength="6" maxlength="15" type="text" value="99984424723" name="phone">
                </div>
            </div>
            <input type="hidden" id="_wpnonce" name="_wpnonce" value="5a5a21333e"/><input type="hidden" name="_wp_http_referer" value="/mojoomla/extend/wordpress/hospital/?dashboard=user&amp;page=account"/>
            <div class="form-group">
                <label for="inputEmail" class="control-label col-sm-2">Email<span class="require-field">*</span></label>

                <div class="col-sm-10">

                    <input id="email" class="form-control validate[required,custom[email]] text-input" type="text" maxlength="100" name="email" value="marcosjuniiorx@gmail.com">
                </div>

            </div>
            <div class="form-group">

                <div class="col-sm-offset-2 col-sm-10">

                    <button type="submit" class="btn btn-success" name="profile_save_change">Save</button>

                </div>

            </div>
        </form>
        <!-- END USER INFORMATION FORM -->
    </div>
    <!-- END PANEL BODY DIV -->
</div>
<!-- END PANEL WHITE DIV -->
</div>
<!-- END USER PROFILE DIV -->
</div>
<!-- END ROW DIV -->
</div>
<!-- END MAIN WRAPPER DIV -->
</div>
</div>
</div>
</asp:Content>