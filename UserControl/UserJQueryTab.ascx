<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserJQueryTab.ascx.cs" Inherits="UserControl_UserJQueryTab" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register src="MenuPublic.ascx" tagname="MenuPublic" tagprefix="uc1" %>
<script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
<script src="../Scripts/PageMethod.js" type="text/javascript"></script>
<link href="../Styles/CSSUserJQueryTab.css" rel="stylesheet" type="text/css" />
<link href="../Styles/CSSMenuPublic.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    .loading
    {
        position:absolute;
        left:70px;
        top:200px;
        z-index:-1;
    }
.dropdown
{
    font-family: Tahoma;
    background: #1a1a1a;
    width: 170px;
    height: 19px;
    color: #FFFFFF;
    border: 1px solid #999999;
    margin: 2px 0;
    text-align: right;
    line-height: 25px;
}
</style>
<script type="text/javascript" language="javascript">
    function SavePublicAttrData()
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
        sex = (sex == 1)? true : false;
//        switch (sex)
//        {
//            case 0:
//                sex = true;
//                break;
//            case 1:
//                sex = false;
//                break;
//        }

        var lblRegMsg = document.getElementById('<%=lblRegMsg.ClientID %>');
        if (firstName == "")
        {
            alert("نام را وارد نمائيد");
            $('#<%= txtFirstName.ClientID %>').focus();
            return;
        }
        if (lastName == "")
        {
            alert("نام خانوادگی را وارد نمائيد");
            $('#<%= txtLastName.ClientID %>').focus();
            return;
        }
        if (year == "" || year == "<سال>")
        {
            alert("سال را به درستي انتخاب نمائيد");
            $('#<%= ddlYear.ClientID %>').focus();
            return;
        }
        if (month == "" || month == "<ماه>")
        {
            alert("ماه را به درستي انتخاب نمائيد");
            $('#<%= ddlMonth.ClientID %>').focus();
            return;
        }
        if (day == "" || day == "<روز>")
        {
            alert("روز را به درستي انتخاب نمائيد");
            $('#<%= ddlDay.ClientID %>').focus();
            return;
        }
        $('#load').fadeIn();
        $.PageMethod('InsertPublicAttribute', onSuccess, onFail, 'firstName', firstName, 'lastName', lastName,
                'sex', sex, 'birthDay', birthDay, 'userName', userName);
        function onSuccess(response)
        {
            $('#load').fadeOut();
            var lblRegMsg = document.getElementById('<%=lblRegMsg.ClientID %>');
            lblRegMsg.innerHTML = 'اطلاعات عمومی شما ثبت گردید'; //'Your Name: ' + response.d.Name + ', Your ID: ' + response.d.ID;
        }
        function onFail(response)
        {
            $('#load').fadeOut();
            alert("خطای مقابل به وقوع پیوست : " + response.d);
        }
    }
</script>
<script type="text/javascript" language="javascript">
    function SaveContactInfoData()
    {
        var userName = $("[id$='txtUserName']").val();
        var phone = $("[id$='txtPhone']").val();
        var mobile = $("[id$='txtMobile']").val();
        var address = $("[id$='txtAddress']").val();
        var country = $("[id$='ddlCountry']").val();
        var city = $("[id$='ddlCity']").val();

        $('#load').fadeIn();
        $.PageMethod('InsertContactInfo', onSuccess, onFail, 'phone', phone, 'mobile', mobile,
                'address', address, 'country', country, 'city', city, 'userName', userName);
        function onSuccess(response)
        {
            $('#load').fadeOut();
            var lblContactInfoMsg = document.getElementById('<%=lblContactInfoMsg.ClientID %>');
            lblContactInfoMsg.innerHTML = 'اطلاعات تماس شما ثبت گردید'; //'Your Name: ' + response.d.Name + ', Your ID: ' + response.d.ID;
        }
        function onFail(response)
        {
            $('#load').fadeOut();
            alert("خطای مقابل به وقوع پیوست : " + response.d);
        }
    }
