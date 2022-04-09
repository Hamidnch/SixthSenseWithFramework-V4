<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EconomicAnalysisManagement.ascx.cs" Inherits="AdminPanel_AdminUserControl_EconomicAnalysisManagement" %>
<link href="AdminStyls/CSSMainAdmin.css" rel="stylesheet" type="text/css" />
<link href="AdminStyls/Modal/dark-hive/jquery-ui-1.8.5.custom.css" rel="stylesheet" type="text/css" />
<link href="AdminStyls/CSSGrid.css" rel="stylesheet" type="text/css" />

<fieldset>
    <legend style="color: #66FF33">مدیریت تحلیلهای اقتصادی</legend>
    <div id="load" align="center" style="display: none"><img src="AdminImages/Loading/loading.gif" alt="در حال انجام" width="28" height="28" /> درحال انجام... </div>
    <asp:GridView ID="GridView_AnalysisManagement" runat="server" AllowPaging="True"
        AutoGenerateColumns="False" AllowSorting="true" Font-Names="tahoma"
        CssClass="GridViewStyle" HeaderStyle-CssClass="HeaderStyle"
        HeaderStyle-HorizontalAlign="Center"  HeaderStyle-VerticalAlign="Middle"         
        GridLines="Horizontal" ShowHeaderWhenEmpty="True">
        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="RowStyle"/>
        <PagerStyle CssClass="PagerStyle" />
        <Columns>
            <asp:TemplateField SortExpression="News_Date" HeaderText="تاریخ درج">
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemTemplate>
                    <asp:Label ID="lbl_AnalysisDate" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("EconomicAnalysis_Date", "{0}"), "L", true) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="عنوان تحلیل" SortExpression="EconomicAnalysis_Title">
                <ItemTemplate>
                    <asp:Label ID="lbl_AnalysisTitle" runat="server" Text='<%# Bind("EconomicAnalysis_Title") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Width="20%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="نویسنده تحلیل" SortExpression="EconomicAnalysis_Author">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("EconomicAnalysis_Author") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Width="30%" />
            </asp:TemplateField>
            <asp:CheckBoxField DataField="EconomicAnalysis_Status" HeaderText="فعال" HeaderStyle-HorizontalAlign="Center"
                HeaderStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" HeaderStyle-Width="5%">
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:CheckBoxField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <a id='<%# Eval("EconomicAnalysis_ID") %>' class="editAnalysis" style="cursor: pointer">
                        <img border="0" src="../Images/ajaxImages/edit.png" alt="ویرایش" /></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:HiddenField ID="lbl_AnalysisID" Value='<%# Eval("EconomicAnalysis_ID") %>' runat="server">
                    </asp:HiddenField>
                    <a href="#" id='<%# Eval("EconomicAnalysis_ID") %>' class="delAnalysis">
                        <img border="0" src="../Images/ajaxImages/delete.png" alt="حذف" /></a><br />
                    <asp:CheckBox ID="cbDelete" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        <EmptyDataTemplate>
            <asp:Label ID="Label3" runat="server" Text="هیچ تحلیلی ثبت نشده است" Width="100%"></asp:Label>
        </EmptyDataTemplate>
        <PagerSettings FirstPageText="«" LastPageText="»" Mode="NextPreviousFirstLast" PageButtonCount="7" />
    </asp:GridView>
    <input type="button" id="btn_DeleteSelected" class="submitdel" value="حذف انتخابی" />
</fieldset>
<div aria-labelledby="ui-dialog-title-dialog-form" role="dialog" tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
    style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: auto;
    width: 450px; top: 82px; left: 460px;">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
        <span id="ui-dialog-title-dialog-form" class="ui-dialog-title">ویرایش</span><a role="button"
            class="ui-dialog-titlebar-close ui-corner-all" href="#"><span class="ui-icon ui-icon-closethick">بستن</span></a></div>
    <div style="width: auto; min-height: 0px; height: auto" class="ui-dialog-content ui-widget-content"
        id="dialog-form">
        <form id="frm_analysis">
        <fieldset>
            <legend style="color: White">تحلیلهای اقتصادی</legend>
            <asp:TextBox ID="txt_AnalysisID" CssClass="customTxt medium" runat="server" Enabled="false" Width="25">
            </asp:TextBox>
            <div class="input_field">
                <label for="mf"> عنوان تحلیل: </label><br /><br />
                <asp:TextBox ID="txt_AnalysisTitle" CssClass="customTxt medium" runat="server"></asp:TextBox>
            </div>
            <div class="input_field">
                <label> متن تحلیل: </label><br /><br />
                <asp:TextBox ID="txt_AnalysisContext" runat="server" Height="200px" TextMode="MultiLine" CssClass="customTxt medium" Width="95%"></asp:TextBox>
            </div>
            <div class="input_field">
                <asp:CheckBox ID="chk_AnalysisStatus" Checked="false" runat="server" />فعال</div>
            <div class="input_field no_margin_bottom">
                <input type="button" id="btn_UpdateAnalysis" class="submit btn_UpdateAnalysis" value="ثبت تحلیل" />
                <input type="button" id="btn_Exit" class="submit" value="بازگشت" />
                <asp:Label ID="lbl_Msg" CssClass="error" runat="server"></asp:Label>
            </div>
        </fieldset>
        </form>
    </div>
    <div class="ui-resizable-handle ui-resizable-n"></div>
    <div class="ui-resizable-handle ui-resizable-e"></div>
    <div class="ui-resizable-handle ui-resizable-s"></div>
    <div class="ui-resizable-handle ui-resizable-w"></div>
    <div style="z-index: 1001;" class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se"></div>
    <div style="z-index: 1002;" class="ui-resizable-handle ui-resizable-sw"></div>
    <div style="z-index: 1003;" class="ui-resizable-handle ui-resizable-ne"></div>
    <div style="z-index: 1004;" class="ui-resizable-handle ui-resizable-nw"></div>
    <div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix"></div>
