<%@ Page Title="" Language="C#" MasterPageFile="~/Economic/SubEconomic.master" AutoEventWireup="true" CodeFile="EconomicServices.aspx.cs" Inherits="Economic_EconomicServices" %>

<%@ Register src="../UserControl/EconomicServices.ascx" tagname="EconomicServices" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/CSSSubEconomicMaster.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSEco_Services.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSEco_Login.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSStxtLogin.css" rel="stylesheet" type="text/css" />

    <link href="../Styles/Common.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/ui-lightness/jquery-ui-1.8.5.custom.css" rel="stylesheet" type="text/css" />

    <script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>    
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="Content_ecoSimpleMenu">
    <ul>
        <li><a href="../Home.aspx">صفحه نخست سایت</a></li>
        <li><a href="EconomicHome.aspx">برگشت به صفحه اقتصاد</a></li>
        <li><a>تماس با ما</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" runat="server" contentplaceholderid="titrHeader">
    <div class="ecoServises_Titr">
        بخش خدمات اقتصادی
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <uc1:EconomicServices ID="EconomicServices1" runat="server" />
</asp:Content>








