<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ArticleMarketManagement.ascx.cs" Inherits="AdminPanel_AdminUserControl_ArticleMarketManagement" %>
<link href="AdminStyls/CSSMainAdmin.css" rel="stylesheet" type="text/css" />
<link href="AdminStyls/Modal/dark-hive/jquery-ui-1.8.5.custom.css" rel="stylesheet" type="text/css" />
<link href="AdminStyls/CSSGrid.css" rel="stylesheet" type="text/css" />
<script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
<script src="../Scripts/jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
<script type="text/javascript">
    function getImagePath()
    {
        return '<%= ImagePath %>';
    }
    var imagePath = getImagePath();
    $(document).ready(function ()
    {
        $(".delArticle, #btn_DeleteSelected").click(function ()
        {
            var selectedIds = "";
            var RowsToRemove = new Array();

            if (this.id == "btn_DeleteSelected")
            {
                $('#<%=gv_ArticleMarket.ClientID %> input[type=checkbox][id$=cbDelete]:checked').each(function (index, item)
                {
                    selectedIds = selectedIds + "'" + $(item).closest("tr").find("input[type=hidden][id$=lbl_ArticleID]").val() + "', ";
                    RowsToRemove.push($(item).closest("tr"));
                });
                if (selectedIds.length > 0)
                {
                    selectedIds = "[" + selectedIds.substring(0, selectedIds.length - 2) + "]";
                }
            }
            else
            {
                selectedIds = "['" + $(this).closest("tr").find("input[type=hidden][id$=lbl_ArticleID]").val() + "']";
                RowsToRemove.push($(this).closest("tr"));
            }
            $.blockUI(
                {
                    message: '<h1><img src="' + imagePath + '/ajaxImages/loading2.gif" /><br /> چند لحظه منتظر بمانيد...</h1>',
                    fadeIn: 700,
                    fadeOut: 700,
                    css: {
                        border: 'none',
                        padding: '5px',
                        backgroundColor: '#000',
                        '-webkit-border-radius': '10px',
                        '-moz-border-radius': '10px',
                        opacity: .6,
                        color: '#fff'
                    }
                });
            if (confirm("آیا با حذف کالا(های) موردنظر موافقید?"))
            {
                $.ajax({
                    type: "POST",
                    url: "ArticleMarketManagement.aspx/DeleteArticleByID",
                    data: "{'selectedIds': " + selectedIds + "}",
                    cache: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function ()
                    {
                        if (RowsToRemove.length > 0)
                            $(RowsToRemove).each(function (index, item)
                            {
                                item.remove();
                            });
                            $.unblockUI();
                    },
                    error: function ()
                    {
                        $.unblockUI();
                        alert("error");
                    }
                });
            }
            $.unblockUI();
            return false;
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function ()
    {
        $("#dialog:ui-dialog").dialog("destroy");
        $("#dialog-form").dialog({
            autoOpen: false,
            resizable: false,
            height: 'auto',
            width: 600,
            show: 'slide',
            hide: 'clip',
            modal: true
        });
        $('.submit').click(function ()
        {
            $("#dialog-form").dialog("close");
        });
        $('#load').hide();
    });
</script>
<script type="text/javascript">
    $(document).ready(function ()
    {
        $('.editArticle').click(function ()
        {
            var record_id = $(this).attr("id");
            $.blockUI(
                {
                    message: '<h1><img src="' + imagePath + '/ajaxImages/loading2.gif" /><br /> چند لحظه منتظر بمانيد...</h1>',
                    fadeIn: 700,
                    fadeOut: 700,
                    css: {
                        border: 'none',
                        padding: '5px',
                        backgroundColor: '#000',
                        '-webkit-border-radius': '10px',
                        '-moz-border-radius': '10px',
                        opacity: .6,
                        color: '#fff'
                    }
                });
            $.ajax({
                type: "POST",
                url: "ArticleMarketManagement.aspx/GetArticleInfo",
                data: "{ articleId: '" + record_id + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data)
                {
                    var articleInfo = data.d;
                    var txt_ArticleID = $('#<%= txt_ArticleID.ClientID %>');
                    var txt_ArticleType = $('#<%= txt_ArticleType.ClientID %>');
                    var txt_ArticleUnit = $('#<%= txt_ArticleUnit.ClientID %>');
                    var txt_ArticleAttribute = $('#<%= txt_ArticleAttribute.ClientID %>');
                    $('#<%= chk_ArticleBuy.ClientID %>').attr('checked', articleInfo.Article_Buy == true ? true : false);
                    $('#<%= chk_ArticleSale.ClientID %>').attr('checked', articleInfo.Article_Sale == true ? true : false);
                    $('#<%= chk_ArticleStatus.ClientID %>').attr('checked', articleInfo.Article_Status == true ? true : false);
                    var txt_ArticleCost = $('#<%= txt_ArticleCost.ClientID %>');

                    txt_ArticleID.val(articleInfo.Article_ID);
                    txt_ArticleType.val(articleInfo.Article_Type);
                    txt_ArticleUnit.val(articleInfo.Article_Unit);
                    txt_ArticleAttribute.val(articleInfo.Article_Attribute);
                    txt_ArticleCost.val(articleInfo.Article_Cost);

                    $("#dialog-form").dialog("open");
                    $.unblockUI();
                },
                error: function ()
                {
                    $.unblockUI();
                    alert("error");
                }
            });
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function ()
    {
        $('.btn_UpdateArticle').click(function ()
        {
            var articleID = $('#<%= txt_ArticleID.ClientID %>').val();
            var articleType = $('#<%= txt_ArticleType.ClientID %>').val();
            var articleUnit = $('#<%= txt_ArticleUnit.ClientID %>').val();
            var articleAttribute = $('#<%= txt_ArticleAttribute.ClientID %>').val();
            var articleBuy = $('#<%= chk_ArticleBuy.ClientID %>').is(':checked');
            var articleSale = $('#<%= chk_ArticleSale.ClientID %>').is(':checked');
            var articleStatus = $('#<%= chk_ArticleStatus.ClientID %>').is(':checked');
            var articleCost = $('#<%= txt_ArticleCost.ClientID %>').val();
            $.blockUI(
                {
                    message: '<h1><img src="' + imagePath + '/ajaxImages/loading2.gif" /><br /> چند لحظه منتظر بمانيد...</h1>',
                    fadeIn: 700,
                    fadeOut: 700,
                    css: {
                        border: 'none',
                        padding: '5px',
                        backgroundColor: '#000',
                        '-webkit-border-radius': '10px',
                        '-moz-border-radius': '10px',
                        opacity: .6,
                        color: '#fff'
                    }
                });
            $.ajax({
                type: "POST",
                url: "ArticleMarketManagement.aspx/UpdateArticleInfo",
                data: "{ articleId        : '" + articleID +
                      "',articleType      : '" + articleType +
                      "',articleUnit      : '" + articleUnit +
                      "',articleAttribute : '" + articleAttribute +
                      "',articleBuy       : '" + articleBuy +
                      "',articleSale      : '" + articleSale +
                      "',articleCost      : '" + articleCost +
                       "',articleStatus   : '" + articleStatus +
                      "'}",

                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data)
                {
                    $.unblockUI();
                    alert("عملیات اصلاح انجام گردید");
                    $("#dialog-form").dialog("close");
                },
                error: function ()
                {
                    $.unblockUI();
                    alert("error");
                }
            });
        });
    });
</script>
<fieldset>
    <legend style="color: #66FF33">مدیریت بازار کالا</legend>
    <div id="load" align="center" style="display: none">
        <img src="AdminImages/Loading/loading.gif" alt="در حال انجام" width="28" height="28" />
        درحال انجام...
    </div>
    <div id="divGridView">
        <asp:GridView ID="gv_ArticleMarket" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            AllowSorting="true" CssClass="GridViewStyle" HeaderStyle-CssClass="HeaderStyle"
            HeaderStyle-HorizontalAlign="Center"  HeaderStyle-VerticalAlign="Middle" ShowHeaderWhenEmpty="True">
            <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="RowStyle"/>
            <PagerStyle CssClass="PagerStyle" />
            <Columns>
                <asp:TemplateField HeaderText="نوع کالا" SortExpression="Article_Type">
                    <ItemTemplate>
                        <asp:Label ID="txt_Article_Type" runat="server" Text='<%# Bind("Article_Type") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle Width="20%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="واحد سنجش" SortExpression="Article_Unit">
                    <ItemTemplate>
                        <asp:Label ID="txt_Article_Unit" runat="server" Text='<%# Bind("Article_Unit") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle Width="10%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="مشخصات کالا" SortExpression="Article_Attribute">
                    <ItemTemplate>
                        <asp:Label ID="txt_Article_Attribute" runat="server" Text='<%# Bind("Article_Attribute") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle Width="25%" />
                </asp:TemplateField>
                <asp:CheckBoxField DataField="Article_Buy" HeaderText="خرید" HeaderStyle-HorizontalAlign="Center"
                    HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle"
                    HeaderStyle-Width="5%" />
                <asp:CheckBoxField DataField="Article_Sale" HeaderText="فروش" HeaderStyle-HorizontalAlign="Center"
                    HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle"
                    HeaderStyle-Width="5%" />
                <asp:TemplateField HeaderText="حدودقیمت" SortExpression="Article_Cost">
                    <ItemTemplate>
                        <asp:Label ID="Article_Cost" runat="server" Text='<%# Bind("Article_Cost") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle Width="10%" />
                </asp:TemplateField>
                <asp:CheckBoxField DataField="Article_Status" HeaderText="وضعیت" HeaderStyle-HorizontalAlign="Center"
                    HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle"
                    HeaderStyle-Width="5%" />
                <asp:TemplateField ShowHeader="False">
                    <ItemStyle Width="10%" />
                    <ItemTemplate>
                        <a id='<%# Eval("Article_ID") %>' class="editArticle" style="cursor: pointer">
                            <img border="0" src="../Images/ajaxImages/edit.png" alt="ویرایش" /></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemStyle Width="10%" />
                    <ItemTemplate>
                        <asp:HiddenField ID="lbl_ArticleID" Value='<%# Eval("Article_ID") %>' runat="server"></asp:HiddenField>                        
                        <a href="#" id='<%# Eval("Article_ID") %>' class="delArticle">
                            <img border="0" src="../Images/ajaxImages/delete.png" alt="حذف" /></a>
                        <br />
                        <asp:CheckBox ID="cbDelete" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <asp:Label ID="Label3" runat="server" Text="هیچ خبری ثبت نشده است" Width="100%"></asp:Label>
            </EmptyDataTemplate>            
            <PagerSettings FirstPageText="«" LastPageText="»" Mode="NextPreviousFirstLast" PageButtonCount="7" />
        </asp:GridView>
    </div>
    <input type="button" id="btn_DeleteSelected" class="submitdel" value="حذف انتخابی" />
</fieldset>
<div aria-labelledby="ui-dialog-title-dialog-form" role="dialog" tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
    style="display:none; z-index: 1002; outline: 0px none; position: absolute; height: auto;
    width: 350px; top: 82px; left: 460px;">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
        <span id="ui-dialog-title-dialog-form" class="ui-dialog-title">ویرایش</span> <a role="button"
            class="ui-dialog-titlebar-close ui-corner-all" href="#"><span class="ui-icon ui-icon-closethick">
                بستن</span> </a>
    </div>
    <div style="width: auto; min-height: 0px; height: auto;" class="ui-dialog-content ui-widget-content"
        id="dialog-form">
        <form id="frm_ArticleMarket">
        <fieldset>
            <asp:TextBox ID="txt_ArticleID" CssClass="customTxt" runat="server" Enabled="false"
                Width="25">
            </asp:TextBox>
            <div class="input_field">
                <label for="mf">
                    نوع کالا:
                </label>
                <asp:TextBox ID="txt_ArticleType" CssClass="customTxt medium" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_ArticleType"
                    ErrorMessage="نوع کالا را وارد نمائید" ForeColor="Yellow" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>
            <div class="input_field">
                <label>
                    واحد سنجش کالا:
                </label>
                <asp:DropDownList ID="txt_ArticleUnit" CssClass="mediumfield" runat="server">
                    <asp:ListItem>عدد</asp:ListItem>
                    <asp:ListItem>کیلوگرم</asp:ListItem>
                    <asp:ListItem>گرم</asp:ListItem>
                    <asp:ListItem>متر</asp:ListItem>
                    <asp:ListItem>تخته</asp:ListItem>
                    <asp:ListItem>راس</asp:ListItem>
                    <asp:ListItem>مثقال</asp:ListItem>
                    <asp:ListItem>فروند</asp:ListItem>
                    <asp:ListItem>شانه</asp:ListItem>
                    <asp:ListItem>بطری</asp:ListItem>
                    <asp:ListItem>قوطی</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="input_field">
                <label>
                    مشخصات کالا:
                </label>
                <asp:TextBox ID="txt_ArticleAttribute" runat="server" CssClass="customTxt medium"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_ArticleAttribute"
                    ErrorMessage="مشخصات کالا را وارد نمائید" ForeColor="Yellow" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>
            <div class="input_field">
                <asp:CheckBox ID="chk_ArticleBuy" Checked="false" runat="server" />
                خرید
                <br />
                <asp:CheckBox ID="chk_ArticleSale" Checked="False" runat="server" />
                فروش
            </div>
            <div class="input_field">
                <label>
                    حدود قیمت روز:
                </label>
                <asp:TextBox ID="txt_ArticleCost" runat="server" CssClass="customTxt"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_ArticleCost"
                    ErrorMessage="حدود قیمت را وارد نمائید" ForeColor="Yellow" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>
            <div class="input_field">
                <asp:CheckBox ID="chk_ArticleStatus" Checked="false" runat="server" />
                وضعیت

            </div>
            <div class="input_field no_margin_bottom">
                <input type="button" id="btn_UpdateArticle" class="submit btn_UpdateArticle" value="اصلاح" />
                <input type="button" id="btn_Exit" class="submit" value="بازگشت" />
                <asp:Label ID="lbl_Msg" CssClass="error" runat="server"></asp:Label>
            </div>
        </fieldset>
        </form>
    </div>
    <div class="ui-resizable-handle ui-resizable-n">
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
    </div>
    <div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix">
        <div class="ui-dialog-buttonset">
            <button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"
                type="button">
                <span class="ui-button-text">Create an account</span></button>
            <button aria-disabled="false" role="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"
                type="button">
                <span class="ui-button-text">Cancel</span></button></div>
    </div>
</div>