</script>
<script type="text/javascript" language="javascript">
    function SaveEmailPassInfoData()
    {
        var userName = $("[id$='txtUserName']").val();
        var CurrentPassword = $("[id$='txtCurrentPassword']").val();
        var newPass = $("[id$='txtnewPassword']").val();
        var dupNewPassword = $("[id$='txtdupNewPassword']").val();
        var newEmail = $("[id$='txtnewEmail']").val();
        var dupNewEmail = $("[id$='txtdupNewEmail']").val();
        var currentEmail = $("[id$='txtCurrentEmail']").val();

        if (CurrentPassword == "")
        {
            alert("کلمه عبور قبلیتان را وارد نمائید");
            $('#<%= txtCurrentPassword.ClientID %>').focus();
            return;
        }
        if (newPass == "")
        {
            alert("کلمه عبور جدید را وارد نمائید");
            $('#<%= txtnewPassword.ClientID %>').focus();
            return;
        }
        if (dupNewPassword == "")
        {
            alert("تکرار کلمه عبور جدید را وارد نمائید");
            $('#<%= txtdupNewPassword.ClientID %>').focus();
            return;
        }
        if (newPass.length < 5)
        {
            alert("طول کلمه عبور حداقل باید 5 کاراکتر باشد");
            return;
        }
        if (newPass != dupNewPassword)
        {
            alert("کلمه عبور با تکرارش مطابقت ندارد");
            return;
        }
        if (newEmail == "")
        {
            alert("ایمیل را وارد نمائید");
            $('#<%= txtnewEmail.ClientID %>').focus();
            return;
        }
        if (dupNewEmail == "")
        {
            alert("تکرار ایمیل را وارد نمائید");
            $('#<%= txtdupNewEmail.ClientID %>').focus();
            return;
        }
        if (newEmail != dupNewEmail)
        {
            alert("ایمیل با تکرارش مطابقت ندارد");

            return;
        }

        $('#load').fadeIn();
        $.PageMethod('InsertEmailPassInfo', onSuccess, onFail, 'currentPassword', CurrentPassword, 'currentEmail', currentEmail, 
                                            'newPass', newPass, 'newEmail', newEmail, 'userName', userName);
        function onSuccess(response)
        {
            var result = response.d;
            {
                $('#load').fadeOut();
                var lblEmailPassMsg = document.getElementById('<%=lblEmailPassMsg.ClientID %>');
                lblEmailPassMsg.innerHTML = result; //'عملیات با موفقیت ثبت گردید'; //'Your Name: ' + response.d.Name + ', Your ID: ' + response.d.ID;
            }               
        }
        function onFail(response)
        {
            $('#load').fadeOut();
            alert("خطای مقابل به وقوع پیوست : " + response.d);
        }
    }
</script>
<script type="text/javascript" language="javascript">
    function SaveAccountInfoData()
    {
        var userName = $("[id$='txtUserName']").val();
        var accountName = $("[id$='txtAccountName']").val();
        var accountFamily = $("[id$='txtAccountFamily']").val();
        var accountNumber = $("[id$='txtAccountNumber']").val();
        var bankName = $("[id$='ddlBankName']").val();
        var webSite = $("[id$='txtWebSite']").val();
        var yahooID = $("[id$='txtYahooID']").val();
        var comment = $("[id$='txtComment']").val();

        $('#load').fadeIn();
        $.PageMethod('InsertAccountInfo', onSuccess, onFail, 'accountName', accountName, 'accountFamily', accountFamily,
                'accountNumber', accountNumber, 'bankName', bankName, 'webSite', webSite,
                'yahooID', yahooID, 'comment', comment, 'userName', userName);
        function onSuccess(response)
        {
            $('#load').fadeOut();
            var lblAccountInfoMsg = document.getElementById('<%=lblAccountInfoMsg.ClientID %>');
            lblAccountInfoMsg.innerHTML = 'اطلاعات حساب شما ثبت گردید'; //'Your Name: ' + response.d.Name + ', Your ID: ' + response.d.ID;
        }
        function onFail(response)
        {
            $('#load').fadeOut();
            alert("خطای مقابل به وقوع پیوست : " + response.d);
        }
    }
