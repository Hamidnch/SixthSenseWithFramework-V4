<%@ Page Title="" Language="C#" MasterPageFile="~/Sport/SportPayment.master" AutoEventWireup="true" CodeFile="Sport_InternetShetabPayment.aspx.cs" Inherits="Sport_Sport_InternetShetabPayment" %>
<%@ Register src="../UserControl/SportSamanPayment.ascx" tagname="SportSamanPayment" tagprefix="uc2" %>
<%@ Register src="../UserControl/SportMenu.ascx" tagname="SportMenu" tagprefix="uc1" %>
<%@ Register Src="../UserControl/ContactUs.ascx" TagName="ContactUs" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/CSSSportMaster.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSSport_Login.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSStxtLogin.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CSSSportMenu.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CssSport_SettleInternetShetab.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/dark-hive/jquery-ui-1.8.5.custom.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/CssContactWithUs.css" rel="stylesheet" type="text/css" />

    <script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
    <script src="../Scripts/OnlyNumber.js" type="text/javascript"></script>
    <script src="../Scripts/HighlightText.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        function getImagePath()
        { return '<%= ImagePath %>'; }
        var imagePath = getImagePath();
        $(document).ready(function ()
        {
            $("#dialog:ui-dialog").dialog("destroy"); $("#dialog-formContactUs").dialog({ autoOpen: false, resizable: false, height: 550, width: 500, title: "تماس با ما", show: 'clip', hide: 'cut', direction: "rtl", bgiframe: false, modal: true }); $('.submit').click(function () { $("#dialog-formContactUs").dialog("close"); }); $('.btnContactUs').click(function () { $("#dialog-formContactUs").dialog("open"); });

            var rb = $('#<%= rb_BankPort.ClientID %>');
            $(rb).change(function ()
            {
                var selected = $(this).find('input[type=radio]:checked').val();
                if (selected == 0)
                {
//                    document.forms[0].method = "post";
//                    document.forms[0].action = "https://Damoon.bankmelli-iran.com/MerchantsIntegrationTestController";
                    loadUserControl("UserControl/SportMeliPayment.ascx");
                }
                else
                    if (selected == 1)
                    {

                        loadUserControl("UserControl/SportSaderatPayment.ascx");
                    }
                    else
                        if (selected == 2)
                        {
                            loadUserControl("UserControl/SportSamanPayment.ascx");
                        }
            });
        });
        function loadUserControl(obj)
        {
            $.blockUI(
                {
                    message: '<h4 style="font-family:tahoma;color:lime"><img src="' + imagePath + '/ajaxImages/loading_User.gif" /><br /><br /></h4>',
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
                        color: '#fff'
                    }
                });
            var ControlName = obj;
            $.ajax({
                type: "POST",
                url: "Sport_InternetShetabPayment.aspx/Result",
                data: "{controlName:'" + ControlName + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response)
                {
                    $.unblockUI();
                    $('#result').html(response.d);
                },
                failure: function (msg)
                {
                    $.unblockUI();
                    $('#result').html(msg);
                }
                //                ,error: function (xhr, status, error)
                //                {
                //                    $.unblockUI();
                //                    // Boil the ASP.NET AJAX error down to JSON.
                //                    var err = eval("(" + xhr.responseText + ")");

                //                    // Display the specific error raised by the server (e.g. not a
                //                    //   valid value for Int32, or attempted to divide by zero).
                //                    alert(err.Message);
                //                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 
    <uc1:SportMenu ID="SportMenu1" runat="server" /> 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <form id="form_InternetShetab">
        <div id="sport_SettleInternetShetab">
            <table style="width: 100%; line-height: 35px; padding: 20px">
                <tr>
                    <td style="font-size: 18px; font-weight: bold;text-align:center;color:Yellow"><span>پرداخت آنلاین اینترنتی با کارتهای عضو شتاب</span></td>
                </tr>
                <tr><td><br /><span style="padding-left: 6px;font-style: italic;color: #CFCCC5;">لطفا درگاه موردنظر خود را جهت پرداخت انتخاب نمائید.</span></td></tr>
                <tr>
                    <td>
                        <asp:RadioButtonList ID="rb_BankPort" runat="server" CssClass="radio" RepeatDirection="Horizontal"
                            Width="99%" Height="100px" >
         <%--                   onselectedindexchanged="rb_BankPort_SelectedIndexChanged" AutoPostBack="True">--%>
                            <asp:ListItem Value="0"><img width="70px" height="70px" src="../Images/bank_melli.png" align="middle" /> درگاه پرداخت اینترنتی بانک ملی</asp:ListItem>
                            <asp:ListItem Value="1"><img width="70px" height="70px" src="../Images/bank_saderat.png" alt="" align="middle" /> درگاه پرداخت اینترنتی بانک صادرات</asp:ListItem>                    
                            <asp:ListItem Value="2"><img width="70px" height="70px" src="../Images/saman.png" align="middle" />درگاه پرداخت اینترنتی بانک سامان</asp:ListItem>
                        </asp:RadioButtonList>        
                    </td>
                </tr>
                <tr>  
                    <td><div id="result"></div></td>
                    <%--<asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>--%>                                              
                </tr>
                <tr>
                    <td>
                        <input type="button" class="sport_BtnForm" value="برگشت" onclick="javascript:window.location.href = 'Sport_SettleIndex.aspx'" />
                    </td>
                </tr>
            </table>                 
        </div>   
<%--ContactUs Modal --%><div id="dialog" aria-labelledby="ui-dialog-title-dialog-form" role="dialog" tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable" style="display: none; z-index: 10002; outline: 0px none; position: absolute; height: 550px; width: 450px; top: 82px; left: 460px;">
<div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix"><span id="ui-dialog-title-dialog-form" class="ui-dialog-title">تماس با ما</span><a role="button" class="ui-dialog-titlebar-close ui-corner-all" href="#"><span class="ui-icon ui-icon-closethick">بستن</span> </a></div>
<div style="width: auto; min-height: 0px; height: 550px;" class="ui-dialog-content ui-widget-content" id="dialog-formContactUs"><fieldset style="padding:0;border:0;margin-top:25px"><div><uc3:ContactUs ID="ContactUs3" runat="server" /></div></fieldset></div></div>           
    </form>           
</asp:Content>