</div>
<script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
<script src="../Scripts/jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>
<script src="ckeditor/ckeditor.js" type="text/javascript"></script>
<script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
<script type="text/javascript">
    function getImagePath() { return '<%= ImagePath %>'; }
    $(document).ready(function ()
    {
        $('#load').hide();
        $("#dialog:ui-dialog").dialog("destroy");
        $("#dialog-form").dialog({
            autoOpen: false,
            resizable: false,
            height: 'auto',
            width: 800,
//            show: 'slide',
//            hide: 'clip',
            modal: true
        });
        $('.submit').click(function ()
        { $("#dialog-form").dialog("close"); });
    });
</script>
<script type="text/javascript">
    $(document).ready(function ()
    {
        $(".delAnalysis, #btn_DeleteSelected").click(function ()
        {
            var imagePath = getImagePath();
            var selectedIds = "";
            var RowsToRemove = new Array();

            if (this.id == "btn_DeleteSelected")
            {
                $('#<%=GridView_AnalysisManagement.ClientID %> input[type=checkbox][id$=cbDelete]:checked').each(function (index, item)
                {
                    selectedIds = selectedIds + "'" + $(item).closest("tr").find("input[type=hidden][id$=lbl_AnalysisID]").val() + "', ";
                    RowsToRemove.push($(item).closest("tr"));
                });
                if (selectedIds.length > 0)
                {
                    selectedIds = "[" + selectedIds.substring(0, selectedIds.length - 2) + "]";
                }
            }
            else
            {
                selectedIds = "['" + $(this).closest("tr").find("input[type=hidden][id$=lbl_AnalysisID]").val() + "']";
                RowsToRemove.push($(this).closest("tr"));
            }
            if (confirm("آیا با حذف تحلیل(های) موردنظر موافقید?"))
            {
                $(RowsToRemove).each(function (index, item)
                {
                    item.find("td").children().css({ 'display': 'none' });
                    $("<div>").text("در حال حذف...").css({ 'height': '20px' }).appendTo(item.find("td:first"));
                });
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
                    url: "EconomicAnalysisManagement.aspx/DelAnalysis",
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
                        $.unblockUI(); alert("بروز خطا");
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
        $('.editAnalysis').click(function ()
        {
            var imagePath = getImagePath();
            var analysisID = $(this).attr("id");
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
                url: "EconomicAnalysisManagement.aspx/GetAnalysisInfo",
                data: "{ analysisID: '" + analysisID + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data)
                {
                    var analysis = data.d;
                    var txt_AnalysisID = $('#<%= txt_AnalysisID.ClientID %>');
                    var editorTitle = CKEDITOR.instances.ctl00_ContentPlaceHolder1_EconomicAnalysisManagement1_txt_AnalysisTitle;
                    var editorContext = CKEDITOR.instances.ctl00_ContentPlaceHolder1_EconomicAnalysisManagement1_txt_AnalysisContext;
                    txt_AnalysisID.val(analysis.AnalysisID);
                    editorTitle.setData(analysis.AnalysisTitle);
                    editorContext.setData(analysis.AnalysisContext);
                    $('#<%= chk_AnalysisStatus.ClientID %>').attr('checked', analysis.AnalysisStatus == true ? true : false);
                    $("#dialog-form").dialog("open");
                    $.unblockUI();
                },
                error: function ()
                {
                    $.unblockUI();
                    alert("خطا در بازیابی اطلاعات");
                }
            });
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function ()
    {
        $('.btn_UpdateAnalysis').click(function ()
        {
            var imagePath = getImagePath();
            var analysisID = $('#<%= txt_AnalysisID.ClientID %>').val();

            var editorTitle = CKEDITOR.instances.ctl00_ContentPlaceHolder1_EconomicAnalysisManagement1_txt_AnalysisTitle;
            var editorContext = CKEDITOR.instances.ctl00_ContentPlaceHolder1_EconomicAnalysisManagement1_txt_AnalysisContext;
            var analysis_Title = editorTitle.getData();
            var analysis_Context = editorContext.getData();
            var analysis_Status = $('#<%= chk_AnalysisStatus.ClientID %>').is(':checked');
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
                url: "EconomicAnalysisManagement.aspx/UpdateAnalysisInfo",
                data: "{ analysisID: '" + analysisID +
                      "',analysis_Title: '" + analysis_Title +
                      "',analysis_Context: '" + analysis_Context +
                      "',analysis_Status: '" + analysis_Status + "'}",
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
                    $.unblockUI(); alert("خطا در ثبت اطلاعات");
                }
            });
        });
    });
</script>
