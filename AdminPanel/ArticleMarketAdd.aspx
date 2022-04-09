<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="ArticleMarketAdd.aspx.cs" Inherits="AdminPanel_ArticleMarketAdd" %>

<%@ Register src="AdminUserControl/ArticleMarketAdd.ascx" tagname="ArticleMarketAdd" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="../Scripts/PageMethod.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ArticleMarketAdd ID="ArticleMarketAdd1" runat="server" />
</asp:Content>

