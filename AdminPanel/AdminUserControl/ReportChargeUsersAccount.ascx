<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ReportChargeUsersAccount.ascx.cs" Inherits="AdminPanel_AdminUserControl_ReportChargeUsersAccount" %>
<%@ Register Assembly="MultiDropDown" Namespace="MultiDropDownLib" TagPrefix="MultiDropDownLib" %>
<%@ Register Assembly="PersianDatePickup" Namespace="PersianDatePickup" TagPrefix="pcal" %>
<link href="../AdminStyls/CSSGrid.css" rel="stylesheet" type="text/css" />
<link href="../AdminStyls/CSSMultiDropDown.css" rel="stylesheet" type="text/css" />
<asp:ScriptManager ID="ScriptManager2" runat="server" EnablePartialRendering="true">
</asp:ScriptManager>
<fieldset>
    <legend style="color: #ffcc00;">گزارش شارژ حساب کاربران</legend>
    <fieldset>
        <div style="float: right">
            <span>از تاریخ: </span>
            <pcal:PersianDatePickup ID="pdp_StartDate" runat="server" CssClass="txtPickup"></pcal:PersianDatePickup>
        </div>
        <div style="float: right">
            <span>تا تاریخ: </span>
            <pcal:PersianDatePickup ID="pdp_EndDate" runat="server" CssClass="txtPickup"></pcal:PersianDatePickup>
        </div>
        <div style="float: right;padding: 0 10px">
                <span class="field_desc">انتخاب بانک</span><br /> 
                <MultiDropDownLib:MultiDropDown ID="mddl_Banks" runat="server" 
                    TextBoxClass="textbox1"
                    ImageButtonClass="imagebutton1"
                    TooltipClass="tooltip1" 
                    DropdownClass="dropdown1 drp2" />       
        </div>
        <div style="float: right; padding: 0 10px">
                <span class="field_desc">انتخاب کاربران</span><br />
                <MultiDropDownLib:MultiDropDown ID="mddl_Users" runat="server" 
                    TextBoxClass="textbox1"
                    ImageButtonClass="imagebutton1"
                    TooltipClass="tooltip1" 
                    DropdownClass="dropdown1 drp1" />  
        </div>
        <div style="float: right;padding: 50px 45px 0 0">
            <asp:Button ID="btn_Search" runat="server" Text="جستجو" CssClass="submit" 
                onclick="btn_Search_Click"/>
            <asp:Button ID="btn_Refersh" runat="server" Text="تازه سازی" CssClass="submit" 
                onclick="btn_Refersh_Click" />
        </div>
    </fieldset>
    <div style="clear: both"></div><br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <fieldset>
<%--                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
                <asp:GridView ID="gv_ChargeUsersAccount" runat="server" AutoGenerateColumns="False"
                    CssClass="GridViewStyle" HeaderStyle-CssClass="HeaderStyle" PagerStyle-CssClass="PagerStyle"
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" 
                    AllowPaging="True" onpageindexchanging="gv_ChargeUsersAccount_PageIndexChanging" >
                    <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="RowStyle" />
                    <Columns>
                        <asp:TemplateField HeaderText="ردیف">
                            <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_RowNumber" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="تاریخ درخواست" SortExpression="Payment_SettleDate">
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_Payment_SettleDate" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("Payment_SettleDate","{0}"), "D", true, "H") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="نام کاربری" SortExpression="Payment_UserName">
                            <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_ReceiptDoc_Payment_UserName" runat="server" Text='<%# Eval("Payment_UserName", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="مبلغ" SortExpression="Payment_Amount">
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_Payment_Amount" runat="server" Text='<%# PersianClass.getPersianNumberStyle(Eval("Payment_Amount", "{0:n0}")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="نام بانک" SortExpression="Payment_BankName">
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_ReceiptDoc_Payment_BankName" runat="server" Text='<%# Eval("Payment_BankName", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="شماره رسید" SortExpression="Payment_ReferenceNumber">
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_Payment_ReservationNumber" runat="server" Text='<%# Eval("Payment_ReferenceNumber", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="تاریخ تایید" SortExpression="Payment_VerificationDate">
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_Payment_VerificationDate" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("Payment_VerificationDate","{0}"), "D", true, "H") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
<%--                        <asp:TemplateField HeaderText="توضیحات" SortExpression="Payment_Description">
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_Payment_Description" runat="server" Text='<%# Eval("Payment_Description", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                    </Columns>
                    <EmptyDataTemplate>
                        <asp:Label ID="Label3" runat="server" Text="هیچ موردی یافت نشد" Width="100%"></asp:Label>
                    </EmptyDataTemplate>
                </asp:GridView>
            </fieldset>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btn_Search" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btn_Refersh" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
<br />
<asp:Button runat="server" Text="برگشت به صفحه گزارشات" CssClass="submit" onclick="Unnamed1_Click" />
</fieldset>
<script type="text/javascript">
    function getImagePath() { return '<%= ImagePath %>'; } var imagePath = getImagePath();
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
                        backgroundColor: '#000',
                        '-webkit-border-radius': '10px',
                        '-moz-border-radius': '10px',
                        opacity: .6,
                        color: '#fff'
                    }
                });
            }
            $(document).ready(function ()
            {
                var prm = Sys.WebForms.PageRequestManager.getInstance();
                prm.add_beginRequest(function ()
                {
                    setBlock();
                });
                prm.add_endRequest(function ()
                {
                    $.unblockUI();
                });
            });
</script>