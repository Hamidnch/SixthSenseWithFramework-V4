<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportSettleInternetShetab.ascx.cs" Inherits="UserControl_SportSettleInternetShetab" %>
<link href="../Styles/CssSport_SettleInternetShetab.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(document).ready(function ()
    {
//        var lbl_titr = $("#lbl_titr");
//        var lbl_amount = $("#lbl_amount");
//        var txt_InternetShetabAmount = $("#<%= txt_InternetShetabAmount.ClientID %>");
//        var lbl_rial = $("#lbl_rial");
//        var btn_InternetShetab = ("#btn_InternetShetab");
        $("#btn_ParsianPort").click(function ()
        {
//            $("#lbl_titr").css("display", "block");
        });
        $("#btn_SamanPort").click(function ()
        {

        });
    });
</script>
<div id="sport_SettleInternetShetab">
    <table style="width: 100%;line-height:35px">
        <tr>
            <td colspan="2">
                <span style="font-size:14px;font-weight:bold;">پرداخت آنلاین اینترنتی با کارتهای عضو شتاب:</span>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:RadioButtonList ID="rb_BankPort" runat="server" CssClass="radio"
                    RepeatDirection="Horizontal" Width="98%" ForeColor="#ffcc00">
                    <asp:ListItem Value="0"><img width="60px" height="60px" src="../Images/bank_melli.png" align="middle" /> درگاه پرداخت اینترنتی بانک ملی</asp:ListItem>
                    <asp:ListItem Value="1"><img width="60px" height="60px" src="../Images/bank_saderat.png" alt="" align="middle" /> درگاه پرداخت اینترنتی بانک صادرات</asp:ListItem>                    
                    <asp:ListItem Value="2"><img width="60px" height="60px" src="../Images/saman.png" align="middle" />درگاه پرداخت اینترنتی بانک سامان</asp:ListItem>
                </asp:RadioButtonList>   
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center">
                <span id="lbl_titr">تعیین مبلغ که قصد دارید پرداخت نمائید</span>
            </td>
            <td>
                <span id="lbl_amount">مبلغ: </span>
                <asp:TextBox ID="txt_InternetShetabAmount" Width="180px" runat="server"></asp:TextBox>
                <span id="lbl_rial">ریال</span>                
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="center">
                <input id="btn_InternetShetab" class="btn" type="button" value="ثبت" style="width: 100px"/>
            </td>
        </tr>
    </table>
</div>