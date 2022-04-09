<%@ Page Title="" Language="C#" MasterPageFile="~/Economic/SubEconomic.master" AutoEventWireup="true" CodeFile="EconomicPartnership.aspx.cs" Inherits="Economic_EconomicPartnership" %>

<%@ Register src="../UserControl/EconomicPartnership.ascx" tagname="EconomicPartnership" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/CSSEco_Login.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSStxtLogin.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSSubEconomicMaster.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSEco_Partnership.css" rel="stylesheet" type="text/css" />    
    <link href="../Styles/CSSEco_ArticleMarket.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSEco_ArticleOrder.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSEco_Bongah.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSEco_BongahOrder.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/ChromeGridView.css" rel="stylesheet" type="text/css" />
  
    <link href="../Styles/Common.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/ui-lightness/jquery-ui-1.8.5.custom.css" rel="stylesheet" type="text/css" />

    <script src='<%=ResolveUrl("~/Scripts/jquery-1.4.4.js")%>' type="text/javascript"></script>
    <script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>   
    <script src="../Scripts/jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>
    <script src='<%=ResolveUrl("~/Scripts/PageMethod.js")%>' type="text/javascript"></script>    
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="Content_ecoSimpleMenu">
    <ul>
        <li><a href="../Home.aspx">صفحه نخست سایت</a></li>
        <li><a href="EconomicHome.aspx">برگشت به صفحه اقتصاد</a></li>
        <li><a href="../ContactWithUs.aspx">تماس با ما</a></li>
    </ul>    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EconomicPartnership ID="EconomicPartnership1" runat="server" />
</asp:Content>




