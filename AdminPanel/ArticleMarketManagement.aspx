<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="ArticleMarketManagement.aspx.cs" Inherits="AdminPanel_ArticleMarketManagement" %>

<%@ Register src="AdminUserControl/ArticleMarketManagement.ascx" tagname="ArticleMarketManagement" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="AdminStyls/CSSMainAdmin.css" rel="stylesheet" type="text/css" />
    <link href="AdminStyls/Modal/black-tie/jquery-ui-1.8.6.custom.css" rel="stylesheet" type="text/css" />
    <link href="AdminStyls/CSSGrid.css" rel="stylesheet" type="text/css" />    
    <script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ArticleMarketManagement ID="ArticleMarketManagement1" runat="server" />
</asp:Content>

