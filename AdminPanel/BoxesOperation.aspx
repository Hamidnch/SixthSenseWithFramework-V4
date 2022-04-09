<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="BoxesOperation.aspx.cs" Inherits="AdminPanel_BoxesOperation" %>

<%@ Register src="AdminUserControl/BoxesOperation.ascx" tagname="BoxesOperation" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="AdminStyls/CSSMainAdmin.css" rel="stylesheet" type="text/css" />
    <link href="AdminStyls/Modal/ui-lightness/jquery-ui-1.8.5.custom.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:BoxesOperation ID="BoxesOperation1" runat="server" />
</asp:Content>

