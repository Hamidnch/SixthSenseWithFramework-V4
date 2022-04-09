<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ReportChargeBoxByUser.ascx.cs" Inherits="AdminPanel_AdminUserControl_ReportChargeBoxByUser" %>
<%@ Register Assembly="PersianDatePickup" Namespace="PersianDatePickup" TagPrefix="pcal" %>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<fieldset>
    <legend style="color: #ffcc00;">گزارش گردش مالی صندوق شارژ کاربران</legend>
    <fieldset>
        <div style="float: right; padding-left: 50px">
            <span>کاربر : </span><br />
            <asp:DropDownList ID="ddl_Users" runat="server"></asp:DropDownList>
        </div>
        <div style="float: right; padding-left: 50px">
            <span>موجودی صندوق از تاریخ : </span>
            <pcal:PersianDatePickup ID="pdp_StartDate" runat="server" CssClass="txtPickup"></pcal:PersianDatePickup>
        </div>
        <div style="float: right; padding-left: 50px">
            <span>تا تاریخ : </span>
            <pcal:PersianDatePickup ID="pdp_EndDate" runat="server" CssClass="txtPickup"></pcal:PersianDatePickup>
        </div>
        <div style="float: right">       
            <asp:Button ID="btn_searchReport" Text="جستجو" runat="server" CssClass="submit" 
                onclick="btn_searchReport_Click"/>
            <asp:Button ID="btn_refreshReport" Text="تازه سازی" runat="server" 
                CssClass="submit" onclick="btn_refreshReport_Click"/>
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div style ="clear:both"><br /></div>
                <div>
                    <fieldset>
                        <asp:GridView ID="gv_ChargeByUserReport" runat="server" 
                            AutoGenerateColumns="False" AlternatingRowStyle-Height="35px"
                            CssClass="GridViewStyle" HeaderStyle-CssClass="HeaderStyle" PagerStyle-CssClass="PagerStyle"
                            HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" 
                            AllowPaging="True" 
                            onpageindexchanging="gv_ChargeByUserReport_PageIndexChanging">
                            <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="RowStyle" />
                            <Columns>
                                <asp:TemplateField HeaderText="ردیف">
                                    <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_RowNumber" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="تاریخ" SortExpression="ChargeBoxTurnover_RegDate">
                                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_ChargeBoxTurnover_RegDate" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("ChargeBoxTurnover_RegDate", "{0}"), "D", true, "H") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="نام کاربری" SortExpression="Member_UserName">
                                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Member_UserName" runat="server" Text='<%# Eval("Member_UserName", "{0}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="شرح" SortExpression="ChargeBoxTurnover_Description">
                                    <ItemStyle Width="35%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_ChargeBoxTurnover_Description" runat="server" Text='<%# Eval("ChargeBoxTurnover_Description", "{0}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="بدهکار" SortExpression="ChargeBoxTurnover_Debtor">
                                    <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_ChargeBoxTurnover_Debtor" runat="server" Text='<%# Eval("ChargeBoxTurnover_Debtor", "{0}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="بستانکار" SortExpression="ChargeBoxTurnover_Creditor">
                                    <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_ChargeBoxTurnover_Creditor" runat="server" Text='<%# Eval("ChargeBoxTurnover_Creditor", "{0}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="مانده" SortExpression="ChargeBoxTurnover_Remain">
                                    <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_ChargeBoxTurnover_Remain" runat="server" Text='<%# Eval("ChargeBoxTurnover_Remain", "{0}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <asp:Label ID="Label3" runat="server" Text="هیچ موردی یافت نشد" Width="100%"></asp:Label>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </fieldset>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btn_searchReport" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btn_refreshReport" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
    </fieldset><br />
    <asp:Button runat="server" ID="btn_Return" Text="برگشت به صفحه گزارشات" 
        CssClass="submit" onclick="btn_Return_Click" />
</fieldset>
<script type="text/javascript">
    function getImagePath() { return '<%= ImagePath %>'; } var imagePath = getImagePath();
    function setBlock()
    {
        $.blockUI(
        {  //'<img src="<=ResolveUrl("~") %>/ajaxImages/loading2.gif" />'
        message: '<h1><img src="' + imagePath + '/ajaxImages/loading2.gif" /><br /> چند لحظه منتظر بمانيد...</h1>',
        fadeIn: 700, fadeOut: 700, css: { border: 'none', padding: '5px', backgroundColor: 'transparent', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .6, color: '#fff'}
    });
    }
    $(document).ready(function ()
    {
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_beginRequest(function () { setBlock(); });
        prm.add_endRequest(function () { $.unblockUI(); });
    });
</script>