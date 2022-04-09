<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportRacingFormEdit.ascx.cs" Inherits="UserPanel_SportRacingFormEdit" %>
<link href="../Styles/CSSSportMaster.css" rel="stylesheet" type="text/css" />
<link href="../Styles/CSSSportRacing.css" rel="stylesheet" type="text/css" />
<link href="../Styles/trontastic/jquery-ui-1.8.8.custom.css" rel="stylesheet" type="text/css" />
<div id="racing">
    <table class="racing_Table">
        <tr>
            <td colspan="4" class="racing_Titr">
                <asp:Label ID="lbl_RaceTitle" runat="server" Text="لیگ ..."></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 93px" class="racing_Cell">
                <asp:Label ID="Label1" runat="server" Text="شماره مسابقه"></asp:Label>
            </td>
            <td style="width: 159px" class="racing_Cell">
                <asp:Label ID="Label2" runat="server" Text="هفته"></asp:Label>
            </td>
            <td style="width: 216px" class="racing_Cell">
                <asp:Label ID="Label3" runat="server" Text="تاریخ"></asp:Label>
            </td>
            <td class="racing_Cell">
                <asp:Label ID="Label4" runat="server" Text="مهلت شرکت در مسابقه"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 93px" class="racing_Cell2">
                <asp:Label ID="lbl_RacingInfoID" runat="server" Text="Label"></asp:Label>
            </td>
            <td style="width: 159px" class="racing_Cell2">
                <asp:Label ID="lbl_RacingDetails" runat="server" Text="Label"></asp:Label>
            </td>
            <td style="width: 216px" class="racing_Cell2">
                <asp:Label ID="lbl_RacingStartEndDate" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="racing_Cell2">
                <asp:Label ID="lbl_RacingRespite" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table> 
    <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="100000">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:GridView ID="gv_Racing" AutoGenerateColumns="False" runat="server" CssClass="racing_Grid"
                CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="ردیف">
                        <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <HeaderStyle CssClass="header_Grid" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_GameID" runat="server" Text='<%# Eval("FormInfo_GameID", "{0}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="تیم میزبان">
                        <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <HeaderStyle CssClass="header_Grid" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_HostTeamID" runat="server" Text='<%# Eval("FormInfo_HostTeamID", "{0}") %>'
                                Visible="false"></asp:Label>
                            <asp:Label ID="lbl_HostTeam" runat="server" Text='<%# Eval("HostTeam", "{0}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="برد میزبان">
                        <HeaderStyle CssClass="header_Grid" />
                        <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>                         
                            <asp:CheckBox ID="chkHost" CssClass="chkSelect" Checked='<%# Eval("FormInfo_IsHostWin") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>       
                    <asp:TemplateField HeaderText="مساوی">
                        <HeaderStyle CssClass="header_Grid" />
                        <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:CheckBox ID="chkHostGuest" CssClass="chkSelect" Checked='<%# Eval("FormInfo_IsEqualGame") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="برد میهمان">
                        <HeaderStyle CssClass="header_Grid" />
                        <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:CheckBox ID="chkGuest" CssClass="chkSelect" Checked='<%# Eval("FormInfo_IsGuestWin") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="تیم میهمان">
                        <HeaderStyle CssClass="header_Grid" />
                        <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_GuestTeamID" runat="server" Text='<%# Eval("FormInfo_GuestTeamID", "{0}") %>'
                                Visible="false"></asp:Label>
                            <asp:Label ID="lbl_GuestTeam" runat="server" Text='<%# Eval("GuestTeam", "{0}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderStyle CssClass="header_Grid" />
                        <ItemStyle ForeColor="Magenta" VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="12px"
                            Width="25%" />
                        <ItemTemplate>
                            <span id="lblError">...</span>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:GridView>
            <div class="lblTotalCount">
                <span style="color: #d2d2d2">جمع مبلغ این جدول</span>
                <asp:Label ID="lbl_TotalCount" Style="color: #ffcc00; font-family: Arial; font-weight: bold;
                    text-decoration: underline" runat="server" Text="0">
                </asp:Label>
                <span style="color: #d2d2d2">ریال است.</span>
                <asp:CustomValidator ClientValidationFunction="CheckItems" ID="ValidateIt" runat="server"
                    ErrorMessage="در هر ردیف می بایست حداقل یک انتخاب انجام گردد." ForeColor="Yellow"
                    EnableViewState="False" SetFocusOnError="True"></asp:CustomValidator>
            </div>
            <div class="chkFormActive"><asp:CheckBox ID="chk_FormActiveStatus" Text="این فرم فعال باشد" Checked="true" runat="server" /></div>
            <div class="divBtnForm">
                <input id="inpHide" type="hidden" runat="server" /> 
                <asp:Button ID="btn_saveForm" runat="server" Text="ثبت فرم" CssClass="btnForm btn_saveForm" onclick="btn_saveForm_Click" />
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btn_saveForm" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
    <div class="divBtnForm2">
        <asp:Button ID="btn_Exit" CssClass="btnForm" Text="برگشت" runat="server"  CausesValidation="false"
            onclick="btn_Exit_Click" />        
        <input type="button" id="btn_ClearForm" class="btnForm" value="خالی کردن فرم" />
    </div>
    <asp:HiddenField ID="MyHidden" runat="server" Value="0" />
