<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportSelectSettle.ascx.cs"
    Inherits="UserControl_SportSelectSettle" %>
<link href="../Styles/CSSSport_SelectSettle.css" rel="stylesheet" type="text/css" />
<link href="../Styles/trontastic/jquery-ui-1.8.8.custom.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    function getImagePath()
    { return '<%= ImagePath %>'; }
    var imagePath = getImagePath();
    $(document).ready(function ()
    {
        $("#dialog:ui-dialog").dialog("destroy");
        $("#dialog-form").dialog({
            autoOpen: false,
            resizable: false,
            height: 290,
            width: 630,
            title: 'حس ششم',
            modal: true
        });
        $('.submit').click(function ()
        {
            $("#dialog-form").dialog("close");
        });
        $('#btn_SettleKartToKart').click(function ()
        {
            $('#result').html('');
            loadUserControl("UserControl/SportSettleKartToKart.ascx");
            $("#dialog-form").dialog("option", "title", 'کارت به کارت');
            $("#dialog-form").dialog("open");
        });
        $('#btn_SettleInternetBank').click(function ()
        {
            $('#result').html('');
            loadUserControl("UserControl/SportSettleInternetBank.ascx");
            $("#dialog-form").dialog("option", "title", 'حواله اینترنتی');
            $("#dialog-form").dialog("open");
        });
        $('#btn_SettlePocketStrap').click(function ()
        {
            $('#result').html('');
            loadUserControl("UserControl/SportSettlePocketStrap.ascx");
            $("#dialog-form").dialog("option", "title", 'فیش نقدی');
            $("#dialog-form").dialog("open");
        });
//        $('#btn_SettleInternetShetab').click(function ()
//        {
//            $('#result').html('');
//            loadUserControl("UserControl/SportSettleInternetShetab.ascx");
//            //$(".selector").dialog("option", "zIndex", 3999);
//            $("#dialog-form").dialog("option", "title", 'پرداخت اینترنتی با کارتهای عضو شتاب');
//            $("#dialog-form").dialog("open");
//        });
        function loadUserControl(obj)
        {
            $.blockUI(
                {
                    message: '<h4 style="font-family:tahoma;color:lime"><img src="' + imagePath + '/ajaxImages/loading_User.gif" /><br /><br />... درحال بارگذاری</h4>',
                    fadeIn: 1000,
                    fadeOut: 1000,
                    centerX: true,
                    centerY: true,
                    css:
                    {
                        border: 'none',
                        padding: '5px',
                        backgroundColor: 'transparent',
                        '-webkit-border-radius': '10px',
                        '-moz-border-radius': '10px',
                        opacity: .6,
                        color: '#000'
                    }
                    //,overlayCSS: { backgroundColor: '#ffffff', opacity: 0.6, border: '1px solid #000000' }
                });
            var ControlName = obj;
            $.ajax({
                type: "POST",
                cache: false,
                url: "Sport_SelectSettle.aspx/Result",
                data: "{controlName:'" + ControlName + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response)
                {
                    $('#result').html(response.d);
                    $.unblockUI();
                },
                failure: function (msg)
                {
                    $.unblockUI();
                    $('#result').html(msg);
                },
                error: function (xhr, status, error)
                {
                    $.unblockUI();
                    // Boil the ASP.NET AJAX error down to JSON.
                    var err = eval("(" + xhr.responseText + ")");

                    // Display the specific error raised by the server (e.g. not a
                    //   valid value for Int32, or attempted to divide by zero).
                    alert(err.Message);
                }
            });
        }
    });
