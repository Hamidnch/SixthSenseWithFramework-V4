<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Economic_Default" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
    <script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>
    <script src="../Scripts/PageMethod.js" type="text/javascript"></script>    
</head>
<body>
    <form id="form1" runat="server">
    <div class="ecoPartnership_mainContent">
        <div id="screen">
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
<%--        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>--%>
                <div>
                    <asp:Button ID="btn_Bongah" runat="server" Text="بورس املاک و بنگاههای اقتصادی" CssClass="button"
                        OnClick="btn_Bongah_Click" CausesValidation="False" />
                    <asp:Button ID="btn_Article" runat="server" Text="بورس کالا" CssClass="button" OnClick="btn_Article_Click"
                        CausesValidation="False" />
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="500">
                        <ProgressTemplate>
                            <img src="../Images/ajaxImages/loading.gif" style="height: 29px; width: 250px; padding-top: 10px" />
                            <span style="color: White; font-family: Tahoma">در حال بارگذاری ....</span>
                            <div id="screen">
                            </div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </div>
                <div id="UC_Container">
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                </div>
<%--            </ContentTemplate>
        </asp:UpdatePanel>--%>
    </div>
    </form>
</body>
</html>
