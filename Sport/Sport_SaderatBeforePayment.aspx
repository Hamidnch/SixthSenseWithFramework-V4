<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sport_SaderatBeforePayment.aspx.cs" Inherits="Sport_Sport_SaderatBeforePayment" %>
<%@ Register Src="../UserControl/SportHorizMenu.ascx" TagName="SportHorizMenu" TagPrefix="uc2" %>
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
</head>
<body onload="highlight('txt_amount');keyEnter('btnSend')">
    <form id="form1" runat="server" style="font-family: Tahoma; color: White">
    <div class="sport_Wrapper">
        <div class="sport_HorizMenu">
            <uc2:sporthorizmenu id="SportHorizMenu1" runat="server" />
        </div>
        <div class="soprt_BottomMenuSeparator">
        </div>
        <div class="sport_MainContent">
            <div id="sport_SettleInternetShetab" class="sport_Content">
                <table style="width: 100%; line-height: 35px; padding: 20px">
                    <tr>
                        <td style="color:#ffcc00">بانک صادرات ایران<br />
                    </td>
                    <tr>                        
                        <td>
                            <fieldset style="background-color: #494949;text-align:center; border:1px #8F8F8F solid">
                                <img alt="" src="../Images/bank_saderat.png" style="width: 212px; height: 195px" />
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <span id="lbl_titr">تعیین مبلغ که قصد دارید پرداخت نمائید</span>
                        </td>
                        <td>
                            <span id="lbl_amount">مبلغ: </span>
                            <input type="text" value="0" runat="server" id="txt_amount" onkeydown="javascript:return jsNumbers(event);" />
                            <span id="lbl_rial">ریال</span>
                        </td>
                        <td>
                            <asp:Button ID="btnSend" runat="server" Text="پرداخت" CssClass="sport_BtnForm" onclick="btnSend_Click" />                            
                            <input type="button" value="برگشت" class="sport_BtnForm" onclick="window.location.href = 'Sport_InternetShetabPayment.aspx'" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td align="center" colspan="2">
                            <asp:Label ID="lblError" runat="server" Visible="false" ForeColor="Yellow"></asp:Label>
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
    </form>
</body>
</html>