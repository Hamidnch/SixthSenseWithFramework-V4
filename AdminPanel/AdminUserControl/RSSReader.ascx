<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RSSReader.ascx.cs" Inherits="AdminPanel_AdminUserControl_RSSReader" %>
<link href="../AdminStyls/CSSMainAdmin.css" rel="stylesheet" type="text/css" />
<fieldset>
    <legend style="color: #66FF33">افزودن خبر RSS</legend>
    <div class="input_field">
        <label>
            تاریخ امروز:
        </label>
        <asp:Label ID="lblDate" CssClass="field_desc" runat="server" Text="Today Date"></asp:Label>
    </div>
    <div class="input_field">
        <label>
            موضوع اخبار:
        </label>
        <asp:TextBox ID="txt_RSSSubject" CssClass="customTxt medium" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ErrorMessage="موضوع خبر را وارد نمائید" ControlToValidate="txt_RSSSubject" 
            ForeColor="Yellow"></asp:RequiredFieldValidator>
    </div>
    <div class="input_field">
        <label>
            لینک RSS اخبار:
        </label>
        <asp:TextBox ID="txt_RSSPath" CssClass="customTxt big" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ErrorMessage="مسیر RSSمورد نظرتان را وارد نمائید" 
            ControlToValidate="txt_RSSPath" ForeColor="Yellow"></asp:RequiredFieldValidator>
    </div>
    <div class="input_field no_margin_bottom">
        <asp:Button ID="btn_RSSLoad" CssClass="submit" runat="server" Text="ثبت خبر" 
            onclick="btn_RSSLoad_Click" />
        <asp:Button ID="btn_Exit" CssClass="submit" runat="server" Text="بستن" 
            CausesValidation="False" UseSubmitBehavior="False" />
    </div>
    <div class="error">
        <asp:Label ID="lbl_Message" runat="server"></asp:Label>
    </div>
</fieldset>
