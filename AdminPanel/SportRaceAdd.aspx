<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="SportRaceAdd.aspx.cs" Inherits="AdminPanel_SportRaceAdd" %>

<%@ Register src="AdminUserControl/SportRaceAdd.ascx" tagname="SportRaceAdd" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="../Scripts/PageMethod.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:SportRaceAdd ID="SportRaceAdd1" runat="server" />
</asp:Content>

