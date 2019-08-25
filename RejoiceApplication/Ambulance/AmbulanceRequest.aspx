<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AmbulanceRequest.aspx.cs" Inherits="RejoiceApplication.Ambulance.AmbulanceRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-inner" style="min-height: 1050px;">
        <!-- start page inner div-->
        <div class="row right_side ambulance">
            <!-- start dashboard content div-->
            <noscript>
                <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
            </noscript>
            <script type="text/javascript">
                jQuery(document).ready(function () {
                    $('.request_time').timepicki(
                        {
                            show_meridian: false,
                            min_hour_value: 0,
                            max_hour_value: 23,
                            step_size_minutes: 15,
                            overflow_minutes: true,
                            increase_direction: 'up',
                            disable_keyboard_mobile: true
                        });

                    $('.dispatch_time').timepicki({
                        show_meridian: false,
                        min_hour_value: 0,
                        max_hour_value: 23,
                        step_size_minutes: 15,
                        overflow_minutes: true,
                        increase_direction: 'up',
                        disable_keyboard_mobile: true
                    });
                    var date = new Date();
                    date.setDate(date.getDate() - 0);
                    $.fn.datepicker.defaults.format = " yyyy-mm-dd";
                    $('#request_date').datepicker({
                        startDate: date,
                        autoclose: true
                    });
                    $('#tax_charge').multiselect({
                        nonSelectedText: 'Select Tax',
                        includeSelectAllOption: true,
                        selectAllText: 'Select all'
                    });
                });
            </script>
            <div class="panel-body panel-white">
                <!-- START PANEL BODY DIV -->
                <ul class="nav nav-tabs panel_tabs" role="tablist">
                    <!-- START NAV TAB -->
                    <li class="">
                        <a href="Ambulance.aspx">
                            <i class="fa fa-align-justify"></i>Request List
                        </a>

                    </li>
                    <li class="active">

                        <a href="AmbulanceRequest.aspx" class="tab active">
                            <i class="fa fa-plus-circle"></i>Add Request
                        </a>

                    </li>

                    <li class="">
                        <a href="AmbulanceList.aspx">
                            <i class="fa fa-align-justify"></i>Ambulance List
                        </a>

                    </li>

                    <li class="">

                        <a href="AddNewAmbulance.aspx" class="tab ">
                            <i class="fa fa-plus-circle"></i>Add New Ambulance
                        </a>

                    </li>

                </ul>
                <!-- END NAV TAB -->
                <div class="tab-content">
                    <!-- START TAB CONTENT DIV -->
                    <div class="tab-pane fade active in" id="add_req">
                        <!-- START TAB FADE DIV -->
                        <script type="text/javascript">
                            jQuery(document).ready(function ($) {
                                $('#patient_form').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });

                                var date = new Date();
                                date.setDate(date.getDate() - 0);
                                $.fn.datepicker.defaults.format = " yyyy-mm-dd";
                                $('#request_date').datepicker({
                                    startDate: date,
                                    autoclose: true
                                });
                            });
                        </script>
                        <div class="panel-body">
                            <!-- START PANEL BODY DIV-->
                            <%-- <form name="patient_form" action="" method="post" class="form-horizontal" id="patient_form">--%>
                            <!-- START AMBULAMCE Request FORM-->
                            <input type="hidden" name="action" value="insert">
                            <input type="hidden" name="amb_req_id" value="" />
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="ambulance_id">Ambulance<span class="require-field">*</span></label>
                                <div class="col-sm-6">
                                    <select name="ambulance_id" class="form-control validate[required] " id="ambulance_id">
                                        <option value="">Select Ambulance</option>
                                        <option value="1">AMB03161</option>
                                        <option value="2">AMB03162</option>
                                        <option value="3">AMB03223</option>
                                        <option value="4">AMB03224</option>
                                    </select>

                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="patient_id">Patient</label>
                                <div class="col-sm-6">
                                    <select name="patient_id" id="patient_id" class="form-control validate[required] patient_address">
                                        <option>Select Patient</option>
                                        <option value="35">P160419 - Nina Cadela</option>
                                        <option value="57">P370519 - R R</option>
                                        <option value="104">P840819 - rer e</option>
                                        <option value="54">P340519 - aaaa aaa</option>
                                        <option value="70">P500519 - aaannnnn bbb</option>
                                        <option value="59">P390519 - Abhijit Borgohain</option>
                                        <option value="64">P440519 - Apj Kalam</option>
                                        <option value="97">P770719 - ashok kumar</option>
                                        <option value="96">P760719 - ashok kumar</option>
                                        <option value="4">P20319 - Ashish Ranjan</option>
                                        <option value="48">P280419 - Amel Ali</option>
                                        <option value="109">P890819 - Andile Zulu</option>
                                        <option value="7">P50319 - Anna Sanz</option>
                                        <option value="63">P430519 - Treatment Range</option>
                                        <option value="95">P750719 - Adi Nugroho</option>
                                        <option value="50">P300419 - gab girbaci</option>
                                        <option value="47">P270419 - Kristopher Davis</option>
                                        <option value="77">P570619 - claudiu ciubotaru</option>
                                        <option value="88">P680719 - NiftecsPOS Ombachi</option>
                                        <option value="110">P900819 - David Urrego</option>
                                        <option value="31">P120419 - akshay sarwade</option>
                                        <option value="34">P150419 - prayag bhaler</option>
                                        <option value="90">P700719 - damien schuling</option>
                                        <option value="83">P630619 - Favour Isoah</option>
                                        <option value="100">P800819 - fdsfdsf dsfsdfsdf</option>
                                        <option value="86">P660619 - abc def</option>
                                        <option value="42">P220419 - Joshua Altio</option>
                                        <option value="41">P210419 - Joshua Altio</option>
                                        <option value="101">P810819 - Haris Abbas</option>
                                        <option value="43">P230419 - hendra wijaya</option>
                                        <option value="89">P690719 - matthew kargbo</option>
                                        <option value="74">P540619 - jong test</option>
                                        <option value="106">P860819 - Igor Negromonte</option>
                                        <option value="105">P850819 - Emran  Imran</option>
                                        <option value="107">P870819 - ahmed ahmed</option>
                                        <option value="81">P610619 - Ilyas Awan</option>
                                        <option value="92">P720719 - Eugene Ciervo</option>
                                        <option value="55">P350519 - pooja chaudhery</option>
                                        <option value="62">P420519 - uu ui</option>
                                        <option value="39">P190419 - king hytrd</option>
                                        <option value="87">P670619 - kkk k</option>
                                        <option value="73">P530519 - Kartik Bhatt</option>
                                        <option value="99">P790719 - kumar singh</option>
                                        <option value="98">P780719 - mark masai manu</option>
                                        <option value="82">P620619 - Johnson  Landzro</option>
                                        <option value="8">P60319 - Lucas M</option>
                                        <option value="49">P290419 - Ahmed Ahme</option>
                                        <option value="65">P450519 - testq proba</option>
                                        <option value="6">P40319 - Mario Rossi</option>
                                        <option value="69">P490519 - John Owner</option>
                                        <option value="103">P830819 - maxmuts muutus</option>
                                        <option value="51">P310419 - test  test</option>
                                        <option value="91">P710719 - Mustufa Aghadi</option>
                                        <option value="32">P130419 - prayag bhaler</option>
                                        <option value="85">P650619 - Onder Gulec</option>
                                        <option value="84">P640619 - ttttt tt</option>
                                        <option value="5">P30319 - John Mark</option>
                                        <option value="3">P10319 - Jose Figueroa</option>
                                        <option value="60">P400519 - patient p</option>
                                        <option value="61">P410519 - patiente p</option>
                                        <option value="68">P480519 - test SINHA</option>
                                        <option value="94">P740719 - sddsa dassss</option>
                                        <option value="108">P880819 - Renan Remi</option>
                                        <option value="58">P380519 - Nico Alderson</option>
                                        <option value="53">P330419 - abc PANDIT</option>
                                        <option value="29">P100419 - muhammed shameem</option>
                                        <option value="46">P260419 - Carlos Roberto Carlos Roberto</option>
                                        <option value="66">P460519 - mohammad khan</option>
                                        <option value="79">P590619 - juan juanxin</option>
                                        <option value="37">P170419 - stan Ngaguthii</option>
                                        <option value="75">P550619 - tan me</option>
                                        <option value="44">P240419 - Test Test</option>
                                        <option value="45">P250419 - Test Test</option>
                                        <option value="71">P510519 - testaaa testaaa</option>
                                        <option value="52">P320419 - Moses Peter</option>
                                        <option value="72">P520519 - Abd ASb</option>
                                        <option value="76">P560619 - TJ med</option>
                                        <option value="102">P820819 - tiny tim</option>
                                        <option value="40">P200419 - Tony Stark</option>
                                        <option value="56">P360519 - Ulisses  Silva</option>
                                        <option value="38">P180419 - AS as</option>
                                        <option value="67">P470519 - Everton  Muta</option>
                                        <option value="80">P600619 - Vishal Singh</option>
                                        <option value="27">P80319 - Vivekanand Adkatalwar</option>
                                        <option value="93">P730719 - Le Thanh</option>
                                        <option value="78">P580619 - Zeeshan Asghar</option>
                                    </select>

                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="address">Address<span class="require-field">*</span></label>
                                <div class="col-sm-6">
                                    <textarea name="address" id="address" maxlength="150" class="form-control validate[required,custom[address_description_validation]]"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="charges">Charges (&#36;)<span class="require-field">*</span></label>
                                <div class="col-sm-6">
                                    <input id="charges" class="form-control validate[required]" min="0" type="number" onkeypress="if(this.value.length==8) return false;" step="0.01" value="" name="charge">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="visiting_fees">Tax</label>
                                <div class="col-sm-2">
                                    <select class="form-control" id="tax_charge" name="tax[]" multiple="multiple">
                                        <option value="1">GST-9</option>
                                        <option value="2">SGST-8</option>
                                        <option value="3">VAT-5</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="request_date">Request Date<span class="require-field">*</span></label>
                                <div class="col-sm-6">
                                    <input id="request_date" class="form-control validate[required]" type="text" value="" name="request_date">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="request_time">Request Time</label>
                                <div class="col-sm-6">
                                    <input id="request_time" class="form-control request_time" type="text" value="" name="request_time">
                                </div>
                            </div>
                            <input type="hidden" id="_wpnonce" name="_wpnonce" value="42b0594b4a" /><input type="hidden" name="_wp_http_referer" value="/mojoomla/extend/wordpress/hospital/?dashboard=user&amp;page=ambulance&amp;tab=add_ambulance_req&amp;action=insert" />
                            <div class="form-group margin_bottom_5px">
                                <label class="col-sm-2 control-label" for="dispatch_time">Dispatch Time</label>
                                <div class="col-sm-8">
                                    <input id="dispatch_time" class="form-control dispatch_time" data-show-meridian="false" data-minute-step="15" type="text" value="" name="dispatch_time">
                                </div>
                            </div>
                            <div class="col-sm-offset-2 col-sm-8">
                                <input type="submit" value="Save" name="save_ambulance_request" class="btn btn-success" />
                                <asp:Button ID="btnSave" class="btn btn-success" runat="server" Text="Save" />
                            </div>
                            <%--</form>--%>
                            <!-- END Ambulance Request FORM -->
                        </div>
                        <!-- END PANEL BODY DIV -->
                    </div>
                    <!-- END TAB FADE DIV -->
                </div>
                <!-- END TAB CONTENT DIV -->
            </div>
        </div>
    </div>

</asp:Content>
