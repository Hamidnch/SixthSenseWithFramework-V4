<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportRaceAdd.ascx.cs" Inherits="AdminPanel_AdminUserControl_SportRaceAdd" %>
<link href="AdminStyls/CSSMainAdmin.css" rel="stylesheet" type="text/css" />
<script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
<script src="../Scripts/PageMethod.js" type="text/javascript"></script>
<script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
<script type="text/javascript">
    function clearControlValue()
    {
        var raceName = document.getElementById('<%= txt_RaceName.ClientID%>');
        raceName.value = "";
        raceName.focus();
    }
    function getImagePath()
    {
        return '<%= ImagePath %>';
    }
    $(document).ready(function ()
    {
        $('.btn_SaveRace').click(function ()
        {
            var imagePath = getImagePath();
            var raceName = $("[id$='txt_RaceName']").val();
            var lblMsg = document.getElementById('<%=lbl_Msg.ClientID %>');
            lblMsg.innerHTML = "";
            if (raceName == "")
            {
                lblMsg.innerHTML = 'عنوان مسابقه را وارد کنید';
                document.getElementById('<%= txt_RaceName.ClientID%>').focus();
                return;
            }
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
                        opacity: .4,
                        color: '#fff'
                    }
                });

            $.PageMethod('InsertRace', onSuccess, onFail, 'raceName', raceName);
            function onSuccess(response)
            {
                $.unblockUI();
                //var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
                //var lblMsg = document.getElementById('<=lbl_Msg.ClientID %>');
                //lblMsg.innerHTML = response.d;
                alert(response.d);
                clearControlValue();
            }
            function onFail(response)
            {
                $.unblockUI();
                alert("خطای  : " + response.d);
            }
        });
    });
</script>

<fieldset>
    <legend style="color: #66FF33">تعریف عناوین مسابقات </legend>
    <table>
        <tr>
            <td>
                <div class="input_field">
                    <label>
                         عنوان مسابقه:
                    </label>
                    <asp:TextBox ID="txt_RaceName" CssClass="customTxt medium" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txt_RaceName" ErrorMessage="عنوان مسابقه را وارد نمائید" 
                        ForeColor="Yellow" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
                <div class="input_field no_margin_bottom">
                    <input type="button" class="btn_SaveRace submit" value="ثبت" />
                    <input type="button" id="btn_NewRace" class="submit" value="جدید" onclick="clearControlValue()" />
                    <input type="button" id="btn_Exit" class="submit" value="بازگشت" onclick="javascript:window.location.href='AdminHome.aspx'" />
                    <asp:Label ID="lbl_Msg" CssClass="error" runat="server"></asp:Label>
                </div>
            </td>
        </tr>
    </table>
</fieldset>