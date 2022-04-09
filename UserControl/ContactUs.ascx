<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ContactUs.ascx.cs" Inherits="UserControl_ContactUs" %>
<style type="text/css">#load { z-index: 1000;}</style>
<div class="contact_wrapper"><div class="contact_Top"></div>
<div class="contact_Middle"><div id="ContactUs">
<asp:Label ID="Label5" runat="server" Text="موضوع تماس" CssClass="label_field"></asp:Label>
<asp:DropDownList ID="ddl_Title" runat="server" CssClass="input_field"><asp:ListItem>عمومی</asp:ListItem><asp:ListItem>مسابقات فوتبال</asp:ListItem><asp:ListItem>بازیهای ورزشی</asp:ListItem></asp:DropDownList>
<asp:Label ID="Label1" runat="server" Text="نام شما" CssClass="label_field"></asp:Label>
<asp:TextBox ID="txt_author" CssClass="input_field" runat="server"></asp:TextBox>
<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_author" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
<asp:Label ID="Label2" runat="server" Text="ایمیل" CssClass="label_field"></asp:Label>
<asp:TextBox ID="txt_email" CssClass="input_field" runat="server"></asp:TextBox>
<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_email" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
<br />
<%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="ایمیل را درست وارد نمائید" ValidationExpression="^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$" ControlToValidate="txt_email" SetFocusOnError="True" ForeColor="Red"></asp:RegularExpressionValidator>--%>
<asp:Label ID="Label3" runat="server" Text="شماره تماس" CssClass="label_field"></asp:Label><asp:TextBox ID="txt_phone" CssClass="input_field phone" runat="server"></asp:TextBox>
<span style="color: Teal; text-align: left">اختیاری</span><asp:Label ID="Label4" runat="server" Text="متن پیام" CssClass="label_field"></asp:Label>
<asp:TextBox ID="txt_message" CssClass="Context_field"  TextMode="MultiLine" runat="server"></asp:TextBox>
<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_Message" ErrorMessage="*"></asp:RequiredFieldValidator>--%>
<div><asp:Label ID="lbl_Message" CssClass="msg" runat="server"></asp:Label></div></div></div>
<div class="contact_End"><input type="button" class="submit_btnSend" name="send" id="btn_ContactRegister" onclick="saveContactUS()" value=""/><input type="reset" class="submit_btnNew" name="reset" id="btn_ContactRest" value="" onclick="resetText()" /></div></div>
<script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
<script type="text/javascript">
    function resetText(){var txt_author = $("#<%= txt_author.ClientID %>");var txt_email = $("#<%= txt_email.ClientID %>");var txt_phone = $("#<%= txt_phone.ClientID %>");var txt_message = $("#<%= txt_message.ClientID %>");txt_author.val(""); txt_email.val("");txt_phone.val("");txt_message.val("");txt_author.focus();}
    function getContactPath() { return '<%= ContactPath %>'; } function getImagePath() { return '<%= ImagePath %>'; }
    //$('#btn_ContactRegister').click(function () {
    function saveContactUS(){var title = $("[id$='ddl_Title']").val();var author = $("[id$='txt_author']").val();
        var email = $("[id$='txt_email']").val();var phone = $("[id$='txt_phone']").val();var message = $("[id$='txt_message']").val();var contactPath = getContactPath();
        var imagePath = getImagePath();var lbl_Message = document.getElementById('<%=lbl_Message.ClientID %>');
        if (author == ""){lbl_Message.style.color = "Red";lbl_Message.innerHTML = 'نام خود را وارد نمائید';$("#<%= txt_author.ClientID %>").focus(); return;}
        if (email == ""){lbl_Message.style.color = "Red";lbl_Message.innerHTML = 'ایمیلتان را وارد نمائید';$("#<%= txt_email.ClientID %>").focus(); return;}
        if (phone == ""){lbl_Message.style.color = "Red";lbl_Message.innerHTML = 'شماره تماس خود را قید فرمائید';$("#<%= txt_phone.ClientID %>").focus(); return;}
        if (message == ""){lbl_Message.style.color = "Red";lbl_Message.innerHTML = 'متن تماس خود را وارد نمائید';$("#<%= txt_message.ClientID %>").focus(); return;}
        $.blockUI({ message: '<h1><img src="' + imagePath + '/ajaxImages/loading2.gif" /><br /> چند لحظه منتظر بمانيد...</h1>', fadeIn: 700, fadeOut: 700, showOverlay: true, centerY: true, centerX: true, css: {
            width: '500px', height: '600px', left: ($(window).width() - 500) / 2 + 'px', top: ($(window).height() - 200) / 2 + 'px', border: 'none', padding: '5px', backgroundColor: 'transparent', '-webkit-border-radius': '10px', '-moz-border-radius': '10px',
            opacity: .4, color: 'Black'}, overlayCSS: { backgroundColor: 'transparent', opacity: 0.4, border: '1px solid #000000', color: 'Black' }});
        $.ajax({type: "POST",url: contactPath + "/InsertContact",data: "{ title: '" + title + "',author: '" + author + "',email: '" + email + "',phone: '" + phone + "',message: '" + message + "'}",
            contentType: "application/json; charset=utf-8",dataType: "json",success: function (data){var lbl_Message = document.getElementById('<%=lbl_Message.ClientID %>');lbl_Message.style.color = "Green";lbl_Message.innerHTML = data.d; $.unblockUI();resetText();},error: function (response){alert(response.d);$.unblockUI();}});}
   // });
    </script>
