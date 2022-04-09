<%@ Page Title="" Language="C#" MasterPageFile="~/Sport/Sport.master" AutoEventWireup="true" CodeFile="Sport_GetBack.aspx.cs" Inherits="Sport_Sport_GetBack" %>
<%@ Register src="../UserControl/SportHorizMenu.ascx" tagname="SportHorizMenu" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/CSSSportMaster.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSSport_Login.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSStxtLogin.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSSport_HorizMenu.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CssSport_SettleInternetShetab.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="../Scripts/PrintDocument.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <uc1:SportHorizMenu ID="SportHorizMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1">
    <div id="divBank" style="font-family: Tahoma; direction: rtl;width:99%; text-align:center">
        <br /><br />
        <asp:Label ID="lbl_Success" runat="server" Text="" ForeColor="#ffcc00"></asp:Label><br />
        <asp:Label ID="lblMsg" runat="server" Font-Bold="True" Font-Size="Larger" ForeColor="Red" Visible="False"></asp:Label><br />
        <asp:Label ID="lbl_Trace" runat="server" Text="Label" ForeColor="White"></asp:Label>
        <br /><br />
        <table style="width: 95%;text-align:center" border="1" cellpadding="1" cellspacing="1">
            <tr style="color:white">
                <td><asp:Label ID="Label12" runat="server" Text="تاریخ"></asp:Label></td>
                <td><asp:Label ID="Label1" runat="server" Text="ساعت"></asp:Label></td>
                <td><asp:Label ID="Label5" runat="server" Text="مبلغ"></asp:Label></td>
                <td><asp:Label ID="Label2" runat="server" Text="رسید دیجیتالی یانک"></asp:Label></td>
                <td><asp:Label ID="Label3" runat="server" Text="شناسه پیگیری خرید"></asp:Label></td>
                <td><asp:Label ID="Label4" runat="server" Text="وضعیت تراکنش پرداخت"></asp:Label></td>
            </tr>
            <tr style="color:#ffcc00">
                <td>
                    <asp:Label ID="lbl_Date" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lbl_Time" runat="server" Text=""></asp:Label>
                </td>
                <td style="height: 24px">
                    <asp:Label ID="lbl_Amount" runat="server"></asp:Label>
                </td>
                <td style="height: 24px">
                    <asp:Label ID="lbl_ReferenceNumber" runat="server"></asp:Label><br />
                </td>
                <td style="height: 24px">
                    <asp:Label ID="lbl_ReservationNumber" runat="server"></asp:Label>&nbsp;
                </td>
                <td style="height: 24px">
                    <asp:Label ID="lbl_TransactionState" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <center>       
            <br />
            <br />
            <asp:Label ID="lbl_DBInfo" runat="server" ForeColor="Yellow"></asp:Label>
            <br />
            <input type="button" value="چاپ" onclick="CallPrint('divBank', 'white', '#222222');" class="sport_BtnForm" />
            <input type="button" value="برگشت" onclick="window.location.href='Sport_SelectRacing.aspx'" class="sport_BtnForm" />
        </center>
    </div>
    </form>
</asp:Content>

