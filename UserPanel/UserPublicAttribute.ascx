<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserPublicAttribute.ascx.cs" Inherits="UserPanel_UserPublicAttribute" %>
<script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
<script src="../Scripts/PageMethod.js" type="text/javascript"></script>
<style type="text/css">.loading{color: White;position:absolute;left:250px;top:100px;z-index:500;}</style>
<script type="text/javascript" language="javascript">
    $(document).ready(function ()
    {
        $('#btnIndividualAttrRegister').click(function ()
        {
            var userName = $("[id$='txtUserName']").val();
            var firstName = $("[id$='txtFirstName']").val();
            var lastName = $("[id$='txtLastName']").val();
            var year = $('#<%= ddlYear.ClientID %>').val();
            var month = $('#<%= ddlMonth.ClientID %>').val();
            month = (month.length == 1) ? "0" + month : month;
            var day = $('#<%= ddlDay.ClientID %>').val();
            day = (day.length == 1) ? "0" + day : day;
            var birthDay = year + "/" + month + "/" + day;
            // $('#rblSex input').index(this));
            //var sex = $("#rblSex").find("input[@checked]").val();
            var sex = $('#<%=rblSex.ClientID %> input[type=radio]:checked').val();
            sex = (sex == 1) ? true : false;
            var lblRegMsg = $('#<%=lblRegMsg.ClientID %>');
            lblRegMsg.html("");
            if (firstName == "")
            {
                lblRegMsg.css("color", "#ffcc00");
                lblRegMsg.html("نام را وارد نمائيد");
                $('#<%= txtFirstName.ClientID %>').focus();
                return;
            }
            if (lastName == "")
            {
                lblRegMsg.css("color", "#ffcc00");
                lblRegMsg.html("نام خانوادگی را وارد نمائيد");
                $('#<%= txtLastName.ClientID %>').focus();
                return;
            }
            if (year == "" || year == "<سال>")
            {
                lblRegMsg.css("color", "#ffcc00");
                lblRegMsg.html("سال را به درستي انتخاب نمائيد");
                $('#<%= ddlYear.ClientID %>').focus();
                return;
            }
            if (month == "" || month == "<ماه>")
            {
                lblRegMsg.css("color", "#ffcc00");
                lblRegMsg.html("ماه را به درستي انتخاب نمائيد");
                $('#<%= ddlMonth.ClientID %>').focus();
                return;
            }
            if (day == "" || day == "<روز>")
            {
                lblRegMsg.css("color", "#ffcc00");
                lblRegMsg.html("روز را به درستي انتخاب نمائيد");
                $('#<%= ddlDay.ClientID %>').focus();
                return;
            }
            $('#load').fadeIn();
            $.PageMethod('InsertPublicAttribute', onSuccess, onFail, 'firstName', firstName, 'lastName', lastName,
                    'sex', sex, 'birthDay', birthDay, 'userName', userName);
            function onSuccess(response)
            {
                $('#load').fadeOut();
                lblRegMsg.css("color", "lime");
                lblRegMsg.html(response.d);
            }
            function onFail(response)
            {
                $('#load').fadeOut();
                alert("خطای مقابل به وقوع پیوست : " + response.d);
            }
        });
    });
</script>
<div id="load" align="center" style="display: none" class="loading"><img src="../Images/ajaxImages/Loading_User.gif" alt="در حال انجام" width="200" height="200" /></div>
<div style="font-family:Tahoma;color:#fff; direction:rtl;">
    <table style="width: 100%; table-layout: fixed; height: 385px;" class="table">
        <tr>
            <td align="right" dir="rtl" style="padding-right: 5px; margin-right: 5px; width: 91px;"><asp:Label ID="lblFirstName3" runat="server" Text="نام کاربری"></asp:Label></td>
            <td align="right"><asp:TextBox ID="txtUserName" runat="server" Width="253px" CssClass="txt" ForeColor="Lime" ReadOnly="true" BackColor="#222222"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right" dir="rtl" style="padding-right: 5px; margin-right: 5px; width: 91px;">
                <asp:Label ID="lblFirstName" runat="server" Text="نام"></asp:Label>
            </td>
            <td align="right"><asp:TextBox ID="txtFirstName" runat="server" Width="253px" CssClass="txt"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 91px;"><asp:Label ID="lblFirstName0" runat="server" Text="نام خانوادگی"></asp:Label></td>
            <td align="right"><asp:TextBox ID="txtLastName" runat="server" Width="253px" CssClass="txt"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 91px;"><asp:Label ID="lblFirstName1" runat="server" Text="تاریخ تولد"></asp:Label></td>
            <td align="right">
                <asp:Label ID="lblYear" runat="server" Text="سال"></asp:Label>
                &nbsp;<asp:DropDownList ID="ddlYear" runat="server" CssClass="ddl"></asp:DropDownList>
                &nbsp;<asp:Label ID="lblMonth" runat="server" Text="ماه"></asp:Label>&nbsp;<asp:DropDownList ID="ddlMonth" runat="server" CssClass="ddl"><asp:ListItem>&lt;ماه&gt;</asp:ListItem>
                    <asp:ListItem Value="1">فروردین</asp:ListItem><asp:ListItem Value="2">اردیبهشت</asp:ListItem><asp:ListItem Value="3">خرداد</asp:ListItem><asp:ListItem Value="4">تیر</asp:ListItem><asp:ListItem Value="5">مرداد</asp:ListItem><asp:ListItem Value="6">شهریور</asp:ListItem><asp:ListItem Value="7">مهر</asp:ListItem><asp:ListItem Value="7">آبان</asp:ListItem><asp:ListItem Value="8">آذر</asp:ListItem><asp:ListItem Value="9">دی</asp:ListItem><asp:ListItem Value="11">بهمن</asp:ListItem><asp:ListItem Value="12">اسفند</asp:ListItem></asp:DropDownList>
                &nbsp;<asp:Label ID="lblDay" runat="server" Text="روز"></asp:Label>&nbsp;
                <asp:DropDownList ID="ddlDay" runat="server" CssClass="ddl"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 91px;">
                <asp:Label ID="lblFirstName2" runat="server" Text="جنسیت"></asp:Label>
            </td>
            <td align="right"><asp:RadioButtonList ID="rblSex" runat="server" RepeatDirection="Horizontal" Width="99px"><asp:ListItem Value="0" Selected="True">مرد</asp:ListItem><asp:ListItem Value="1">زن</asp:ListItem></asp:RadioButtonList></td>
        </tr>
        <tr>
            <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; height: 54px;" colspan="2">
                <input type="button" id="btnIndividualAttrRegister" class="btn" value="ثبت"/>
            </td>
        </tr>
        <tr>
            <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 91px;">&nbsp;</td>
            <td style="width: 416px" align="center"><asp:Label ID="lblRegMsg" runat="server" Font-Bold="True" ForeColor="Lime"></asp:Label></td>
        </tr>
    </table>
</div>