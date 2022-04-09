<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RSSManagement.ascx.cs" Inherits="AdminPanel_AdminUserControl_RSSManagement" %>
<link href="AdminStyls/CSSMainAdmin.css" rel="stylesheet" type="text/css" />
<link href="AdminStyls/Modal/dark-hive/jquery-ui-1.8.5.custom.css" rel="stylesheet" type="text/css" />
<link href="AdminStyls/CSSGrid.css" rel="stylesheet" type="text/css" />
<script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
<script src="../Scripts/jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>

<script type="text/javascript">
    $(document).ready(function ()
    {
        $(".DelRss, #btn_DeleteSelected").click(function ()
        {
            var selectedIds = "";
            var RowsToRemove = new Array();

            if (this.id == "btn_DeleteSelected")
            {
                $('#<%=gv_RSS.ClientID %> input[type=checkbox][id$=cbDelete]:checked').each(function (index, item)
                {
                    selectedIds = selectedIds + "'" + $(item).closest("tr").find("input[type=hidden][id$=lbl_RssID]").val() + "', ";
                    RowsToRemove.push($(item).closest("tr"));
                });
                if (selectedIds.length > 0)
                {
                    selectedIds = "[" + selectedIds.substring(0, selectedIds.length - 2) + "]";
                }
            }
            else
            {
                selectedIds = "['" + $(this).closest("tr").find("input[type=hidden][id$=lbl_RssID]").val() + "']";
                RowsToRemove.push($(this).closest("tr"));
            }
            $('#load').fadeIn();
            if (confirm("آیا با حذف RSS موردنظر موافقید?"))
            {
                $.ajax({
                    type: "POST",
                    url: "RSSManagement.aspx/DelRss",
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
        $('.editRss').click(function ()
        {
            var rssFeed_id = $(this).attr("id");
            $('#load').fadeIn();
            $.ajax({
                type: "POST",
                url: "RssManagement.aspx/GetRssFeedInfo",
                data: "{ rssFeedID: '" + rssFeed_id + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data)
                {
                    var rss = data.d;
                    var txt_RssFeedTitle = $('#<%= txt_RssFeedTitle.ClientID %>');
                    var txt_RssFeedDesc = $('#<%= txt_RssFeedDesc.ClientID %>');
                    var txt_RssFeedID = $('#<%= txt_RssFeedID.ClientID %>');

                    txt_RssFeedID.val(rss.RssFeedID);
                    txt_RssFeedTitle.val(rss.RssTitle);
                    txt_RssFeedDesc.val(rss.RssDescription);

                    $('#<%= chk_IsHome.ClientID %>').attr('checked', rss.RssIsHome == "True" ? true : false);
                    $('#<%= chk_IsEconomic.ClientID %>').attr('checked', rss.RssIsEconomic == "True" ? true : false);
                    $('#<%= chk_IsEducation.ClientID %>').attr('checked', rss.RssIsEducation == "True" ? true : false);
                    $('#<%= chk_IsRacing.ClientID %>').attr('checked', rss.RssIsRacing == "True" ? true : false);
                    $('#<%= chk_IsActive.ClientID %>').attr('checked', rss.RssIsActive == "True" ? true : false);

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
        $('.btn_UpdateRssFeed').click(function ()
        {
            var feedID = $('#<%= txt_RssFeedID.ClientID %>').val();
            var feedTitle = $('#<%= txt_RssFeedTitle.ClientID %>').val();
            var feedDesc = $('#<%= txt_RssFeedDesc.ClientID %>').val();

            var feedIsHome = $('#<%= chk_IsHome.ClientID %>').is(':checked');
            var feedIsEconomic = $('#<%= chk_IsEconomic.ClientID %>').is(':checked');
            var feedIsEducation = $('#<%= chk_IsEducation.ClientID %>').is(':checked');
            var feedIsRacing = $('#<%= chk_IsRacing.ClientID %>').is(':checked');
            var feedIsActive = $('#<%= chk_IsActive.ClientID %>').is(':checked');
            $.ajax({
                type: "POST",
                url: "RSSManagement.aspx/UpdateRss",
                data: "{ feedID         : '" + feedID +
                "',feedTitle      : '" + feedTitle +
                "',feedDesc       : '" + feedDesc +
                "',feedIsHome     : '" + feedIsHome +
                "',feedIsEconomic : '" + feedIsEconomic +
                "',feedIsEducation: '" + feedIsEducation +
                "',feedIsRacing   : '" + feedIsRacing +
                "',feedIsActive   : '" + feedIsActive +
                "'}",

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
    $(document).ready(function ()
    {
        $("#dialog:ui-dialog").dialog("destroy");
        $("#dialog-form").dialog({
            autoOpen: false,
            resizable: false,
            height: 'auto',
            width: 800,
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
<%--<script type="text/javascript">
    $(document).ready(function ()
    {
        $(".ddl_Subject").change(function ()
        {
            //            $("OPTION:selected", this).val()
            var subject = $("#<%# ddlRSSSearch.ClientID %>:selected").text();
            alert(subject);
            $.ajax({
                type: "POST",
                url: "RSSManagement.aspx/LoadRssFeedBySubject",
                data: "{subject: '" + subject + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data)
                {
                    alert("Yes");
                }
            });
        });
    });
</script>--%>
<div id="load" align="center" style="display: none">
    <img src="AdminImages/Loading/loading.gif" width="28" height="28" />
    درحال انجام...
</div>
<div class="searchRss">
    <fieldset>
        <legend>جستجو</legend>
        <asp:DropDownList ID="ddlRSSSearch" runat="server" CssClass="ddl_Subject" Width="100px">
            <asp:ListItem Selected="True" Text="نام کاربری" Value="UserName"></asp:ListItem>
        </asp:DropDownList>
    </fieldset>
</div>
<%--<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>--%>
        <div id="divGridView">
            <asp:GridView ID="gv_RSS" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center"
                GridLines="Horizontal" CssClass="GridViewStyle" HeaderStyle-CssClass="HeaderStyle"
                HeaderStyle-HorizontalAlign="Center"  HeaderStyle-VerticalAlign="Middle" 
                AllowPaging="True" OnPageIndexChanged="gv_RSS_PageIndexChanged" OnPageIndexChanging="gv_RSS_PageIndexChanging">
                <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="RowStyle"/>
                <PagerStyle CssClass="PagerStyle" />
                <Columns>
                    <asp:TemplateField HeaderText="نام مدیر">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%"></ItemStyle>
                        <ItemTemplate>
                            <asp:Label ID="lbl_RssAuthor" runat="server" Text='<%# Bind("RSSOther_Author") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="موضوع">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%"></ItemStyle>
                        <ItemTemplate>
                            <asp:Label ID="lbl_RssSubject" runat="server" Text='<%# Bind("RSSOther_Subject") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="نام سایت">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%"></ItemStyle>
                        <ItemTemplate>
                            <asp:Label ID="lbl_RssSite" runat="server" Text='<%# Bind("RSSFeed_Site") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="آدرس لینک">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%"></ItemStyle>
                        <ItemTemplate>
                            <asp:HyperLink ID="hl_RssLink" Text='<%# Eval("RSSFeed_Link", "{0}") %>' NavigateUrl='<%# Eval("RSSFeed_Link", "{0}") %>'
                                Font-Underline="true" Target="_blank" runat="server">
                            </asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="تاریخ درج">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%"></ItemStyle>
                        <ItemTemplate>
                            <asp:Label ID="lbl_RssOtherDate" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("RSSOther_Date", "{0}"), "L", false) %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="تاریخ ایجاد">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%"></ItemStyle>
                        <ItemTemplate>
                            <asp:Label ID="lbl_RssPubDate" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("RSSFeed_PubDate", "{0}"), "L", false) %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CheckBoxField DataField="RSSFeed_IsHome" HeaderText="خانه" HeaderStyle-HorizontalAlign="Center"
                        HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle"
                        HeaderStyle-Width="5%" >
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:CheckBoxField>
                    <asp:CheckBoxField DataField="RSSFeed_IsEconomic" HeaderText="اقتصاد" HeaderStyle-HorizontalAlign="Center"
                        HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle"
                        HeaderStyle-Width="5%" >
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:CheckBoxField>
                    <asp:CheckBoxField DataField="RSSFeed_IsEducation" HeaderText="مهاجرت" HeaderStyle-HorizontalAlign="Center"
                        HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle"
                        HeaderStyle-Width="5%" >
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:CheckBoxField>
                    <asp:CheckBoxField DataField="RSSFeed_IsRacing" HeaderText="ورزش" HeaderStyle-HorizontalAlign="Center"
                        HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle"
                        HeaderStyle-Width="5%" >
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:CheckBoxField>
                    <asp:CheckBoxField DataField="RSSFeed_IsActive" HeaderText="فعال" HeaderStyle-HorizontalAlign="Center"
                        HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle"
                        HeaderStyle-Width="5%" >
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:CheckBoxField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <a id='<%# Eval("RSSFeed_ID") %>' class="editRss" style="cursor: pointer">
                                <img border="0" src="../Images/ajaxImages/edit.png" alt="ویرایش" /></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:HiddenField ID="lbl_RssID" Value='<%# Eval("RSSFeed_ID") %>' runat="server"></asp:HiddenField>
                            <a id='<%# Eval("RSSFeed_ID") %>' class="DelRss" style="cursor: pointer">
                                <img border="0" src="../Images/ajaxImages/delete.png" alt="حذف" /></a>
                            <br />
                            <asp:CheckBox ID="cbDelete" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <asp:Label ID="Label3" runat="server" Text="هیچ موردی یافت نشد" Width="100%"></asp:Label>
                </EmptyDataTemplate>
            </asp:GridView>
            <input type="button" id="btn_DeleteSelected" class="submitdel" value="حذف انتخابی" />
<%--            <asp:Button ID="btn_RssDelete" runat="server" CssClass="submit" 
                onclick="btn_RssDelete_Click" Text="حذف گروهی" />--%>
        </div>
<%--    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btn_RssDelete" EventName="Click" />
    </Triggers>
</asp:UpdatePanel>--%>
<div class="input_field no_margin_bottom">
    <asp:Label ID="lbl_Warning" runat="server"></asp:Label>
</div>

<div aria-labelledby="ui-dialog-title-dialog-form" role="dialog" tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
    style="display: none; z-index: 1002; outline: 0px none; position: absolute;
    height: auto; width: 350px; top: 82px; left: 460px;">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
        <span id="ui-dialog-title-dialog-form" class="ui-dialog-title">ویرایش</span>
            <a role="button" class="ui-dialog-titlebar-close ui-corner-all" href="#">
                <span class="ui-icon ui-icon-closethick">بستن</span>
            </a>
    </div>
    <div style="width: auto; min-height: 0px; height: auto;" class="ui-dialog-content ui-widget-content"
        id="dialog-form">
        <form id="frm_Rss">
            <fieldset>
                <%--				<legend style="color: White">ویرایش خبر</legend>--%>
                <asp:TextBox ID="txt_RssFeedID" CssClass="customTxt medium" runat="server" Enabled="false"
                    Width="25">
                </asp:TextBox>
                <div class="input_field">
                    <label for="mf">
                        عنوان خبر:
                    </label>
                    <asp:TextBox ID="txt_RssFeedTitle" CssClass="customTxt medium" runat="server"></asp:TextBox>
                </div>
                <div class="input_field">
                    <label>
                        خلاصه خبر:
                    </label>
                    <asp:TextBox ID="txt_RssFeedDesc" runat="server" runat="server" Height="200px" Width="95%" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="input_field">
                    <asp:CheckBox ID="chk_IsHome" Checked="false" runat="server" />
                   لینک این خبر در صفحه نخست سایت موجود باشد.
                    <br />
                    <asp:CheckBox ID="chk_IsEconomic" Checked="False" runat="server" />
                    لینک این خبر در صفحه اقتصاد موجود باشد.
                    <br />
                    <asp:CheckBox ID="chk_IsEducation" Checked="False" runat="server" />
                    لینک این خبر در صفحه مهاجرت و تحصیل موجود باشد.
                    <br />
                    <asp:CheckBox ID="chk_IsRacing" Checked="False" runat="server" />
                    لینک این خبر در صفحه ورزش و مسابقات موجود باشد.
                    <br />
                    <asp:CheckBox ID="chk_IsActive" Checked="False" runat="server" />
                    لینک این خبر فعال باشد.
                    <br />
                </div>
                <div class="input_field no_margin_bottom">
                    <input type="button" id="btn_UpdateRssFeed" class="submit btn_UpdateRssFeed" value="اصلاح" />
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
