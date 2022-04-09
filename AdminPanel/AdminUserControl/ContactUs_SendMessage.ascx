<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ContactUs_SendMessage.ascx.cs" Inherits="AdminPanel_AdminUserControl_ContactUs_SendMessage" %>
<%@ Register Assembly="MultiDropDown" Namespace="MultiDropDownLib" TagPrefix="MultiDropDownLib" %>
<fieldset>
    <legend style="color: #66FF33">ارسال پیام جدید</legend>
    <div class="input_field">
        <label>تاریخ امروز:</label>
        <asp:Label ID="lblDate" CssClass="field_desc" runat="server" Text="Today Date"></asp:Label>
    </div>
    <div class="input_field">
        <label for="mf">موضوع:</label>
        <asp:TextBox ID="txt_MessageTitle" CssClass="customTxt big" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_MessageTitle" ErrorMessage="عنوان پیام را وارد نمائید" ForeColor="Yellow" SetFocusOnError="True"></asp:RequiredFieldValidator>
    </div>  
    <div class="input_field">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ErrorMessage="متن پیام را وارد نمائید" ControlToValidate="txt_Message" 
            ForeColor="Yellow" SetFocusOnError="True"></asp:RequiredFieldValidator>
        &nbsp;<asp:TextBox ID="txt_Message" runat="server" Height="200px"
            TextMode="MultiLine" Width="95%"></asp:TextBox>
    </div>  <br />
    <div class="input_field">
        <label>دریافت کننده(ها):</label>
            <MultiDropDownLib:MultiDropDown ID="ddl_Receiver" runat="server" CssClass="mddl"
                TextBoxClass="textbox1 txt2" ImageButtonClass="imagebutton1" TooltipClass="tooltip1" DropdownClass="dropdown1 drp1" />
            <img onclick="delReceivers()" src="../Images/cancel.png" alt="حذف" style="float:right; cursor:pointer"/>
<%--            <asp:TextBox ID="txt_Receiver" runat="server" CssClass="customTxt big"></asp:TextBox>--%>
<%--            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="ddl_Receiver" ErrorMessage="ایمیل افراد دریافت کننده را وارد نمایید" 
                ForeColor="Yellow" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
    </div>
    <div class="input_field no_margin_bottom">
        <input type="button" id="btn_SendMessage" class="submit" value="ارسال پیام" />
        <input type="button" id="btn_NewsNew" class="submit" value="جدید" onclick="clearControlValues()" />
        <asp:Label ID="lbl_Msg" CssClass="error" runat="server"></asp:Label>
    </div>
</fieldset>
<script type="text/javascript">
    function delReceivers()
    {
        var Message_ReceiverEmail = document.getElementById("ctl00_ContentPlaceHolder1_ContactUs_SendMessage1_ddl_Receiver_txtItemList");
        Message_ReceiverEmail.value = "";
        $('input:checkbox').attr('checked', false);
    }
    function clearControlValues()
    {
        var Message_Subject = document.getElementById("<%= txt_MessageTitle.ClientID %>");
        var Message_ReceiverEmail = document.getElementById("ctl00_ContentPlaceHolder1_ContactUs_SendMessage1_ddl_Receiver_txtItemList");
        var editor = CKEDITOR.instances.ctl00_ContentPlaceHolder1_ContactUs_SendMessage1_txt_Message;
        Message_Subject.value = "";
        Message_ReceiverEmail.value = "";
        editor.setData("");
        
    }
    function getImagePath() { return '<%= ImagePath %>'; } var imagePath = getImagePath();
    $(document).ready(function ()
    {
        $('#btn_SendMessage').click(function ()
        {
            setBlock();
            var Message_Subject = $("[id$='txt_MessageTitle']").val();
            var Message_ReceiverEmail = $("[id$='ddl_Receiver_txtItemList']").val(); //document.getElementById("ctl00_ContentPlaceHolder1_ContactUs_SendMessage1_ddl_Receiver_txtItemList").value; //
            //alert(Message_ReceiverEmail);
            var editor = CKEDITOR.instances.ctl00_ContentPlaceHolder1_ContactUs_SendMessage1_txt_Message;
            var Message_Context = editor.getData();
            var lblMsg = document.getElementById('<%=lbl_Msg.ClientID %>');
            if (Message_Subject == "")
            {
                lblMsg.innerHTML = 'عنوان پیام را مشخص کنید';
                $("[id$='txt_MessageTitle']").focus();
                $.unblockUI();
                return;
            }
            if (Message_ReceiverEmail == "")
            {
                lblMsg.innerHTML = 'گیرندگان پیام را مشخص نمایید';
                $("[id$='ddl_Receiver']").focus();
                $.unblockUI();
                return;
            }
            if (Message_Context == "")
            {
                lblMsg.innerHTML = 'متن پیام را وارد کنید';
                $.unblockUI();
                return;
            }
            $.ajax({
                type: "POST",
                url: "ContactUs_SendMessage.aspx/Admin_InsertNewMessage",
                data: "{ Message_Subject: '" + Message_Subject + "',Message_ReceiverEmail: '" + Message_ReceiverEmail +
                "',Message_Context: '" + Message_Context + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data)
                {
                    var lblMsg = document.getElementById('<%=lbl_Msg.ClientID %>');
                    $.unblockUI();
                    jAlert(data.d, "حس ششم");
                    clearControlValues();
                },
                error: function (response)
                {
                    $.unblockUI();
                    alert("خطای مقابل به وقوع پیوست : " + response.d);
                }
            });
        });
    });
</script>