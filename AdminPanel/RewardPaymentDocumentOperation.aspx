<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="RewardPaymentDocumentOperation.aspx.cs" Inherits="AdminPanel_RewardPaymentDocumentOperation" %>

<%@ Register src="AdminUserControl/RewardPaymentDocumentOperation.ascx" tagname="RewardPaymentDocumentOperation" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="AdminStyls/CSSMainAdmin.css" rel="stylesheet" type="text/css" />
    <link href="AdminStyls/CSSGrid.css" rel="stylesheet" type="text/css" />
    <link href="AdminStyls/Modal/smoothness/jquery-ui-1.8.5.custom.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
    <script src="../Scripts/PageMethod.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.table.addrow.js" type="text/javascript"></script>
    <script src="../Scripts/OnlyNumber.js" type="text/javascript"></script>
    <script src="../Scripts/PrintDocument.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:RewardPaymentDocumentOperation ID="RewardPaymentDocumentOperation1" 
        runat="server" />
</asp:Content>

