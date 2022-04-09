<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="ReportRacingActiveInventoryAmount.aspx.cs" Inherits="AdminPanel_ReportRacingActiveInventoryAmount" %>

<%@ Register src="AdminUserControl/ReportRacingActiveInventoryAmount.ascx" tagname="ReportRacingActiveInventoryAmount" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="AdminStyls/CSSGrid.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ReportRacingActiveInventoryAmount ID="ReportRacingActiveInventoryAmount1" 
        runat="server" />
</asp:Content>

