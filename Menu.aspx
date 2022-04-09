<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="Menu" %>

<%@ Register src="UserControl/EconomicMenu.ascx" tagname="EconomicMenu" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="Scripts/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>
    <script src="Scripts/scripts.js" type="text/javascript"></script>
    <link href="Styles/CSSEco_Menu.css" rel="stylesheet" type="text/css" />

</head>
<body>

    <form id="form1" runat="server">
    <uc1:EconomicMenu ID="EconomicMenu1" runat="server" />
    </form>

</body>
</html>
