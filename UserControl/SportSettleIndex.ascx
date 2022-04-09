<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportSettleIndex.ascx.cs" Inherits="UserControl_SportSettleIndex" %>
<link href="../Styles/CSSSport_SelectSettle.css" rel="stylesheet" type="text/css" />
<div id="sport_selectSettle">
    <fieldset class="sport_SettleFieldset">
        <div class="sport_SettleNote">
            <p>
                کاربر گرامی شما میتوانید با استفاده از کلیه کارتهای بانکی عضو شتاب از طریق انتخاب
                یکی از درگاههای بانکی در سایت در کلیه ساعات شبانه روز به صورت آنلاین نسبت به
                شارژ حساب کاربری خود اقدام نمائید.
                <br />
                <span style="color:Yellow; font-weight:bold;">تذکر: </span>
                مهلت شارژ حساب کاربری جهت فعالسازی فرم پیش بینی شرکت در مسابقات حداکثر تا 2 ساعت قبل از پایان
                مهلت شرکت در هر مسابقه می باشد،بدیهی است چنانچه شارژ حساب کاربری پس از پایان مهلت مقرر انجام گردد
                در صورت عدم فعالسازی فرم کاربر هیچ گونه مسئولیتی متوجه حس ششم نمی باشد و وجه واریری در حساب
                کاربری فرد موردنظر جهت شرکت در مسابقات بعدی باقی خواهد ماند.
            </p>
            <br /><br />
            <center>
                <fieldset class="sport_BankImage">
                        <img src="../Images/Bank_03.jpg" width="100%" />
<%--                    <img src="../Images/bank_saderat.png" width="200px" height="160px" align="middle" alt="بانک صادرات" />
                    <img src="../Images/bank_melli.png" width="200px" height="160px" align="middle" alt="بانک ملی" />
                    <img src="../Images/saman.png" width="200px" height="160px" align="middle" alt="بانک سامان" />--%>
                </fieldset>
                <br /><br />
                <input type="button" id="btn_SettleInternetShetab" onclick="javascript:window.location.href='Sport_InternetShetabPayment.aspx'"
                    class="sport_BtnForm" value="پرداخت اینترنتی آنلاین (با کارتهای عضو شتاب) " />
                <input type="button" value="برگشت" onclick="javascript:window.location.href='Sport_SelectRacing.aspx'" class="sport_BtnForm" />
            </center>
            <br /><br />
        </div>
    </fieldset>
</div>