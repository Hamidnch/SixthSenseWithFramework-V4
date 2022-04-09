<%@ Page Title="" Language="C#" MasterPageFile="~/Sport/Sport.master" AutoEventWireup="true" CodeFile="Sport_Racing.aspx.cs" Inherits="Sport_Sport_Racing" %>
<%@ Register src="../UserControl/SportRacing.ascx" tagname="SportRacing" tagprefix="uc1" %>
<%@ Register src="../UserControl/SportMenu.ascx" tagname="SportMenu" tagprefix="uc2" %>
<%--<%@ Register src="../UserControl/SportHorizMenu.ascx" tagname="SportHorizMenu" tagprefix="uc2" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/CSSSportMaster.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSSport_Login.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSStxtLogin.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSSportRacing.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/Common.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/trontastic/jquery-ui-1.8.8.custom.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
    <script src="../Scripts/CustomBlockUI.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <%--<uc2:SportHorizMenu ID="SportHorizMenu1" runat="server" />--%>
    <uc2:SportMenu ID="SportMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><uc1:SportRacing ID="SportRacing1" runat="server" /></asp:Content>

