<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportRacing.ascx.cs" Inherits="UserControl_SportRacing" EnableViewState="false" %>
<link href="../Styles/CSSSportRacing.css" rel="stylesheet" type="text/css" />
<link href="../Styles/trontastic/jquery-ui-1.8.8.custom.css" rel="stylesheet" type="text/css" />
<div id="racing">
    <table class="racing_Table">
        <tr>
            <td colspan="2" class="formCount"><span style="color:White">دفعات پرشدن این فرم توسط کاربر : </span><span id="formCount" runat="server" style="color:Lime">0</span></td>            
            <td colspan="2" class="racing_Titr"><span style="color:White">عنوان مسابقه : </span><span ID="lbl_RaceTitle" runat="server">....</span></td>
        </tr>
        <tr>
            <td style="width: 93px" class="racing_Cell"><asp:Label ID="Label1" runat="server" Text="شماره مسابقه"></asp:Label></td>
            <td style="width: 159px" class="racing_Cell"><asp:Label ID="Label2" runat="server" Text="هفته"></asp:Label></td>
            <td style="width: 216px" class="racing_Cell"><asp:Label ID="Label3" runat="server" Text="تاریخ شروع و پایان بازیها"></asp:Label></td>
            <td class="racing_Cell"><asp:Label ID="Label4" runat="server" Text="پایان مهلت شرکت در مسابقه"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 93px" class="racing_Cell2"><asp:Label ID="lbl_RacingInfoID" runat="server" Text=""></asp:Label></td>
            <td style="width: 159px" class="racing_Cell2"><asp:Label ID="lbl_RacingDetails" runat="server" Text=""></asp:Label></td>
            <td style="width: 216px" class="racing_Cell2"><asp:Label ID="lbl_RacingStartEndDate" runat="server" Text=""></asp:Label></td>
            <td class="racing_Cell2"><asp:Label ID="lbl_RacingRespite" runat="server" Text="Label"></asp:Label></td>
        </tr>
    </table>
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:GridView ID="gv_Racing" AutoGenerateColumns="False" runat="server" CssClass="racing_Grid"
                CellPadding="4" ForeColor="#333333" GridLines="None" oncontextmenu="return false;">
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <AlternatingRowStyle BackColor="#E7EAF1" />
                <RowStyle BackColor="#EFF3FB" VerticalAlign="Middle" HorizontalAlign="Center" />
                <Columns>
                    <asp:TemplateField HeaderText="ردیف">
                        <ItemStyle Width="5%"/>
                        <HeaderStyle CssClass="header_Grid" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_GameID" runat="server" Text='<%# Eval("Racing_GameID", "{0}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="تیم میزبان">
                        <ItemStyle Width="15%" />
                        <HeaderStyle CssClass="header_Grid" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_HostTeamID" runat="server" Text='<%# Eval("Racing_HostTeamID", "{0}") %>'
                                Visible="false"></asp:Label>
                            <asp:Label ID="lbl_HostTeam" runat="server" Text='<%# Eval("HostTeam", "{0}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="برد میزبان">
                        <HeaderStyle CssClass="header_Grid" />
                        <ItemStyle Width="10%"/>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkHost" CssClass="chkSelect" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="مساوی">
                        <HeaderStyle CssClass="header_Grid" />
                        <ItemStyle Width="10%"/>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkHostGuest" CssClass="chkSelect" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="برد میهمان">
                        <HeaderStyle CssClass="header_Grid" />
                        <ItemStyle Width="10%"/>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkGuest" CssClass="chkSelect" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="تیم میهمان">
                        <HeaderStyle CssClass="header_Grid" />
                        <ItemStyle Width="15%"/>
                        <ItemTemplate>
                            <asp:Label ID="lbl_GuestTeamID" runat="server" Text='<%# Eval("Racing_GuestTeamID", "{0}") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lbl_GuestTeam" runat="server" Text='<%# Eval("GuestTeam", "{0}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderStyle CssClass="header_Grid" />
                        <ItemStyle ForeColor="Magenta" Font-Size="12px" Width="25%" />
                        <ItemTemplate><span id="lblError">...</span></ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div class="lblTotalCount">
                <span style="color: #d2d2d2">جمع مبلغ این جدول</span>
                <asp:Label ID="lbl_TotalCount" Style="color: #ffcc00; font-family: Arial; font-weight: bold; text-decoration: underline" runat="server" Text="0">
                </asp:Label>
                <span style="color: #d2d2d2">ریال است.</span>
                <asp:CustomValidator ClientValidationFunction="CheckItems" ID="ValidateIt" runat="server"
                    ErrorMessage="در هر ردیف می بایست حداقل یک انتخاب انجام گردد." ForeColor="Yellow"
                    EnableViewState="False" SetFocusOnError="True"></asp:CustomValidator>
            </div>            
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="divBtnForm">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <input id="inpHide" type="hidden" runat="server" /> 
                <asp:Button ID="btn_saveForm" runat="server" Text="ثبت فرم" CssClass="btnForm btn_saveForm" OnClick="btn_saveForm_Click" />
            </ContentTemplate>
            <Triggers><asp:AsyncPostBackTrigger ControlID="btn_saveForm" EventName="Click" /></Triggers>
        </asp:UpdatePanel>
    </div>
    <div class="divBtnForm2">        
        <asp:Button ID="btn_Exit" runat="server" Text="برگشت" CssClass="btnForm" 
            OnClick="btn_Exit_Click" CausesValidation="False" />
        <input type="button" id="btn_ClearForm" class="btnForm" value="خالی کردن فرم" />
    </div>
    <asp:HiddenField ID="MyHidden" runat="server" Value="0" />
