<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="RSSManagement.aspx.cs" Inherits="AdminPanel_RSSManagement" %>

<%@ Register src="AdminUserControl/RSSManagement.ascx" tagname="RSSManagement" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="AdminStyls/CSSGrid.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>    
    <script src="../Scripts/jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:RSSManagement ID="RSSManagement1" runat="server" />
</asp:Content>

