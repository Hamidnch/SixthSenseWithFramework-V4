<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="ReportChargeBoxByUser.aspx.cs" Inherits="AdminPanel_ReportChargeBoxByUser" %>

<%@ Register src="AdminUserControl/ReportChargeBoxByUser.ascx" tagname="ReportChargeBoxByUser" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="AdminStyls/CSSGrid.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ReportChargeBoxByUser ID="ReportChargeBoxByUser1" runat="server" />
</asp:Content>

