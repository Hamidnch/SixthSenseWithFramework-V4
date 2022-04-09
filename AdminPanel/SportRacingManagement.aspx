<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="SportRacingManagement.aspx.cs" 
        Inherits="AdminPanel_SportRacingManagement" EnableEventValidation="false" Async="true" %>

<%--<%@ Register src="AdminUserControl/SportRacingManagement.ascx" tagname="SportRacingManagement" tagprefix="uc1" %>--%>

<%@ Register src="AdminUserControl/SportRacingManagement.ascx" tagname="SportRacingManagement2" tagprefix="uc1" %>

<%--<%@ Register src="AdminUserControl/SportRacingManagement1.ascx" tagname="SportRacingManagement1" tagprefix="uc1" %>--%>


<%--<%@ Register src="AdminUserControl/SportRacingManagement.ascx" tagname="SportRacingManagement" tagprefix="uc1" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="AdminStyls/CSSMainAdmin.css" rel="stylesheet" type="text/css" />
    <link href="AdminStyls/CSSGrid.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
    <script src="../Scripts/CustomBlockUI.js" type="text/javascript"></script>
    <script src="../Scripts/OnlyNumber.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--        <uc1:SportRacingManagement ID="SportRacingManagement1" runat="server" />--%>
<%--<uc1:SportRacingManagement1 ID="SportRacingManagement11" runat="server" />--%>
    <%--<uc2:SportRacingManagement ID="SportRacingManagement1" runat="server" />--%>
    <uc1:SportRacingManagement2 ID="SportRacingManagement21" runat="server" />
    <%--<uc1:SportRacingManagement ID="SportRacingManagement1" runat="server" />--%>
</asp:Content>

