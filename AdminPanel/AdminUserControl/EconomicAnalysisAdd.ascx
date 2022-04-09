<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EconomicAnalysisAdd.ascx.cs" Inherits="AdminPanel_AdminUserControl_EconomicAnalysisAdd" %>
<link href="AdminStyls/CSSMainAdmin.css" rel="stylesheet" type="text/css" />
<fieldset>
    <legend style="color: #66FF33">تحليلهاي اقتصادي</legend>
    <div class="input_field">
        <label>تاریخ امروز:</label>
        <asp:Label ID="lblDate" CssClass="field_desc" runat="server" Text="Today Date"></asp:Label>
    </div>
    <div class="input_field">
        <label>عنوان تحليل:</label><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txt_AnalysisTitle" ErrorMessage="عنوان تحليل را وارد نمائید" 
            ForeColor="Yellow" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <asp:TextBox ID="txt_AnalysisTitle" CssClass="customTxt medium" TextMode="MultiLine" runat="server" Height="100px" Width="95%"></asp:TextBox>
    </div>
    <div class="input_field">
        <label>متن تحليل:</label><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="txt_AnalysisContext" ErrorMessage="متن تحليل را وارد نمائید"
            ForeColor="Yellow" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txt_AnalysisContext" runat="server" CssClass="customTxt medium" Height="200px" TextMode="MultiLine" Width="95%"></asp:TextBox>
    </div>
    <div class="input_field">
        <asp:CheckBox ID="chk_Status" CssClass="checkbox" Text=" " Checked="true" runat="server" />فعال
    </div>
    <div class="input_field no_margin_bottom">
        <input type="button" id="btn_SaveAnalysis" class="btnSaveAnalysis submit" value="ثبت تحليل" />
        <input type="button" id="btn_NewAnalysis" class="submit" value="جدید" onclick="clearControlValues()" />
        <asp:Button ID="btn_Exit" CssClass="submit" runat="server" Text="بستن" CausesValidation="False" />
        <asp:Label ID="lbl_Msg" CssClass="error" runat="server"></asp:Label>
    </div>
</fieldset>
<div id="load" align="center" style="display: none">
    <img src="AdminImages/Loading/loading.gif" alt="در حال انجام" style="position:absolute; z-index:2000" width="150" height="150" />   درحال انجام عملیات...
</div>
<script src="ckeditor/ckeditor.js" type="text/javascript"></script>
<script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
<script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
<script type="text/javascript">
    function clearControlValues()
    {
        var editorTitle = CKEDITOR.instances.ctl00_ContentPlaceHolder1_EconomicAnalysisAdd1_txt_AnalysisTitle;
        editorTitle.setData("");
        var editorContext = CKEDITOR.instances.ctl00_ContentPlaceHolder1_EconomicAnalysisAdd1_txt_AnalysisContext;
        editorContext.setData("");
        var chk_status = $('#<%= chk_Status.ClientID %>').attr('checked', true);
    }
</script>
<script type="text/javascript" language="javascript">
    $(document).ready(function ()
    {
        function getImagePath(){return '<%= ImagePath %>';}
        $('.btnSaveAnalysis').click(function ()
        {
            var imagePath = getImagePath();
            var editorTitle = CKEDITOR.instances.ctl00_ContentPlaceHolder1_EconomicAnalysisAdd1_txt_AnalysisTitle;
            var editorContext = CKEDITOR.instances.ctl00_ContentPlaceHolder1_EconomicAnalysisAdd1_txt_AnalysisContext;
            var txt_AnalysisTitle = editorTitle.getData();
            var txt_AnalysisContext = editorContext.getData();
            var chk_AnalysisStatus = $('#<%= chk_Status.ClientID %>').is(':checked');

            var lblMsg = document.getElementById('<%=lbl_Msg.ClientID %>');
            if (txt_AnalysisTitle == "")
            {
                lblMsg.innerHTML = 'عنوان تحلیل را مشخص کنید';
                this.focus();
                return;
            }
            if (txt_AnalysisContext == "")
            {
                lblMsg.innerHTML = 'متن تحلیل را وارد کنید';
                this.focus();
                return;
            }
            // $('#load').fadeIn();
            $.blockUI(
        {
            message: '<h1><img src="' + imagePath + '/ajaxImages/loading2.gif" /><br /> چند لحظه منتظر بمانيد...</h1>',
            fadeIn: 700,
            fadeOut: 700,
            css: {
                border: 'none',
                padding: '5px',
                backgroundColor: '#000',
                '-webkit-border-radius': '10px',
                '-moz-border-radius': '10px',
                opacity: .6,
                color: '#fff'
            }
        });
            $.ajax({
                type: "POST",
                url: "EconomicAnalysisAdd.aspx/InsertAnalysis",
                data: "{ analysisTitle: '" + txt_AnalysisTitle + "',analysisContext: '" + txt_AnalysisContext +
                "',analysisStatus: '" + chk_AnalysisStatus + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data)
                {
                    var lblMsg = document.getElementById('<%=lbl_Msg.ClientID %>');
                    lblMsg.innerHTML = data.d;
                    clearControlValues();
                    $.unblockUI();
                },
                error: function (response)
                {                    
                    $.unblockUI(); alert("بروزخطا: " + response.d);
                }
            });
        });
    });
</script>