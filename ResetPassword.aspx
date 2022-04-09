<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResetPassword.aspx.cs" Inherits="ResetPassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
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
    <div style="display: none">
        پسورد قبلی شما حذف گردید و یک پسورد جدید به ایمیلتان ارسال شد.<br />
        لطفا در اولین فرصت به قسمت تنظیمات کاربریتان رفته و پسورد خود را تغییر دهید.
        <br />
    </div>
    <div>
        <asp:Label ID="lblResult" runat="server" ForeColor="White"></asp:Label>
    </div>
    </form>
</body>
</html>
