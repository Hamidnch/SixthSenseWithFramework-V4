<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EconomicArticleMarket.ascx.cs"
    Inherits="UserControl_EconomicArticleMarket" %>
<%@ Register Src="EconomicArticleOrder.ascx" TagName="EconomicArticleOrder" TagPrefix="uc1" %>
<link href="../Styles/CSSEco_ArticleMarket.css" rel="stylesheet" type="text/css" />
<link href="../Styles/CSSEco_Login.css" rel="stylesheet" type="text/css" />
<link href="../Styles/CSStxtLogin.css" rel="stylesheet" type="text/css" />
<link href="../Styles/ChromeGridView.css" rel="stylesheet" type="text/css" />
<link href="../Styles/WindowStyles.css" rel="stylesheet" type="text/css" />
<link href="../Styles/CSSEco_ArticleOrder.css" rel="stylesheet" type="text/css" />
<%--<script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>--%>
<%--<script type="text/javascript">
    $(document).ready(function ()
    {
        $("#dialog:ui-dialog").dialog("destroy");
        $("#dialog-form").dialog({
            autoOpen: false,
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
        $('.btnArticleOrder').click(function ()
        {
            $("#dialog-form").dialog("open");
        });
    });
</script>--%>
<script type="text/javascript">

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
</script>
<div class="ecoArticleMarket_mainContent">
    <div class="ecoArticleMarket_Desc">
        در این بخش کالاهای مختلف بر اساس نوع کالا دسته بندی و عرضه می گردند و کاربران محترم
        می توانند بر اساس نوع درخواست ( خرید – فروش ) و قیمت روزانه میزان سفارش را ثبت نمایند
        .و یا از طریق <a href="#" style="color: Yellow">تماس با ما</a>&nbsp; با مسئول مربوطه
        هماهنگ شوند
    </div>
    <div class="GridViewStyle">
        <asp:GridView ID="GridViewArticle" runat="server" AutoGenerateColumns="False" Width="800px">
            <Columns>
                <asp:TemplateField HeaderText="شماره">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text="<%# Container.DataItemIndex+1 %>"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="نوع کالا">
                    <ItemStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:HyperLink ID="hl_Article_Type" runat="server" Text='<%# Eval("Article_Type", "{0}") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="واحد سنجش">
                    <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lbl_Article_Unit" runat="server" Text='<%# Eval("Article_Unit", "{0}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="مشخصات">
                    <ItemStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lbl_Article_Attribute" runat="server" Text='<%# Eval("Article_Attribute", "{0}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CheckBoxField DataField="Article_Buy" HeaderText="خرید" HeaderStyle-HorizontalAlign="Center"
                    HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle"
                    HeaderStyle-Width="5%" />
                <asp:CheckBoxField DataField="Article_Sale" HeaderText="فروش" HeaderStyle-HorizontalAlign="Center"
                    HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle"
                    HeaderStyle-Width="5%" />
                <asp:TemplateField HeaderText="حدود قیمت روز">
                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lbl_Article_Cost" runat="server" Text='<%# Eval("Article_Cost", "{0}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="">
                    <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" Font-Bold="true" />
                    <ItemTemplate>
                        <asp:Label ID="Article_ID" runat="server" Visible="false"></asp:Label>
                        <a id='<%# Eval("Article_ID") %>' class="btnArticleOrder btn_RegOrder" onclick="showModal('block')">
                            ثبت سفارش</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="HeaderStyle" />
            <PagerStyle CssClass="PagerStyle" />
            <RowStyle CssClass="RowStyle" />
        </asp:GridView>
    </div>
    <div class="ecoArticleMarket_btnOrder">
        <a id="link_order" href="#" class="btnArticleOrder btn">ثبت سفارش</a>
    </div>
    <div class="ecoArticleMarket_Desc">
        کاربران محترم، پس از ثبت سفارش شما در جدول فوق در اسرع وقت (حداکثر 24 ساعت ) با
        شما تماس گرفته می شود.
    </div>
</div>
<%--Modal--%>
<div id="MessageHistoryWindow" class="myDiv" style="height: auto; width: 680px; position: absolute;
    direction: rtl; display: none;">
    <div id="MessageHistoryWindowTitleBorderLeft" class="WindowTitleBorderLeft">
        <div id="MessageHistoryWindowTitleBorderRight" class="WindowTitleBorderRight">
            <div id="MessageHistoryWindowTitle" class="WindowTitle">
                <b>ثبت صفارش</b>
            </div>
        </div>
        <a href="#" class="TitleCloseButton" onclick="showModal('none')"></a>
    </div>
    <div id="MessageHistoryWindowBorderLeft" class="WindowBorderLeft">
        <div id="MessageHistoryWindowBorderRight" class="WindowBorderRight">
            <div id="MessageHistoryWindowBody" class="WindowBody">
                <div id="MessageHistory" title="" style="height: 300px; width: 680px; overflow: hidden;
                    padding: 15px 5px; line-height: 30px;">
                    <uc1:EconomicArticleOrder ID="EconomicArticleOrder1" runat="server" />
                </div>
            </div>
        </div>
    </div>
</div>
<%--
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
                <uc1:EconomicArticleOrder ID="EconomicArticleOrder1" runat="server" />
            </div>
        </fieldset>
    </div>
</div>--%>