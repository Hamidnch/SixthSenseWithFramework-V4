<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="ContactUs_InputMessage.aspx.cs" Inherits="AdminPanel_ContactUs_InputMessage" EnableEventValidation="false" %>
<%@ Register src="AdminUserControl/ContactUs_InputMessage.ascx" tagname="ContactUs_InputMessage" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="AdminStyls/CSSUsersManagement.css" rel="stylesheet" type="text/css" media="all" />
    <link href="AdminStyls/CSSGrid.css" rel="stylesheet" type="text/css" />
    <link href="AdminStyls/Modal/dark-hive/jquery-ui-1.8.5.custom.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>
    <script src="../Scripts/CustomBlockUI.js" type="text/javascript"></script>
    <script src="ckeditor/ckeditor.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ContactUs_InputMessage ID="ContactUs_InputMessage1" runat="server" />
</asp:Content>

