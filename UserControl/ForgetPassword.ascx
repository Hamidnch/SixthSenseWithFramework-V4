<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ForgetPassword.ascx.cs" Inherits="UserControl_ForgetPassword" %>
<link href="../Styles/CSSForgetPassword.css" rel="stylesheet" type="text/css" />
<div id="headerForget">
 بازیابی پسورد شما
</div>
<div id="titrForget">
    برای دریافت کلمه عبور ایمیلتان را وارد نمائید تا کلمه عبور جدید به ایمیل شما ارسال گردد
</div> 
<div id="contentForget">
ایمیل:&nbsp;&nbsp;&nbsp;&nbsp; 
    <asp:TextBox ID="txtEmail" runat="server" Width="475px" CssClass="txtForget"></asp:TextBox>
            <asp:RegularExpressionValidator ID="regExpValEmail" runat="server" ControlToValidate="txtEmail"
                ErrorMessage="ایمیل را صحیح وارد نمایید" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
</div>  
<hr />
<div id="buttonForget">
    <asp:Button ID="btnSend" runat="server" Text="ارسال" Width="77px" 
        onclick="btnSend_Click" />
&nbsp;&nbsp;
    <asp:Label ID="lblResult" runat="server" ForeColor="#CC0000"></asp:Label>  
</div>

