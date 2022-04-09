<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="SportClassificationTableAdd.aspx.cs" Inherits="AdminPanel_SportClassificationTableAdd" %>
<%@ Register src="AdminUserControl/SportClassificationTableAdd.ascx" tagname="SportClassificationTableAdd" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="AdminStyls/CSSMainAdmin.css" rel="stylesheet" type="text/css" />
    <link href="AdminStyls/CSSGrid.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="../Scripts/PageMethod.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
    <script src="../Scripts/CustomBlockUI.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:SportClassificationTableAdd ID="SportClassificationTableAdd1" runat="server" />
</asp:Content>

