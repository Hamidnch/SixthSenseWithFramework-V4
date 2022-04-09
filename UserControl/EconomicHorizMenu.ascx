<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EconomicHorizMenu.ascx.cs" Inherits="UserControl_EconomicHorizMenu" %>
<link href="../Styles/CSSEco_HorizMenu.css" rel="stylesheet" type="text/css" />
<div class="eco_menu">
    <ul id="top-menu">
        <li><a href="../Home.aspx" id="ecoHome" runat="server">صفحه نخست</a></li>
        <li><a href="~/Economic/EconomicAnalysis.aspx" id="ecoAnalysis" runat="server">تحلیلهای اقتصادی</a></li>
        <li><a href="~/Economic/EconomicServices.aspx" id="ecoServices" runat="server">خدمات اقتصادی</a></li>
        <li><a href="~/Economic/EconomicPartnership.aspx" id="ecoPartnership" runat="server">مشارکت اقتصادی</a></li>
        <li><a class="btnContactUs" style="cursor:pointer" id="ecoContactUs" runat="server">تماس با ما</a></li>
        <li><a id="ecoAdministrator" visible="false" href="~/AdminPanel/AdminHome.aspx"
            runat="server">مدیریت سایت</a></li>
    </ul>
</div>
