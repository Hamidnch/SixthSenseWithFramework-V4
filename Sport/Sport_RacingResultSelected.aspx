<%@ Page Title="" Language="C#" MasterPageFile="~/Sport/Sport.master" AutoEventWireup="true" CodeFile="Sport_RacingResultSelected.aspx.cs" Inherits="Sport_Sport_RacingResultSelected" EnableEventValidation="false" %>
<%@ Register src="../UserControl/SportMenu.ascx" tagname="SportMenu" tagprefix="uc1" %>
<%--<%@ Register src="../UserControl/SportHorizMenu.ascx" tagname="SportHorizMenu" tagprefix="uc1" %>--%>
<%@ Register src="../UserControl/SportRacingResultSelected.ascx" tagname="SportRacingResultSelected" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="../Styles/CSSSportMaster.css" rel="stylesheet" type="text/css" />
<link href="../Styles/CSSSport_Login.css" rel="stylesheet" type="text/css" />
<link href="../Styles/CSStxtLogin.css" rel="stylesheet" type="text/css" />
<link href="../Styles/CSSSportRacingResultSelected.css" rel="stylesheet" type="text/css" />
<script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
<script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<%--    <uc1:SportHorizMenu ID="SportHorizMenu1" runat="server" />--%>
    <uc1:SportMenu ID="SportMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc2:SportRacingResultSelected ID="SportRacingResultSelected1" runat="server" />
</asp:Content>

