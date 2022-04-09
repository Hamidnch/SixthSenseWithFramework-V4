<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportMenu.ascx.cs" Inherits="UserControl_SportMenu" %>
<link href="../Styles/CSSSportMenu.css" rel="stylesheet" type="text/css" />
<ul id="navigation" class="nav-main">
    <li><a id="sportmenu_Home" runat="server" href="~/Home.aspx">صفحه نخست</a>
	    <ul visible="false" id="ul1" runat="server" class="nav-sub">
            <li><a visible="false" id="sportmenu_HomeSite" runat="server" href="../Home.aspx" >سایت</a></li>
            <li><a visible="false" id="sportmenu_HomeSport" runat="server" href="../Sport/Sport_Home.aspx">مسابقات فوتبال</a></li>
        </ul>
    </li>    
    <li><a visible="true" id="sportmenu_RacingTable" href="../Sport/Sport_ClassificationTable.aspx" runat="server">جدول مسابقات</a></li>
    <li><a visible="true" id="sportmenu_Racing" runat="server" class="list">مسابقات فوتبال</a>
	    <ul  visible="true" id="ul2" runat="server" class="nav-sub">
            <li><a visible="true" id="sportmenu_menuRace" runat="server" CausesValidation ="false">پیش بینی مسابقات</a></li>
            <li id="sportmenu_RacingResultli" runat="server"><a visible="true" id="sportmenu_RacingResult" runat="server" href="../Sport/SportRacingTitles.aspx" >نتایج مسابقات</a></li>
            <li  id="li_sportmenu_ChargeAccount" runat="server"><a visible="true" id="sportmenu_ChargeAccount" runat="server" href="../Sport/Sport_SettleIndex.aspx">شارژ حساب</a></li>
        </ul>
    </li>
    <%--<li><a visible="false" id="sportmenu_menuRace2" runat="server" href="~/Sport/Sport_SelectRacing.aspx">پیش بینی مسابقات</a></li>    --%>
    <li><a visible="false" id="sportmenu_RacingResult2" runat="server" href="../Sport/SportRacingTitles.aspx" >نتایج مسابقات</a></li>
    <li><a visible="false" id="sportmenu_ChargeAccount2" runat="server" href="../Sport/Sport_SettleIndex.aspx">شارژ حساب</a></li>
    <li><a visible="true" id="sportmenu_Low" runat="server" href="../Sport/Sport_Lows.aspx">مجوزها و قوانین</a></li>
    <li><a visible="true" id="sportmenu_ContactUs" class="btnContactUs" runat="server" style="cursor:pointer">تماس با ما</a></li>
    <li><a visible="false" runat="server" id="sportMenu_Administrator" href="../AdminPanel/AdminHome.aspx">مدیریت سایت</a></li>
</ul>