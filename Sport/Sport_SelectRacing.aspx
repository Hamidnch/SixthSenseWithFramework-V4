<%@ Page Title="" Language="C#" MasterPageFile="~/Sport/Sport.master" AutoEventWireup="true" CodeFile="Sport_SelectRacing.aspx.cs" Inherits="Sport_Sport_SelectRacing" %>
<%@ Register src="../UserControl/SportMenu.ascx" tagname="SportMenu" tagprefix="uc1" %>
<%--<%@ Register src="../UserControl/SportHorizMenu.ascx" tagname="SportHorizMenu" tagprefix="uc1" %>--%>
<%@ Register src="../UserControl/SportSelectRacing.ascx" tagname="SportSelectRacing" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/CSSSportMaster.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSSport_Login.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSStxtLogin.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSSportSelectRacing.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSSportMenu.css" rel="stylesheet" type="text/css" />
<%--    <link href="../Styles/CSSSport_HorizMenu.css" rel="stylesheet" type="text/css" />--%>
    <script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<%--    <uc1:SportHorizMenu ID="SportHorizMenu1" runat="server" />--%>
    <uc1:SportMenu ID="SportMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><center><uc2:SportSelectRacing ID="SportSelectRacing1" runat="server" /></center></asp:Content>
<asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolder3"><div style="color: White; text-align:center; font-family:Tahoma; font-size:xx-large;padding:0 0 5px 0; text-shadow: 0px -11px 10px #C60, 0px -3px 9px #FF0;"><p>پیش بینی مسابقات فعال</p></div></asp:Content>