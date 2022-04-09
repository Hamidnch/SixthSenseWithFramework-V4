<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Error.aspx.cs" Inherits="Error" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <center>
            <div class="ContentHead">ERROR</div>
            <br />
            <br />
            <asp:Label ID="Label_ErrorFrom" runat="server" Text=""></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label_ErrorMessage" runat="server" Text=""></asp:Label>
            <br />
            <br />
<%--            <asp:Label ID="Label_Url" runat="server" Text=""></asp:Label>
            <br />
            <br />--%>
        </center>
    </form>
    <div style="direction:rtl;font-family:Tahoma;">
        <table>
            <tr>
                <td>متن پیام</td>
                <td><asp:TextBox ID="txt_Message" runat="server" Height="162px" TextMode="MultiLine" Width="557px" /></td>
            </tr>
            <tr>
                <td>ایمیل فرستنده</td>
                <td><asp:TextBox ID="txt_Email" ReadOnly="true" BackColor="Silver" runat="server" Width="431px" /></td>
            </tr>
            <tr>
                <td>پاسخ به پیام</td>
                <td><asp:TextBox runat="server" Height="172px" Width="557px" TextMode="MultiLine" /></td>
            </tr>
            <tr>
                <td><input type="button" id="btn_Send" value="ارسال پیام" /></td>
                <td></td>
            </tr>
        </table>
    </div>
</body>
</html>
