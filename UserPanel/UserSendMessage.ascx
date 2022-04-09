<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserSendMessage.ascx.cs" Inherits="UserPanel_UserSendMessage" %>
<%@ Register Assembly="MultiDropDown" Namespace="MultiDropDownLib" TagPrefix="MultiDropDownLib" %>

<fieldset style="direction:rtl">
    <legend style="color: #66FF33">ارسال پیام جدید</legend>
    <div style="color:White;text-align:right">
        <label>تاریخ امروز:</label>
        <asp:Label ID="lblDate" CssClass="field_desc" runat="server" Text="Today Date"></asp:Label>
    </div><br />
    <div style="color:White;text-align:right">
        <label for="mf">موضوع:</label>
        <asp:TextBox ID="txt_MessageTitle" CssClass="txt" Width="500px" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_MessageTitle" ErrorMessage="عنوان پیام را وارد نمائید" ForeColor="Yellow" SetFocusOnError="True"></asp:RequiredFieldValidator>
    </div><br />  
    <div>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ErrorMessage="متن پیام را وارد نمائید" ControlToValidate="txt_Message" 
            ForeColor="Yellow" SetFocusOnError="True"></asp:RequiredFieldValidator>
        &nbsp;<asp:TextBox ID="txt_Message" runat="server" Height="200px" CssClass="txt"
            TextMode="MultiLine" Width="95%"></asp:TextBox>
    </div><br />   
    <div style="color:White;text-align:right;">
         <label style='float:right'>دریافت کننده(ها):</label>
        <MultiDropDownLib:MultiDropDown ID="ddl_Receiver" runat="server" CssClass="mddl"
                TextBoxClass="textbox1 txt2" ImageButtonClass="imagebutton1" TooltipClass="tooltip1" DropdownClass="dropdown1 drp1" />
            <img onclick="delReceivers()" src="../Images/cancel.png" alt="حذف" style="float:right; cursor:pointer"/>             
    </div> <br /><br />  
    <div style="clear:both">
        <input type="button" class="btn" value="ارسال پیام" />
        <input type="button" id="btn_NewsNew" class="btn" value="جدید" onclick="clearControlValues()" />
        <asp:Label ID="lbl_Msg" CssClass="error" runat="server"></asp:Label>
    </div>
</fieldset>
<script type="text/javascript">
    function delReceivers()
    {
        var Message_ReceiverEmail = document.getElementById("UserProfile1_00000000-0000-0000-0000-000000000000_ddl_Receiver_txtItemList");
        Message_ReceiverEmail.value = "";
        $('input:checkbox').attr('checked', false);
    }
    function clearControlValues()
    {
        var Message_Subject = document.getElementById("<%= txt_MessageTitle.ClientID %>");
        var Message_ReceiverEmail = document.getElementById("UserProfile1_00000000-0000-0000-0000-000000000000_ddl_Receiver_txtItemList");

        var editor = CKEDITOR.instances["Editor"].getData()
                                       
        alert(editor);
        Message_Subject.value = "";
        Message_ReceiverEmail.value = "";
        editor.setData("");
    }
</script>