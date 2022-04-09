<%@ Page Title="" Language="C#" MasterPageFile="~/Sport/Sport.master" AutoEventWireup="true" CodeFile="Sport_InputRacing.aspx.cs" Inherits="Sport_Sport_InputRacing" %>
<%@ Register src="../UserControl/SportHorizMenu.ascx" tagname="SportHorizMenu" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/CSSSportMaster.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSSport_Login.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSStxtLogin.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSSport_HorizMenu.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSSport_InputRacing.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server"><uc2:SportHorizMenu ID="SportHorizMenu1" runat="server" /></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--<uc1:SportInputRacing ID="SportInputRacing1" runat="server" />--%>
<div><asp:Button ID="btn_Lows" runat="server" Text="قوانین مسابقات" CssClass="sport_btnInputRacing" PostBackUrl="~/Sport/Sport_Lows.aspx" CausesValidation="False" /><asp:Button ID="btn_InputRacing" runat="server" Text="شرکت در مسابقات" CssClass="sport_btnInputRacing" CausesValidation="False" Enabled="False" PostBackUrl="~/Sport/Sport_SelectRacing.aspx" /></div>
</asp:Content>