</div>
<script language="javascript" type="text/javascript">
    function getImagePath() { return '<%= ImagePath %>'; }var imagePath = getImagePath();
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_beginRequest(BeginRequestHandler);
    prm.add_endRequest(EndRequestHandler);
    function BeginRequestHandler(sender, args) { setBlock(); }
    function EndRequestHandler(sender, args) { $.unblockUI(); }
    function pageLoad(sender, args)
    {
        TotalCount = $("span[id$=lbl_TotalCount]").html();
        TotalCount = Number.parseLocale(TotalCount);
        //  $("span[id$=lbl_TotalCount]").html("0");
        $("span[id$=lblError]").html("...");
        $('table[id$=gv_Racing]').find('input:checkbox').click(function ()
        {
            $("span[id$=lblError]").html("...");

            if (this.checked){TotalCount += 5000;}
            else{TotalCount -= 5000;}
            var tr = $(this).closest('tr');
            var lblError = tr.find('span[id$=lblError]');
            $("span[id$=lbl_TotalCount]").html(TotalCount); //.formatMoney(0, '.', ','));
            $("input:hidden[id$=MyHidden]").val(TotalCount);

            if (tr.find('input:checkbox:checked').length == 3)
            {
                this.checked = false;
                TotalCount -= 5000;
                $("span[id$=lbl_TotalCount]").html(TotalCount); //.formatMoney(0, '.', ','));
                $("input:hidden[id$=MyHidden]").val(TotalCount);
                lblError.html('شما یک یا دو انتخاب بیشتر ندارید');
            }
            else{lblError.html("...");}
            $("span[id$=lbl_TotalCount]").html();
        });
        $("#btn_ClearForm").click(function (){clearForm();});
    }
    function clearForm() { $('table[id$=gv_Racing]').find('input:checkbox').attr("checked", false); TotalCount = 0; $("span[id$=lbl_TotalCount]").html("0"); $("span[id$=lblError]").html("..."); }    
    function disableControl()
    {
        $('table[id$=gv_Racing]').attr('disabled', true);
        $('#<%= btn_saveForm.ClientID %>').attr('disabled', true);
        $('#btn_ClearForm').attr('disabled', true);
        $('#btn_Exit').attr('disabled', true);
    }
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
                    $(item).css("color", "Red"); $(item).css("text-decoration", "underline");flag = false;return;
                }
                else{ $(item).css("color", "#000"); $(item).css("text-decoration", "none"); }
            }
        });
        args.IsValid = flag;
    }
</script>