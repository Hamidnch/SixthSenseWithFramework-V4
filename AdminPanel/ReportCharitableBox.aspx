<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="ReportCharitableBox.aspx.cs" Inherits="AdminPanel_ReportCharitableBox" %>

<%@ Register src="AdminUserControl/ReportCharitableBox.ascx" tagname="ReportCharitableBox" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="AdminStyls/CSSGrid.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ReportCharitableBox ID="ReportCharitableBox1" runat="server" />
</asp:Content>

