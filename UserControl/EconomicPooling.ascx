<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EconomicPooling.ascx.cs" Inherits="UserControl_EconomicPooling" %>
<link href="../Styles/CSSEco_Pooling.css" rel="stylesheet" type="text/css" />
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>        
        <div class="pooling">    
            <table style="width: 102%">
                <tr>
                    <td style="width: 206px; height: 33px;">
            <asp:Label ID="Label1" runat="server" Text="نام شما" CssClass="lbl"></asp:Label>
                    </td>
                    <td style="height: 33px; width: 507px">
            <asp:TextBox ID="txt_PoolingName" runat="server" Height="22px" Width="247px" 
                CssClass="txt" ontextchanged="txt_PoolingName_TextChanged"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txt_PoolingName" ErrorMessage="نام خود را وارد نمائید" 
                            ForeColor="#FFFF66" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                    <td style="height: 33px">
                        </td>
                </tr>
                <tr>
                    <td style="width: 206px" rowspan="2">
            <asp:Label ID="Label2" runat="server" Text="نظر شما" CssClass="lbl"></asp:Label>

                    </td>
                    <td rowspan="2" style="width: 507px">
            <asp:TextBox ID="txt_poolingComment" runat="server" Height="105px" TextMode="MultiLine" 
                Width="472px" CssClass="txt" ontextchanged="txt_PoolingName_TextChanged"></asp:TextBox>

                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="padding-top: 40px">
            <asp:Button ID="btn_InsertPooling" CssClass="btn" runat="server" Text="ثبت نظر" 
                ForeColor="White" Height="27px" Width="67px" onclick="btn_InsertPooling_Click" />

                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="msg">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txt_poolingComment" ErrorMessage="نظر خود را وارد نمائید" 
                            ForeColor="#FFFF99"></asp:RequiredFieldValidator>
                       <asp:Label ID="lbl_Msg" runat="server" Visible="False"></asp:Label>
                    </td>
                    
                </tr>
            </table>
        </div>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btn_InsertPooling" EventName="Click" />
    </Triggers>
</asp:UpdatePanel>