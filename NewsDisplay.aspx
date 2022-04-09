<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="NewsDisplay.aspx.cs" Inherits="NewsDisplay" %>

<%@ Register src="UserControl/NewsDisplay.ascx" tagname="NewsDisplay" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link href="Styles/CSSNewsDisplay.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="newsbody">
       <uc1:NewsDisplay ID="NewsDisplay1" runat="server" />
    </div>
</asp:Content>

