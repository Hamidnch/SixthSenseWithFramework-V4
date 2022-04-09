<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserRegisteration.aspx.cs" Inherits="UserRegisteration" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc2" %><%@ Register Src="UserControl/UserRegisteration.ascx" TagName="UserRegisteration" TagPrefix="uc1" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ثبت نام در سایت حس ششم</title>
    <link href="Styles/CSSUserRegisteration.css" rel="stylesheet" type="text/css" />
    <link href="Styles/CSSMenuPublic.css" rel="stylesheet" type="text/css" />
<%--    <link href="Styles/CssContactWithUs.css" rel="stylesheet" type="text/css" />--%><link
    href="Styles/dark-hive/jquery-ui-1.8.5.custom.css" rel="stylesheet" type="text/css" />
<%--    <link href="Styles/trontastic/jquery-ui-1.8.8.custom.css" rel="stylesheet" type="text/css" />--%>
    <script src="Scripts/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery-blockUI.js" type="text/javascript"></script>
    <script src="Scripts/json2.js" type="text/javascript"></script>
    <script src="Scripts/Farsi.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server"><div id="screen"></div><div><uc1:UserRegisteration ID="UserRegisteration1" runat="server"/></div></form>
</body>
</html>