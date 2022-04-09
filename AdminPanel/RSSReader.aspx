<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="RSSReader.aspx.cs" Inherits="AdminPanel_RSSReader" %>

<%@ Register src="AdminUserControl/RSSReader.ascx" tagname="RSSReader" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:RSSReader ID="RSSReader1" runat="server" />
</asp:Content>

