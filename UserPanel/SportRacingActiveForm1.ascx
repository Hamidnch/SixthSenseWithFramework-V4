<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportRacingActiveForm1.ascx.cs" Inherits="UserPanel_SportRacingActiveForm1" %>
<script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
<script src="../Scripts/jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>
<script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
<script src="../Scripts/PageMethod.js" type="text/javascript"></script>
<script src="../Scripts/PageMethod.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">
    function getImagePath()
    { return '<%= ImagePath %>'; }
    var imagePath = getImagePath();

    Number.prototype.formatMoney = function (c, d, t)
    {
        var n = this, c = isNaN(c = Math.abs(c)) ? 2 : c, d = d == undefined ? "," : d, t = t == undefined ? "." : t, s = n < 0 ? "-" : "", i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "", j = (j = i.length) > 3 ? j % 3 : 0;
        return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
    };
    function clearForm()
    {
        $('table[id$=gv_EditRacing]').find('input:checkbox').attr("checked", false);
        TotalCount = 0;
        $("span[id$=lbl_TotalCount]").html("0");
        $("span[id$=lblError]").html("...");
    }
    $(document).ready(function ()
    {
        clearForm();
        $('table[id$=gv_EditRacing]').find('input:checkbox').click(function ()
        {
            $("span[id$=lblError]").html("...");
            if (this.checked)
            {
                TotalCount += 5000;
            }
            else
            {
                TotalCount -= 5000;
            }
            var tr = $(this).closest('tr');
            var lblError = tr.find('span[id$=lblError]');
            $("span[id$=lbl_TotalCount]").html(TotalCount.formatMoney(0, '.', ','));
            $("input:hidden[id$=MyHidden]").val(TotalCount);

            if (tr.find('input:checkbox:checked').length == 3)
            {
                this.checked = false;
                TotalCount -= 5000;
                $("span[id$=lbl_TotalCount]").html(TotalCount.formatMoney(0, '.', ','));
                $("input:hidden[id$=MyHidden]").val(TotalCount);
                lblError.html('شما یک یا دو انتخاب بیشتر ندارید');
            }
            else
            {
                lblError.html("...");
            }
        });
        $("#btn_ClearForm").click(function ()
        {
            clearForm();
        });
    });

    function CheckItems(sender, args)
    {
        var flag = true;
        $('#<%= gv_EditRacing.ClientID %> tr').each(function (index, item)
        {
            if ($(item).find('td').length > 0)
            {
                var num = $(item).find('input:checked').length;
                if (num == 0 || num == 3)
                {
                    flag = false;
                    return;
                }
            }
        });
        args.IsValid = flag;
    }

    function expandcollapse(obj, row)
    {
        var div = document.getElementById(obj);
        var img = document.getElementById('img' + obj);

        if (div.style.display == "none")
        {
            div.style.display = "block";
            if (row == 'alt')
            {
                img.src = imagePath + "/ajaxImages/minus.gif";
            }
            else
            {
                img.src = imagePath + "/ajaxImages/minus.gif";
            }
            //img.alt = "Close to view other Customers";
        }
        else
        {
            div.style.display = "none";
            if (row == 'alt')
            {
                img.src = imagePath + "/ajaxImages/plus.gif";
            }
            else
            {
                img.src = imagePath + "/ajaxImages/plus.gif";
            }
            //img.alt = "Expand to show Orders";
        }
    }
</script>

<div id="activeForms" style="color: #FFFFFF; border: thin solid #5d5852; font-family: Tahoma;
    font-size: 12px; background-color: #333333; margin: 5px 5px; outline: 0; -moz-border-radius: 5px;
    direction: rtl; -webkit-border-radius: 5px">
