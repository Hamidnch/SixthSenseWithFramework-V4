<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EconomicPartnership.ascx.cs"
    Inherits="UserControl_EconomicPartnership" %>
<%@ Register Src="EconomicArticleOrder.ascx" TagName="EconomicArticleOrder" TagPrefix="uc1" %>
<%@ Register Src="EconomicArticleMarket.ascx" TagName="EconomicArticleMarket" TagPrefix="uc2" %>
<link href="../Styles/CSSEco_Partnership.css" rel="stylesheet" type="text/css" />
<link href="../Styles/CSSEco_Login.css" rel="stylesheet" type="text/css" />
<link href="../Styles/CSStxtLogin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    function getImagePath()
    { return '<%= ImagePath %>'; }
    var imagePath = getImagePath();
    //        jQuery.noConflict();
    $(document).ready(function ()
    {
        loadUserControl("UserControl/EconomicArticleMarket.ascx");
        function loadUserControl(obj)
        {
            $.blockUI({ message: '<h1><img src="' + imagePath + '/ajaxImages/loading_User.gif" /><br /><br />... درحال بارگذاری</h1>',
                fadeIn: 1000,
                fadeOut: 1000,
                centerX: true,
                centerY: true,
                css: {
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
                url: "EconomicPartnership.aspx/Result",
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
            });
        }
        $('#btn_Bongah').click(function ()
        {
            loadUserControl("UserControl/EconomicBongah.ascx");
        });
        $('#btn_Article').click(function ()
        {
            loadUserControl("UserControl/EconomicArticleMarket.ascx");
        });
    });
</script>
<%--<script type="text/javascript">
    function showModal(displayStyle)
    {
        var top = ($(window).height() - $('.myDiv').outerHeight()) / 2;
        var left = ($(window).width() - $('.myDiv').outerWidth()) / 2;
        switch (displayStyle)
        {
            case "block":
                {
                    $('#screen').css({ "display": "block", opacity: 0.5,
                        "width": $(document).width(),
                        "height": $(document).height(),
                        "background-color": "gray"
                    });
                    $('body').css({ "overflow": "scroll" });
                    $('.myDiv').fadeIn(50);
                    break;
                }
            case "none":
                {

                    $('#screen').css("display", "none");
                    $('.myDiv').fadeOut(50);
                    $('body').css({ "overflow": "scroll" });
                    break;
                }
        }
        $('.myDiv').css("display", displayStyle);
        $('.myDiv').css(
            {
                position: 'absolute',
                margin: 0,
                top: (top > 0 ? top : 0) + 'px',
                left: (left > 0 ? left : 0) + 'px'
            });
    }
</script>--%>
<div class="ecoPartnership_mainContent">
    <div id="screen">
    </div>
    <input type="button" id="btn_Article" value="بورس املاک و بنگاههای اقتصادی" class="button" />
    <input type="button" id="btn_Bongah" value="بورس کالا" class="button" />
    <div id="result">
    </div>
</div>