</script>
<script type="text/javascript">
    $(document).ready(function ()
    {
//        $('input[type="text"]').focus(function ()
//        {
//            $(this).addClass("focus");
//        });
//        $('input[type="text"]').blur(function ()
//        {
//            $(this).removeClass("focus");
//        });

        //Default Action
        $(".tab_contentProfile").hide(); //Hide all content
        $("ul.tabsProfile li:first").addClass("active").show(); //Activate first tab
        $(".tab_contentProfile:first").show(); //Show first tab content

        //On Click Event
        $("ul.tabsProfile li").click(function ()
        {
            $("ul.tabsProfile li").removeClass("active"); //Remove any "active" class
            $(this).addClass("active"); //Add "active" class to selected tab
            $(".tab_contentProfile").hide(); //Hide all tab content
            var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
            $(activeTab).fadeIn(); //Fade in the active content
            return false;
        });
    });

</script>
    <script type="text/javascript">
        function getImagePath()
        {
            return '<%= getImagePath %>';
        }
        function getUserName()
        {
            return '<%= getUserName %>';
        }        
        var imagePath = getImagePath();
        var uName = getUserName();
//        function imageLoad()
//        {           
//         alert("yes");
//            img = document.getElementById('<%= imgUser.ClientID %>');
//            fileName = arguments.get_fileName();
//            fileLen = fileName.length;
//            var ext = fileName.substr(fileLen - 4, 4);
//            var path = getImagePath() + uName + ext;
//            img.src = path;

