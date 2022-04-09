<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportMeliPayment.ascx.cs" Inherits="UserControl_SportMeliPayment" %>
<script type="text/javascript">
    function gotoMelliBeforePayment()
    {
       // var txt_amount = document.getElementById("txt_amount").value;
        // location.href = "Sport_MelliBeforePayment.aspx?amountValue=" + txt_amount;
        location.href = "Sport_MelliBeforePayment.aspx";
        }
//    function submitForm()
//    {
//        $.ajax({
//            type: "POST",
//            url: "Sport_InternetShetabPayment.aspx/submitForm",
//            data: "{}",
//            contentType: "application/json; charset=utf-8",
//            dataType: "json",
//            success: function (res)
//            {
//                // result = data.d;
//                alert("Yes" + res.d);
//            },
//            error: function (fail)
//            {
//                 alert("خطا به وقوع پیوست" + fail.responseText);
//            }
//         });
//    }
</script>
<table style="width: 100%; line-height: 35px; padding: 20px">
    <tr>
        <td>بانک ملی ایران</td>
    </tr>
    <tr>
    <td>
        برای ورود به بخش پرداخت از طریق درگاه ملی برروی دکمه زیر کلیک کنید:
        <br />
    </td>
<%--        <td align="center">
            <span id="lbl_titr">تعیین مبلغ که قصد دارید پرداخت نمائید</span>
        </td>
        <td>
            <span id="lbl_amount">مبلغ: </span>
            <input type="text" value="0" id="txt_amount" />
            <span id="lbl_rial">ریال</span>
        </td>--%>
        <td>
<%--            <asp:Label ID="lbl" runat="server"></asp:Label>
            <input type="hidden" name='x_description' value='x_description' style='width: 300;' />
            <input type="hidden" name="x_fp_sequence" id="x_fp_sequence" runat="server" style="width: 300;" />
            <input type="hidden" name="x_fp_timestamp" id="x_fp_timestamp" runat="server" style="width: 300;" />
            <input type="hidden" name="x_fp_hash" runat="server" id="x_fp_hash" style='width: 300;' />
            <input type="hidden" name='x_login' runat="server" id="x_login" style='width: 300;' />--%>
            <%--<input type="hidden" name='hdnamount' runat="server" id="x_amount" style='width: 300;' />--%>
<%--            <input type="hidden" name='x_currency_code' runat="server" id="x_currency_code" style='width: 300;' />--%>
            <%--<input type='submit' value="Damoon  ::  Accept Order" />--%>
            <%--<asp:Button ID="btnSend" runat="server" Text="پرداخت" CssClass="sport_BtnForm" PostBackUrl="https://Damoon.bankmelli-iran.com/MerchantsIntegrationTestController" />--%>
            <%--<asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />--%>
            <input type="button" onclick="gotoMelliBeforePayment()" id="btn" value="صفحه پرداخت" class="sport_BtnForm" />
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td align="center" colspan="2">
            &nbsp;
        </td>
    </tr>
</table>