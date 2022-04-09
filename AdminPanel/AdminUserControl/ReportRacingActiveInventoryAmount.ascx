<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ReportRacingActiveInventoryAmount.ascx.cs" Inherits="AdminPanel_ReportRacingActiveInventoryAmount" %>
<link href="../AdminStyls/CSSGrid.css" rel="stylesheet" type="text/css" />
<asp:ScriptManager ID="ScriptManager2" runat="server" EnablePartialRendering="true">
</asp:ScriptManager>
<fieldset>
    <legend style="color: #ffcc00;">گزارش مبلغ موجودی فعال شده هرمسابقه</legend>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <fieldset>
                <div style="float: right">
                    <span>شماره مسابقه: </span>
                    <asp:DropDownList ID="ddl_AllRacing" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddl_AllRacing_SelectedIndexChanged">
                    </asp:DropDownList>                                   
                </div>
                <div style="float: right;padding: 5px 15px">
                    <span>نام مسابقه:     </span>
                    <asp:Label ID="lbl_RaceTitle" runat="server" Text="...." ForeColor="Lime" Font-Bold="true"></asp:Label>
                </div>
                <div  style="float: right;padding: 5px 15px">
                    <asp:Button ID="btnSearch" runat="server" CssClass="btnUser" Text="جستجو" EnableViewState="false" onclick="btnSearch_Click"/>                    
                </div>                
                <div style="clear:both"></div><br />
                <div style="float: right">
                    <span>موجودی این مسابقه تا تاریخ:  </span>
                    <asp:Label ID="lbl_RacingDate" runat="server" Text="..............." ForeColor="Lime" Font-Bold="true"></asp:Label>
                </div>
<%--                <div style="float: right">
                    <span>ساعت: </span>
                    <asp:Label ID="lbl_RacingTime" runat="server" Text=".............." ForeColor="Lime" Font-Bold="true"></asp:Label>
                </div>--%>
                <div style="float: right;padding-right:10px">
                    <span>مبلغ  :  </span>
                    <asp:Label ID="lbl_RacingFormsAmount" runat="server" Text=".............." ForeColor="Lime" Font-Bold="true"></asp:Label><span> ریال می باشد.</span>
                </div>
<%--                <div style="float: right">
                    <asp:Button ID="btn_Search" runat="server" Text="جستجو" CssClass="submit" />
                    <asp:Button ID="btn_Refersh" runat="server" Text="تازه سازی" CssClass="submit" />
                </div>--%>
            </fieldset>
            <div style="clear: both">
            </div>
            <br />
            <fieldset>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gv_RacingActiveInventoryAmount" runat="server" AutoGenerateColumns="False"
                            CssClass="GridViewStyle" HeaderStyle-CssClass="HeaderStyle" PagerStyle-CssClass="PagerStyle"
                            HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" 
                            AllowPaging="True" 
                            onpageindexchanging="gv_RacingActiveInventoryAmount_PageIndexChanging" 
                            PageSize="10">
                            <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="RowStyle" />
                            <Columns>
                                <asp:TemplateField HeaderText="ردیف">
                                    <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_RowNumber" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="تاریخ" SortExpression="Form_CreationDate">
                                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Form_CreationDate" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("Form_CreationDate","{0}"), "D", true, "H") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="نام کاربری" SortExpression="Member_UserName">
                                    <ItemStyle Width="30%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Member_UserName" runat="server" Text='<%# Eval("Member_UserName", "{0}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="شماره فرم" SortExpression="FormInfo_FormID">
                                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_FormInfo_FormID" runat="server" Text='<%# Eval("FormInfo_FormID", "{0}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="مبلغ(ریال)" SortExpression="Form_Amount">
                                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Form_Amount" runat="server" Text='<%# PersianClass.getPersianNumberStyle(Eval("Form_Amount", "{0:n0}")) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="توضیحات" SortExpression="Form_Description">
                                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Form_Description" runat="server" Text='<%# Eval("Form_Description", "{0}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <asp:Label ID="Label3" runat="server" Text="هیچ موردی یافت نشد" Width="100%"></asp:Label>
                            </EmptyDataTemplate> 
                        </asp:GridView>                                             
                    </ContentTemplate>
                </asp:UpdatePanel>
            </fieldset>
            <br />
            <asp:Button runat="server" Text="برگشت به صفحه گزارشات" CssClass="submit" 
            onclick="Unnamed1_Click" />
        </ContentTemplate>
<%--        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btn_Search" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btn_Refersh" EventName="Click" />
        </Triggers>--%>
    </asp:UpdatePanel>
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
