<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserActivation.aspx.cs" Inherits="UserActivation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>فعالسازی کاربر در سایت حس ششم</title>
        <style type="text/css">
            body
            {
                direction: rtl;
                font-family: Tahoma;
                font-size: 20px;
                line-height: 45px;
                text-align: center;
                height: 133px;
                padding: 100px;
                background-color: Gray;
                color: White;
            }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblResult" runat="server" ForeColor="White"></asp:Label>
        </div>
        <br/>
        <a href="http://www.hesesheshom.com/Home.aspx">بازگشت به سایت</a>
    </form>
</body>
</html>
