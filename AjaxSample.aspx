<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AjaxSample.aspx.cs" Inherits="AjaxTest" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            background-color: #0d0402; 
        }
        a{ color:#666; }
        a:hover{ color:#f0f0f0; text-decoration:none;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableHistory="true" EnablePartialRendering="true" EnablePageMethods="false">
    </asp:ScriptManager>
    <div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

        <asp:TextBoxWatermarkExtender ID="TextBox1_TextBoxWatermarkExtender" 
            runat="server" Enabled="True" TargetControlID="TextBox1" WatermarkText="نام">
        </asp:TextBoxWatermarkExtender>
        <br />
        <br />

        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <asp:TextBoxWatermarkExtender ID="TextBox2_TextBoxWatermarkExtender" 
            runat="server" Enabled="True" TargetControlID="TextBox2" 
            WatermarkText="نام خانوادگی">
        </asp:TextBoxWatermarkExtender>
        <br />
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    </div>
    <div>
        <a href="">Hamid N.CH</a>
        <a href="">Hamid N.CH</a>
        <a href="">Hamid N.CH</a>
    </div>
    </form>
</body>
</html>
