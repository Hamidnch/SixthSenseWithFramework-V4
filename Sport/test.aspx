<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="Sport_test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
                    <asp:RadioButtonList ID="rb_BankPort" runat="server" CssClass="radio"
                    RepeatDirection="Horizontal" Width="98%" ForeColor="#ffcc00">
                    <asp:ListItem Value="0"><img width="60px" height="60px" src="../Images/bank_melli.png" align="middle" /> درگاه پرداخت اینترنتی بانک ملی</asp:ListItem>
                    <asp:ListItem Value="1"><img width="60px" height="60px" src="../Images/bank_saderat.png" alt="" align="middle" /> درگاه پرداخت اینترنتی بانک صادرات</asp:ListItem>                    
                    <asp:ListItem Value="2"><img width="60px" height="60px" src="../Images/saman.png" align="middle" />درگاه پرداخت اینترنتی بانک سامان</asp:ListItem>
                </asp:RadioButtonList>    
    </div>
    </form>
</body>
</html>
