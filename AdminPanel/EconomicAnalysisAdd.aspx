<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPanel/Admin.master" AutoEventWireup="true" CodeFile="EconomicAnalysisAdd.aspx.cs" Inherits="AdminPanel_EconomicAnalysisAdd" %>

<%@ Register src="AdminUserControl/EconomicAnalysisAdd.ascx" tagname="EconomicAnalysisAdd" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="ckeditor/ckeditor.js" type="text/javascript"></script>    
    <script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">       
      

      
    <uc1:EconomicAnalysisAdd ID="EconomicAnalysisAdd1" runat="server" />
      

      
</asp:Content>

