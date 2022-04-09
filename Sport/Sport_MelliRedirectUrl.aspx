<%@ Page Title="" Language="C#" MasterPageFile="~/Sport/SportPayment.master" AutoEventWireup="true" CodeFile="Sport_MelliRedirectUrl.aspx.cs" Inherits="Sport_Sport_MelliRedirectUrl" %>
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:SportHorizMenu ID="SportHorizMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div id="divBank" style="font-family: Tahoma; direction: rtl;width:99%; text-align:center">
        <p style="color: White; font-size: 50px">بانک ملی ایران</p>
        <br />
        <br />
        <asp:Label ID="lbl_Success" runat="server" Text="" ForeColor="#ffcc00"></asp:Label><br />
        <asp:Label ID="lblMsg" runat="server" Font-Bold="True" Font-Size="Larger" ForeColor="Red"
            Visible="False"></asp:Label>
        <br />
        <br />
        <table style="width: 97%; text-align: center" border="1" cellpadding="1" cellspacing="1">
            <tr style="color: white">
                <td>
                    <asp:Label ID="Label1" runat="server" Text="تاریخ"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="ساعت"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label14" runat="server" Text="مبلغ پرداختی"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label10" runat="server" Text="رسيد دیجیتالی بانک"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label11" runat="server" Text="کد پیگیری خرید"></asp:Label>  
                </td>
                <td>
                    <asp:Label ID="Label15" runat="server" Text="وضعیت تراکنش"></asp:Label>
                </td>
            </tr>
            <tr style="color: #ffcc00">
                <td>
                    <asp:Label ID="lbl_Date" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lbl_Time" runat="server" Text=""></asp:Label>
                </td>
                <td style="height: 24px">
                    <asp:Label ID="amount" runat="server"></asp:Label>
                </td>
                <td style="height: 24px">
                    <asp:Label ID="trans_Id" runat="server"></asp:Label>&nbsp;
                </td>
                <td>
                    <asp:Label ID="lbl_reservationNumber" runat="server" Text=""></asp:Label>
                </td>
                <td style="height: 24px">
                    <asp:Label ID="response_code" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <div>
            <span style="color:#ffcc00"> بدیهی است فرمهای شما تا سقف موجودی شما به صورت خودکار فعال می گردد.</span>
        </div>
        <div style="color:White;text-align:right;padding-right:50px">
            <asp:Label ID="Label5" runat="server" Text=" کد جزيي پاسخ "></asp:Label>
            &nbsp;&nbsp;
            <asp:Label ID="response_subcode" runat="server" Text="---" ForeColor="Lime"></asp:Label><br />
            <asp:Label ID="Label7" runat="server" Text=" کد علت پاسخ "></asp:Label>
            &nbsp;&nbsp;
            <asp:Label ID="response_reason_code" runat="server" Text="---" ForeColor="Lime"></asp:Label><br />
            <asp:Label ID="Label9" runat="server" Text="توضيح علت پاسخ"></asp:Label>
            &nbsp;&nbsp;
            <asp:Label ID="response_reason_text" runat="server" Text="---" ForeColor="Lime"></asp:Label><br />
            <asp:Label ID="Label2" runat="server" Text="شناسه پذیرنده"></asp:Label>
            &nbsp;&nbsp;
            <asp:Label ID="login" runat="server" Text="---" ForeColor="Lime"></asp:Label><br />
            <asp:Label ID="Label6" runat="server" Text="کد خرید یا شماره تراکنش"></asp:Label>
            &nbsp;&nbsp;
            <asp:Label ID="fp_sequence" runat="server" Text="---" ForeColor="Lime"></asp:Label><br />
            <asp:Label ID="Label3" runat="server" Text="زمان امضا"></asp:Label>
            &nbsp;&nbsp;
            <asp:Label ID="fp_timestamp" runat="server" Text="---" ForeColor="Lime"></asp:Label><br />
            <asp:Label ID="Label13" runat="server" Text="واحد پول"></asp:Label>
            &nbsp;&nbsp;
            <asp:Label ID="currency_code" runat="server" Text="---" ForeColor="Lime"></asp:Label><br />
            <asp:Label ID="Label8" runat="server" Text="امضا"></asp:Label>
            &nbsp;&nbsp;
            <asp:Label ID="fp_hash" runat="server" Text="---" ForeColor="Lime"></asp:Label><br />
        </div>
    </div>
    <div>
        <center>
            <br />
            <br />
            <input type="button" value="چاپ" onclick="CallPrint('divBank', 'White', '#222222');" class="sport_BtnForm" />
            <input type="button" value="برگشت" onclick="window.location.href='Sport_SelectRacing.aspx'" class="sport_BtnForm" />
        </center>
    </div>
</asp:Content>

