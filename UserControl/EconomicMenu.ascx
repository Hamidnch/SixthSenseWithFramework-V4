<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EconomicMenu.ascx.cs" Inherits="UserControl_EconomicMenu" %>
<link href="../Styles/CSSEco_Menu.css" rel="stylesheet" type="text/css" />

<!--[if lt IE 8]>
		<script src ="http://ie7-js.googlecode.com/svn/version/2.1(beta2)/IE8.js"></script>
	<![endif]-->
<ul id="nav">
    <li><a href="#">صفحه نخست</a>
        <ul>
            <li><a href="../Home.aspx" id="ecoHome" runat="server">صفحه اصلی</a></li>
            <li><a href="#">صفحه اقتصاد</a></li>
        </ul>
    </li>
    <li><a href="~/Economic/EconomicAnalysis.aspx" id="ecoAnalysis" runat="server">تحلیلهای اقتصادی</a></li>
    <li><a href="~/Economic/EconomicServices.aspx" id="ecoServices" runat="server">خدمات اقتصادی</a></li>
    <li><a href="~/Economic/EconomicPartnership.aspx" id="ecoPartnership" runat="server">مشارکت اقتصادی</a>
        <ul class="subnav">
            <li><a href="#">بورس املاک و معاملات</a></li>
            <li><a href="#">بورس کالا</a></li>
            <li><a href="#">مشارکت گروهی</a></li>
        </ul>
    </li>
    <li><a class="btnContactUs" id="ecoContactUs" runat="server">تماس با ما</a></li>
    <li><a id="ecoAdministrator" visible="false" href="~/AdminPanel/AdminHome.aspx" runat="server">
        مدیریت سایت</a></li>
</ul>
<script src="Scripts/jquery-1.4.4.js" type="text/javascript"></script>
<script src="Scripts/jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>
<script src="Scripts/scripts.js" type="text/javascript"></script>
