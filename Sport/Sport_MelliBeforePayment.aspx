<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sport_MelliBeforePayment.aspx.cs" Inherits="Sport_Sport_MelliBeforePayment" %>
<%--<%@ Register src="../UserControl/LoginUserControl.ascx" tagname="LoginUserControl" tagprefix="uc1" %>--%>
<%@ Register src="../UserControl/SportHorizMenu.ascx" tagname="SportHorizMenu" tagprefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/CSSSportMaster.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSSport_Login.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSStxtLogin.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSSport_HorizMenu.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CssSport_SettleInternetShetab.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="../Scripts/OnlyNumber.js" type="text/javascript"></script>
    <script src="../Scripts/HighlightText.js" type="text/javascript"></script>
<%--    <script type="text/javascript">
        $(document).ready(function (){$('#<%= Button1.ClientID %>').click(function (){alert("Hello");});});
    </script>--%>
<%--    <script type="text/javascript">

        function setAndSaveMelli(){
            $.ajax({
                type: "POST",
                async: false,
                url: "Sport_MelliBeforePayment.aspx/InsertPaymentReadyMelli",
                data: "{ reservationNumber: '" + reservationNumber + "',amount: '" + amount + "',bankID: '" + bankID +
                "',timeStamp: '" + timeStamp + "',hashCode: '" + hashCode + "',description: '" + description + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "text",
                success: function ()
                {
                    alert("Ok");
                },
                error: function (fail)
                {
                    // alert("خطا به وقوع پیوست");
                }
            });
        }
    </script>--%>
<%--    <script type="text/javascript" language='JavaScript'>
        function setAndSaveMelli()
        {
            var sequence = "397";
            var amount = "0";
            var bankID = "1";
            var timeStamp = "1303225240";
            var description = "Sample Transaction";
            var fingerprint = "9e11a00c0a9c941ed895d48ba2000789";

            $.ajax({ type: 'POST', async: false,
                url: 'Sport_MelliBeforePayment.aspx/InsertPaymentReadyMelli',
                data: "{ reservationNumber: '" + sequence + "',amount: '" + amount + "',bankID: '" + bankID + "',timeStamp: '"
                        + timeStamp + "',hashCode: '" + fingerprint + "',description: '" + description + "'}"
                ,contentType: 'application/json; charset=utf-8', dataType: 'text',
                success: function ()
                {
                    alert('Ok');
                },
                error: function (fail)
                {
                    alert('خطا به وقوع پیوست');
                }
            });
        }

    </script>--%>
</head>
<body onload="highlight('txt_amount');keyEnter('btnSend')">
    <form id="form1" runat="server" style="font-family:Tahoma;color:White" defaultfocus="txt_amount">
<%-- <asp:ScriptManager ID="TheScriptManager" runat="server">
        <Scripts>
            <asp:ScriptReference Path="~/Scripts/AddCommaText.js" />
        </Scripts>
    </asp:ScriptManager>--%>
    <div class="sport_Wrapper">
<%--        <div class="sport_Login">
            <uc1:LoginUserControl ID="LoginUserControl1" runat="server" />
        </div>--%>
        <div class="sport_HorizMenu">            
            <uc2:SportHorizMenu ID="SportHorizMenu1" runat="server" />
        </div>
        <div class="soprt_BottomMenuSeparator"></div>
        <div class="sport_MainContent">
            <div id="sport_SettleInternetShetab" class="sport_Content">
                <table style="width: 100%; line-height: 35px; padding: 20px">
                    <tr>
                        <td style="color:Aqua">بانک ملی ایران<br />
                    &nbsp;<span><img alt="" src="../Images/bank_melli.png" style="width: 200px; height: 200px" /></span></td>
                    </tr>
                    <tr>
                        <td align="center">
                            <span id="lbl_titr">تعیین مبلغ که قصد دارید پرداخت نمائید</span>
                        </td>
                        <td>
                            <span id="lbl_amount">مبلغ: </span>
                            <%--<asp:TextBox ID="txt_amount" runat="server"></asp:TextBox>--%>
                            <input type="text" value="0" runat="server" id="txt_amount" onkeydown="javascript:return jsNumbers(event);"/>
                            <span id="lbl_rial" style="color:#ffcc00">ریال</span>
                        </td>
                        <td>
<%--                            <asp:Label ID="lbl" runat="server"></asp:Label>
                            <input type="hidden" name='x_description' value='x_description' style='width: 300;' />
                            <input type="hidden" name="x_fp_sequence" id="x_fp_sequence" runat="server" style="width: 300;" />
                            <input type="hidden" name="x_fp_timestamp" id="x_fp_timestamp" runat="server" style="width: 300;" />
                            <input type="hidden" name="x_fp_hash" runat="server" id="x_fp_hash" style='width: 300;' />
                            <input type="hidden" name='x_login' runat="server" id="x_login" style='width: 300;' />
                            <input type="hidden" name='x_amount' runat="server" id="x_amount" style='width: 300;' />
                            <input type="hidden" name='x_currency_code' runat="server" id="x_currency_code" style='width: 300;' />--%>
                                    <%--<input type='button' value="Damoon  ::  Accept Order" onclick="setAndSaveMelli()" />--%>
                            <asp:Button ID="btnSend" runat="server" Text="پرداخت" CssClass="sport_BtnForm" 
                                OnClick="btnSend_Click" />
                            <input type="button" value="برگشت" class="sport_BtnForm" onclick="window.location.href = 'Sport_InternetShetabPayment.aspx'" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td align="center" colspan="2">
                            <asp:Label ID="lblError" runat="server" Visible="false" ForeColor="Yellow"></asp:Label>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </div>
            <div class="soprt_Footer">
            </div>
        </div>
    </div>
    <div class="sport_End">
    </div>
<%--        <script type="text/javascript">
            Sys.Application.add_init(pageInit);
            function pageInit(sender, e)
            {
                $create(Test.AddCommaText, {}, {}, {}, $get('txt_amount'));
            }
    </script>--%>
    </form>
</body>
</html>
