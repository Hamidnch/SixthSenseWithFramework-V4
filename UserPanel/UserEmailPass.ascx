<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserEmailPass.ascx.cs" Inherits="UserPanel_UserEmailPass" %>
<script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
<script src="../Scripts/PageMethod.js" type="text/javascript"></script>
<style type="text/css">.loading{color: White;position:absolute;left:250px;top:100px;z-index:500;}</style>
<script type="text/javascript" language="javascript">
    $(document).ready(function ()
    {
        $('#btnEmailPassChange').click(function ()
        {
            var userName = $("[id$='txtUserName']").val();
            var CurrentPassword = $("[id$='txtCurrentPassword']").val();
            var newPass = $("[id$='txtnewPassword']").val();
            var dupNewPassword = $("[id$='txtdupNewPassword']").val();
            var newEmail = $("[id$='txtnewEmail']").val();
            var dupNewEmail = $("[id$='txtdupNewEmail']").val();
            var currentEmail = $("[id$='txtCurrentEmail']").val();
            var lblMsg = $('#<%=lblEmailPassMsg.ClientID %>');
            lblMsg.html("");
            if (CurrentPassword == "")
            {
                lblMsg.css("color", "#ffcc00");
                lblMsg.html("کلمه عبور قبلیتان را وارد نمائید");
                $('#<%= txtCurrentPassword.ClientID %>').focus();
                return;
            }
            if (newPass == "")
            {
                lblMsg.css("color", "#ffcc00");
                lblMsg.html("کلمه عبور جدید را وارد نمائید");
                $('#<%= txtnewPassword.ClientID %>').focus();
                return;
            }
            if (dupNewPassword == "")
            {
                lblMsg.css("color", "#ffcc00");
                lblMsg.html("تکرار کلمه عبور جدید را وارد نمائید");
                $('#<%= txtdupNewPassword.ClientID %>').focus();
                return;
            }
            if (newPass.length < 5)
            {
                lblMsg.css("color", "#ffcc00");
                lblMsg.html("طول کلمه عبور حداقل باید 5 کاراکتر باشد");
                return;
            }
            if (newPass != dupNewPassword)
            {
                lblMsg.css("color", "#ffcc00");
                lblMsg.html("کلمه عبور با تکرارش مطابقت ندارد");
                return;
            }
            if (newEmail == "")
            {
                lblMsg.css("color", "#ffcc00");
                lblMsg.html("ایمیل را وارد نمائید");
                $('#<%= txtnewEmail.ClientID %>').focus();
                return;
            }
            if (dupNewEmail == "")
            {
                lblMsg.css("color", "#ffcc00");
                lblMsg.html("تکرار ایمیل را وارد نمائید");
                $('#<%= txtdupNewEmail.ClientID %>').focus();
                return;
            }
            if (newEmail != dupNewEmail)
            {
                lblMsg.css("color", "#ffcc00");
                lblMsg.html("ایمیل با تکرارش مطابقت ندارد");
                return;
            }

            $('#load').fadeIn();
            $.PageMethod('InsertEmailPassInfo', onSuccess, onFail, 'currentPassword', CurrentPassword, 'currentEmail', currentEmail,
                                            'newPass', newPass, 'newEmail', newEmail, 'userName', userName);
            function onSuccess(response)
            {
                var result = response.d;
                {
                    $('#load').fadeOut();
                    lblMsg.css("color", "lime");
                    lblMsg.html(result);
                }
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
<div style="font-family:Tahoma;color:#fff; direction:rtl;">
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
            <td align="right" dir="rtl" style="padding-right: 5px; margin-right: 5px; width: 95px;
                height: 22px;">
                <asp:Label ID="Label12" runat="server" Text="کلمه عبور قبلی"></asp:Label>
            </td>
            <td style="height: 22px" align="right">
                <asp:TextBox ID="txtCurrentPassword" runat="server" Width="210px" CssClass="txt"
                    TextMode="Password"></asp:TextBox>
                <%--<asp:Label ID="Label18" runat="server" Text="Label"></asp:Label>--%>
            </td>
        </tr>
        <tr valign="top">
            <td align="right" dir="rtl" style="padding-right: 5px; margin-right: 5px; height: 100px;"
                colspan="2">
                <fieldset id="fspassword" runat="server" style="height: 118px">
                    <legend id="legend1" runat="server" style="border: 1px solid white; width: 180px;font-size:10px;
                        height: 30px;">&nbsp; ویرایش کلمه عبور(اختیاری)</legend>
                    <div style="height: 42px; margin-top: 10px">
                        &nbsp;&nbsp;
                        <asp:Label ID="Label17" runat="server" Text="رمز عبور جدید"></asp:Label>
                        &nbsp;&nbsp;
                        <asp:TextBox ID="txtnewPassword" runat="server" Width="210px" CssClass="txt" TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ControlToCompare="txtdupNewPassword" ControlToValidate="txtnewPassword" 
                            ErrorMessage="رمز عبور و تکرارش مطابقت ندارد" ForeColor="Yellow">رمز عبور و تکرارش مطابقت ندارد</asp:CompareValidator>
                    </div>
                    <div>
                        &nbsp;&nbsp;
                        <asp:Label ID="Label4" runat="server" Text="تکرار رمز عبور"></asp:Label>
                        &nbsp; &nbsp;
                        <asp:TextBox ID="txtdupNewPassword" runat="server" Width="210px" CssClass="txt" TextMode="Password"></asp:TextBox>
                    </div>
                </fieldset>
            </td>
        </tr>
        <tr valign="top">
            <td align="right" dir="rtl" style="padding-right: 5px; margin-right: 5px;" colspan="2">
                <fieldset id="Fieldset1" runat="server" style="margin-top: 25px">
                    <legend id="legend2" runat="server" style="border: 1px solid white; width: 180px;font-size:10px;
                        height: 30px;">&nbsp; ویرایش آدرس ایمیل(اختیاری)</legend>
                    <div style="height: 41px">
                        &nbsp;&nbsp;
                        <asp:Label ID="Label5" runat="server" Text="آدرس ایمیل جدید"></asp:Label>
                        &nbsp;&nbsp;
                        <asp:TextBox ID="txtnewEmail" runat="server" Width="210px" CssClass="txt"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" 
                            ControlToCompare="txtdupNewEmail" ControlToValidate="txtnewEmail" 
                            ErrorMessage="ایمیل و تکرارش مطابقت ندارد" ForeColor="Yellow">ایمیل و تکرارش مطابقت ندارد</asp:CompareValidator>
                        <span id="emailSpan"></span>
                    </div>
                    <div style="height: 33px">
                        &nbsp;&nbsp;
                        <asp:Label ID="Label6" runat="server" Text="تکرار آدرس ایمیل"></asp:Label>
                        &nbsp; &nbsp;
                        <asp:TextBox ID="txtdupNewEmail" runat="server" Width="210px" CssClass="txt"></asp:TextBox>
                    </div>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 116px;">
                <input type="button" id="btnEmailPassChange" class="btn" value="ثبت"/>
            </td>
            <td style="width: 416px" align="center">
                <asp:Label ID="lblEmailPassMsg" runat="server" Font-Bold="True" 
                    ForeColor="Lime"></asp:Label>
                    <br />
                        <input type="text" ID="txtCurrentEmail" class="txt" readonly="readonly" style="display:none" runat="server" />
            </td>
        </tr>
    </table>                        
</div>