<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgetPassword.aspx.cs" Inherits="ForgetPassword" %>

<%@ Register src="UserControl/ForgetPassword.ascx" tagname="ForgetPassword" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            margin:20px;
            padding:20px;
        }
    </style>
    <link href="Styles/CSSForgetPassword.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <uc1:ForgetPassword ID="ForgetPassword1" runat="server" />
    
    </div>
    </form>
</body>
</html>
