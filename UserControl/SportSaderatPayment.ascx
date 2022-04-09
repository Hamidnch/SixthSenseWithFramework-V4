<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportSaderatPayment.ascx.cs" Inherits="UserControl_SportSaderatPayment" %>
<script type="text/javascript">function gotoSaderatBeforePayment(){location.href = "Sport_SaderatBeforePayment.aspx";}</script>
<table style="width: 100%; line-height: 35px; padding: 20px">
    <tr><td>بانک صادرات ایران</td></tr>
    <tr>
        <td>برای ورود به بخش پرداخت از طریق درگاه صادرات برروی دکمه زیر کلیک کنید:<br /></td>
        <td><input type="button" onclick="gotoSaderatBeforePayment()" id="btn" value="صفحه پرداخت" class="sport_BtnForm" /></td>
    </tr>
    <tr><td>&nbsp;</td><td align="center" colspan="2">&nbsp;</td></tr>
</table>