<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportRacingCreation.ascx.cs" Inherits="AdminPanel_AdminUserControl_SportRacingCreation" %>
<%@ Register Assembly="PersianDatePickup" Namespace="PersianDatePickup" TagPrefix="pcal" %>
<link href="../AdminStyls/Modal/dark-hive/jquery-ui-1.8.5.custom.css" rel="stylesheet" type="text/css" />  
<style type="text/css">
    .cell{text-align: center;padding-left: 10px;}
    .newLine{clear: both;background-color: White;}
    .lblInfo{color: Lime;font-weight: bold;text-decoration: underline;padding: 0 10px;}
</style>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div id="racing">
    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <fieldset>
                <legend>ایجاد مسابقه جدید</legend>
                <asp:Panel ID="pnl_RacingInfo" runat="server">
                    <table cellspacing="1">
                        <tr style="width:100%">
                            <td>
                                <label class="field_desc">عنوان مسابقه:</label>
                                <asp:DropDownList ID="ddl_RacingTitle" CssClass="txtPickup inputControl" Width="180px" runat="server"></asp:DropDownList><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddl_RacingTitle"
                                    ErrorMessage="*" ForeColor="Yellow" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <label class="field_desc">جزئیات مسابقه:</label>
                                <asp:TextBox ID="txt_RacingDetails" runat="server" Width="200px" CssClass="customTxt inputControl"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_Details" runat="server" ControlToValidate="txt_RacingDetails"
                                    ErrorMessage="*" ForeColor="Yellow" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <label class="field_desc">نام کشور:</label>
                                <asp:DropDownList ID="ddl_RacingCountry" Width="190px" CssClass="txtPickup inputControl" runat="server"></asp:DropDownList><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddl_RacingCountry"
                                    ErrorMessage="*" ForeColor="Yellow" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr><td colspan="3" class="newLine"><hr /></td></tr>
                        <tr>
                            <td class="cell" style="width:30%">                                 
                                <fieldset>
                                    <legend>تاریخ شروع و پایان بازیهای یک مسابقه</legend>
                                    <div style="width:150px;height:120px; float:right; text-align: right">
                                        <table>
                                            <tr>
                                                <td>
                                                    <label class="field_desc">تاریخ شروع:</label>
                                                    <pcal:PersianDatePickup ID="pdp_RacingStartDate" runat="server" CssClass="txtPickup"
                                                        ReadOnly="True"></pcal:PersianDatePickup>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="pdp_RacingStartDate" runat="server" 
                                                        ErrorMessage="*" ForeColor="Yellow">
                                                    </asp:RequiredFieldValidator>  
                                                </td>                                                    
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="field_desc">تاریخ پایان:</label>
                                                    <pcal:PersianDatePickup ID="pdp_RacingEndDate" runat="server" CssClass="txtPickup"
                                                        ReadOnly="True">
                                                    </pcal:PersianDatePickup>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="pdp_RacingEndDate" runat="server" 
                                                        ErrorMessage="*" ForeColor="Yellow">
                                                    </asp:RequiredFieldValidator>                                                        
                                                </td>
                                            </tr>
                                        </table>
                                    </div>    
                                </fieldset>
                            </td>
                            <td class="cell" style="width:30%">                                 
                                <fieldset>
                                    <legend> شروع و پایان مهلت پیش بینی مسابقه</legend>
                                    <div style="width:220px;height:120px; float:right; text-align: right">
                                        <table>
                                            <tr>
                                                <td>
                                                    <label class="field_desc">تاریخ شروع مهلت:</label>
                                                    <pcal:PersianDatePickup ID="pdp_StartRespiteDate" runat="server" CssClass="txtPickup" ReadOnly="True"></pcal:PersianDatePickup>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="pdp_RacingStartDate" runat="server" 
                                                        ErrorMessage="*" ForeColor="Yellow">
                                                    </asp:RequiredFieldValidator>                                                    
                                                </td>
                                                <td style="text-align: center">
                                                    <span class="field_desc">ساعت شروع مهلت:</span><br />
                                                    <asp:TextBox ID="txt_StartRespiteTime" CssClass="txtTime" runat="server" Width="45px"></asp:TextBox>
                                                    <Ajax:MaskedEditExtender ID="MaskedEditExtender2" runat="server" Enabled="True"
                                                        Mask="99:99" MaskType="Time" TargetControlID="txt_StartRespiteTime" ClearTextOnInvalid="True" AcceptAMPM="False">
                                                    </Ajax:MaskedEditExtender>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="txt_StartRespiteTime" runat="server" 
                                                        ErrorMessage="*" ForeColor="Yellow">
                                                    </asp:RequiredFieldValidator> 
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="field_desc">تاریخ پایان مهلت:</label>
                                                    <pcal:PersianDatePickup ID="pdp_EndRespiteDate" runat="server" CssClass="txtPickup" ReadOnly="True"></pcal:PersianDatePickup>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="pdp_RacingEndDate" runat="server" 
                                                        ErrorMessage="*" ForeColor="Yellow">
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                                <td style="text-align: center">
                                                    <span class="field_desc">ساعت پایان مهلت:</span><br />
                                                    <asp:TextBox ID="txt_EndRespiteTime" CssClass="txtTime" runat="server" Width="45px"></asp:TextBox>
                                                    <Ajax:MaskedEditExtender ID="MaskedEditExtender3" runat="server" Enabled="True"
                                                        Mask="99:99" MaskType="Time" TargetControlID="txt_EndRespiteTime">
                                                    </Ajax:MaskedEditExtender>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="txt_EndRespiteTime" runat="server" 
                                                        ErrorMessage="*" ForeColor="Yellow">
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>   
                                </fieldset>
                            </td>  
                            <td style="width: 30%;" class="cell">
                                <fieldset>
                                    <legend>وضعیت فعال بودن مسابقه</legend>
                                    <div style="height:120px; float:right; text-align: right">
                                        <label class="field_desc">وضعیت:</label>
                                        <asp:DropDownList ID="ddl_RacingStatus" CssClass="txtPickup" runat="server">
                                            <asp:ListItem Value="1">فعال</asp:ListItem><asp:ListItem Value="0">غیرفعال</asp:ListItem>
                                        </asp:DropDownList>
                                    </div> 
                                </fieldset>
                            </td>                                                     
                        </tr>
                    </table>                    
                </asp:Panel>
                <br /><div class="newLine"><hr /></div><br />
                <asp:Panel ID="pnl_RacingGames" runat="server">
                    <table>
                        <tr>
                            <td class="cell" style="width:30%;">
                                <fieldset style="height:100px;">
                                    <legend>انتخاب تیم میهمان و میزبان</legend>   
                                    <div style="text-align: center;">
                                        <asp:HiddenField ID="hdn_EqualTeam" runat="server" />
                                        <label class="field_desc">تیم میزبان: </label>&nbsp;
                                        <asp:DropDownList ID="ddl_HostSelect" CssClass="txtPickup ddlTeam" Width="156px" runat="server"></asp:DropDownList>
                                        <asp:HiddenField ID="hdn_HostSelect" runat="server" />
                                    </div>
                                    <div style="text-align: center;">
                                        <label class="field_desc">تیم میهمان: </label>
                                        <asp:DropDownList ID="ddl_GuestSelect" CssClass="txtPickup ddlTeam" Width="156px" runat="server"></asp:DropDownList>
                                        <asp:HiddenField ID="hdn_GuestSelect" runat="server" />
                                    </div>
                                </fieldset>
                            </td>
                            <td class="cell" style="width:30%;">
                                <fieldset style="height:100px;">
                                    <legend>تعیین تاریخ و زمان بازی</legend>
                                    <table>
                                        <tr>
                                            <td style="padding-left:20px">
                                                <label class="field_desc">تاربخ بازی:</label>
                                                <pcal:PersianDatePickup ID="pdp_GameDateSelect" runat="server" CssClass="txtPickup" ReadOnly="True"></pcal:PersianDatePickup>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="pdp_GameDateSelect" runat="server" ErrorMessage="*" ForeColor="Yellow"></asp:RequiredFieldValidator>
                                            </td>
                                            <td style="text-align: right">
                                                <label class="field_desc">ساعت بازی :</label><br />
                                                <asp:TextBox ID="txt_GameTimeSelect" CssClass="txtTime" runat="server" Width="45px"></asp:TextBox>
                                                <Ajax:MaskedEditExtender ID="MaskedEditExtender1" runat="server" Enabled="True"
                                                    Mask="99:99" MaskType="Time" TargetControlID="txt_GameTimeSelect">
                                                </Ajax:MaskedEditExtender>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txt_GameTimeSelect" runat="server" ErrorMessage="*" ForeColor="Yellow"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </td>
                            <td class="cell" style="width:30%;">
                                <fieldset style="height:100px;">
                                    <legend>تعیین محل بازی</legend>   
                                    <div style="text-align: center;">
                                        <label class="field_desc">محل بازی: </label>
                                        <asp:TextBox ID="txt_GameLocationSelect" Text="" CssClass="customTxt" Width="200px" runat="server" />
                                    </div>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <div class="no_margin_bottom">
                                    <asp:LinkButton ID="btn_AddNewGame" runat="server" ForeColor="#ffcc00" Font-Bold="true" Font-Size="20px" Font-Underline="true"
                                        Text="افزودن به لیست" OnClientClick="onAddNewGame();" OnClick="btn_AddNewGame_Click"></asp:LinkButton>                                
                                    <br />
                                    <br />
