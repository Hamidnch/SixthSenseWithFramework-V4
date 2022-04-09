<%@ Page Title="" Language="C#" MasterPageFile="~/Sport/SportWithHeader.master" AutoEventWireup="true" CodeFile="Sport_Lows.aspx.cs" Inherits="Sport_Sport_Lows" %>
<%@ Register src="../UserControl/SportLows.ascx" tagname="SportLows" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/CSSSportMaster.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSSport_Login.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSStxtLogin.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSSport_Lows.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><uc2:SportLows ID="SportLows1" runat="server" /></asp:Content>

