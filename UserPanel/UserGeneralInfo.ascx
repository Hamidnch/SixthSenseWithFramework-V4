<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserGeneralInfo.ascx.cs" Inherits="UserPanel_UserGeneralInfo" %>
<script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
<script src="../Scripts/PageMethod.js" type="text/javascript"></script>
<style type="text/css">.loading{color: White;position:absolute;left:250px;top:100px;z-index:500}</style>
<script type="text/javascript" language="javascript">
    $(document).ready(function ()
    {
        $("#btn_RegisterGeneralInfo").click(function ()
        {
            var userName = $("[id$='txtUserName']").val();
            var accountName = $("[id$='txtAccountName']").val();
            var accountFamily = $("[id$='txtAccountFamily']").val();
            var accountNumber = $("[id$='txtAccountNumber']").val();
            var bankName = $("[id$='ddlBankName']").val();
            var webSite = $("[id$='txtWebSite']").val();
            var yahooID = $("[id$='txtYahooID']").val();
            var comment = $("[id$='txtComment']").val();

            var lblMsg = $('#<%=lblAccountInfoMsg.ClientID %>');

            $('#load').fadeIn();
            $.PageMethod('InsertAccountInfo', onSuccess, onFail, 'accountName', accountName, 'accountFamily', accountFamily,
                'accountNumber', accountNumber, 'bankName', bankName, 'webSite', webSite,
                'yahooID', yahooID, 'comment', comment, 'userName', userName);
            function onSuccess(response)
            {
                $('#load').fadeOut();
                lblMsg.html(response.d);
            }
            function onFail(response)
            {
                $('#load').fadeOut();
                alert("خطای مقابل به وقوع پیوست : " + response.d);
            }
        });
    });
</script>
<div id="load" align="center" style="display: none" class="loading"><img src="../Images/AjaxImages/loading_User.gif" alt="در حال انجام" width="200" height="200" /></div>
<div style="font-family:Tahoma;color:#fff; direction:rtl">
    <table style="width: 100%">
        <tr>
            <td align="right" dir="rtl" 
                style="padding-right: 5px; margin-right: 5px; width: 133px;">
                <asp:Label ID="lblFirstName3" runat="server" Text="نام کاربری"></asp:Label>
            </td>
            <td align="right">
                <asp:TextBox ID="txtUserName" runat="server" Width="253px" CssClass="txt" ForeColor="Lime"
                    ReadOnly="true" BackColor="#222222"></asp:TextBox>
            </td>
        </tr>        
        <tr>
            <td align="right" dir="rtl" style="padding-right: 5px; margin-right: 5px; width: 133px;">
                <asp:Label ID="Label19" runat="server" Text="نام صاحب حساب"></asp:Label>
            </td>
            <td style="width: 416px;" align="right" dir="rtl">
                <asp:TextBox ID="txtAccountName" runat="server" Width="253px" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" dir="rtl" style="padding-right: 5px; margin-right: 5px; width: 133px;">
                <asp:Label ID="Label14" runat="server" Text="نام خانوادگی"></asp:Label>
            </td>
            <td style="width: 416px" align="right" dir="rtl">
                <asp:TextBox ID="txtAccountFamily" runat="server" Width="253px" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 133px;">
                <asp:Label ID="Label10" runat="server" Text="شماره حساب بانکی"></asp:Label>
            </td>
            <td style="width: 416px" align="right" dir="rtl">
                <asp:TextBox ID="txtAccountNumber" runat="server" Width="253px" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 133px;">                            
                <asp:Label ID="Label18" runat="server" Text="نام بانک"></asp:Label>                            
            </td>
            <td style="width: 416px" align="right" dir="rtl">
                <asp:DropDownList ID="ddlBankName" runat="server"
                    TabIndex="20" Width="253px" Font-Names="Tahoma" CssClass="ddl">
                    <asp:ListItem>سیبای ملی</asp:ListItem>
                    <asp:ListItem>سپهر صادرات</asp:ListItem>
                    <asp:ListItem>جام ملت</asp:ListItem>
                    <asp:ListItem>مهر کشاورزی</asp:ListItem>
                    <asp:ListItem>بانک سپه</asp:ListItem>
                    <asp:ListItem>بانک تجارت</asp:ListItem>
                    <asp:ListItem>بانک سامان</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 133px;">                            
                <asp:Label ID="Label21" runat="server" Text="آدرس سایت"></asp:Label>                            
            </td>
            <td style="width: 416px" align="right" dir="rtl">
                <asp:TextBox ID="txtWebSite" runat="server" Width="253px" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 133px;">
                <asp:Label ID="Label15" runat="server" Text="آیدی یاهو"></asp:Label>
            </td>
            <td style="width: 416px" align="right" dir="rtl">
                <asp:TextBox ID="txtYahooID" runat="server" Width="253px" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 133px;">
                <asp:Label ID="Label20" runat="server" Text="امضا"></asp:Label>
            </td>
            <td style="width: 416px" align="right" dir="rtl">
                <asp:TextBox ID="txtComment" runat="server" Width="253px" CssClass="txt" 
                    Height="55px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 133px;">
                <input type="button" id="btn_RegisterGeneralInfo" class="btn" value="ثبت"/>
            </td>
            <td style="width: 416px" align="center">
                <asp:Label ID="lblAccountInfoMsg" runat="server" Font-Bold="True" 
                    ForeColor="Lime"></asp:Label>
            </td>
        </tr>
    </table>
</div>