//        }
        function uploadError(sender, args)
        {
            alert("error");
            //addToClientTable(args.get_fileName(), "<span style='color:red;'>" + args.get_errorMessage() + "</span>");
        }
        function uploadComplete(sender, args)
        {
            img = document.getElementById('<%= imgUser.ClientID %>');
//            img.src = "";
//            var contentType = args.get_contentType();
//            var text = args.get_length() + " bytes";
//            if (contentType.length > 0)
//            {
//                fileName = args.get_fileName();
//                fileLen = fileName.length;
//                ext = fileName.substr(fileLen - 4, 4);

//                path = getImagePath() + uName + ext; //args.get_fileName()                       
//                img.src = path;
    //        }                     
        }
    </script>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<div id="container">
    <div id="userSettingsMenu">
        <div id="menuPublic">
            <ul>
                <li><a href="../Home.aspx">صفحه نخست</a></li>                
                <li><a href="../Economic/EconomicHome.aspx" target="_parent">فعالیتهای اقتصادی</a></li>
                <li><a href="../Sport/Sport_Home.aspx">ورزش و مسابقات</a></li>
                <li><a href="../EducationHome.aspx">مهاجرت و تحصیل</a></li>
                <li><a href="#">تماس با ما</a></li>
            </ul>
        </div>
    </div>
    <div class="tabProfile">
        <div class="containerProfile">
            <%-- <h1>پروفایل کاربری</h1>--%>
            <ul class="tabsProfile">
                <li class="active"><a href="#tab1">مشخصات فردی</a></li>
                <li class=""><a href="#tab2">اطلاعات تماس</a></li>
                <li class="" id="tabpass" runat="server"><a href="#tab3">تغییر ایمیل و کلمه عبور</a></li>
                <li class=""><a href="#tab4">تغییر آواتار</a></li>
                <li class=""><a href="#tab5">مشخصات عمومی</a></li>
                <li class=""><a href="#tab6">صندوق پیامها</a></li>
            </ul>
            <div class="tab_containerProfile">
                <div id="load" align="center" style="display: none" class="loading">
                    <img src="../Images/loading.gif" alt="در حال انجام" width="100" height="100" />
                    درحال انجام...
                </div>
            <div style="display: block; width: 689px;" id="tab1" class="tab_contentProfile">
                <table style="width: 100%; table-layout: fixed; height: 385px;" class="table">
                    <tr>
                        <td align="right" dir="rtl" style="padding-right: 5px; margin-right: 5px; width: 91px;">
                            <asp:Label ID="lblFirstName3" runat="server" Text="نام کاربری"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:TextBox ID="txtUserName" runat="server" Width="253px" CssClass="txt" ForeColor="Lime"
                                ReadOnly="true" BackColor="#222222"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" dir="rtl" style="padding-right: 5px; margin-right: 5px; width: 91px;">
                            <asp:Label ID="lblFirstName" runat="server" Text="نام"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:TextBox ID="txtFirstName" runat="server" Width="253px" CssClass="txt"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 91px;">
                            <asp:Label ID="lblFirstName0" runat="server" Text="نام خانوادگی"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:TextBox ID="txtLastName" runat="server" Width="253px" CssClass="txt"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 91px;">
                            <asp:Label ID="lblFirstName1" runat="server" Text="تاریخ تولد"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Label ID="lblYear" runat="server" Text="سال"></asp:Label>
                            &nbsp;<asp:DropDownList ID="ddlYear" runat="server" CssClass="ddl">
                            </asp:DropDownList>
                            &nbsp;<asp:Label ID="lblMonth" runat="server" Text="ماه"></asp:Label>&nbsp;<asp:DropDownList
                                ID="ddlMonth" runat="server" CssClass="ddl">
                                <asp:ListItem Value="1">فروردین</asp:ListItem>
                                <asp:ListItem Value="2">اردیبهشت</asp:ListItem>
                                <asp:ListItem Value="3">خرداد</asp:ListItem>
                                <asp:ListItem Value="4">تیر</asp:ListItem>
                                <asp:ListItem Value="5">مرداد</asp:ListItem>
                                <asp:ListItem Value="6">شهریور</asp:ListItem>
                                <asp:ListItem Value="7">مهر</asp:ListItem>
                                <asp:ListItem Value="7">آبان</asp:ListItem>
                                <asp:ListItem Value="8">آذر</asp:ListItem>
                                <asp:ListItem Value="9">دی</asp:ListItem>
                                <asp:ListItem Value="11">بهمن</asp:ListItem>
                                <asp:ListItem Value="12">اسفند</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;<asp:Label ID="lblDay" runat="server" Text="روز"></asp:Label>&nbsp;
                            <asp:DropDownList ID="ddlDay" runat="server" CssClass="ddl">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 91px;">
                            <asp:Label ID="lblFirstName2" runat="server" Text="جنسیت"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:RadioButtonList ID="rblSex" runat="server" RepeatDirection="Horizontal" Width="99px">
                                <asp:ListItem Value="0" Selected="True">مرد</asp:ListItem>
                                <asp:ListItem Value="1">زن</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; height: 54px;"
                            colspan="2">
                            <asp:Button ID="btnIndividualAttrRegister" runat="server" Text="ثبت" CssClass="btn"
                                Height="31px" Width="114px" OnClientClick="javascript:SavePublicAttrData();return false;" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 91px;">
                            &nbsp;
                        </td>
                        <td style="width: 416px" align="center">
                            <asp:Label ID="lblRegMsg" runat="server" Font-Bold="True" ForeColor="Lime"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="display: none;" id="tab2" class="tab_contentProfile">
                <table style="width: 100%; height: 385px;" class="table">
                    <tr>
                        <td align="right" dir="rtl" style="padding-right: 5px; margin-right: 5px; width: 116px;">
                            <asp:Label ID="Label1" runat="server" Text="شماره تلفن ثابت"></asp:Label>
                        </td>
                        <td style="width: 416px" align="right">
                            <asp:TextBox ID="txtPhone" runat="server" Width="329px" CssClass="txt"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 116px;">
                            <asp:Label ID="Label2" runat="server" Text="شماره همراه "></asp:Label>
                        </td>
                        <td style="width: 416px" align="right">
                            <asp:TextBox ID="txtMobile" runat="server" Width="329px" CssClass="txt"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 116px;">
                            <asp:Label ID="Label3" runat="server" Text="آدرس"></asp:Label>
                        </td>
                        <td style="width: 416px" align="right">
                            <asp:TextBox ID="txtAddress" runat="server" Width="554px" CssClass="txt"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 116px;">
                            <asp:Label ID="Label7" runat="server" Text="کشور"></asp:Label>
                        </td>
                        <td style="width: 416px" align="right">
                            <asp:DropDownList ID="ddlCountry" runat="server" Width="216px" CssClass="ddl">
                                <asp:ListItem>ایران</asp:ListItem>
                                <asp:ListItem>خارج از ایران</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 116px;">
                            <asp:Label ID="Label8" runat="server" Text="شهر"></asp:Label>
                        </td>
                        <td style="width: 416px" align="right">
                            <asp:DropDownList ID="ddlCity" runat="server" Width="216px" CssClass="ddl">
                                <asp:ListItem>تهران</asp:ListItem>
                                <asp:ListItem>قزوین</asp:ListItem>
                                <asp:ListItem>شیراز</asp:ListItem>
                                <asp:ListItem>مشهد</asp:ListItem>
                                <asp:ListItem>اصفهان</asp:ListItem>
                                <asp:ListItem>اردبیل</asp:ListItem>
                                <asp:ListItem>تبریز</asp:ListItem>
                                <asp:ListItem>گیلان</asp:ListItem>
                                <asp:ListItem>اهواز</asp:ListItem>
                                <asp:ListItem>خوزستان</asp:ListItem>
                                <asp:ListItem>سیستان وبلوچستان</asp:ListItem>
                                <asp:ListItem>کهکلویه و بویراحمد</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 116px;">
                            <asp:Button ID="btnContactInfoRegister" runat="server" Text="ثبت" CssClass="btn"
                                Height="31px" Width="114px" OnClientClick="javascript:SaveContactInfoData();return false;" />
                        </td>
                        <td style="width: 416px" align="center">
                            <asp:Label ID="lblContactInfoMsg" runat="server" Font-Bold="True" 
                                ForeColor="Lime"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="display: none;" id="tab3" class="tab_contentProfile">
                <table style="width: 100%; height: 385px;" class="table">
                    <tr>
                        <td align="right" dir="rtl" style="padding-right: 5px; margin-right: 5px; width: 95px;
                            height: 22px;">
                            <asp:Label ID="Label12" runat="server" Text="کلمه عبور قبلی"></asp:Label>
                        </td>
                        <td style="height: 22px" align="right">
                            <asp:TextBox ID="txtCurrentPassword" runat="server" Width="210px" CssClass="txt"
                                TextMode="Password"></asp:TextBox>
                            <%--                            <asp:Label ID="Label18" runat="server" Text="Label"></asp:Label>--%>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td align="right" dir="rtl" style="padding-right: 5px; margin-right: 5px; height: 100px;"
                            colspan="2">
                            <fieldset id="fspassword" runat="server" style="height: 118px">
                                <legend id="legend1" runat="server" style="border: 1px solid white; width: 180px;
                                    height: 30px;">&nbsp; ویرایش کلمه عبور(اختیاری)</legend>
                                <div style="height: 42px; margin-top: 10px">
                                    &nbsp;&nbsp;
                                    <asp:Label ID="Label17" runat="server" Text="رمز عبور جدید"></asp:Label>
                                    &nbsp;&nbsp;
                                    <asp:TextBox ID="txtnewPassword" runat="server" Width="210px" CssClass="txt" TextMode="Password"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                        ControlToCompare="txtdupNewPassword" ControlToValidate="txtnewPassword" 
                                        ErrorMessage="رمز عبور و تکرارش مطابقت ندارد" ForeColor="Yellow">رمز عبور و تکرارش مطابقت ندارد</asp:CompareValidator>
                                </div>
                                <div>
                                    &nbsp;&nbsp;
                                    <asp:Label ID="Label4" runat="server" Text="تکرار رمز عبور"></asp:Label>
                                    &nbsp; &nbsp;
                                    <asp:TextBox ID="txtdupNewPassword" runat="server" Width="210px" CssClass="txt" TextMode="Password"></asp:TextBox>
                                </div>
                            </fieldset>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td align="right" dir="rtl" style="padding-right: 5px; margin-right: 5px;" colspan="2">
                            <fieldset id="Fieldset1" runat="server" style="margin-top: 25px">
                                <legend id="legend2" runat="server" style="border: 1px solid white; width: 180px;
                                    height: 34px;">&nbsp; ویرایش آدرس ایمیل(اختیاری)</legend>
                                <div style="height: 41px">
                                    &nbsp;&nbsp;
                                    <asp:Label ID="Label5" runat="server" Text="آدرس ایمیل جدید"></asp:Label>
                                    &nbsp;&nbsp;
                                    <asp:TextBox ID="txtnewEmail" runat="server" Width="210px" CssClass="txt"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                        ControlToCompare="txtdupNewEmail" ControlToValidate="txtnewEmail" 
                                        ErrorMessage="ایمیل و تکرارش مطابقت ندارد" ForeColor="Yellow">ایمیل و تکرارش مطابقت ندارد</asp:CompareValidator>
                                    <span id="emailSpan"></span>
                                </div>
                                <div style="height: 33px">
                                    &nbsp;&nbsp;
                                    <asp:Label ID="Label6" runat="server" Text="تکرار آدرس ایمیل"></asp:Label>
                                    &nbsp; &nbsp;
                                    <asp:TextBox ID="txtdupNewEmail" runat="server" Width="210px" CssClass="txt"></asp:TextBox>
                                </div>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 116px;">
                            <asp:Button ID="btnEmailPassChange" runat="server" Text="ثبت" CssClass="btn" Height="31px"
                                Width="114px" OnClientClick="javascript:SaveEmailPassInfoData();return false;" />
                        </td>
                        <td style="width: 416px" align="center">
                            <asp:Label ID="lblEmailPassMsg" runat="server" Font-Bold="True" 
                                ForeColor="Lime"></asp:Label>
                                <br />
                                    <input type="text" ID="txtCurrentEmail" class="txt" readonly="readonly" style="display:none" runat="server" />
                        </td>
                    </tr>
                </table>                        
            </div>
            <div style="display: none;" id="tab4" class="tab_contentProfile">
                <table style="width: 100%; height: 216px; line-height: 40px" class="table">
                    <tr>
                        <td align="right" dir="rtl" style="padding-right: 5px; margin-right: 5px; width: 542px;">
                            <br />
                            <cc1:asyncfileupload id="fuPicture" runat="server" uploadingbackcolor="Yellow"
                                    throbberid="loading" 
                                onuploadedcomplete="ProcessUpload" OnClientUploadComplete="uploadComplete" />
                            <br />
                        </td>
                        <td align="center">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                   <asp:Image ID="imgUser" runat="server" Height="156px" Width="155px" ImageUrl="~/UserPanel/UserImgUpload/NoPhoto.jpg" 
                                BorderStyle="None" />  
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="fuPicture" />
                                </Triggers>
                            </asp:UpdatePanel>
  
                        </td>
                    </tr>
                    <tr>
                        <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 116px;">
                            <%--                            <asp:Button ID="btnPictureChange" runat="server" CssClass="btn" Height="31px" OnClick="btnPictureChange_Click"
                                Text="ثبت" Width="114px" />--%>
   <%--                         <asp:Label ID="Label22" runat="server" ForeColor="#ffcc00" Text=""></asp:Label>--%>
                        </td>
                        <td style="width: 416px" align="center">
                            <asp:Label ID="lblPictureMsg" runat="server" Font-Bold="True" ForeColor="Yellow"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="display: none;" id="tab5" class="tab_contentProfile">
                <table style="width: 100%; table-layout: fixed;" class="table">
                    <tr>
                        <td align="right" dir="rtl" style="padding-right: 5px; margin-right: 5px; width: 133px;">
                            <asp:Label ID="Label19" runat="server" Text="نام صاحب حساب"></asp:Label>
                        </td>
                        <td style="width: 416px">
                            <asp:TextBox ID="txtAccountName" runat="server" Width="253px" CssClass="txt"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" dir="rtl" style="padding-right: 5px; margin-right: 5px; width: 133px;">
                            <asp:Label ID="Label14" runat="server" Text="نام خانوادگی"></asp:Label>
                        </td>
                        <td style="width: 416px">
                            <asp:TextBox ID="txtAccountFamily" runat="server" Width="253px" CssClass="txt"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 133px;">
                            <asp:Label ID="Label10" runat="server" Text="شماره حساب بانکی"></asp:Label>
                        </td>
                        <td style="width: 416px">
                            <asp:TextBox ID="txtAccountNumber" runat="server" Width="253px" CssClass="txt"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 133px;">
                            
                            <asp:Label ID="Label18" runat="server" Text="نام بانک"></asp:Label>
                            
                        </td>
                        <td style="width: 416px">
                                            <asp:DropDownList ID="ddlBankName" runat="server"
                                                TabIndex="20" Width="253px" Font-Names="Tahoma" CssClass="ddl">
                                                <asp:ListItem>سیبای ملی</asp:ListItem>
                                                <asp:ListItem>سپهر صادرات</asp:ListItem>
                                                <asp:ListItem>جام ملت</asp:ListItem>
                                                <asp:ListItem>مهر کشاورزی</asp:ListItem>
                                                <asp:ListItem>بانک سپه</asp:ListItem>
                                                <asp:ListItem>بانک تجارت</asp:ListItem>
                                                <asp:ListItem>بانک سامان</asp:ListItem>
                                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 133px;">
                            
                            <asp:Label ID="Label21" runat="server" Text="آدرس سایت"></asp:Label>
                            
                        </td>
                        <td style="width: 416px">
                            <asp:TextBox ID="txtWebSite" runat="server" Width="253px" CssClass="txt"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 133px;">
                            <asp:Label ID="Label15" runat="server" Text="آیدی یاهو"></asp:Label>
                        </td>
                        <td style="width: 416px">
                            <asp:TextBox ID="txtYahooID" runat="server" Width="253px" CssClass="txt"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 133px;">
                            <asp:Label ID="Label20" runat="server" Text="امضا"></asp:Label>
                        </td>
                        <td style="width: 416px">
                            <asp:TextBox ID="txtComment" runat="server" Width="253px" CssClass="txt" 
                                Height="55px" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" dir="rtl" style="margin-right: 5px; padding-right: 5px; width: 116px;">
                            <asp:Button ID="Button1" runat="server" Text="ثبت" CssClass="btn" Height="31px" Width="114px"
                                OnClientClick="javascript:SaveAccountInfoData();return false;" />
                        </td>
                        <td style="width: 416px" align="center">
                            <asp:Label ID="lblAccountInfoMsg" runat="server" Font-Bold="True" 
                                ForeColor="Lime"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="display: none;" id="tab6" class="tab_contentProfile">
            </div>
        </div>
        </div>  
    </div>
</div>