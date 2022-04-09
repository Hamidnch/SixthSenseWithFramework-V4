<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportHorizMenu.ascx.cs" Inherits="UserControl_SportHorizMenu" %>
<link href="../Styles/CSSSport_HorizMenu.css" rel="stylesheet" type="text/css" />
<%--<script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>--%>
<script language="javascript" type="text/javascript">
    $(document).ready(function ()
    {
         /// wrap inner content of each anchor with first layer and append background layer
        $("#menu li a").wrapInner('<span class="out"></span>').append('<span class="bg"></span>');

        // loop each anchor and add copy of text content
        $("#menu li a").each(function ()
        {
            $('<span class="over">' + $(this).text() + '</span>').appendTo(this);
        });

        $("#menu li a").hover(function ()
        {
            // this function is fired when the mouse is moved over
            $(".out", this).stop().animate({ 'top': '45px' }, 250); // move down - hide
            $(".over", this).stop().animate({ 'top': '0px' }, 250); // move down - show
            $(".bg", this).stop().animate({ 'top': '0px' }, 120); // move down - show

        }, function ()
        {
            // this function is fired when the mouse is moved off
            $(".out", this).stop().animate({ 'top': '0px' }, 250); // move up - show
            $(".over", this).stop().animate({ 'top': '-45px' }, 250); // move up - hide
            $(".bg", this).stop().animate({ 'top': '-45px' }, 120); // move up - hide
        });
    });
</script>
<%--href="../Sport/Sport_InputRacing.aspx"--%>
<div id="sport_ContentHoriz">
    <div id="menu" class="menu">
        <ul>
<%--            <li id="menuHome" runat="server"><a href="../Home.aspx">صفحه نخست سایت</a></li>--%>
            <li><a id="menuHome" href="../Home.aspx" runat="server">صفحه نخست</a></li>
            <li><a id="menuEconomic" runat="server">بازیهای ورزشی</a></li>
            <li><a id="menuRace" runat="server">پیش بینی مسابقات</a></li>
            <li><a id="menuEducate" href="../Sport/Sport_Lows.aspx" runat="server">مجوزها و قوانین</a></li>
            <li><a id="menuContactUs" class="btnContactUs" style="cursor:pointer" runat="server">تماس با ما</a></li>
            <li>
                <a id="sportMenuAdministrator" href="../AdminPanel/AdminHome.aspx" visible="false" runat="server">مدیریت سایت</a>
            </li>
        </ul>
    </div>
</div>
