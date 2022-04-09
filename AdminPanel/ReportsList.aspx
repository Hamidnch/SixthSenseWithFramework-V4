<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="ReportsList.aspx.cs" Inherits="AdminPanel_ReportsList" %>

<%@ Register src="AdminUserControl/ReportsList.ascx" tagname="ReportsList" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ReportsList ID="ReportsList1" runat="server" />
</asp:Content>

