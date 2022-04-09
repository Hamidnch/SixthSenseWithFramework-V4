<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EconomicBongahOrder.ascx.cs"
    Inherits="UserControl_EconomicBongahOrder" %>
<link href="../Styles/CSSEco_BongahOrder.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    .loading
    {
        position: absolute;
        left: 200px;
        top: 50px;
    }
</style>
<script type="text/javascript">
    function clearBongahControlValue()
    {
        var bongahType = document.getElementById("<%= txt_bongahType.ClientID %>");
        var chk_bongahBuy = $('#<%= chk_BongahBuy.ClientID %>');
        var chk_bongahSale = $('#<%= chk_BongahSale.ClientID %>');
        var chk_bongahInvestor = $('#<%= chk_BongahInvestor.ClientID %>');
        var chk_bongahCapitalist = $('#<%= chk_BongahCapitalist.ClientID %>');

        var bongahAddress = document.getElementById("<%= txt_BongahAddress.ClientID %>");
        var bongahPhone = document.getElementById("<%= txt_BongahPhone.ClientID %>");
        var bongahEmail = document.getElementById("<%= txt_BongahEmail.ClientID%>");

        bongahType.value = "";
        chk_bongahBuy.attr("checked", false);
        chk_bongahSale.attr("checked", false);
        chk_bongahInvestor.attr("checked", false);
        chk_bongahCapitalist.attr("checked", false);
        bongahAddress.value = "";
        bongahPhone.value = "";
        bongahEmail.value = "";
    }
</script>
<%--<script type="text/javascript">
    $(document).ready(function ()
    {
        clearBongahControlValue();
    });
</script>
<script type="text/javascript">
    function pageLoad(sender, args)
    {
        if (args.get_isPartialLoad())
        {
            clearBongahControlValue();
        }
    }
</script>--%>
<div class="bongahOrder_table">
    <table style="width: 100%; line-height: 30px">
        <%--        <tr>
            <td colspan="4" class="bongahOrder_Header">
                ثبت تقاضا
            </td>
        </tr>--%>
        <tr>
            <td class="bongahOrder_label" style="width: 220px">
                نوع ملک یا بنگاه اقتصادی
            </td>
            <td style="width: 144px">
                <asp:TextBox ID="txt_bongahType" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="bongahOrder_label" style="width: 166px">
                <asp:Label ID="lbl_bongahID" runat="server" ForeColor="Black"></asp:Label>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="bongahOrder_label" style="width: 220px">
                <asp:CheckBox ID="chk_BongahBuy" Text="خرید" runat="server" />
            </td>
            <td style="width: 144px">
                <asp:CheckBox ID="chk_BongahSale" Text="فروش" runat="server" />
            </td>
            <td style="width: 166px" class="bongahOrder_label">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="bongahOrder_label" style="width: 220px">
                <asp:CheckBox ID="chk_BongahCapitalist" Text="مشارکت سرمایه پذیر" runat="server" />
            </td>
            <td style="width: 144px">
                <asp:CheckBox ID="chk_BongahInvestor" Text="مشارکت سرمایه گذار" runat="server" />
            </td>
            <td style="width: 166px" class="bongahOrder_label">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="bongahOrder_label" style="width: 220px">
                آدرس
            </td>
            <td colspan="3">
                <asp:TextBox ID="txt_BongahAddress" runat="server" Height="66px" TextMode="MultiLine"
                    Width="450px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="bongahOrder_label" style="width: 220px">
                تلفن
            </td>
            <td style="width: 144px">
                <asp:TextBox ID="txt_BongahPhone" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="bongahOrder_label" style="width: 166px">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="bongahOrder_label" style="width: 220px">
                ایمیل
            </td>
            <td style="width: 144px">
                <asp:TextBox ID="txt_BongahEmail" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td colspan="2">
                <%--                <asp:RegularExpressionValidator ID="regExpValEmail" runat="server" ControlToValidate="txt_BongahEmail"
                    ErrorMessage="ایمیل را صحیح وارد نمایید" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>--%>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;
                <input type="button" id="btn_BongahRegOrder" value="ثبت" class="bongahOrder_Button" />
                &nbsp;<input type="button" id="btn_BongahExit" value="بازگشت" onclick="clearBongahControlValue()"
                    class="bongahOrder_Button" />
            </td>
            <td colspan="2">
                <asp:Label ID="lbl_MsgbongahOrder" runat="server" ForeColor="#009900"></asp:Label>
            </td>
        </tr>
    </table>
    <div id="load" align="center" style="display: none" class="loading">
        <img src="../Images/loading.gif" alt="در حال انجام" width="100" height="100" />
        درحال انجام...
    </div>
</div>