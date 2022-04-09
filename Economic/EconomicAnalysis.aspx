<%@ Page Title="" Language="C#" MasterPageFile="~/Economic/SubEconomic.master" AutoEventWireup="true" CodeFile="EconomicAnalysis.aspx.cs" Inherits="Economic_EconomicAnalysis" %>

<%@ Register src="../UserControl/EconomicAnalysis.ascx" tagname="EconomicAnalysis" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/CSSSubEconomicMaster.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSEco_Analysis.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSEco_Login.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSStxtLogin.css" rel="stylesheet" type="text/css" /> 
    <script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.panelgallery-2.0.0.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="Content_ecoSimpleMenu">
    <ul>
        <li><a href="../Home.aspx">صفحه نخست سایت</a></li>
        <li><a href="EconomicHome.aspx">برگشت به صفحه اقتصاد</a></li>
        <li><a class="btnContactUs" style="cursor:pointer">تماس با ما</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <uc1:EconomicAnalysis ID="EconomicAnalysis1" runat="server" />
</asp:Content>
<asp:Content ID="Content4" runat="server" contentplaceholderid="titrHeader">
    <div class="ecoAnalysis_Titr">
        تحلیل های اقتصادی هفته برگرفته از مطبوعات معتبر جهان 
    </div>
</asp:Content>
