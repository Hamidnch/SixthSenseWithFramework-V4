<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EconomicBongah.ascx.cs"
    Inherits="UserControl_EconomicBongah" %>
<%@ Register Src="EconomicBongahOrder.ascx" TagName="EconomicBongahOrder" TagPrefix="uc1" %>
<link href="../Styles/CSSEco_Bongah.css" rel="stylesheet" type="text/css" />
<link href="../Styles/CSSEco_Login.css" rel="stylesheet" type="text/css" />
<link href="../Styles/CSStxtLogin.css" rel="stylesheet" type="text/css" />
<link href="../Styles/ChromeGridView.css" rel="stylesheet" type="text/css" />
<link href="../Styles/WindowStyles.css" rel="stylesheet" type="text/css" />
<link href="../Styles/CSSEco_BongahOrder.css" rel="stylesheet" type="text/css" />
<link href="../Styles/Common.css" rel="stylesheet" type="text/css" />
<link href="../Styles/dark-hive/jquery-ui-1.8.5.custom.css" rel="stylesheet" type="text/css" />
<%--<script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>--%>
<script type="text/javascript">
    $(document).ready(function ()
    {
        $("#dialog:ui-dialog").dialog("destroy");
        $("#dialog-form").dialog({
            autoOpen: false,
            //            top: ($(window).height() - 550) / 2 + 'px',
            //            left: ($(window).width() - 500) / 2 + 'px',
            height: 350,
            width: 615,
            resizable: false,
            bgiframe: false,
            modal: true
        });
        $('.submit').click(function ()
        {
            $("#dialog-form").dialog("close");
        });
        $('.btnBongahOrder').click(function ()
        {
            $("#dialog-form").dialog("open");
        });
    });
</script>
<%--<script type="text/javascript">
    function showModal2(displayStyle)
    {
        var top = ($(window).height() - $('.myDiv2').outerHeight()) / 2;
        var left = ($(window).width() - $('.myDiv2').outerWidth()) / 2;
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
                    $('.myDiv2').fadeIn(50);
                    break;
                }
            case "none":
                {

                    $('#screen').css("display", "none");
                    $('.myDiv2').fadeOut(50);
                    $('body').css({ "overflow": "scroll" });
                    break;
                }
        }
        $('.myDiv2').css("display", displayStyle);
        $('.myDiv2').css(
            {
                position: 'absolute',
                margin: 0,
                top: (top > 0 ? top : 0) + 'px',
                left: (left > 0 ? left : 0) + 'px'
            });
    }
</script>--%>
<div class="ecoInvestingConsultant_mainContent">
    <div class="ecoBongah_Desc">
        در این بورس فعالان اقتصادی می توانند با مشارکت در بورس املاک و مراکز صنعتی ، تجاری
        ، کشاورزی با توجه به جدول موجود وبا کسب آخرین اخبار و اطلاعات سایت بر اساس اهداف
        تجاری خود (خرید – فروش – مشارکت سرمایه گذار – مشارکت سرمایه پذیر) برنامه های تجاری
        خود را به انجام برسانند. کاربران محترم می توانند گزینه های مورد نظر خود را از جدول
        بورس املاک انتخاب نموده و جهت بهره برداری از طریق ثبت سفارش با مدیر مربوطه هماهنگ
        نمایند.
    </div>
    <div class="GridViewStyle">
        <asp:GridView ID="GridViewInvesting" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField HeaderText="شماره">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text="<%# Container.DataItemIndex+1 %>"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="نوع بنگاه">
                    <ItemStyle Width="10%" />
                    <ItemTemplate>
                        <asp:HyperLink ID="hl_BongahType" runat="server" Text='<%# Eval("Bongah_Type", "{0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="مکان">
                    <ItemStyle Width="20%" />
                    <ItemTemplate>
                        <asp:Label ID="lbl_Location" runat="server" Text='<%# Eval("Bongah_Location", "{0}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="مشخصات">
                    <ItemStyle Width="25%" />
                    <ItemTemplate>
                        <asp:Label ID="lbl_Attribute" runat="server" Text='<%# Eval("Bongah_Attribute", "{0}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CheckBoxField DataField="Bongah_Buy" HeaderText="خرید" HeaderStyle-HorizontalAlign="Center"
                    HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle"
                    HeaderStyle-Width="5%" />
                <asp:CheckBoxField DataField="Bongah_Sale" HeaderText="فروش" HeaderStyle-HorizontalAlign="Center"
                    HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle"
                    HeaderStyle-Width="5%" />
                <asp:CheckBoxField DataField="Bongah_Investor" HeaderText="سرمایه گذار" HeaderStyle-HorizontalAlign="Center"
                    HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle"
                    HeaderStyle-Width="10%" />
                <asp:CheckBoxField DataField="Bongah_Capitalist" HeaderText="سرمایه پذیر" HeaderStyle-HorizontalAlign="Center"
                    HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle"
                    HeaderStyle-Width="10%" />
                <asp:TemplateField HeaderText="">
                    <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Bold="true" />
                    <ItemTemplate>
                        <asp:Label ID="Bongah_ID" runat="server" Visible="false"></asp:Label>
                        <a id='<%# Eval("Bongah_ID") %>' class="btn_RegOrder btnBongahOrder">ثبت تقاضای مشارکت</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="HeaderStyle" />
            <PagerStyle CssClass="PagerStyle" />
            <RowStyle CssClass="RowStyle" />
        </asp:GridView>
    </div>
</div>
<%--Modal--%>
<%--<div id="MessageHistoryWindow" class="myDiv" style="height: auto; width: 600px; position: absolute;
    direction: rtl; display: none;">
    <div id="MessageHistoryWindowTitleBorderLeft" class="WindowTitleBorderLeft">
        <div id="MessageHistoryWindowTitleBorderRight" class="WindowTitleBorderRight">
            <div id="MessageHistoryWindowTitle" class="WindowTitle">
                <b>ثبت تقاضای مشارکت</b>
            </div>
        </div>
        <a href="#" class="TitleCloseButton" onclick="showModal('none')"></a>
    </div>
    <div id="MessageHistoryWindowBorderLeft" class="WindowBorderLeft">
        <div id="MessageHistoryWindowBorderRight" class="WindowBorderRight">
            <div id="MessageHistoryWindowBody" class="WindowBody">
                <div id="MessageHistory" title="" style="height: 320px; width: 600px; overflow: hidden;
                    padding: 15px 5px; line-height: 30px;">
                        <uc1:EconomicBongahOrder ID="EconomicBongahOrder1" runat="server" />

                </div>
            </div>
        </div>
    </div>
</div>--%>
<div id="dialog" aria-labelledby="ui-dialog-title-dialog-form" role="dialog" tabindex="-1"
    class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
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
                <uc1:EconomicBongahOrder ID="EconomicBongahOrder1" runat="server" />
            </div>
        </fieldset>
    </div>
</div>