<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ReportSiteBox.ascx.cs" Inherits="AdminPanel_AdminUserControl_ReportSiteBox" %>
<%@ Register Assembly="PersianDatePickup" Namespace="PersianDatePickup" TagPrefix="pcal" %>
<link href="../AdminStyls/CSSGrid.css" rel="stylesheet" type="text/css" />
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<fieldset>
    <legend style="color: #ffcc00;">گزارش صندوق سایت</legend>
    <fieldset>
        <div style="float: right; padding-left: 50px">
            <span>موجودی صندوق از تاریخ : </span>
            <pcal:PersianDatePickup ID="pdp_StartDate" runat="server" CssClass="txtPickup"></pcal:PersianDatePickup>
        </div>
        <div style="float: right; padding-left: 50px">
            <span>تا تاریخ : </span>
            <pcal:PersianDatePickup ID="pdp_EndDate" runat="server" CssClass="txtPickup"></pcal:PersianDatePickup>
        </div>
        <div style="float: right; padding: 20px 0 0 50px">
            <span>ساعت : </span>
            <asp:Label ID="lbl_Time" runat="server" Text="........"></asp:Label>
        </div>
        <div style="float: right; padding: 20px 0 0 50px">
            <span>مبلغ : </span>
            <asp:Label ID="lbl_Amount" runat="server" Text="........"></asp:Label>
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
                        <asp:GridView ID="gv_siteReport" runat="server" AutoGenerateColumns="False" AlternatingRowStyle-Height="35px"
                            CssClass="GridViewStyle" HeaderStyle-CssClass="HeaderStyle" PagerStyle-CssClass="PagerStyle"
                            HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" 
                            AllowPaging="True" onpageindexchanging="gv_siteReport_PageIndexChanging">
                            <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="RowStyle" />
                            <Columns>
                                <asp:TemplateField HeaderText="ردیف">
                                    <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_RowNumber" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="تاریخ" SortExpression="DocumentsBox_RegDate">
                                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_DocumentsBox_RegDate" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("DocumentsBox_RegDate","{0}"), "D", false) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="شماره سند" SortExpression="DocumentsBox_DocID">
                                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_DocumentsBox_DocID" runat="server" Text='<%# PersianClass.getPersianNumberStyle(Eval("DocumentsBox_DocID", "{0}")) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="شرح" SortExpression="DocumentsBox_Comment">
                                    <ItemStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_DocumentsBox_Comment" runat="server" Text='<%# Eval("DocumentsBox_Comment", "{0}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="بدهکار" SortExpression="DocumentsBox_Debtor">
                                    <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_DocumentsBox_Debtor" runat="server" Text='<%# PersianClass.getPersianNumberStyle(Eval("DocumentsBox_Debtor", "{0:n0}")) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="بستانکار" SortExpression="DocumentsBox_Creditor">
                                    <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_DocumentsBox_Creditor" runat="server" Text='<%# PersianClass.getPersianNumberStyle(Eval("DocumentsBox_Creditor", "{0:n0}")) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="مانده" SortExpression="DocumentsBox_Remain">
                                    <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_DocumentsBox_Remain" runat="server" Text='<%# PersianClass.getPersianNumberStyle(Eval("DocumentsBox_Remain", "{0:n0}")) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="توضیحات" SortExpression="DocumentsBox_Note">
                                    <ItemStyle Width="35%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_DocumentsBox_Note" runat="server" Text='<%# Eval("DocumentsBox_Note", "{0}") %>'></asp:Label>
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
    <asp:Button runat="server" ID="btn_Return" Text="برگشت به صفحه گزارشات" CssClass="submit" 
    onclick="Unnamed1_Click" />
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