<%@ Page Title="" Language="C#" MasterPageFile="~/Sport/Sport.master" AutoEventWireup="true" CodeFile="Sport_ClassificationTable.aspx.cs" Inherits="Sport_Sport_ClassificationTable" %>
<%@ Register src="../UserControl/SportMenu.ascx" tagname="SportMenu" tagprefix="uc1" %>
<%@ Register src="../UserControl/SportClassificationTable.ascx" tagname="SportClassificationTable" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/CSSSportMaster.css" rel="stylesheet" type="text/css" /><link href="../Styles/CSSSport_Login.css" rel="stylesheet" type="text/css" /><link href="../Styles/CSStxtLogin.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSSport_Titles.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSSport_HorizMenu.css" rel="stylesheet" type="text/css" /><script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <div class="RacingTitlesTitr">جدول رده بندی</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <uc1:SportMenu ID="SportMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc2:SportClassificationTable ID="SportClassificationTable1" runat="server" />
</asp:Content>

