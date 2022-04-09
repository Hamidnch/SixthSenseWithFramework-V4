<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="UserAccountDetails.aspx.cs" Inherits="AdminPanel_UserAccountDetails" %>
<%@ Register src="AdminUserControl/UserAccountDetails.ascx" tagname="UserAccountDetails" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="AdminStyls/CSSUsersManagement.css" rel="stylesheet" type="text/css" media="all" />
    <link href="AdminStyls/CSSGrid.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:UserAccountDetails ID="UserAccountDetails1" runat="server" />
</asp:Content>

