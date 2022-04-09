<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserVariance.ascx.cs" Inherits="UserPanel_UserVariance" %>
<%@ Register Assembly="PersianDatePickup" Namespace="PersianDatePickup" TagPrefix="pcal" %>
<link href="../Styles/black-tie/jQuery-ui-1.8.6.custom.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    .style1
    {
        width: 199px;
    }
    .style2
    {
        width: 107px;
    }
</style>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div class="userReward">
    <fieldset style="text-align:right;">
        <legend>اعلام مغایرت</legend>
        <span style="color:Window;width: 70%;line-height:35px;font-family:Tahoma;text-align:right">درصورت مشاهده مغایرت در حساب خود با انتخاب گزینه اعلام مغایرت جزئیات خود را ثبت نمایید.ظرف مدت 48 ساعت نسبت به بررسی و اعلام نتیجه به شما از طریق ایمیل اعلامی شما و در صورت نیاز اصلاح صندوق حساب شما اقدام می گردد.</span>
        <br /><br />
        <div>
            <input type="button" class="btn" value="اعلام مغایرت" onclick="showVarianceWindow()" />
            <input type="button" class="btn" value="بازگشت" />
        </div>
    </fieldset>
</div>

<div id="divVariance" aria-labelledby="ui-dialog-title-dialog-form" role="dialog"
    tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
    style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: auto;
    width: 800px; top: 82px; left: 460px;">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
        <span id="ui-dialog-title-dialog-form" class="ui-dialog-title">اعلام مغایرت</span><a role="button"
            class="ui-dialog-titlebar-close ui-corner-all" href="#"><span class="ui-icon ui-icon-closethick">بستن</span></a></div>
    <div style="width: auto; min-height: 0px; height: auto; top: 0px; left: 0px;" class="ui-dialog-content ui-widget-content"
        id="dialog-Variance">
        <div style="direction:rtl;text-align:right;line-height:25px">
            <fieldset>
                    <legend style="text-align: center;color:#222222">فرم ثبت مغایرت</legend>
                    <table style="text-align:right;font-family:Tahoma; width:100%;float:right">
                        <tr>
                            <td class="style2"><span>نوع مغایرت</span></td>
                            <td>
                                <asp:DropDownList ID="ddl_VarianceType" runat="server" Height="28px" CssClass="txt">
                                    <asp:ListItem Selected="True" Value="-1">انتخاب کنید...</asp:ListItem>
                                    <asp:ListItem Value="0">شارژ حساب</asp:ListItem>
                                    <asp:ListItem Value="1">صندوق جایزه</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2"><span>مبلغ مغایرت</span></td>
                            <td><asp:TextBox ID="txt_VarianceAmount" CssClass="txt" runat="server" onkeydown="javascript:return jsNumbers(event);"></asp:TextBox><span> ریال </span></td>
                        </tr>
                        <tr>
                            <td class="style2"><span>تاریخ مغایرت</span></td>
                            <td><pcal:PersianDatePickup ID="pdp_VarianceDate" runat="server" CssClass="txt" ReadOnly="true"></pcal:PersianDatePickup></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="style1">
                                <span>شرح</span><br />
                                <asp:TextBox ID="txt_varianceDescription" runat="server" CssClass="txt" TextMode="MultiLine" Height="92px" 
                                    Width="400px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="button" class="btn" value="ثبت و ارسال" onclick="insertVariance()"/></td>
                            <td><input type="button" class="btn" value="بازگشت" onclick="$('#dialog-Variance').dialog('close');"></td>
                        </tr>
                    </table>        
            </fieldset>
        </div>        
    </div>
    <div class="ui-resizable-handle ui-resizable-n"></div><div class="ui-resizable-handle ui-resizable-e"></div><div class="ui-resizable-handle ui-resizable-s"></div><div class="ui-resizable-handle ui-resizable-w"></div><div style="z-index: 1001;" class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se"></div><div style="z-index: 1002;" class="ui-resizable-handle ui-resizable-sw"></div><div style="z-index: 1003;" class="ui-resizable-handle ui-resizable-ne"></div><div style="z-index: 1004;" class="ui-resizable-handle ui-resizable-nw"></div><div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix"></div>