<%--                                    <asp:CustomValidator ID="ValidateGame" ClientValidationFunction="CheckItems" runat="server" EnableViewState="false" 
                                    ErrorMessage="شما نمی توانید تیم میزبان و میهمان را یکسان انتخاب نمائید" SetFocusOnError="true">
                                    </asp:CustomValidator>--%>
                                    <asp:Label ID="lbl_Msg" CssClass="error" runat="server"></asp:Label>
                                </div>  
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>
                                <asp:GridView ID="gv_RacingGames" ShowHeader="true" ShowFooter="true" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true"
                                    runat="server" GridLines="None" CssClass="GridViewStyle" HeaderStyle-CssClass="HeaderStyle" PagerStyle-CssClass="PagerStyle">
                                    <%--<HeaderStyle ForeColor="#ffcc00" BackColor="#161616" VerticalAlign="Middle" HorizontalAlign="Center" BorderColor="#333333" BorderStyle="Solid" BorderWidth="1" />--%>
                                    <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="RowStyle"/>
                                    <Columns>                                    
                                        <asp:BoundField DataField="RowNumber" HeaderText="ردیف">
                                            <ItemStyle Width="5%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="HostTeam" HeaderText="تیم میزبان">
                                            <ItemStyle Width="20%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="GuestTeam" HeaderText="تیم میهمان">
                                            <ItemStyle Width="20%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="GameDate" HeaderText="تاریخ بازی">
                                            <ItemStyle Width="20%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="GameTime" HeaderText="ساعت بازی">
                                            <ItemStyle Width="15%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="GameLocation" HeaderText="محل بازی">
                                            <ItemStyle Width="20%" />
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemStyle Width="10%" ForeColor="#ffcc00"></ItemStyle>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lb_DelRow" runat="server" OnClick="lb_DelRow_Click" OnClientClick="setBlock('main')"
                                                    CausesValidation="false" Font-Underline="true" ForeColor="#ffcc00">حذف</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <caption>
                            <hr />
                            <tr>
                                <td>
                                    <div class="no_margin_bottom">                                        
                                        <input id="inpHide" type="hidden" runat="server" />   
                                        <asp:Button ID="btn_SaveRacingGames" runat="server" CssClass="submit" 
                                            onclick="btn_SaveRacingGames_Click" OnClientClick="ConfirmIt();setBlock('main');disableControls();" 
                                            Text="ثبت اطلاعات مسابقه" Visible="false"/>
                                        <asp:Button ID="btn_NewRacing" CssClass="mySubmit" Text="جدید" runat="server" 
                                            CausesValidation="False" onclick="btn_NewRacing_Click" UseSubmitBehavior="False" Width="81px" />  
                                        <input type="button" id="btn_Exit" class="mySubmit" value="بازگشت" onclick="javascript:window.location.href='AdminHome.aspx'" />                                        
                                    </div>
                                </td>
                            </tr>
                        </caption>
                    </table>
                </asp:Panel>
            </fieldset>
            <div id="divConfirm" aria-labelledby="ui-dialog-title-dialog-form" role="dialog"
                    tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
                    style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: auto;
                    width: 800px; top: 82px; left: 460px;">
                    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
                        <span id="ui-dialog-title-dialog-form" class="ui-dialog-title">پيام</span><a role="button"
                            class="ui-dialog-titlebar-close ui-corner-all" href="#"><span class="ui-icon ui-icon-closethick">بستن</span></a></div>
                    <div style="width: auto; min-height: 0px; height: auto" class="ui-dialog-content ui-widget-content" id="dialog-form">
                        <form id="frm_Confirm">
                            <fieldset>
                                <asp:HiddenField ID="hdn_RacingInfoID" runat="server" />
                                <asp:HiddenField ID="hdn_RaceTitle" runat="server" />
                                <span>مسابقه </span><span id="lbl_RaceTitle" class="lblInfo" runat="server">................</span>
                                <br /><br /><span> با کد </span>
                                <span id="lbl_RacingInfo_ID" class="lblInfo" runat="server">..................</span>