</script>
<div id="sport_selectSettle">
    <fieldset class="sport_SettleFieldset">
        <span class="sport_SettleTitr">مشخصات حسابهای حس ششم جهت واریز وجه و شارژ حساب کاربران
            بنام ...........................</span>
        <div class="sport_Settle">
            <p>
            </p>
            <p>
                کارت به کارت(صادرات) : .................................................... حواله
                بانکی (ملی ) : ....................................................
            </p>
            <p>
                کارت به کارت(ملی) : .................................................... حواله بانکی
                (صادرات) : ....................................................
            </p>
            <p>
                کارت به کارت(سامان) : .................................................... حواله
                بانکی (سامان) : ....................................................
            </p>
        </div>
        <div style="padding: 5px 0 20px 0">
            <span style="color: yellow; font-size: 14px">تذکر:</span>
        </div>
        <div class="sport_SettleNote">
            <p>
                <img src="../Images/Sport/3991.png" style="height: 27px; width: 29px" alt="" />
                <span>مهلت شارژ حساب به روشهای 1 و 2</span> (<span style="color: #ffcc00">کارت به کارت
                    (دستگاه خود پرداز )</span> و <span style="color: #ffcc00">بانکداری اینترنتی (حواله اینترنتی)</span>
                ) <span>تا پایان وقت</span><br />
                <span style="padding: 0 35px 0 0;">اداری آخرین روز مهلت شرکت در هر مسابقه می باشد.</span>
            </p>
            <p>
                <img src="../Images/Sport/3991.png" style="height: 27px; width: 29px" alt="" />
                <span>مهلت شارژ حساب به روش 3</span> (<span style="color: #ffcc00">حواله بانکی (فیش
                    نقدی)</span>) <span>تا 24 ساعت قبل از پایان مهلت شرکت در هر مسابقه می باشد.</span>
            </p>
            <p>
                <img src="../Images/Sport/3991.png" style="height: 27px; width: 29px" alt="" />
                <span>مهلت شارژ حساب به روش 4 </span>(<span style="color: #ffcc00">پرداخت اینترنتی (آنلاین
                    با کارتهای عضو شتاب)</span>) <span>تا 2 ساعت قبل از پایان مهلت شرکت در هر </span>
                <br />
                <span style="padding: 0 35px 0 0; line-height: 35px">مسابقه می باشد.</span>
            </p>
            <p>
                بدیهی است پس از شارژ حساب کاربری پس از مهلت مقرر در صورت عدم فعال سازی فرم کاربر
                هیچ گونه مسئولیتی متوجه حس ششم نمی باشد و وجه واریزی در حساب کاربری فرد مورد نظر
                باقی می ماند .
            </p>
        </div>
        <div style="text-align: center; color: #ffffcc">
            لطفاً روش پرداخت خود را انتخاب نمائید</div>
        <div style="text-align: center;">
            <input type="button" id="btn_SettleKartToKart" class="sport_BtnForm" value="1 - کارت به کارت (دستگاه خود پرداز)" />
            <input type="button" id="btn_SettleInternetBank" class="sport_BtnForm" value="2 - بانکداری اینترنتی (حواله اینترنتی)" />
            <input type="button" id="btn_SettlePocketStrap" class="sport_BtnForm" value="3 - حواله بانکی ( فیش نقدی)" />
            <input type="button" id="btn_SettleInternetShetab" onclick="javascript:window.location.href='Sport_InternetShetabPayment.aspx'"
                class="sport_BtnForm" value="4 - پرداخت اینترنتی(آنلاین با کارتهای عضو شتاب) " />
        </div>
        <div class="divBtnForm">
            <%--<input type="button" id="btn_Exit" class="sport_BtnForm" value="برگشت" onclick="window.location.href='Sport_SelectRacing.aspx'" />--%>
            <asp:Button ID="btn_Exit" runat="server" Text="برگشت" CssClass="sport_BtnForm" OnClick="btn_Exit_Click"
                CausesValidation="False" />
        </div>
    </fieldset>
</div>
<div aria-labelledby="ui-dialog-title-dialog-form" role="dialog" tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
    style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: 250px;
    width: 350px; top: 82px; left: 460px;">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
        <span id="ui-dialog-title-dialog-form" class="ui-dialog-title">ثبت فرم</span> <a
            role="button" class="ui-dialog-titlebar-close ui-corner-all" href="Home.aspx"><span
                class="ui-icon ui-icon-closethick">بستن</span> </a>
    </div>
    <div style="width: auto; min-height: 0px; height: auto;" class="ui-dialog-content ui-widget-content"
        id="dialog-form">
        <form id="frm_SportSettle">
        <fieldset>
            <div style="height: auto" id="result">
                <%--محل یوزر کنترل--%>
            </div>
        </fieldset>
        </form>
    </div>
    <div class="ui-resizable-handle ui-resizable-n"></div>
    <div class="ui-resizable-handle ui-resizable-e"></div>
    <div class="ui-resizable-handle ui-resizable-s">
    </div>
    <div class="ui-resizable-handle ui-resizable-w">
    </div>
    <div style="z-index: 1001;" class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se">
    </div>
    <div style="z-index: 1002;" class="ui-resizable-handle ui-resizable-sw">
    </div>
    <div style="z-index: 1003;" class="ui-resizable-handle ui-resizable-ne">
    </div>
    <div style="z-index: 1004;" class="ui-resizable-handle ui-resizable-nw">
    </div>
</div>