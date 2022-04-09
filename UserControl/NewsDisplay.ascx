<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsDisplay.ascx.cs" Inherits="UserControl_NewsDisplay" %>
<link href="../Styles/CSSNewsDisplay.css" rel="stylesheet" type="text/css" />

<%--<asp:FormView ID="FormView_NewsDisplay" runat="server" DataKeyNames="News_ID" CellPadding="0" CssClass="formView"
               GridLines="Horizontal">
    <RowStyle BackColor="White" />
    <ItemTemplate>
        <asp:CheckBox ID="chk_NewsPooling" Enabled="false" Visible="false" runat="server" />
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td>
                    عنوان خبر :
                    <asp:Label ID="lbl_NewsTitle" runat="server">
                    </asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    تاریخ ثبت خبر :
                    <asp:Label ID="lbl_NewsDate" runat="server">
                    </asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    تعداد بازدید از خبر :
                    <asp:Label ID="lbl_NewsViewCount" runat="server">
                    </asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding: 5px 5px">
                    <asp:Label ID="lbl_NewsContext" runat="server">
                    </asp:Label>
                </td>
            </tr>
        </table>
    </ItemTemplate>
    <EmptyDataTemplate>
        <asp:Label ID="Label1" runat="server" Text="خبری با این مشخصات در سایت موجود نمی باشد"
            Width="100%">
        </asp:Label>
    </EmptyDataTemplate>
</asp:FormView>--%>
<div class="news_Container">
    <div class="news_Header">
         <table align="left" dir="rtl" 
             style="width: 96%; margin: 15px 0px 0 0; height: 72px;">
            <tr>
                <td class="newsCol1">
                    <asp:Label ID="Label4" runat="server" Text="عنوان خبر:"></asp:Label>
                </td>
                <td class="newsCol2">
                    <asp:Label ID="lbl_NewsTitle" runat="server" Text="Label"></asp:Label>
                    <asp:CheckBox ID="chk_NewsPooling" runat="server" Visible="False" />
                </td>
            </tr>
            <tr>
                <td class="newsCol1">
                    <asp:Label ID="Label6" runat="server" Text="تاریخ ثبت خبر:"></asp:Label>
                </td>
                <td class="newsCol2">
                    <asp:Label ID="lbl_NewsDate" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td width="20%" class="newsCol1">
                    <asp:Label ID="Label8" runat="server" Text="تعداد بازدید از خبر:"></asp:Label>
                </td>
                <td class="newsCol2">
                    <asp:Label ID="lbl_NewsViewCount" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
        </table>   
    </div>
    <div class="news_TopMiddle"></div>
    <div class="news_Middle">
        <div style="direction: rtl; color:Green; padding: 0 20px 20px 0; width: 430px; overflow:hidden">
           <asp:Label ID="lbl_NewsContext" runat="server" CssClass="news_Context" 
                Height="350px" Width="421px"></asp:Label>  
        </div>
    </div>
    <div class="news_Footer"></div>
</div>
<%--    <table align="left" dir="rtl" style="width: 100%">
        <tr>
            <td class="newsCol1">
                <asp:Label ID="Label1" runat="server" Text="عنوان خبر:"></asp:Label>
            </td>
            <td class="newsCol2">
                <asp:Label ID="lbl_NewsTitle" runat="server" Text="Label"></asp:Label>
                <asp:CheckBox ID="chk_NewsPooling" runat="server" Visible="False" />
            </td>
        </tr>
        <tr>
            <td class="newsCol1">
                <asp:Label ID="Label2" runat="server" Text="تاریخ ثبت خبر:"></asp:Label>
            </td>
            <td class="newsCol2">
                <asp:Label ID="lbl_NewsDate" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="20%" class="newsCol1">
                <asp:Label ID="Label3" runat="server" Text="تعداد بازدید از خبر:"></asp:Label>
            </td>
            <td class="newsCol2">
                <asp:Label ID="lbl_NewsViewCount" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lbl_NewsContext" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>--%>