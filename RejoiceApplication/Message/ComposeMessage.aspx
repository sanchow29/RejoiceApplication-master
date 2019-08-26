<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ComposeMessage.aspx.cs" Inherits="RejoiceApplication.Message.ComposeMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-inner" style="min-height: 1050px;">
        <!-- start page inner div-->
        <div class="row right_side message">
            <!-- start dashboard content div-->
            <noscript>
                <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
            </noscript>

            <div class="row mailbox-header">
                <!-- START MAIL BOX HEADER DIV-->

                <div class="col-md-2">

                    <a class="btn btn-success btn-block" href="?dashboard=user&page=message&tab=compose">Compose</a>

                </div>
                <div class="col-md-6">
                    <h2>
                        Compose

                    </h2>
                </div>

            </div>
            <!-- END MAIL BOX HEADER DIV-->
            <div class="col-md-2">
                <ul class="list-unstyled mailbox-nav">
                    <li>
                        <a href="Messages.aspx"><i class="fa fa-inbox"></i>Inbox<span class="badge badge-success pull-right">0</span></a>
                    </li>
                    <li>
                        <a href="SentMessages.aspx"><i class="fa fa-sign-out"></i>Sent</a>
                    </li>
                </ul>
            </div>
            <div class="col-md-10">
                <noscript>
                    <meta http-equiv="refresh" content="0;URL=http://pushnifty.com/mojoomla/extend/wordpress/hospital/wp-content/plugins/hospital-management/ShowErrorPage.php">
                </noscript>
                <script type="text/javascript">

                    $(document).ready(function() {
                        $('#message_form').validationEngine({ promptPosition: "bottomRight", maxErrorsPerField: 1 });
                    });
                </script>
                <div class="mailbox-content">
                    <!-- START MAIL BOX CONTENT DIV -->
                    <h2></h2>
                    <form name="message_form" action="" method="post" class="form-horizontal" id="message_form">
                        <!-- START MESSAGE FORM -->
                        <input type="hidden" name="action" value="insert">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="to">Message To<span class="require-field">*</span></label>
                            <div class="col-sm-8">

                                <select name="receiver" class="form-control validate[required] text-input" id="to">
                                    <option value="patient">All Patient</option>
                                    <option value="doctor">All Doctor</option>
                                    <option value="nurse">All Nurse</option>
                                    <option value="receptionist">All Support Staff</option>
                                    <option value="pharmacist">All Pharmacist</option>
                                    <option value="laboratorist">All Laboratory Staff</option>
                                    <option value="accountant">All Accountant</option>
                                    <optgroup label="patient" style="text-transform: capitalize;">
                                    <option value="35">Nina Cadela</option>
                                    <option value="57">R R</option>
                                    <option value="104">rer e</option>
                                    <option value="54">aaaa aaa</option>
                                    <option value="70">aaannnnn bbb</option>
                                    <option value="59">Abhijit Borgohain</option>
                                    <option value="64">Apj Kalam</option>
                                    <option value="97">ashok kumar</option>
                                    <option value="96">ashok kumar</option>
                                    <option value="4">Ashish Ranjan</option>
                                    <option value="48">Amel Ali</option>
                                    <option value="109">Andile Zulu</option>
                                    <option value="7">Anna Sanz</option>
                                    <option value="63">Treatment Range</option>
                                    <option value="95">Adi Nugroho</option>
                                    <option value="50">gab girbaci</option>
                                    <option value="47">Kristopher Davis</option>
                                    <option value="77">claudiu ciubotaru</option>
                                    <option value="88">NiftecsPOS Ombachi</option>
                                    <option value="110">David Urrego</option>
                                    <option value="31">akshay sarwade</option>
                                    <option value="34">prayag bhaler</option>
                                    <option value="90">damien schuling</option>
                                    <option value="83">Favour Isoah</option>
                                    <option value="100">fdsfdsf dsfsdfsdf</option>
                                    <option value="86">abc def</option>
                                    <option value="42">Joshua Altio</option>
                                    <option value="41">Joshua Altio</option>
                                    <option value="101">Haris Abbas</option>
                                    <option value="43">hendra wijaya</option>
                                    <option value="89">matthew kargbo</option>
                                    <option value="74">jong test</option>
                                    <option value="106">Igor Negromonte</option>
                                    <option value="105">Emran Imran</option>
                                    <option value="107">ahmed ahmed</option>
                                    <option value="81">Ilyas Awan</option>
                                    <option value="92">Eugene Ciervo</option>
                                    <option value="55">pooja chaudhery</option>
                                    <option value="62">uu ui</option>
                                    <option value="39">king hytrd</option>
                                    <option value="87">kkk k</option>
                                    <option value="73">Kartik Bhatt</option>
                                    <option value="99">kumar singh</option>
                                    <option value="98">mark masai manu</option>
                                    <option value="82">Johnson Landzro</option>
                                    <option value="8">Lucas M</option>
                                    <option value="49">Ahmed Ahme</option>
                                    <option value="65">testq proba</option>
                                    <option value="6">Mario Rossi</option>
                                    <option value="69">John Owner</option>
                                    <option value="103">maxmuts muutus</option>
                                    <option value="51">test test</option>
                                    <option value="91">Mustufa Aghadi</option>
                                    <option value="32">prayag bhaler</option>
                                    <option value="85">Onder Gulec</option>
                                    <option value="84">ttttt tt</option>
                                    <option value="5">John Mark</option>
                                    <option value="3">Jose Figueroa</option>
                                    <option value="60">patient p</option>
                                    <option value="61">patiente p</option>
                                    <option value="68">test SINHA</option>
                                    <option value="94">sddsa dassss</option>
                                    <option value="108">Renan Remi</option>
                                    <option value="58">Nico Alderson</option>
                                    <option value="53">abc PANDIT</option>
                                    <option value="29">muhammed shameem</option>
                                    <option value="46">Carlos Roberto Carlos Roberto</option>
                                    <option value="66">mohammad khan</option>
                                    <option value="79">juan juanxin</option>
                                    <option value="37">stan Ngaguthii</option>
                                    <option value="75">tan me</option>
                                    <option value="44">Test Test</option>
                                    <option value="45">Test Test</option>
                                    <option value="71">testaaa testaaa</option>
                                    <option value="52">Moses Peter</option>
                                    <option value="72">Abd ASb</option>
                                    <option value="76">TJ med</option>
                                    <option value="102">tiny tim</option>
                                    <option value="40">Tony Stark</option>
                                    <option value="56">Ulisses Silva</option>
                                    <option value="38">AS as</option>
                                    <option value="67">Everton Muta</option>
                                    <option value="80">Vishal Singh</option>
                                    <option value="27">Vivekanand Adkatalwar</option>
                                    <option value="93">Le Thanh</option>
                                    <option value="78">Zeeshan Asghar</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="subject">Subject<span class="require-field">*</span></label>
                            <div class="col-sm-8">
                                <input id="subject" class="form-control validate[required,custom[popup_category_validation]] text-input" maxlength="50" type="text" name="subject">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="subject">Message Comment<span class="require-field">*</span></label>
                            <div class="col-sm-8">
                                <textarea name="message_body" id="message_body" maxlength="150" class="form-control validate[required,custom[address_description_validation]] text-input"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label " for="enable">Send SMS</label>
                            <div class="col-sm-8">
                                <div class="checkbox">
                                    <label>
                                        <input id="chk_sms_sent" type="checkbox" value="1" name="hmgt_sms_service_enable">
                                    </label>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" id="_wpnonce" name="_wpnonce" value="67322bb8c5"/><input type="hidden" name="_wp_http_referer" value="/mojoomla/extend/wordpress/hospital/?dashboard=user&amp;page=message&amp;tab=compose"/>
                        <div id="hmsg_message_sent" class="hmsg_message_none">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="sms_template">SMS Text<span class="require-field">*</span></label>
                                <div class="col-sm-8">
                                    <textarea name="sms_template" class="form-control validate[required,custom[address_description_validation]]" maxlength="160"></textarea>
                                    <label>Max. 160 Character</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-10">
                                <div class="pull-right">
                                    <input type="submit" value="Send Message" name="save_message" class="btn btn-success"/>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- END MESSAGE FORM -->
                </div>
                <!-- START MAIL BOX CONTENT DIV -->
            </div>

        </div>
    </div>

</asp:Content>