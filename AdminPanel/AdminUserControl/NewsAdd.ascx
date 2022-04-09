<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsAdd.ascx.cs" Inherits="AdminPanel_AdminUserControl_NewsAdd" %>
<link href="AdminStyls/CSSMainAdmin.css" rel="stylesheet" type="text/css" />
<script src="ckeditor/ckeditor.js" type="text/javascript"></script>
<script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
<div id="load" align="center" style="display: none">
    <img src="AdminImages/Loading/loading.gif" alt="در حال انجام" width="28" height="28" />درحال انجام...
</div>
<fieldset>
    <legend style="color: #66FF33">افزودن خبر جدید</legend>
    <div class="input_field">
        <label>تاریخ امروز:</label>
        <asp:Label ID="lblDate" CssClass="field_desc" runat="server" Text="Today Date"></asp:Label>
    </div>
    <div class="input_field">
        <label for="mf">عنوان خبر:</label>
<%--        <input class="mediumfield" name="mf" type="text" value="" />--%>
        <asp:TextBox ID="txt_NewsTitle" CssClass="customTxt" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_NewsTitle" ErrorMessage="عنوان خبر را وارد نمائید" ForeColor="Yellow" SetFocusOnError="True"></asp:RequiredFieldValidator>
<%--        <span class="validate_success">A positive message!</span>--%>
    </div>
    <div class="input_field">
        <label>خلاصه خبر:</label>
<%--        <input class="bigfield" name="lf" type="text" value="" />  --%>      
            <asp:TextBox ID="txt_NewsSummary" runat="server" CssClass="customTxt big"></asp:TextBox>
<%--        <span class="validate_error">A negative message!</span>--%>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="txt_NewsSummary" ErrorMessage="خلاصه خبر را وارد نمائید" 
            ForeColor="Yellow" SetFocusOnError="True"></asp:RequiredFieldValidator>
    </div>
    <div class="input_field">
          <asp:CheckBox ID="chk_Pooling" CssClass="checkbox" Text=" " Checked="true" runat="server" />نظردهی به این خبر <br />
          <asp:CheckBox ID="chk_Status" CssClass="checkbox" Text=" " Checked="true" runat="server" />فعال
<%--        <span class="form_line"></span> --%>
    </div>
<%--    <div class="input_field">
        <label for="dropdown">
            DropDown:
        </label>
        <select name="dropdown" class="dropdown">
            <option>United States</option>
            <option>Other Country</option>
        </select>
    </div>--%>
<%--    <div class="input_field">
        <label>
            Vertical:</label>
        <div class="column">
            <span class="form_line">
                <input type="checkbox" name="che" class="checkbox" />Lorem Ipsum</span> <span class="form_line">
                    <input type="checkbox" name="che" class="checkbox" />Lorem Ipsum</span>
            <span class="form_line">
                <input type="checkbox" name="che" class="checkbox" />Lorem Ipsum</span> <span class="form_line">
                    <input type="checkbox" name="che" class="checkbox" />Lorem Ipsum</span>
        </div>
        <div class="column">
            <span class="form_line">
                <input type="radio" class="radio" />Lorem Ipsum</span> <span class="form_line">
                    <input type="radio" class="radio" />Lorem Ipsum</span> <span class="form_line">
                        <input type="radio" class="radio" />Lorem Ipsum</span> <span class="form_line">
                            <input type="radio" class="radio" />Lorem Ipsum</span>
        </div>
    </div>--%>
    <div class="input_field">
<%--        <textarea cols="80" id="txt_NewsContext" name="editor1" rows="10" runat="server"></textarea>--%>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ErrorMessage="متن خبر را وارد نمائید" ControlToValidate="txt_NewsContext" 
            ForeColor="Yellow" SetFocusOnError="True"></asp:RequiredFieldValidator>
        &nbsp;<asp:TextBox ID="txt_NewsContext" runat="server" Height="200px"
            TextMode="MultiLine" Width="95%"></asp:TextBox>
    </div>    
    <div class="input_field no_margin_bottom">
<%--    <asp:Button ID="btn_NewsSave" CssClass="submit" runat="server" Text="" />--%>
        <input type="button" class="btn_SaveNews submit" value="ثبت خبر" />
        <input type="button" id="btn_NewsNew" class="submit" value="جدید" onclick="clearControlValues()" />
        <asp:Button ID="btn_Exit" CssClass="submit" runat="server" Text="بستن" 
            onclick="btn_Exit_Click" CausesValidation="False" />
        <asp:Label ID="lbl_Msg" CssClass="error" runat="server"></asp:Label>
    </div>
</fieldset>
<script type="text/javascript" language="javascript">
    function clearControlValues()
    {
        txt_NewsTitle = document.getElementById("<%= txt_NewsTitle.ClientID %>");
        var txt_NewsSummary = document.getElementById("<%= txt_NewsSummary.ClientID %>");
        var txt_NewsContext = document.getElementById("<%= txt_NewsContext.ClientID%>");
        var editor = CKEDITOR.instances.ctl00_ContentPlaceHolder1_NewsAdd1_txt_NewsContext;
        txt_NewsTitle.value = "";
        txt_NewsSummary.value = "";
        editor.setData("");
        // txt_NewsContext.getInstance().setData(""); //txt_NewsContext.setData(""); //CKEDITOR.instances.page_content.getData();
    }
    $(document).ready(function ()
    {
        $('.btn_SaveNews').click(function ()
        {
            var NewsTitle = $("[id$='txt_NewsTitle']").val();
            var NewsSummary = $("[id$='txt_NewsSummary']").val();
            var editor = CKEDITOR.instances.ctl00_ContentPlaceHolder1_NewsAdd1_txt_NewsContext;
            var NewsContext = editor.getData();
            var NewsPooling = $('#<%= chk_Pooling.ClientID %>').is(':checked');
            var NewsStatus = $('#<%= chk_Status.ClientID %>').is(':checked');

            var lblMsg = document.getElementById('<%=lbl_Msg.ClientID %>');
            if (NewsTitle == "")
            {
                lblMsg.innerHTML = 'عنوان خبر را مشخص کنید';
                $("[id$='txt_NewsTitle']").focus();
                return;
            }
            if (NewsSummary == "")
            {
                lblMsg.innerHTML = 'خلاصه ای از خبر را وارد کنید';
                $("[id$='txt_NewsSummary']").focus();
                return;
            }
            if (NewsContext == "")
            {
                lblMsg.innerHTML = 'متن خبر را وارد کنید';
                return;
            }
            $('#load').fadeIn();
            $.ajax({
                type: "POST",
                url: "NewsAdd.aspx/InsertNews",
                data: "{ newsTitle: '" + NewsTitle + "',newsSummary: '" + NewsSummary +
                "',newsContext: '" + NewsContext + "',newsPooling: '" + NewsPooling +
                "',newsStatus: '" + NewsStatus + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data)
                {
                    $('#load').fadeOut();
                    var lblMsg = document.getElementById('<%=lbl_Msg.ClientID %>');
                    //lblMsg.innerHTML = 'خبر مورد نظر ثبت گردید'; //'Your Name: ' + response.d.Name + ', Your ID: ' + response.d.ID;
                    alert('خبر مورد نظر ثبت گردید');                    
                    clearControlValues();
                },
                error: function (response)
                {
                    $('#load').fadeOut();
                    alert("خطای مقابل به وقوع پیوست : " + response.d);
                }
            });
        });
    });
</script>
