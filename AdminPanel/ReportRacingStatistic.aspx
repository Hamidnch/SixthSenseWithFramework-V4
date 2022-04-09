<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="ReportRacingStatistic.aspx.cs" Inherits="AdminPanel_ReportRacingStatistic" %>

<%@ Register src="AdminUserControl/ReportRacingStatistic.ascx" tagname="ReportRacingStatistic" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ReportRacingStatistic ID="ReportRacingStatistic1" runat="server" />
</asp:Content>