<%--                                <br /><br /><span> در ساعت </span>
                                <span id="lbl_Time" class="lblInfo" runat="server">.........</span>--%>
                                <br /><br /><span> در مورخه </span><span id="lbl_Date" class="lblInfo" runat="server">..................</span>
                                <span> تعريف و با موفقيت ثبت گرديد.</span>
                                <br /><br />
                                <hr />
                                <input type="button" value="چاپ تاييديه" class="submit" onclick="CallPrint('dialog-form', 'Black', 'White')"/>
                                <input type="button" value="بازگشت" class="submit" />
                            </fieldset>
                        </form>
                    </div>
                    <div class="ui-resizable-handle ui-resizable-n"></div><div class="ui-resizable-handle ui-resizable-e"></div><div class="ui-resizable-handle ui-resizable-s"></div><div class="ui-resizable-handle ui-resizable-w"></div><div style="z-index: 1001;" class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se"></div><div style="z-index: 1002;" class="ui-resizable-handle ui-resizable-sw"></div><div style="z-index: 1003;" class="ui-resizable-handle ui-resizable-ne"></div><div style="z-index: 1004;" class="ui-resizable-handle ui-resizable-nw"></div><div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix"></div>
                </div>                 
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btn_SaveRacingGames" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</div>   
<script type="text/javascript">
    function getImagePath() { return '<%= ImagePath %>'; } var imagePath = getImagePath();
    
    function ConfirmIt()
    {
        var x = confirm("آیا با ثبت اطلاعات مسابقه موافقید?");
        //var control = '<%=inpHide.ClientID%>';
        if (x == true)
        {
            //document.getElementById(control).value = "1";
            $("input:hidden[id$=inpHide]").val("1");
        }
        else
        {
            // document.getElementById(control).value = "0";
            $("input:hidden[id$=inpHide]").val("0");
        }
    }
