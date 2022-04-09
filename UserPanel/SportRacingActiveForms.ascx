<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportRacingActiveForms.ascx.cs" Inherits="UserPanel_SportRacingActiveForms" %>
<%@ Register src="~/UserPanel/SportRacingFormEdit.ascx" tagname="SportRacingFormEdit" tagprefix="uc1" %>
<script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
<script src="../Scripts/jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>
<script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
<script src="../Scripts/jquery.tablePagination.0.1.js" type="text/javascript"></script>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<script type="text/javascript">
    $(document).ready(function ()
    {
//        function loadUserControl(obj)
//        {
//            $.blockUI(
//                {
//                    message: '<h4 style="font-family:tahoma;color:lime"><img src="' + imagePath + '/ajaxImages/loading_User.gif" /><br /><br />... درحال بارگذاری</h4>',
//                    fadeIn: 1000,
//                    fadeOut: 1000,
//                    centerX: true,
//                    centerY: true,
//                    css:
//                    {
//                        border: 'none',
//                        padding: '5px',
//                        backgroundColor: 'transparent',
//                        '-webkit-border-radius': '10px',
//                        '-moz-border-radius': '10px',
//                        opacity: .6,
//                        color: '#fff'
//                    }
//                });
//            var ControlName = obj;
//            $.ajax({
//                type: "POST",
//                url: "UserProfileRegister.aspx/Result",
//                data: "{controlName:'" + ControlName + "'}",
//                contentType: "application/json; charset=utf-8",
//                dataType: "json",
//                success: function (response)
//                {
//                    $.unblockUI();
//                    $('#result2').html(response.d);
//                },
//                failure: function (msg)
//                {
//                    $.unblockUI();
//                    $('#result2').html(msg);
//                }
//            });
//        }
        $('table').tablePagination({});
//        $("#dialog:ui-dialog").dialog("destroy");
//        $("#dialog-form").dialog({
//            autoOpen: false,
//            resizable: false,
//            height: 'auto',
//            width: 'auto',
//            modal: true,
//            position: 'center'
//        });
//        $('.submit').click(function ()
//        {
//            $("#dialog-form").dialog("close");
//        });
//        $('.editForm').click(function ()
//        {
//            loadUserControl("UserPanel/SportRacingFormEdit.ascx");
//            $("#dialog-form").dialog("open");
//        });
    });
</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
<%--        <div style="direction:rtl;text-align:right">
            <span style="color:#ffcc00">کد مسابقه</span><asp:TextBox ID="txt_srchRacingInfo" runat="server" CssClass="txt" EnableViewState="false"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
            <span style="color: #ffcc00">شماره فرم</span><asp:TextBox ID="txt_srchFormID" 
                runat="server" CssClass="txt" EnableViewState="false"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_Search" runat="server" CssClass="btnSearch" Text="جستجو" 
                onclick="btn_Search_Click" UseSubmitBehavior="False" />
        </div>--%>
        <div id="activeForms" style="color: #FFFFFF; border: thin solid #5d5852; font-family: Tahoma;
            font-size: 12px; background-color: #333333; margin: 5px 5px; outline: 0; -moz-border-radius: 2px;
            direction: rtl; -webkit-border-radius: 2px">
            <asp:GridView ID="gv_ActiveForms" runat="server" CellPadding="4" ForeColor="#333333"
                GridLines="None" AutoGenerateColumns="false" PageSize="5" HorizontalAlign="Center"
                UseAccessibleHeader="false" OnPreRender="gv_ActiveForms_PreRender" EnableViewState="false">
                <Columns>
                    <asp:TemplateField HeaderText="ردیف">
                        <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_RowNumber" runat="server" Text='<%# Container.DataItemIndex + 1%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="کد مسابقه">
                        <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_racingInfoID" runat="server" Text='<%# Eval("RacingInfo_ID", "{0}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="شماره فرم">
                        <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_FormID" runat="server" Text='<%# Eval("Form_ID", "{0}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="عنوان مسابقه">
                        <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_raceTitle" runat="server" Text='<%# Eval("Race_Title", "{0}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="جزئیات">
                        <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_raceDetail" runat="server" Text='<%# Eval("RacingInfo_Details", "{0}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="تاریخ ایجاد فرم">
                        <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_FormCreationDate" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("Form_CreationDate","{0}"), "L", true) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="تاریخ آخرین ویرایش">
                        <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_FormCreationDate" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("Form_LastUpdate","{0}"), "L", true) %>'
                                ForeColor="Red" Font-Italic="true"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="مهلت مسابقه">
                        <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("RacingInfo_RespiteDate","{0}"), "L", false) %>'>
                            </asp:Label>&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label1" CssClass="activeRacingSubItem" runat="server" Text='<%# Eval("RacingInfo_RespiteTime", "{0}") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <a style="font-weight: bold; font-size: 12px; font-family: Tahoma" href='<%# Eval("Form_ID","UserSportRacingEditForm.aspx?formID={0}")%>'>
                                ویرایش</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" Height="30px" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
    </ContentTemplate>
<%--    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btn_Search" EventName="Click" />
    </Triggers>--%>
</asp:UpdatePanel>
    
<%--<div aria-labelledby="ui-dialog-title-dialog-form" role="dialog" tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
    style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: 250px;
    width: 350px; top: 82px; left: 460px;">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
        <span id="ui-dialog-title-dialog-form" class="ui-dialog-title">ثبت فرم</span> <a
            role="button" class="ui-dialog-titlebar-close ui-corner-all" href="Home.aspx"><span
                class="ui-icon ui-icon-closethick">بستن</span> </a>
    </div>
    <div style="width: auto; min-height: 0px; height: auto;" class="ui-dialog-content ui-widget-content" id="dialog-form">--%>       
<%--        <form id="frm_RacingEditForm">--%><%--        <fieldset>
            <div id="result2"></div>--%><%--            <uc1:SportRacingFormEdit ID="SportRacingFormEdit1" runat="server" />--%><%--        </fieldset>--%><%--        </form>--%><%--    </div>
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
</div>--%>