<%--    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:GridView ID="gv_ActiveForms" runat="server" CellPadding="4" ForeColor="#333333"
                GridLines="None" AutoGenerateColumns="false" PageSize="5" HorizontalAlign="Center"
                DataKeyNames="RacingInfo_ID" UseAccessibleHeader="false"
                OnRowDataBound="gv_ActiveForms_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="ردیف">
                        <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_RowNumber" runat="server" Text='<%# Container.DataItemIndex + 1%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="کد مسابقه">
                        <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_racingInfoID" runat="server" Text='<%# Eval("RacingInfo_ID", "{0}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="شماره فرم">
                        <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_FormID" runat="server" Text='<%# Eval("Form_ID", "{0}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="عنوان مسابقه">
                        <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_raceTitle" runat="server" Text='<%# Eval("Race_Title", "{0}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="جزئیات">
                        <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_raceDetail" runat="server" Text='<%# Eval("RacingInfo_Details", "{0}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="تاریخ ایجاد فرم">
                        <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_FormCreationDate" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("Form_CreationDate","{0}"), "L", false) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="مهلت مسابقه">
                        <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("RacingInfo_RespiteDate","{0}"), "L", false) %>'>
                            </asp:Label>&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label1" CssClass="activeRacingSubItem" runat="server" Text='<%# Eval("RacingInfo_RespiteTime", "{0}") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ویرایش " HeaderStyle-Font-Size="8pt" HeaderStyle-Font-Bold="false"
                        HeaderStyle-Font-Names="Tahoma">
                        <ItemTemplate>
                            <a href="javascript:expandcollapse('div<%# Eval("RacingInfo_ID") %>','one');">
                                <img id="imgdiv<%# Eval("RacingInfo_ID") %>" alt="ویرایش فرم"
                                    width="32px" border="0" src="../Images/ajaxImages/plus.gif" />
                            </a>
                        </ItemTemplate>
                        <HeaderStyle Font-Bold="False" Font-Names="Tahoma" Font-Size="8pt" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <tr>
                                <td colspan="100%">
                                    <div id="div<%# Eval("RacingInfo_ID") %>" style="display: none" class="divRacingGrid">
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:GridView ID="gv_EditRacing" AutoGenerateColumns="False" runat="server" CssClass="racing_Grid"
                                                    CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="Racing_RacingInfoID">
<%--                                                    OnRowEditing="gv_EditRacing_RowEditing"--%>
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="ردیف">
                                                            <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                            <HeaderStyle CssClass="header_Grid" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_GameID" runat="server" Text='<%# Eval("Racing_GameID", "{0}") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="تیم میزبان">
                                                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                            <HeaderStyle CssClass="header_Grid" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_HostTeamID" runat="server" Text='<%# Eval("Racing_HostTeamID", "{0}") %>'
                                                                    Visible="false"></asp:Label>
                                                                <asp:Label ID="lbl_HostTeam" runat="server" Text='<%# Eval("HostTeam", "{0}") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="برد میزبان">
                                                            <HeaderStyle CssClass="header_Grid" />
                                                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkHost" Checked='<%# Eval("FormInfo_IsHostWin") %>' CssClass="chkSelect"
                                                                    runat="server" />
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
<%--                                                            <EditItemTemplate>
                                                                <asp:CheckBox ID="chkGuest" CssClass="chkSelect" runat="server" />
                                                            </EditItemTemplate>--%>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="تیم میهمان">
                                                            <HeaderStyle CssClass="header_Grid" />
                                                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_GuestTeamID" runat="server" Text='<%# Eval("Racing_GuestTeamID", "{0}") %>'
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
                                                        <%--<asp:CommandField ShowEditButton="true" EditText="ویرایش" CancelText="لغو" UpdateText="ثبت" />--%>
                                                    </Columns>
                                                    <EditRowStyle BackColor="#2461BF" />
                                                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                    <RowStyle BackColor="#EFF3FB" />
                                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                                </asp:GridView>
                                                <div class="lblTotalCount">
                                                    <span style="color: #d2d2d2">جمع مبلغ این جدول</span>
                                                    <asp:Label ID="lbl_TotalCount" Style="color: #ffcc00; font-family: Arial; font-weight: bold;
                                                        text-decoration: underline" runat="server" Text="0">
                                                    </asp:Label>
                                                    <%--                <input type="hidden" name="htotal" id="htotal" runat="server" />--%>
                                                    <span style="color: #d2d2d2">ریال است.</span>
                                                    <asp:CustomValidator ClientValidationFunction="CheckItems" ID="ValidateIt" runat="server"
                                                        ErrorMessage="در هر ردیف می بایست حداقل یک انتخاب انجام گردد." ForeColor="Yellow"
                                                        EnableViewState="False" SetFocusOnError="True"></asp:CustomValidator>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
           <%--                             <div class="divBtnForm">
                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Button ID="btn_saveForm" runat="server" Text="ثبت فرم" CssClass="btnForm btn_saveForm" />
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btn_saveForm" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                        <div class="divBtnForm2">
                                            <input type="button" id="btn_Exit" class="btnForm" value="برگشت" onclick="window.location.href='Sport_selectRacing.aspx'" />
                                            <input type="button" id="btn_ClearForm" class="btnForm" value="خالی کردن فرم" />
                                        </div>--%>
                                    </div>
                                </td>
                            </tr>                                            
                        </ItemTemplate>                        
                    </asp:TemplateField>
                </Columns>
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" Height="30px" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>            
        </ContentTemplate>     
    </asp:UpdatePanel>
    <asp:HiddenField ID="MyHidden" runat="server" Value="0" />
</div>
