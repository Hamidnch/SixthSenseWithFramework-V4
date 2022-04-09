<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserSendMessage.aspx.cs" Inherits="UserPanel_UserSendMessage" %>
<%@ Register Assembly="MultiDropDown" Namespace="MultiDropDownLib" TagPrefix="MultiDropDownLib" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/CSSUserProfile.css" rel="stylesheet" type="text/css" />
    <link href="../AdminPanel/AdminStyls/CSSMultiDropDown.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSAlerts.css" rel="stylesheet" type="text/css" />

    <script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="../AdminPanel/ckeditor/ckeditor.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
    <script src="../Scripts/CustomBlockUI.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.alerts.js" type="text/javascript"></script>    
</head>
<body>
    <form id="form1" runat="server">
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
                <input type="button" id="btn_SendMessage" class="btn" value="ارسال پیام" />
                <input type="button" id="btn_NewsNew" class="btn" value="جدید" onclick="clearControlValues()" />
                <asp:Button ID="btn_Exit" Text="برگشت" runat="server" CssClass="btn" CausesValidation="false"
                    onclick="btn_Exit_Click" />
                <asp:Label ID="lbl_Msg" ForeColor="#ffcc00" runat="server"></asp:Label>
            </div>
        </fieldset>
    </form>
</body>
</html>
<script type="text/javascript">
    function delReceivers()
    {
        var Message_ReceiverEmail = document.getElementById("ddl_Receiver_txtItemList");
        Message_ReceiverEmail.value = "";
        $('input:checkbox').attr('checked', false);
    }
    function clearControlValues()
    {
        var Message_Subject = document.getElementById("<%= txt_MessageTitle.ClientID %>");
        var Message_ReceiverEmail = document.getElementById("ddl_Receiver_txtItemList");

        var editor = CKEDITOR.instances.txt_Message;
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
            var Message_ReceiverEmail = $("[id$='ddl_Receiver_txtItemList']").val();
            var editor = CKEDITOR.instances.txt_Message;
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
                url: "UserSendMessage.aspx/User_InsertNewMessage",
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