</div>
<div aria-labelledby="ui-dialog-title-dialog-form" role="dialog" tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
    style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: 250px;
    width: 350px; top: 82px; left: 460px;">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
        <span id="ui-dialog-title-dialog-form" class="ui-dialog-title">شارژ حساب</span>
        <a role="button" class="ui-dialog-titlebar-close ui-corner-all" ><span class="ui-icon ui-icon-closethick">بستن</span></a>
    </div>
    <div style="width: auto; min-height: 0px; height: auto;" class="ui-dialog-content ui-widget-content"
        id="dialog-form">
        <form id="frm_RacingForm">
            <fieldset style="height: 250px;color:Window;font-family:Tahoma;line-height: 30px;padding: 10px;">
                <span style="color:#ffcc00; font-weight:bold;">فرم شما با موفقیت ثبت شد.</span><hr /><br />
                <span>در صورتی که موجودی حساب شما کافی نباشد جهت فعال سازی و شرکت دادن این فرم در مسابقه باید نسبت به شارژ حساب خود اقدام نمایید
                بدیهی است پس از شارژ حساب و تأیید مدیریت سایت، فرم شما به صورت خودکار فعال خواهد شد.</span>
                <br /><span style="color:lime">*تذکر : </span>
                <span>دقت فرمائید چنانچه چند فرم انتخابی و ذخیره شده دارید، حتماً با مراجعه به پروفایل کاربری آخرین ویرایش خود را تأیید نمائید در غیر اینصورت آخرین فرم انتخابی شما فعال می شود و اگر برای چند فرم حساب خود را شارژ نموده اید به ترتیب از آخرین فرم فعال میگردد.</span>
            </fieldset>
        </form>
    </div>
    <div class="ui-resizable-handle ui-resizable-n"></div><div class="ui-resizable-handle ui-resizable-e"></div><div class="ui-resizable-handle ui-resizable-s"></div><div class="ui-resizable-handle ui-resizable-w"></div><div style="z-index: 1001;" class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se"></div><div style="z-index: 1002;" class="ui-resizable-handle ui-resizable-sw"></div><div style="z-index: 1003;" class="ui-resizable-handle ui-resizable-ne"></div><div style="z-index: 1004;" class="ui-resizable-handle ui-resizable-nw"></div>
</div>
<script language="javascript" type="text/javascript">
    Number.prototype.formatMoney = function (c, d, t)
    {
        var n = this, c = isNaN(c = Math.abs(c)) ? 2 : c, d = d == undefined ? "," : d, t = t == undefined ? "." : t, s = n < 0 ? "-" : "", i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "", j = (j = i.length) > 3 ? j % 3 : 0;
        return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
    };
    function clearForm()
    {
        $('table[id$=gv_Racing]').find('input:checkbox').attr("checked", false);
        TotalCount = 0;
        $("span[id$=lbl_TotalCount]").html("0");
        $("span[id$=lblError]").html("...");
    }
    function ConfirmIt(){var x = confirm("آیا با ثبت اطلاعات فرم موافقید?");if (x == true){$("input:hidden[id$=inpHide]").val("1");}else{$("input:hidden[id$=inpHide]").val("0");}}
    $(document).ready(function ()
    {
        clearForm();
        $('table[id$=gv_Racing]').find('input:checkbox').click(function ()
        {
            $("span[id$=lblError]").html("...");
            if (this.checked){TotalCount += 5000;}else{TotalCount -= 5000;}
            var tr = $(this).closest('tr');
            var lblError = tr.find('span[id$=lblError]');
            $("span[id$=lbl_TotalCount]").html(TotalCount.formatMoney(0, '.', ','));
            $("input:hidden[id$=MyHidden]").val(TotalCount);

            if (tr.find('input:checkbox:checked').length == 3)
            {
                this.checked = false;TotalCount -= 5000;
                $("span[id$=lbl_TotalCount]").html(TotalCount.formatMoney(0, '.', ','));
                $("input:hidden[id$=MyHidden]").val(TotalCount);
                lblError.html('شما یک یا دو انتخاب بیشتر ندارید');
            }
            else{lblError.html("...");}
        });
        $("#btn_ClearForm").click(function (){clearForm();});
    });
</script>
<script type="text/javascript">
    function getImagePath() { return '<%= ImagePath %>'; } var imagePath = getImagePath();
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_beginRequest(BeginRequestHandler);
    prm.add_endRequest(EndRequestHandler);
    function BeginRequestHandler(sender, args) { setBlock(); }
    function EndRequestHandler(sender, args) { $.unblockUI(); }
    $(document).ready(function () { $("#dialog:ui-dialog").dialog("destroy"); $("#dialog-form").dialog({ autoOpen: false, height: 'auto', width: 600, modal: true, resizable: false, show: 'clip', hide: 'cut', title: 'شارژ حساب', buttons: { "شارژ حساب": function () { $(this).dialog("close"); window.location.href = "Sport_SettleIndex.aspx"; }, "بازگشت": function () { $(this).dialog("close"); window.location.href = "Sport_SelectRacing.aspx"; } } });  $('.btn_saveForm').bind('click', function () { $('.btn_saveForm').unbind('click'); }); });
    function CheckItems(sender, args)
    {
        var flag = true;
        $('#<%= gv_Racing.ClientID %> tr').each(function (index, item)
        {
            if ($(item).find('td').length > 0)
            {
                var num = $(item).find('input:checked').length;
                if (num == 0 || num == 3)
                {
                    //$(item).find('td:first').css("color", "Red");
                    $(item).css("color", "Red");
                    $(item).css("text-decoration", "underline");
                    flag = false;return;
                }
                else{$(item).css("color", "#000");$(item).css("text-decoration", "none");}
            } 
        }); args.IsValid = flag;
        if (flag) ConfirmIt();
    }
</script>