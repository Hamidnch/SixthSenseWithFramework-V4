<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserContactInfo.ascx.cs" Inherits="UserPanel_UserContactInfo" %>
<script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
<script src="../Scripts/PageMethod.js" type="text/javascript"></script>
<style type="text/css">.loading{color: White;position:absolute;left:250px;top:100px;z-index:500;}</style>
<script type="text/javascript" language="javascript">
    $(document).ready(function ()
    {
        $("#btnContactInfoRegister").click(function ()
        {
            var userName = $("[id$='txtUserName']").val();
            var phone = $("[id$='txtPhone']").val();
            var mobile = $("[id$='txtMobile']").val();
            var address = $("[id$='txtAddress']").val();
            var country = $("[id$='ddlCountry']").val();
            var city = $("[id$='ddlCity']").val();

            var lblMsg = $('#<%=lblContactInfoMsg.ClientID %>');
            lblMsg.html("");
            $('#load').fadeIn();
            $.PageMethod('InsertContactInfo', onSuccess, onFail, 'phone', phone, 'mobile', mobile,
                'address', address, 'country', country, 'city', city, 'userName', userName);
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
<div id="load" align="center" style="display: none" class="loading">
    <img src="../Images/AjaxImages/loading_User.gif" alt="در حال انجام" width="200" height="200" />
    درحال پردازش اطلاعات
</div>
<div  style="font-family:Tahoma;color:#fff; direction:rtl;">
    <table style="width: 100%; height: 385px;" class="table">
        <tr>
            <td align="right" dir="rtl" style="padding-right: 5px; margin-right: 5px; width: 91px;">
                <asp:Label ID="lblFirstName3" runat="server" Text="نام کاربری"></asp:Label>
            </td>
            <td align="right">
                <asp:TextBox ID="txtUserName" runat="server" Width="253px" CssClass="txt" ForeColor="Lime"
                    ReadOnly="true" BackColor="#222222"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" dir="rtl" style="padding-right: 5px; margin-right: 5px; width: 116px;">
                <asp:Label ID="Label1" runat="server" Text="شماره تلفن ثابت"></asp:Label>
            </td>
            <td style="width: 416px" align="right">
                <asp:TextBox ID="txtPhone" runat="server" Width="329px" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 116px;">
                <asp:Label ID="Label2" runat="server" Text="شماره همراه "></asp:Label>
            </td>
            <td style="width: 416px" align="right">
                <asp:TextBox ID="txtMobile" runat="server" Width="329px" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 116px;">
                <asp:Label ID="Label3" runat="server" Text="آدرس"></asp:Label>
            </td>
            <td style="width: 416px" align="right">
                <asp:TextBox ID="txtAddress" runat="server" Width="554px" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 116px;">
                <asp:Label ID="Label7" runat="server" Text="کشور"></asp:Label>
            </td>
            <td style="width: 416px" align="right">
                <asp:DropDownList ID="ddlCountry" runat="server" Width="216px" CssClass="ddl">
                    <asp:ListItem>ایران</asp:ListItem>
                    <asp:ListItem>خارج از ایران</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 116px;">
                <asp:Label ID="Label8" runat="server" Text="شهر"></asp:Label>
            </td>
            <td style="width: 416px" align="right">
                <asp:DropDownList ID="ddlCity" runat="server" Width="216px" CssClass="ddl">
                    <asp:ListItem>تهران</asp:ListItem>
                    <asp:ListItem>قزوین</asp:ListItem>
                    <asp:ListItem>شیراز</asp:ListItem>
                    <asp:ListItem>مشهد</asp:ListItem>
                    <asp:ListItem>اصفهان</asp:ListItem>
                    <asp:ListItem>اردبیل</asp:ListItem>
                    <asp:ListItem>تبریز</asp:ListItem>
                    <asp:ListItem>گیلان</asp:ListItem>
                    <asp:ListItem>اهواز</asp:ListItem>
                    <asp:ListItem>خوزستان</asp:ListItem>
                    <asp:ListItem>سیستان وبلوچستان</asp:ListItem>
                    <asp:ListItem>کهکلویه و بویراحمد</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 116px;">
                <input type="button" id="btnContactInfoRegister" class="btn" value="ثبت"/>
            </td>
            <td style="width: 416px" align="center">
                <asp:Label ID="lblContactInfoMsg" runat="server" Font-Bold="True" 
                    ForeColor="Lime"></asp:Label>
            </td>
        </tr>
    </table>
</div>