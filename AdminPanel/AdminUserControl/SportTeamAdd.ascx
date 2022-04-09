<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportTeamAdd.ascx.cs" Inherits="AdminPanel_AdminUserControl_SportTeamAdd" %>
<fieldset>
    <legend style="color: #66FF33">افزودن تیم جدید</legend>
    <table>
        <tr>
            <td>
                <div class="input_field">
                    <label>
                         نام تیم:
                    </label>
                    <asp:TextBox ID="txt_TeamName" CssClass="customTxt medium" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txt_TeamName" ErrorMessage="نام تیم را وارد نمائید" 
                        ForeColor="Yellow" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
                <div class="input_field">
                    <label>
                        نام کشور:
                    </label> 
                        <asp:DropDownList ID="ddl_TeamCountry" CssClass="customTxt medium" runat="server">
                        </asp:DropDownList>
                </div>   
<%--                <div class="input_field">
                    <label>
                        آرم تیم:
                    </label> 
                    <input type="file" id="upd_Slogan" class="bigfield" onchange="getSloganPath()" />
                    <br />
                   <asp:TextBox ID="txt_SloganPicture" runat="server" CssClass="mediumfield"></asp:TextBox>
                </div>   --%> 
                <div class="input_field no_margin_bottom">
                    <input type="button" class="btn_SaveTeam submit" value="ثبت" />
                    <input type="button" id="btn_TeamNew" class="submit" value="جدید" onclick="clearControlValue()" />
                    <input type="button" id="btn_Exit" class="submit" value="بازگشت" onclick="javascript:window.location.href='AdminHome.aspx'" />
                    &nbsp;&nbsp;&nbsp;<asp:Label ID="lbl_Msg" CssClass="error" runat="server"></asp:Label>
                </div>
            </td>
<%--            <td>
                <asp:Image ID="Image1" runat="server" Height="93px" Width="109px" />
            </td>--%>
        </tr>
    </table>
</fieldset>
<script type="text/javascript" language="javascript">
    function getImagePath() { return '<%= ImagePath %>'; }
    function clearControlValue()
    {
        var teamName = document.getElementById('<%= txt_TeamName.ClientID %>');
        var countryID = document.getElementById("<%= ddl_TeamCountry.ClientID %>");
        teamName.value = "";
        countryID = $("[id$='ddl_TeamCountry']").val("-1");
        teamName.focus();
    }
    $(document).ready(function ()
    {
        $('.btn_SaveTeam').click(function ()
        {
            var imagePath = getImagePath();
            var teamName = $("[id$='txt_TeamName']").val();
            var countryID = $("[id$='ddl_TeamCountry']").val();
            //var sloganPicture = $("[id$='txt_SloganPicture']").val();
            var sloganPicture = "فعلا هیچ";
            var lblMsg = document.getElementById('<%=lbl_Msg.ClientID %>');
            lblMsg.innerHTML = "";
            if (teamName == "")
            {
                lblMsg.innerHTML = 'نام تیم را وارد کنید';
                $("[id$='txt_TeamName']").focus();
                return;
            }
            if (countryID == "-1")
            {
                lblMsg.innerHTML = 'لطفا کشور مربوطه را تعیین نمائید';
                $("[id$='ddl_TeamCountry']").focus();
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
                        opacity: .6,
                        color: '#fff'
                    }
                });
            //clearControlValue();
            $.PageMethod('InsertTeam', onSuccess, onFail, 'teamName', teamName, 'countryID', countryID, 'sloganPicture', sloganPicture);
            function onSuccess(response)
            {
                //$('#load').fadeOut();
                //var lblMsg = document.getElementById('<=lbl_Msg.ClientID %>');
                //lblMsg.innerHTML = response.d;
                alert(response.d);
                clearControlValue();
                $.unblockUI();
            }
            function onFail(response)
            {
                $.unblockUI();
                alert("خطای  : " + response.d);
            }
        });
    });
</script>