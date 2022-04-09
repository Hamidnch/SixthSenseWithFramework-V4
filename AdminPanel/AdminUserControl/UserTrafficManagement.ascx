<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserTrafficManagement.ascx.cs" Inherits="AdminPanel_AdminUserControl_UserTrafficManagement" %>
<link href="../AdminStyls/CSSUsersManagement.css" rel="stylesheet" type="text/css" />
<link href="../AdminStyls/CSSGrid.css" rel="stylesheet" type="text/css" />
<link href="AdminStyls/Modal/dark-hive/jquery-ui-1.8.5.custom.css" rel="stylesheet" type="text/css" />
<script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
<script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
<script src="../Scripts/jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>
<div>
    <asp:ScriptManager runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel runat="server" UpdateMode="Always">
            <ContentTemplate>
            <asp:GridView ID="gv_UserTraffic" runat="server" AutoGenerateColumns="false"
            AllowSorting="True" BackColor="White" BorderColor="#999999" BorderStyle="None" CssClass="GridViewStyle" GridLines="Both"
            HeaderStyle-CssClass="HeaderStyle" PagerStyle-CssClass ="PagerStyle" BorderWidth="1px" CellPadding="3" Height="292px" PageSize="15" 
            AllowPaging="True" onpageindexchanging="gv_UserTraffic_PageIndexChanging">
                <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="RowStyle"/>
                <PagerSettings FirstPageText="صفحه اول" LastPageText="صفحه آخر" Mode="NextPreviousFirstLast" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
                <Columns>
                    <asp:TemplateField HeaderText="تعداد">
                        <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Visit_ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="تاريخ">
                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# PersianClass.getPersianNumberStyle(PersianClass.getPersiaDate(Eval("Visit_Date", "{0}"), "L", true, "H"))  %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="نام كاربري">
                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Visit_UserName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="آي پي كاربر">
                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Visit_UserIP") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="آدرس صفحه">
                    <ItemStyle Width="30%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Visit_PageURL") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="مشخصات مرورگر">
                        <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("Visit_BrowserType") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <asp:Label ID="Label3" runat="server" Text="هیچ موردی یافت نشد" Width="100%"></asp:Label>
                </EmptyDataTemplate>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
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
                        backgroundColor: 'transparent',
                        '-webkit-border-radius': '10px',
                        '-moz-border-radius': '10px',
                        opacity: .6,
                        color: 'Lime'
                    }
                });
    }
    $(document).ready(function ()
    {
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_beginRequest(function (){setBlock();});
        prm.add_endRequest(function (){$.unblockUI();});
    });
</script>
