﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LoginUserControl.ascx.cs" Inherits="UserControl_LoginUserControl" %>
<script src="../Scripts/css_browser_selector.js" type="text/javascript"></script>
<table id="loginPanel" runat="server" lang="fa" class="loginPanel"><tr><td style="width: 63px;" align="left"><span class="labelText">نام کاربری</span></td>
        <td align="right" style="width: 98px;"><asp:TextBox ID="txtUserName" runat="server" CausesValidation="True" CssClass="inputTxt" AutoCompleteType="Disabled" autocomplete="off"></asp:TextBox></td>
        <td style="width: 63px;" align="left"><span class="labelText">کلمه عبور</span></td><td align="right" style="width: 134px;"><asp:TextBox ID="txtPassword" runat="server" CssClass="inputTxt" TextMode="Password"></asp:TextBox></td>
        <td class="rememberMe"><input type="checkbox" id="chkRememberMe" runat="server" />مرا بخاطر بسپار</td><td align="right" style="width: 49px;"><asp:Image ID="Image3" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/Images/legend/go.png" /><asp:Button ID="lbLogin" runat="server" Text="ورود" CssClass="inputBtn" OnClick="lbLogin_Click" CausesValidation="false"/></td>
        <td align="center" class="forgetDiv" style=" width: 149px;"><asp:HyperLink ID="hlForgetPassword" runat="server" CssClass="forgetPassword" NavigateUrl="~/ForgetPassword.aspx" Font-Underline="False">رمز عبور را فراموش کرده اید؟</asp:HyperLink></td><td align="left" style="width: 72px;" valign="middle"><asp:Image ID="Image2" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/Images/legend/membership.png" />
        <asp:HyperLink ID="hlRegister" runat="server" CssClass="register" NavigateUrl="~/UserRegisteration.aspx">عضویت</asp:HyperLink></td><td align="center"></td></tr><tr><td style="height: 28px;" colspan="4" align="center" valign="top" dir="rtl"><asp:Label ID="lblMessage" runat="server" ForeColor="Yellow" Font-Bold="False" Font-Italic="False" Font-Names="Tahoma" Font-Size="10px"></asp:Label></td><td style="height: 28px;" colspan="4" valign="top" align="center" dir="rtl"><asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="SingleParagraph" EnableViewState="False" ForeColor="Yellow" Width="249px" /></td><td align="left" dir="rtl" lang="fa" valign="top">&nbsp;</td></tr></table>
<table id="welcomePanel" style="width: 100%; height: 46px;" runat="server" visible="false" class="welcome"><tr><td style="font-family: Tahoma; font-size: 12px; height: 29px; width: 1958px; text-align: center;" class="simpleText"> کاربر گرامی
        <asp:Label ID="lbl_UserLoggedin" runat="server" CssClass="userLoggedin" Font-Bold="True"></asp:Label>&nbsp;خوش آمدید&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblLastLoginDate" runat="server" Font-Size="10px"></asp:Label></td><td style="width: 362px;" class="simpleText"><asp:Image ID="Image1" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/Images/legend/profile.png" /><asp:LinkButton ID="lbUserProfile" runat="server" OnClick="lbUserProfile_Click" CssClass="userSetting" CausesValidation="False">تنظیمات کاربری</asp:LinkButton></td><td>
        <asp:LinkButton ID="lb_Logout" CssClass="logout" runat="server" PostBackUrl="~/Home.aspx" onclick="lb_Logout_Click" CausesValidation="False">خروج</asp:LinkButton></td></tr></table>
