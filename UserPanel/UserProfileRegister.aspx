<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserProfileRegister.aspx.cs" Inherits="UserProfileRegister"%>
<%@ Register Src="UserProfile.ascx" TagName="UserProfile" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title>پروفایل کاربری</title>
    <link href="../Styles/CSSUserProfile.css" rel="stylesheet" type="text/css" /> 
    <link href="../Styles/CSSUserPayment.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/trontastic/jquery-ui-1.8.8.custom.css" rel="stylesheet" type="text/css" />    
    <link href="../Styles/CSSUserAvatarDefault.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSUserAvatarUploadify.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSAlerts.css" rel="stylesheet" type="text/css" />

    <script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.alerts.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.uploadify.v2.1.0.min.js" type="text/javascript"></script>
    <script src="../Scripts/swfobject.js" type="text/javascript"></script>  
</head>
<body><form id="form1" runat="server"><uc2:UserProfile ID="UserProfile1" runat="server" /></form></body>
</html>