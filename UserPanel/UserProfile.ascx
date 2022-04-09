<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserProfile.ascx.cs" Inherits="UserPanel_UserProfile" %>
<link href="../Styles/CSSUserProfile.css" rel="stylesheet" type="text/css" />
<script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
<script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
<script type="text/javascript">
    function getImagePath() { return '<%= ImagePath %>'; } var imagePath = getImagePath();
    jQuery.noConflict();
    jQuery(document).ready(function ($)
    {
        jQuery('div.sidenav:eq(0)> div.subnav:not(:first)').hide();
        //jQuery('div.sidenav:eq(0)> div.subnav').hide();
        jQuery('div.sidenav:eq(0)> div.navhead').click(function ()
        {
            jQuery(this).parent().find("div.subnav").slideUp('normal');
            jQuery(this).parent().find("div.navhead").removeClass("selected");
            jQuery(this).next().slideToggle('fast');
            jQuery(this).toggleClass("selected");
        });
    });
</script>
<div id="container">
    <div id="sidebar">
        <div class="sidebox">
            <div id="navigation">
                <div class="sidenav">
                    <div class="navhead">
                        <span id="spanHome">صفحه نخست</span>
                    </div>
                        <div class="subnav">
                        <ul class="submenu">
                            <li><a href="../Home.aspx" title="">سایت</a></li>
                            <li><a href="../Sport/Sport_Home.aspx" title="">مسابقات فوتبال</a></li>
                            <li><a href="#" title="">بازیهای ورزشی</a></li>
<%--                            <li><a href="../Economic/EconomicHome.aspx" title="">اقتصاد و بازرگانی</a></li>
                            <li><a href="../EducationHome.aspx" title="">مهاجرت و تحصیل</a></li>--%>
                        </ul>
                    </div>
                    <div class="navhead selected">
                        <span>مشخصات کاربری</span>
                    </div>
                    <div class="subnav">
                        <ul class="submenu">
                            <li><a id="btn_PublicAttr" runat="server">اطلاعات فردی</a></li>
                            <li><a id="btn_GeneralInfo" runat="server">اطلاعات تکمیلی</a></li>
                            <li><a id="btn_ContactInfo" runat="server">اطلاعات تماس</a></li>
                            <li><a id="btn_EmailPass" runat="server">تغییر ایمیل و رمز عبور</a></li>
                            <li><a id="btn_Avatar" href="~/UserPanel/UserAvatarUpload.aspx" runat="server">بارگذاری تصویر کاربر</a></li>
                        </ul>
                    </div>
                    <div class="navhead">
                        <span>فرم های من</span></div>
                    <div class="subnav">
                        <ul class="submenu">
                            <li><a id="btn_ActiveForms" runat="server">فرمهای فعال</a></li>
                            <li><a id="btn_ArchiveForms" runat="server">آرشیو فرمها</a></li>
                        </ul>
                    </div>
                    <div class="navhead">
                        <span>حساب های من</span>
                    </div>
                    <div class="subnav">
                        <ul class="submenu">
                            <li><a id="btn_UserInventoryStatus" runat="server">وضعیت موجودی</a></li>
<%--                            <li><a id="btn_UserPayments" runat="server">وضعیت پرداختهای من</a></li>--%>
                            <li><a id="btn_UserRewardBox" runat="server">صندوق جایزه</a></li>
                            <li><a id="btn_UserPayments" runat="server">آخرین پرداختهای من</a></li>
                            <li><a id="btn_Variance" runat="server">مغایرت</a></li>
                        </ul>
                    </div>
                    <div class="navhead">
                        <span>صندوق پیام ها</span>
                    </div>
                    <div class="subnav">
                        <ul class="submenu">
                            <li><a id="btn_UserSendMessage" href="UserSendMessage.aspx" runat="server">ارسال پیام جدید</a></li>
                            <li><a href="UserAllSendMessages.aspx" title="">پیامهای ارسالی</a></li>
                            <li><a href="UserReceiveMessages.aspx" title="">پیامهای دریافتی</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="litralContent"><asp:PlaceHolder ID="PlaceHolder_Result" EnableViewState="false" runat="server"></asp:PlaceHolder></div>