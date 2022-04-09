<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsManagement.ascx.cs"
    Inherits="AdminPanel_AdminUserControl_NewsManagement" %>
<link href="../AdminStyls/CSSMainAdmin.css" rel="stylesheet" type="text/css" />
<link href="AdminStyls/Modal/dark-hive/jquery-ui-1.8.5.custom.css" rel="stylesheet" type="text/css" />
<link href="AdminStyls/CSSGrid.css" rel="stylesheet" type="text/css" />
<script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
<script src="../Scripts/jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>
<script src="ckeditor/ckeditor.js" type="text/javascript"></script>
<script type="text/javascript">
//    jQuery.fn.center = function ()
//    {
//        this.css("position", "absolute");
//        this.css("top", ($(window).height() - this.height()) / 2 + $(window).scrollTop() + "px");
//        this.css("left", ($(window).width() - this.width()) / 2 + $(window).scrollLeft() + "px");
//        return this;
//    }
    $(document).ready(function ()
    {
        $(".delNews, #btn_DeleteSelected").click(function ()
        {
            var selectedIds = "";
            var RowsToRemove = new Array();

            if (this.id == "btn_DeleteSelected")
            {
                $('#<%=GridView_ManagementNews.ClientID %> input[type=checkbox][id$=cbDelete]:checked').each(function (index, item)
                {
                    selectedIds = selectedIds + "'" + $(item).closest("tr").find("input[type=hidden][id$=lbl_NewsID]").val() + "', ";
                    RowsToRemove.push($(item).closest("tr"));
                });
                if (selectedIds.length > 0)
                {
                    selectedIds = "[" + selectedIds.substring(0, selectedIds.length - 2) + "]";
                }
            }
            else
            {
                selectedIds = "['" + $(this).closest("tr").find("input[type=hidden][id$=lbl_NewsID]").val() + "']";
                RowsToRemove.push($(this).closest("tr"));
            }
            $('#load').fadeIn();
            if (confirm("آیا با حذف خبر(های) موردنظر موافقید?"))
            {
                $.ajax({
                    type: "POST",
                    url: "NewsManagement.aspx/DelNews",
                    data: "{'selectedIds': " + selectedIds + "}",
                    cache: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function ()
                    {
                        if (RowsToRemove.length > 0)
                            $(RowsToRemove).each(function (index, item)
                            {
                                item.fadeTo("slow", 0.01, function ()
                                { //fade
                                    $(this).slideUp("slow", function ()
                                    {
                                        item.remove();
                                    });
                                });
                            });
                        $('#load').fadeOut();
                    },
                    error: function ()
                    {
                        alert("error");
                    }
                });
            }
            $('#load').fadeOut();
            return false;
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function ()
    {
        $('.editNews').click(function ()
        {
            var news_id = $(this).attr("id");
            $('#load').fadeIn();
            $.ajax({
                type: "POST",
                url: "NewsManagement.aspx/GetNewsInfo",
                data: "{ newsID: '" + news_id + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data)
                {
                    var news = data.d;
                    var txt_NewsTitle = $('#<%= txt_NewsTitle.ClientID %>');
                    var txt_NewsSummary = $('#<%= txt_NewsSummary.ClientID %>');
                    var txt_NewsContext = $('#<%= txt_NewsContext.ClientID %>');
                    var txt_NewsID = $('#<%= txt_NewsID.ClientID %>');
                    var editor = CKEDITOR.instances.ctl00_ContentPlaceHolder1_NewsManagement1_txt_NewsContext;
                    editor.setData(news.NewsContext);
                    txt_NewsTitle.val(news.NewsTitle);
                    txt_NewsSummary.val(news.NewsSummary);
                    txt_NewsID.val(news.NewsID);
                    $('#<%= chk_Pooling.ClientID %>').attr('checked', news.NewsPooling == "True" ? true : false);
                    $('#<%= chk_Status.ClientID %>').attr('checked', news.NewsStatus == "True" ? true : false);
                    $("#dialog-form").dialog("open");
                    $('#load').fadeOut();
                }
            });
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function ()
    {
        $('.btn_UpdateNews').click(function ()
        {
            var news_ID = $('#<%= txt_NewsID.ClientID %>').val();
            var news_Title = $('#<%= txt_NewsTitle.ClientID %>').val();
            var news_Summary = $('#<%= txt_NewsSummary.ClientID %>').val();
            var editor = CKEDITOR.instances.ctl00_ContentPlaceHolder1_NewsManagement1_txt_NewsContext;
            var news_context = editor.getData();
            var news_Pooling = $('#<%= chk_Pooling.ClientID %>').is(':checked');
            var news_Status = $('#<%= chk_Status.ClientID %>').is(':checked');
            $.ajax({
                type: "POST",
                url: "NewsManagement.aspx/UpdateNewsInfo",
                data: "{ news_ID: '" + news_ID + "',news_Title: '" + news_Title + "',news_Summary: '" + news_Summary +
                "',news_Context: '" + news_context + "',news_Pooling: '" + news_Pooling +
                "',news_Status: '" + news_Status + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data)
                {
                    alert("عملیات اصلاح انجام گردید");
                    $("#dialog-form").dialog("close");
                }
            });
        });
    });
</script>
<script type="text/javascript">
    //    function pageLoad(sender, args)
    //    {
    //        if (args.get_isPartialLoad())
    //        {
    //            deleteNews();
    //            loadNewsInfo();
    //            updateNewsInfo();
    //        }
    //    }
    $(document).ready(function ()
    {
        $('#load').hide();
        $("#dialog:ui-dialog").dialog("destroy");
        $("#dialog-form").dialog({
            autoOpen: false,
            height: 'auto',
            width: 850,
            resizable: false,
//            show: 'slide',
//            hide: 'clip',
            modal: true
        });
        $('.submit').click(function ()
        {
            $("#dialog-form").dialog("close");
        });
        var txt_NewsContext = document.getElementById("<%= txt_NewsContext.ClientID%>");
        CKEDITOR.replace(txt_NewsContext);
    });
</script>
<fieldset>
    <legend style="color: #66FF33">مدیریت اخبار</legend>
    <div id="load" align="center" style="display: none">
        <img src="AdminImages/Loading/loading.gif" alt="در حال انجام" width="28" height="28" />
        درحال انجام...
    </div>
    <asp:GridView ID="GridView_ManagementNews" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        AllowSorting="true" Font-Names="tahoma" CssClass="GridViewStyle" HeaderStyle-CssClass="HeaderStyle"
        HeaderStyle-HorizontalAlign="Center"  HeaderStyle-VerticalAlign="Middle"
        Font-Size="12px" CaptionAlign="Left" GridLines="Horizontal"
        HorizontalAlign="Center" ShowHeaderWhenEmpty="True" OnPageIndexChanged="GridView_ManagementNews_PageIndexChanged"
        OnPageIndexChanging="GridView_ManagementNews_PageIndexChanging">
        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="RowStyle"/>
        <PagerStyle CssClass="PagerStyle" />
        <Columns>
            <asp:TemplateField SortExpression="News_Date" HeaderText="تاریخ درج">
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemTemplate>
                    <asp:Label ID="lbl_NewsDate" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("News_Date", "{0}"), "L", true) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="عنوان خبر" SortExpression="News_Title">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("News_Title") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("News_Title") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Width="20%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="خلاصه خبر" SortExpression="News_Summary">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("News_Summary") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("News_Summary") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Width="30%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="تعداد بازدید" SortExpression="News_ViewCount">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("News_ViewCount") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("News_ViewCount") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <a id='<%# Eval("News_ID") %>' class="editNews" style="cursor: pointer">
                        <img border="0" src="../Images/ajaxImages/edit.png" alt="ویرایش" /></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:HiddenField ID="lbl_NewsID" Value='<%# Eval("News_ID") %>' runat="server"></asp:HiddenField>
                    <a href="#" id='<%# Eval("News_ID") %>' class="delNews">
                        <img border="0" src="../Images/ajaxImages/delete.png" alt="حذف" /></a>
                    <br />
                    <asp:CheckBox ID="cbDelete" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        <EmptyDataTemplate>
            <asp:Label ID="Label3" runat="server" Text="هیچ خبری ثبت نشده است" Width="100%"></asp:Label>
        </EmptyDataTemplate>
        <PagerSettings FirstPageText="«" LastPageText="»" Mode="NextPreviousFirstLast" PageButtonCount="7" />
    </asp:GridView>
    <input type="button" id="btn_DeleteSelected" class="submitdel" value="حذف انتخابی" />
</fieldset>
<div aria-labelledby="ui-dialog-title-dialog-form" role="dialog" tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
    style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: auto;
    width: auto; top: 82px; left: 460px;">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
        <span id="ui-dialog-title-dialog-form" class="ui-dialog-title">ویرایش</span><a role="button"
            class="ui-dialog-titlebar-close ui-corner-all" href="#"><span class="ui-icon ui-icon-closethick">بستن</span></a></div>
    <div style="width: auto; min-height: 0px; height: auto" class="ui-dialog-content ui-widget-content"
        id="dialog-form">
        <form id="frm_News">
        <fieldset>
            <legend style="color: White">اخبار سایت</legend>
            <%--<div class="input_field">
                    <label>
                        تاریخ ویرایش:
                    </label>
                    <asp:Label ID="lblDate" CssClass="field_desc" runat="server" Text="Today Date"></asp:Label>
                </div>--%>
            <asp:TextBox ID="txt_NewsID" CssClass="customTxt" runat="server" Enabled="false"
                Width="25"></asp:TextBox>
            <div class="input_field">
                <label for="mf">
                    عنوان خبر:
                </label>
                <asp:TextBox ID="txt_NewsTitle" CssClass="customTxt medium" runat="server"></asp:TextBox>
            </div>
            <div class="input_field">
                <label>
                    خلاصه خبر:
                </label>
                <asp:TextBox ID="txt_NewsSummary" runat="server" CssClass="customTxt medium" Width="375px"></asp:TextBox>
            </div>
            <div class="input_field">
                <asp:CheckBox ID="chk_Pooling" Checked="False" runat="server" />
                نظردهی به این خبر
                <br />
                <asp:CheckBox ID="chk_Status" Checked="false" runat="server" />
                فعال
            </div>
            <div class="input_field">
                &nbsp;
                <asp:TextBox ID="txt_NewsContext" runat="server" Height="200px" TextMode="MultiLine"
                    Width="100%">
                </asp:TextBox>
                <%--<script type="text/javascript">
                        var txt_NewsContext = document.getElementById("<%= txt_NewsContext.ClientID%>");
                        CKEDITOR.replace(txt_NewsContext);
                    </script>--%>
            </div>
            <div class="input_field no_margin_bottom">
                <input type="button" id="btn_UpdateNews" class="submit btn_UpdateNews" value="ثبت خبر" />
                <input type="button" id="btn_Exit" class="submit" value="بازگشت" />
                <asp:Label ID="lbl_Msg" CssClass="error" runat="server"></asp:Label>
            </div>
        </fieldset>
        </form>
    </div>
    <div class="ui-resizable-handle ui-resizable-n"></div><div class="ui-resizable-handle ui-resizable-e"></div><div class="ui-resizable-handle ui-resizable-s"></div><div class="ui-resizable-handle ui-resizable-w"></div><div style="z-index: 1001;" class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se"></div><div style="z-index: 1002;" class="ui-resizable-handle ui-resizable-sw"></div><div style="z-index: 1003;" class="ui-resizable-handle ui-resizable-ne"></div><div style="z-index: 1004;" class="ui-resizable-handle ui-resizable-nw"></div><div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix"></div></div>