//    function confirmForSave()
//    {
//        $('span[id$=lbl_RacingInfo_ID]').html($('input:hidden[id$=hdn_RacingInfoID]').val());
//        $('span[id$=lbl_RaceTitle]').html($('input:hidden[id$=hdn_RaceTitle]').val());
//        alert($('span[id$=lbl_RaceTitle]').html());
//         $.unblockUI(); $('#dialog-form').dialog('open');
////        sSave = window.confirm("You have some changes that have not been saved. Click OK to save now or CANCEL to continue without saving.");
////        if (sSave)
////            return true;
////        return false;        
//    }
    function setBlock()
    {
        $.blockUI(
                {  //'<img src="<=ResolveUrl("~") %>/ajaxImages/loading2.gif" />'
                    message: '<h1><img src="' + imagePath + '/ajaxImages/loading2.gif" /><br /> چند لحظه منتظر بمانيد...</h1>',
                    fadeIn: 700,
                    fadeOut: 700,
                    css: {
                        border: 'none',
                        padding: '5px',
                        backgroundColor: 'transparent',
                        '-webkit-border-radius': '10px',
                        '-moz-border-radius': '10px',
                        opacity: .6,
                        color: '#fff'
                    }
                });
    }
    $(document).ready(function ()
    {
        var pbControl = null;
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_beginRequest(function (sender, args)
        {
            pbControl = args.get_postBackElement();  //the control causing the postback
            pbControl.disabled = true;
            setBlock();
        });
        prm.add_endRequest(function (sender, args)
        {
            pbControl.disabled = false;
            pbControl = null;
            $.unblockUI();
        });
        getTeams();
        $('#<%= ddl_RacingCountry.ClientID %>').change(function ()
        {
            getTeams();
        });
    });
    function getTeams()
    {
        var countryID = $('#<%= ddl_RacingCountry.ClientID %>').val();
        $.ajax({
            type: "POST",
            url: "SportRacingCreation.aspx/GetTeamsByCountryID",
            data: "{countryID: '" + countryID + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response)
            {
                setBlock();
                var teams = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;

                $('.ddlTeam').attr("disabled", false);
                $(".ddlTeam > option").remove();
                for (var i = 0; i < teams.length; i++)
                {
                    var val = teams[i].TeamID;
                    var text = teams[i].TeamName;
                    //if (($('.ddlTeam').selectedIndex) == 0)
                    $('.ddlTeam').append("<option value ='" + val + "'>" + text + "</option>");
                    // $("#dropListBuilding")[0].options.add(new Option("My Text", "My Value"))
                }
                $.unblockUI();
            },
            error: function (xhr, status, error)
            {
                $.unblockUI();
                // Boil the ASP.NET AJAX error down to JSON.
                var err = eval("(" + xhr.responseText + ")");

                // Display the specific error raised by the server (e.g. not a
                //   valid value for Int32, or attempted to divide by zero).
                alert("وقوع خطا" + err.Message);
            }
        });
    }
    function disableControls()
    {
        $('#<%= ddl_RacingTitle.ClientID %>').attr('disabled', true);
        $('#<%= txt_RacingDetails.ClientID %>').attr('disabled', true);
        $('#<%= ddl_RacingCountry.ClientID %>').attr('disabled', true);
        $('#<%= pdp_RacingStartDate.ClientID %>').attr('disabled', true);
        $('#<%= pdp_RacingEndDate.ClientID %>').attr('disabled', true);
        $('#<%= pdp_StartRespiteDate.ClientID %>').attr('disabled', true);
        $('#<%= pdp_EndRespiteDate.ClientID %>').attr('disabled', true);
        $('#<%= txt_StartRespiteTime.ClientID %>').attr('disabled', true);
        $('#<%= txt_EndRespiteTime.ClientID %>').attr('disabled', true);
    }
    function onAddNewGame()
    {
        var hostSelect = $('select[id$=ddl_HostSelect] option:selected').text();
        var GuestSelect = $('select[id$=ddl_GuestSelect] option:selected').text();
        //        alert(hostSelect + " = " + GuestSelect);

        if (hostSelect == GuestSelect)
        {
            //alert("شما نمی توانید تیم میهمان و میزبان را یکسان انتخاب نمائید.");
            //return true;
            $('input:hidden[id$=hdn_EqualTeam]').val('مساوی');
        }
        else
        {
            $('input:hidden[id$=hdn_EqualTeam]').val('نامساوی');
        }
        //        if $('input:text[id$=pdp_GameDateSelect]').val
        //setBlock('main');
        $('input[type=hidden][id$=hdn_HostSelect]').val(hostSelect);
        $('input[type=hidden][id$=hdn_GuestSelect]').val(GuestSelect);
        //        alert($('input:hidden[id$=hdn_EqualTeam]').val());
    }

    //    function CheckItems(sender, args)
    //    {
    //        var hostSelect = $('select[id$=ddl_HostSelect] option:selected').text();
    //        var GuestSelect = $('select[id$=ddl_GuestSelect] option:selected').text();

    //        var flag = true;
    //        if (hostSelect == GuestSelect)
    //        {
    //            flag = false;
    //            return;
    //        }
    //        args.IsValid = flag;
    //    }

    function pageLoad(sender, args)
    {
        if (args.get_isPartialLoad())
        {
           getTeams();
        }
    }
</script>