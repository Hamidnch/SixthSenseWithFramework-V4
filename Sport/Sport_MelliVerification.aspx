<%@ Page Title="" Language="C#" MasterPageFile="~/Sport/SportPayment.master" AutoEventWireup="true" CodeFile="Sport_MelliVerification.aspx.cs" Inherits="Sport_Sport_MelliVerification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/CSSSportMaster.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSSport_Login.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSStxtLogin.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSSport_HorizMenu.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    
    <table style="width: 100%;color:White">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="txt_fp_sequence"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_fp_sequence" runat="server">512</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="txt_fp_timestamp"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_fp_timestamp" runat="server">1303531355</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="txt_amount"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_amount" runat="server">35000</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="txt_currency_code"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_currency_code" runat="server">Rial</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="txt_fp_hash"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_fp_hash" runat="server" Height="20px" Width="282px">8058f1c950cee5c985e2da8445e8b3ed</asp:TextBox>
            </td>
        </tr>
    </table>
    <br />
    <asp:Label ID="Label6" ForeColor="Yellow" runat="server" Text="Label"></asp:Label><asp:TextBox ID="TextBox1"
        runat="server"></asp:TextBox>
    <asp:Label ID="Label7" ForeColor="Yellow" runat="server" Text="Label"></asp:Label><asp:TextBox
        ID="TextBox2" runat="server"></asp:TextBox>
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><asp:TextBox ID="TextBox4"
        runat="server"></asp:TextBox><asp:TextBox ID="TextBox5" runat="server"></asp:TextBox><asp:TextBox
            ID="TextBox6" runat="server"></asp:TextBox><asp:TextBox ID="TextBox7" runat="server"></asp:TextBox><asp:TextBox
                ID="TextBox8" runat="server"></asp:TextBox><asp:TextBox ID="TextBox9" runat="server"></asp:TextBox><asp:TextBox
                    ID="TextBox10" runat="server"></asp:TextBox><asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
        <br />
    <asp:Button ID="btn_Verify" runat="server" Text="Verification"  OnClick="btn_Verify_Click" />
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />
</asp:Content>

