<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddAssignedInstrumentList.aspx.cs" Inherits="RejoiceApplication.Instrument.AddAssignedInstrumentList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-inner" style="min-height: 1050px;">
        <!-- start page inner div-->
        <div class="row right_side instrument">
            <!-- start dashboard content div-->
            <noscript>
                <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
            </noscript>
            <script type="text/javascript">
                jQuery(document).ready(function ($) {
                    jQuery('#instrument_list').DataTable({
                        "responsive": true,
                        "aoColumns": [
                            { "bSortable": true },
                            { "bSortable": true },
                            { "bSortable": true },
                            { "bSortable": true },
                            { "bSortable": true },
                            { "bSortable": true },
                            { "bSortable": false }],
                        language: { "sEmptyTable": "No data available in table", "sInfo": "Showing _START_ to _END_ of _TOTAL_ entries", "sInfoEmpty": "Showing 0 to 0 of 0 entries", "sInfoFiltered": "(filtered from _MAX_ total entries)", "sInfoPostFix": "", "sInfoThousands": ",", "sLengthMenu": "Show _MENU_ entries", "sLoadingRecords": "Loading...", "sProcessing": "Processing...", "sSearch": "Search:", "sZeroRecords": "No matching records found", "oPaginate": { "sFirst": "First", "sLast": "Last", "sNext": "Next", "sPrevious": "Previous" }, "oAria": { "sSortAscending": ": activate to sort column ascending", "sSortDescending": ": activate to sort column descending" } }
                    });
                });
            </script>

            <div class="panel-body panel-white">
                <!--START PANEL BODY DIV-->
                <ul class="nav nav-tabs panel_tabs" role="tablist">

                    <li class="">
                        <a href="InstrumentList.aspx" class="tab ">
                            <i class="fa fa-align-justify"></i>Instrument List
                        </a>
                       
                    </li>

                    <li class="">

                        <a href="AddInstrument.aspx" class="tab ">
                            <i class="fa fa-plus-circle"></i>Add Instrument
                        </a>

                    </li>
                    <li class="">
                        <a href="AssignedInstrumentList.aspx" class="tab ">
                            <i class="fa fa-align-justify"></i>Assigned Instrument List
                        </a>
                        
                    </li>
                    <li class="active">

                        <a href="AddAssignedInstrumentList.aspx" class="tab active">
                            <i class="fa fa-plus-circle"></i>Assign Instrument
                        </a>

                    </li>


                </ul>
                <script type="text/javascript">
                    jQuery(document).ready(function ($) {
                        $('#assign_instrument_form').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });

                        var start = new Date();
                        var end = new Date(new Date().setYear(start.getFullYear() + 1));
                        $.fn.datepicker.defaults.format = " yyyy-mm-dd";
                        $('#start_date').datepicker({
                            startDate: start,
                            endDate: end,
                            autoclose: true
                        }).on('changeDate', function (selected) {
                            var minDate = new Date(selected.date.valueOf());
                            $('#end_date').datepicker('setStartDate', minDate);
                        });
                        $.fn.datepicker.defaults.format = " yyyy-mm-dd";
                        $('#end_date').datepicker({
                            startDate: start,
                            endDate: end,
                            autoclose: true
                        }).on('changeDate', function (selected) {
                            var maxDate = new Date(selected.date.valueOf());
                            $('#start_date').datepicker('setEndDate', maxDate);
                        });

                        $('#end_time').timepicki(
                            {
                                show_meridian: false,
                                min_hour_value: 0,
                                max_hour_value: 23,
                                step_size_minutes: 15,
                                overflow_minutes: true,
                                increase_direction: 'up',
                                disable_keyboard_mobile: true
                            }
                        );
                        $('#start_time').timepicki(
                            {
                                show_meridian: false,
                                min_hour_value: 0,
                                max_hour_value: 23,
                                step_size_minutes: 15,
                                overflow_minutes: true,
                                increase_direction: 'up',
                                disable_keyboard_mobile: true
                            }
                        );
                    });
                </script>
                <div class="panel-body">
                    <!--START PANEL BODY DIV-->
                    <form name="assign_instrument_form" action="" method="post" class="form-horizontal" id="assign_instrument_form">
                        <!--START Assign INSTRUMENT FORM-->
                        <input type="hidden" name="action" value="insert">
                        <input type="hidden" name="assign_instrument_id" value="" />
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="patient">Patient<span class="require-field">*</span></label>
                            <div class="col-sm-8">
                                <select name="patient_id" class="form-control validate[required] " id="patient_id">
                                    <option value="">Select Patient</option>
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
                            <label class="col-sm-2 control-label" for="patient">Instrument<span class="require-field">*</span></label>
                            <div class="col-sm-8">
                                <select name="instrument_id" class="form-control validate[required] " id="instrument_id">
                                    <option value="">Select Instrument</option>
                                    <option value="1">001 - Verumak</option>
                                    <option value="2">002 - Verumak</option>
                                    <option value="3">10 - Verumak</option>
                                </select>
                            </div>

                        </div>

                        <div id="select_instrument_block">
                        </div>
                        <input type="hidden" id="_wpnonce" name="_wpnonce" value="8395b69289" /><input type="hidden" name="_wp_http_referer" value="/mojoomla/extend/wordpress/hospital/?dashboard=user&amp;page=instrument&amp;tab=assign_instrument&amp;action=insert" />
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="description">Description</label>
                            <div class="col-sm-8">
                                <textarea id="description" class="form-control validate[custom[address_description_validation]]" maxlength="150" name="description"></textarea>
                            </div>
                        </div>

                        <div class="col-sm-offset-2 col-sm-8">
                            <input type="submit" value="Assign Instrument" name="assign_instrument" class="btn btn-success assigned_instrument_validation" />
                        </div>
                    </form>
                    <!--END Assign INSTRUMENT FORM-->
                </div>
                <!--END PANEL BODY DIV-->
            </div>
            <!--END PANEL BODY DIV-->
        </div>
        <!--END PANEL BODY DIV-->
    </div>

</asp:Content>
