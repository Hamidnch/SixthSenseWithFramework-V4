<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EconomicServices.ascx.cs" Inherits="UserControl_EconomicServices" %>

<%@ Register src="ContactUs.ascx" tagname="ContactUs" tagprefix="uc1" %>

<link href="../Styles/CSSEco_Login.css" rel="stylesheet" type="text/css" />
<link href="../Styles/CSStxtLogin.css" rel="stylesheet" type="text/css" />
<link href="../Styles/CSSEco_Services.css" rel="stylesheet" type="text/css" />
<link href="../Styles/Common.css" rel="stylesheet" type="text/css" />
<link href="../Styles/dark-hive/jquery-ui-1.8.5.custom.css" rel="stylesheet" type="text/css" />

<%--<script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>--%>
<%--<script src="../Scripts/jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>--%>
<script type="text/javascript">
    $(document).ready(function ()
     {
        $("#dialog:ui-dialog").dialog("destroy");
        $("#dialog-form").dialog({
            autoOpen: false,
            resizable: false,
//            top: ($(window).height() - 550) / 2 + 'px',
//            left: ($(window).width() - 500) / 2 + 'px',
            height: 550,
            width: 500,
            bgiframe: false,
            modal: true
        }); 
        $('.submit').click(function ()
        {
            $("#dialog-form").dialog("close");
        });
        $('.btnContactUs').click(function ()
        {
            $("#dialog-form").dialog("open");
        });
     });
</script>

<div class="ecoServicesMainDescription">
    <div class="ecoServicesBorderTopLeft"></div>
    <div class="ecoServicesBorderMiddleTop"></div>
    <div class="ecoServicesBorderTopRight"></div>
    <div class="ecoServicesContentMiddle">
        <span class="txtContent" >مدیریت سایت بهمراه
            کارشناسان مجرب و با تجربه در امور تجاری ، مالی و املاک راهکارهای مفید و مؤثری را
            در این بخش ارائه می نمایند و کاربران محترم می توانند با مسئولین مربوطه از طریق (Email
            ، تلفن و حضور مستقیم در دفتر مربوطه ) با انجام مشاوره در هر یک از موارد مورد نیاز
            گامی صحیح در جهت اهداف خود بردارند.
            <br />
            <b style="float: left; padding-left: 20px;">
                 <a class="btnContactUs" style="cursor:pointer;text-decoration:underline;">تماس با ما</a>
            </b>
        </span>
    </div>
    <div class="ecoServicesBorderBottomLeft"></div>
    <div class="ecoServicesBorderMiddleBottom"></div>
    <div class="ecoServicesBorderBottomRight"></div>
</div>
<div class="ecoServices_IndustrialTitr">
</div>
<div class="ecoServicesMainDescription">
    <div class="ecoServicesBorderTopLeft">
    </div>
    <div class="ecoServicesBorderMiddleTop">
    </div>
    <div class="ecoServicesBorderTopRight">
    </div>
    <div class="ecoServicesContentMiddle">
        <span class="txtContent">
            1 - مشاوره و ارائه راهکارهای مناسب سرمایه گذاری با توجه به
            فرصتهای اقتصادی کشور و اولویتهای استانی با نظر کارشناسان خبره بر اساس آخرین اطلاعات
            <br />
            2 - مشاوره و پیگیری جهت اخذ مجوزهای صنعتی و تجاری توسط افراد مجرب 
            <br />
            <b style="float: left; padding-left: 20px;">
                <a class="btnContactUs" style="cursor:pointer;text-decoration:underline;">تماس با ما</a>
            </b>
        </span>
    </div>
    <div class="ecoServicesBorderBottomLeft">
    </div>
    <div class="ecoServicesBorderMiddleBottom">
    </div>
    <div class="ecoServicesBorderBottomRight">
    </div>
</div>
<div class="ecoServices_FinanceTitr">
</div>
<div class="ecoServicesMainDescription">
    <div class="ecoServicesBorderTopLeft">
    </div>
    <div class="ecoServicesBorderMiddleTop">
    </div>
    <div class="ecoServicesBorderTopRight">
    </div>
    <div class="ecoServicesContentMiddle">
        <span class="txtContent">
            1 – مشاوره و انجام امور حسابداری ، تکمیل دفاتر مالی ، اظهارنامه
                        و ... مربوط به شرکتها ، بنگاههای کسب و کار و افراد حقیقی با استفاده از افراد ذیصلاح            
            <br />
            2 – مشاوره و ارائه راهکارهای مناسب تأمین نقدینگی و اعتبار مالی بر اساس نوع کسب و
            کار
            <br />
            <b style="float: left; padding-left: 20px;">
                <a class="btnContactUs" style="cursor:pointer;text-decoration:underline;">تماس با ما</a>
            </b>
        </span>
    </div>
    <div class="ecoServicesBorderBottomLeft">
    </div>
    <div class="ecoServicesBorderMiddleBottom">
    </div>
    <div class="ecoServicesBorderBottomRight">
    </div>
</div>
<div class="ecoServices_RegisterTitr">
</div>
<div class="ecoServicesMainDescription">
    <div class="ecoServicesBorderTopLeft">
    </div>
    <div class="ecoServicesBorderMiddleTop">
    </div>
    <div class="ecoServicesBorderTopRight">
    </div>
    <div class="ecoServicesContentMiddle">
        <span class="txtContent">
            مشاوره و پیگیری ثبتی و حقوقی در امور املاک و امور مالی شرکتها
                        و افراد حقیقی و حقوقی
            <br />
            <b style="float: left; padding-left: 20px;">
                <a class="btnContactUs" style="cursor:pointer;text-decoration:underline;">تماس با ما</a>
            </b>
           
    </span>
    </div>
    <div class="ecoServicesBorderBottomLeft">
    </div>
    <div class="ecoServicesBorderMiddleBottom">
    </div>
    <div class="ecoServicesBorderBottomRight">
    </div>
</div>

<div id="dialog" aria-labelledby="ui-dialog-title-dialog-form" role="dialog" tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
    style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: 550px;
    width: 450px; top: 82px; left: 460px;">
   <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
        <span id="ui-dialog-title-dialog-form" class="ui-dialog-title">تماس با ما</span>
        <a role="button" class="ui-dialog-titlebar-close ui-corner-all" href="#"><span class="ui-icon ui-icon-closethick">
            بستن</span> </a>
    </div>
    <div style="width: auto; min-height: 0px; height: 550px;" class="ui-dialog-content ui-widget-content"
        id="dialog-form">
        <fieldset>
            <div>
                <uc1:ContactUs ID="ContactUs1" runat="server" />

            </div>
        </fieldset> 
    </div>
<%--    <div class="ui-resizable-handle ui-resizable-n">
    </div>
    <div class="ui-resizable-handle ui-resizable-e">
    </div>
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
    </div>--%>
</div>






