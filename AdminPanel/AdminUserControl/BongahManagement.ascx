<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BongahManagement.ascx.cs" Inherits="AdminPanel_AdminUserControl_BongahManagement" %>
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
        $(".delBongah, #btn_DeleteSelected").click(function ()
        {
            var selectedIds = "";
            var RowsToRemove = new Array();

            if (this.id == "btn_DeleteSelected")
            {
                $('#<%=gv_Investing.ClientID %> input[type=checkbox][id$=cbDelete]:checked').each(function (index, item)
                {
                    selectedIds = selectedIds + "'" + $(item).closest("tr").find("input[type=hidden][id$=lbl_BongahID]").val() + "', ";
                    RowsToRemove.push($(item).closest("tr"));
                });
                if (selectedIds.length > 0)
                {
                    selectedIds = "[" + selectedIds.substring(0, selectedIds.length - 2) + "]";
                }
            }
            else
            {
                selectedIds = "['" + $(this).closest("tr").find("input[type=hidden][id$=lbl_BongahID]").val() + "']";
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
            if (confirm("آیا با حذف بنگاه(های) موردنظر موافقید?"))
            {
                $.ajax({
                    type: "POST",
                    url: "BongahManagement.aspx/DeleteBongah",
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
        $('.editBongah').click(function ()
        {
            var bongah_Id = $(this).attr("id");
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
                url: "BongahManagement.aspx/GetBongahInfo",
                data: "{ bongahId: '" + bongah_Id + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data)
                {
                    var bongahInfo = data.d;
                    var txt_BongahID = $('#<%= txt_BongahID.ClientID %>');
                    var txt_BongahType = $('#<%= txt_BongahType.ClientID %>');
                    var txt_BongahLocation = $('#<%= txt_BongahLocation.ClientID %>');
                    var txt_BongahAttribute = $('#<%= txt_BongahAttribute.ClientID %>');
                    txt_BongahID.val(bongahInfo.BongahID);
                    txt_BongahType.val(bongahInfo.Bongah_Type);
                    txt_BongahLocation.val(bongahInfo.Bongah_Location);
                    txt_BongahAttribute.val(bongahInfo.Bongah_Attribute);
                    $('#<%= chk_IsBuy.ClientID %>').attr('checked', bongahInfo.Bongah_buy == true ? true : false);
                    $('#<%= chk_IsSale.ClientID %>').attr('checked', bongahInfo.Bongah_sale == true ? true : false);
                    $('#<%= chk_IsInvestor.ClientID %>').attr('checked', bongahInfo.Bongah_investor == true ? true : false);
                    $('#<%= chk_IsCapitalist.ClientID %>').attr('checked', bongahInfo.Bongah_capitalist == true ? true : false);

                    $("#dialog-form").dialog("open");
                    $.unblockUI();
                }
            });
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function ()
    {
        $('.btn_UpdateBongah').click(function ()
        {
            var bongahId = $('#<%= txt_BongahID.ClientID %>').val();
            var bongahType = $('#<%= txt_BongahType.ClientID %>').val();
            var bongahLocation = $('#<%= txt_BongahLocation.ClientID %>').val();
            var bongahAttribute = $('#<%= txt_BongahAttribute.ClientID %>').val();

            var bongahBuy = $('#<%= chk_IsBuy.ClientID %>').is(":checked");
            var bongahSale = $('#<%= chk_IsSale.ClientID %>').is(":checked");
            var bongahInvestor = $('#<%= chk_IsInvestor.ClientID %>').is(":checked");
            var bongahCapitalist = $('#<%= chk_IsCapitalist.ClientID %>').is(":checked");
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
                url: "BongahManagement.aspx/UpdateBongahInfo",
                data: "{ bongahId        : '" + bongahId +
                      "',bongahType      : '" + bongahType +
                      "',bongahLocation  : '" + bongahLocation +
                      "',bongahAttribute : '" + bongahAttribute +
                      "',bongahBuy       : '" + bongahBuy +
                      "',bongahSale      : '" + bongahSale +
                      "',bongahInvestor  : '" + bongahInvestor +
                      "',bongahCapitalist: '" + bongahCapitalist +
                      "'}",

                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data)
                {
                    alert("عملیات اصلاح انجام گردید");
                    $("#dialog-form").dialog("close");
                    $.unblockUI();
                }
            });
        });
    });
</script>
<fieldset>
    <legend style="color: #66FF33">مدیریت بنگاه ها</legend>

    <div id="divGridView">
        <asp:GridView ID="gv_Investing" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            AllowSorting="true" GridLines="Horizontal"
            CssClass="GridViewStyle" HeaderStyle-CssClass="HeaderStyle"
            HeaderStyle-HorizontalAlign="Center"  HeaderStyle-VerticalAlign="Middle" 
            ShowHeaderWhenEmpty="True" OnPageIndexChanging="gv_Investing_PageIndexChanging"
            OnPageIndexChanged="gv_Investing_PageIndexChanged">
            <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="RowStyle"/>
            <PagerStyle CssClass="PagerStyle" />
            <Columns>
                <asp:TemplateField HeaderText="نوع بنگاه" SortExpression="Bongah_Type">
                    <ItemTemplate>
                        <asp:Label ID="txt_BongahType" runat="server" Text='<%# Bind("Bongah_Type") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle Width="20%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="موقعیت بنگاه" SortExpression="Bongah_Location">
                    <ItemTemplate>
                        <asp:Label ID="txt_Bongah_Location" runat="server" Text='<%# Bind("Bongah_Location") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="مشخصات بنگاه" SortExpression="Bongah_Attribute">
                    <ItemTemplate>
                        <asp:Label ID="txt_Bongah_Attribute" runat="server" Text='<%# Bind("Bongah_Attribute") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle Width="30%" />
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
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <a id='<%# Eval("Bongah_ID") %>' class="editBongah" style="cursor: pointer">
                            <img border="0" src="../Images/ajaxImages/edit.png" alt="ویرایش" /></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:HiddenField ID="lbl_BongahID" Value='<%# Eval("Bongah_ID") %>' runat="server"></asp:HiddenField>
                        <a href="#" id='<%# Eval("Bongah_ID") %>' class="delBongah">
                            <img border="0" src="../Images/ajaxImages/delete.png" alt="حذف" /></a>
                            <br />
                        <asp:CheckBox ID="cbDelete" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <asp:Label ID="Label3" runat="server" Text="هیچ موردی یافت نشد" Width="100%"></asp:Label>
            </EmptyDataTemplate>
            <PagerSettings FirstPageText="«" LastPageText="»" Mode="NextPreviousFirstLast" PageButtonCount="7" />
        </asp:GridView>
    </div>
    <input type="button" id="btn_DeleteSelected" class="submitdel" value="حذف انتخابی" />
</fieldset>
<div aria-labelledby="ui-dialog-title-dialog-form" role="dialog" tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
    style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: auto;
    width: 350px; top: 82px; left: 460px;">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
        <span id="ui-dialog-title-dialog-form" class="ui-dialog-title">ویرایش</span> <a role="button"
            class="ui-dialog-titlebar-close ui-corner-all" href="#"><span class="ui-icon ui-icon-closethick">
                بستن</span> </a>
    </div>
    <div style="width: auto; min-height: 0px; height: auto;" class="ui-dialog-content ui-widget-content"
        id="dialog-form">
        <form id="frm_Investing">
        <fieldset>
            <%--				<legend style="color: White">ویرایش خبر</legend>--%>
            <asp:TextBox ID="txt_BongahID" CssClass="customTxt" runat="server" Enabled="false"
                Width="25">
            </asp:TextBox>
            <div class="input_field">
                <label for="mf">
                    نوع بنگاه:
                </label>
                <asp:TextBox ID="txt_BongahType" CssClass="customTxt medium" runat="server"></asp:TextBox>
            </div>
            <div class="input_field">
                <label>
                    مکان:
                </label>
                <asp:TextBox ID="txt_BongahLocation" runat="server" Width="95%" CssClass="customTxt big"></asp:TextBox>
            </div>
            <div class="input_field">
                <label>
                    مشخصات بنگاه:
                </label>
                <asp:TextBox ID="txt_BongahAttribute" runat="server" Height="200px" Width="95%" TextMode="MultiLine"
                    CssClass="customTxt big"></asp:TextBox>
            </div>
            <div class="input_field">
                <asp:CheckBox ID="chk_IsBuy" Checked="false" runat="server" />
                خرید
                <br />
                <asp:CheckBox ID="chk_IsSale" Checked="False" runat="server" />
                فروش
                <br />
                <asp:CheckBox ID="chk_IsInvestor" Checked="False" runat="server" />
                سرمایه گذار
                <br />
                <asp:CheckBox ID="chk_IsCapitalist" Checked="False" runat="server" />
                سرمایه پذیر
            </div>
            <div class="input_field no_margin_bottom">
                <input type="button" id="btn_UpdateBongah" class="submit btn_UpdateBongah" value="اصلاح" />
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