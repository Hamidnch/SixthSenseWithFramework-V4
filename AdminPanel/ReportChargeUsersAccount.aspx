<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="ReportChargeUsersAccount.aspx.cs" Inherits="AdminPanel_ReportChargeUsersAccount" %>

<%@ Register src="AdminUserControl/ReportChargeUsersAccount.ascx" tagname="ReportChargeUsersAccount" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="AdminStyls/CSSGrid.css" rel="stylesheet" type="text/css" />
    <link href="AdminStyls/CSSMultiDropDown.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ReportChargeUsersAccount ID="ReportChargeUsersAccount1" runat="server" />
</asp:Content>

