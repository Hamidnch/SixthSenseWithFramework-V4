﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="SportRacingReport.aspx.cs" Inherits="AdminPanel_SportRacingReport" %>
<%@ Register src="AdminUserControl/SportRacingReport.ascx" tagname="SportRacingReport" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../AdminStyls/CSSMainAdmin.css" rel="stylesheet" type="text/css" /><link href="AdminStyls/Modal/dark-hive/jquery-ui-1.8.5.custom.css" rel="stylesheet" type="text/css" /><link href="../AdminStyls/CSSGrid.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script><script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script><script src="../Scripts/jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:SportRacingReport ID="SportRacingReport1" runat="server" />
</asp:Content>

