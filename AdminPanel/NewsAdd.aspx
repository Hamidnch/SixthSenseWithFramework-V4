<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="NewsAdd.aspx.cs" Inherits="AdminPanel_NewsAdd" ValidateRequest="false" %>

<%@ Register src="AdminUserControl/NewsAdd.ascx" tagname="NewsAdd" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="ckeditor/ckeditor.js" type="text/javascript"></script>
<%--    <script src="../Scripts/PageMethod.js" type="text/javascript"></script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:NewsAdd ID="NewsAdd1" runat="server" />
</asp:Content>