</div>
<script src="../Scripts/OnlyNumber.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
    function getImagePath() { return '<%= ImagePath %>'; } var imagePath = getImagePath();
    function showVarianceWindow()
    {        
        $('#dialog-Variance').dialog('open');
    }
//    function getUserID()
//    {
//        return '<%= ActiveUserID %>';
//    }
//    var activeUserID = getUserID();

    function isUserAuthenticated()
    {
        return '<%= IsUserAuthenticated %>';
    }
    var isAuthenticated = isUserAuthenticated();
    function setBlock()
    {
        $.blockUI({ message: '<h4 style="font-family:tahoma;color:lime"><img src="' + imagePath + '/ajaxImages/loading_User.gif" /><br /><br /></h4>',
            fadeIn: 1000, fadeOut: 1000, centerX: true, centerY: true,
            css: { border: 'none', padding: '5px', backgroundColor: 'transparent', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .6, color: '#000' }
        });
    }
    function clearValues()
    {
        $('select[id$=ddl_VarianceType]').val(-1);
        $('input:text[id$=txt_VarianceAmount]').val("");
        $('input:text[id$=pdp_VarianceDate]').val("");
        $('[id$=txt_varianceDescription]').val("");
        $('select[id$=ddl_VarianceType] option:selected').focus();
    }
    function insertVariance()
    {
        setBlock();
        var varianceType = $('select[id$=ddl_VarianceType] option:selected').val();
        var varianceAmount= $('input:text[id$=txt_VarianceAmount]').val();
        var varianceDate = $('input:text[id$=pdp_VarianceDate]').val();
        var varianceDescription = $('[id$=txt_varianceDescription]').val();
        if (varianceType == -1)
        {
            alert("نوع مغایرت را مشخص نمائید");
            $('select[id$=ddl_VarianceType] option:selected').focus();
            $.unblockUI();
            return;
        }
        if (varianceAmount == "")
        {
            alert("مبلغ مغایرت را وارد نمائید");
            $('input:text[id$=txt_VarianceAmount]').focus();
            $.unblockUI();
            return;
        }
        if(varianceDate == "")
        {
            alert("تاریخ مغایرت را وارد نمائید");
            $('input:text[id$=pdp_VarianceDate]').focus();
            $.unblockUI();
            return;
        }
        if(varianceDescription == "")
        {
            alert("شرح مغایرت را وارد نمائید");
            $('[id$=txt_varianceDescription]').focus();
            $.unblockUI();
            return;
        }

        $.ajax({
            type: "POST",
            url: "UserProfileRegister.aspx/InsertVariance",
            data: "{ varianceType: '" + varianceType +
                "',varianceAmount: '" + varianceAmount + "',varianceDate: '" + varianceDate +
                "',varianceDescription: '" + varianceDescription + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data)
            {
                $.unblockUI();
                alert('مغایرت مورد نظر ثبت گردید');                
                clearValues();
            },
            error: function (response)
            {
                $.unblockUI();
                alert("خطای  : " + response.d);
            }
        });
    }
    $(document).ready(function ()
    {
        $("#dialog:ui-dialog").dialog("destroy");
        $("#dialog-Variance").dialog({
            autoOpen: false, resizable: false, height: 'auto', width: 500, direction: 'rtl',
            show: 'clip', hide: 'clip', stack: true, position: 'center', title: 'اعلام مغایرت', modal: true
        }); $('.submit').click(function () { $("#dialog-Variance").dialog("close"); });

        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_beginRequest(function ()
        {
            setBlock();
        });
        prm.add_endRequest(function ()
        {
            $.unblockUI();
        });
    });
</script>