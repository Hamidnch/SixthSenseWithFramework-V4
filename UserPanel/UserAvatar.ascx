<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserAvatar.ascx.cs" Inherits="UserPanel_UserAvatar" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<style type="text/css">
    .loading
    {
        color: White;
        position: absolute;
        left: 250px;
        top: 100px;
        z-index: 500;
    }
</style>
<div id="load" align="center" style="display: none" class="loading">
    <img src="../Images/loading.gif" alt="در حال انجام" width="200" height="200" />
    درحال پردازش اطلاعات
</div>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<div style="font-family: Tahoma; color: #fff; direction: rtl;">
    <table style="width: 100%; height: 216px; line-height: 40px" class="table">
        <tr>
            <td align="right" dir="rtl" style="padding-right: 5px; margin-right: 5px; width: 542px;">
                <br />
                <asp:TextBox ID="txtUserName" runat="server" Width="253px" CssClass="txt" ForeColor="Lime"
                    ReadOnly="true" BackColor="#222222" Visible="false"></asp:TextBox>
                <cc1:AsyncFileUpload ID="fuPicture" runat="server" UploadingBackColor="Yellow" ThrobberID="loading"
                    OnUploadedComplete="fuPicture_UploadedComplete" />
                <br />
            </td>
            <td align="center">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Image ID="imgUser" runat="server" Height="156px" Width="155px" BorderStyle="None" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="fuPicture" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 116px;">
            </td>
            <td style="width: 416px" align="center">
                <asp:Label ID="lblPictureMsg" runat="server" Font-Bold="True" ForeColor="Yellow"></asp:Label>
            </td>
        </tr>
    </table>
</div>