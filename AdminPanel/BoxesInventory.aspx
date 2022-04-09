<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="BoxesInventory.aspx.cs" Inherits="AdminPanel_BoxesInventory" %>
<%@ Register src="AdminUserControl/BoxesInventory.ascx" tagname="BoxesInventory" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../Scripts/PageMethod.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
    <script src="../Scripts/MoneyFormat.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:BoxesInventory ID="BoxesInventory1" runat="server" />
</asp:Content>

