<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BoxesOperation.ascx.cs" Inherits="AdminPanel_AdminUserControl_BoxesOperation" %>
<fieldset>
    <legend style="color: #ffcc00;font-size: 20px">عملیات مالی</legend>
    <ul style="line-height:40px;">
        <li><a href="#" id="site" class="btn_Operation">1 - عملیات صندوق سایت</a></li>
        <li><a href="#" id="govern" class="btn_Operation">2 - عملیات صندوق دولتی</a></li>
        <li><a href="#" id="charitable" class="btn_Operation">3 - عملیات صندوق عام المنفعه</a></li>
        <li><a href="#" id="reward" class="btn_Operation">4 - عملیات صندوق جوایز</a></li>
        <li><a href="../AdminPanel/SportVariance.aspx" id="variance" class="btn_Operation">5 - عملیات مغایرت</a></li>
    </ul>
</fieldset>

<div id="divFinanceOperation" aria-labelledby="ui-dialog-title-dialog-form" role="dialog"
    tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
    style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: auto;
    width: 800px; top: 82px; left: 460px;">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
        <span id="ui-dialog-title-dialog-form" class="ui-dialog-title">نوع عملیات</span><a role="button"
            class="ui-dialog-titlebar-close ui-corner-all" href="#"><span class="ui-icon ui-icon-closethick">بستن</span></a></div>
    <div style="width: auto; min-height: 0px; height: auto" class="ui-dialog-content ui-widget-content" id="dialog-form">
        <form id="frm_FinanceOperation">
            <fieldset>
                <span>لطفا نوع عملیات موردنظر خود را انتخاب نمائید. </span>&nbsp;&nbsp;&nbsp; 
                <span style="color: #282828; font-weight:bold;" id="operationKind"></span><br /><br />
                <input type="button" value="دریافت" class="submit" id="btn_receipt" />
                <input type="button" value="پرداخت" class="submit" id="btn_payment" />
            </fieldset>
        </form>
    </div>
    <div class="ui-resizable-handle ui-resizable-n"></div><div class="ui-resizable-handle ui-resizable-e"></div><div class="ui-resizable-handle ui-resizable-s"></div><div class="ui-resizable-handle ui-resizable-w"></div><div style="z-index: 1001;" class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se"></div><div style="z-index: 1002;" class="ui-resizable-handle ui-resizable-sw"></div><div style="z-index: 1003;" class="ui-resizable-handle ui-resizable-ne"></div><div style="z-index: 1004;" class="ui-resizable-handle ui-resizable-nw"></div><div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix"></div>
</div>
    <script src="../Scripts/jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function ()
    {
        $("#dialog:ui-dialog").dialog("destroy");
        $("#dialog-form").dialog({
            autoOpen: false, resizable: false, height: 'auto', width: 450, direction: 'rtl',
            show: 'clip', hide: 'clip', stack: true, position: 'center', title: 'تعیین نوع عملیات', modal: true
        }); $('.submit').click(function () { $("#dialog-form").dialog("close"); });
        var boxId = -1;
        $('.btn_Operation').click(function ()
        {
            var id = $(this).attr('id');
            var box = '';
            if (id == 'site') { box = ' صندوق سایت'; boxId = 1; }
            if (id == 'govern') { box = ' صندوق دولتی'; boxId = 2; }
            if (id == 'charitable') { box = ' صندوق عام المنفعه'; boxId = 3; }
            if (id == 'reward') { box = ' صندوق جوایز'; boxId = 4; }
            if (id == 'variance') { box = ' صندوق مغایرت'; boxId = 5; }
            $('span[id$=operationKind]').html(box);
            if(boxId != 5)
                jQuery('#dialog-form').dialog('open');
        });
        $('#btn_receipt').click(function ()
        {
            if (boxId == 1)
            {
                window.location.href = "SiteReceiptDocumentOperation.aspx";
            }
            if (boxId == 2)
            {
                window.location.href = "GovernReceiptDocumentOperation.aspx";
            }
            if (boxId == 3)
            {
                window.location.href = "CharitableReceiptDocumentOperation.aspx";
            }
            if (boxId == 4)
            {
                window.location.href = "RewardReceiptDocumentOperation.aspx";
            }
        });
        $('#btn_payment').click(function ()
        {
            if (boxId == 1)
            {
                window.location.href = "SitePaymentDocumentOperation.aspx";
            }
            if (boxId == 2)
            {
                window.location.href = "GovernPaymentDocumentOperation.aspx";
            }
            if (boxId == 3)
            {
                window.location.href = "CharitablePaymentDocumentOperation.aspx";
            }
            if (boxId == 4)
            {
                window.location.href = "RewardPaymentDocumentOperation.aspx";
            }
        });

    });
</script>
