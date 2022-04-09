<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="SportRacingManagementBest.aspx.cs" Inherits="AdminPanel_SportRacingManagementBest" %>

<%@ Register src="AdminUserControl/SportRacingManagementBest.ascx" tagname="SportRacingManagementBest" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="AdminStyls/CSSMainAdmin.css" rel="stylesheet" type="text/css" />
    <link href="AdminStyls/CSSGrid.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/OnlyNumber.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:SportRacingManagementBest ID="SportRacingManagementBest1" runat="server" />
</asp:Content>

