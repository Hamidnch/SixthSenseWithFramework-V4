<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportRacingReport2.ascx.cs" Inherits="AdminPanel_AdminUserControl_SportRacingReport2" %>
<style type="text/css">.GridView1{margin: 0; border: thin none white;}.GridView1 td{border-bottom: thin solid #ADA7A7; padding: 1px;}</style>
<asp:ScriptManager ID="ScriptManager1" runat="server">
    <Services><asp:ServiceReference Path="~/RacingService.asmx" /></Services>
    <Scripts><asp:ScriptReference Path="~/Scripts/PreviewScripts/PreviewScript.js" /><asp:ScriptReference Path="~/Scripts/PreviewScripts/PreviewDragDrop.js" /><asp:ScriptReference Path="~/Scripts/PreviewScripts/PreviewGlitz.js" /></Scripts>
</asp:ScriptManager>
<table>
    <tr>
        <td style="text-align: left; border-color: #333333; border-style: solid; border-width: 1px">
            <div id="DivRacinfWithInfo" style="color: #FFFFFF; border: thin solid #5d5852; font-family: Tahoma;
                font-size: 12px; background-color: #333333; margin: 5px 5px; outline: 0; -moz-border-radius: 2px;
                direction: rtl; -webkit-border-radius: 2px">
                <AjaxData:GridView ID="gv_RacingWithInfo" runat="server" CellSpacing="0" CellPadding="3"
                    RowDataBoundEvent="onRowDataBound" SortOrderAscendingImageUrl="~/Images/up.gif"
                    SortOrderDescendingImageUrl="~/Images/dn.gif" SortCommandEvent="onSortCommand"
                    RowCommandEvent="onRowCommand">
<%--                    RowMouseOverEvent="onRowMouseOver" RowMouseOutEvent="onRowMouseOut"--%>
                    <HeaderStyle Font-Bold="True" ForeColor="Aqua" VerticalAlign="Middle" HorizontalAlign="Center" BackColor="#1b1b1b" BorderColor="#404040" Height="30px" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="50px"/>
               <%--     <RowStyle BackColor="#9f6827" ForeColor="#f0eee0" Height="50px" />--%>
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <AjaxData:GridViewTemplateColumn>
                            <ItemTemplate>
                                <span id="spnRacingInfo" style="display:none"></span>
                            </ItemTemplate>
                        </AjaxData:GridViewTemplateColumn>
                        <AjaxData:GridViewBoundColumn HeaderText="ردیف" DataField="RowIndex"
                            HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-Wrap="false">
                        </AjaxData:GridViewBoundColumn>
                        <AjaxData:GridViewBoundColumn HeaderText="کد اطلاعاتی مسابقه" DataField="RacingInfoID" AllowDragAndDrop="true"
                            SortField="RacingInfoID" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                            HeaderStyle-Wrap="false">
                        </AjaxData:GridViewBoundColumn>
                        <AjaxData:GridViewBoundColumn HeaderText="عنوان مسابقه" DataField="RacingTitle" SortField="RacingTitle" AllowDragAndDrop="true"
                            HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-Wrap="false">
                        </AjaxData:GridViewBoundColumn>
                        <AjaxData:GridViewBoundColumn HeaderText="جزئیات مسابقه" DataField="RacingDetails" AllowDragAndDrop="true"
                            SortField="RacingDetails" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-Wrap="false">
                        </AjaxData:GridViewBoundColumn>
                        <AjaxData:GridViewBoundColumn HeaderText="نام کشور" DataField="Country" SortField="Country" AllowDragAndDrop="true"
                            HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-Wrap="false">
                        </AjaxData:GridViewBoundColumn>
                        <AjaxData:GridViewBoundColumn HeaderText="تاریخ ایجاد" DataField="RacingCreationDate"
                            AllowDragAndDrop="true" SortField="RacingCreationDate" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Center" HeaderStyle-Wrap="false">
                        </AjaxData:GridViewBoundColumn>
                        <AjaxData:GridViewBoundColumn HeaderText="تاریخ آخرین ویرایش" DataField="RacingLastUpdate" AllowDragAndDrop="true"
                            SortField="RacingLastUpdate" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-Wrap="false">
                        </AjaxData:GridViewBoundColumn>
    <%--                    <AjaxData:GridViewTemplateColumn>
                            <ItemTemplate>
                                <a id="a_showForms" commandname="ShowInfo" onclick="showForms();"><img id="imgdiv" style="cursor:pointer" alt="نمایش فرمها" width="32px" border="0" src="../Images/ajaxImages/game.png" /></a>
                            </ItemTemplate>
                        </AjaxData:GridViewTemplateColumn>--%>
                        <AjaxData:GridViewButtonColumn CommandName="ShowInfo" HeaderText="نمایش فرمها" DataTextField="RacingInfoID"
                            HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" ImageUrl="../Images/ajaxImages/game.png" ButtonType="Image">
                        </AjaxData:GridViewButtonColumn>
                        <AjaxData:GridViewButtonColumn CommandName="ShowWin" HeaderText="نمایش برندگان" DataTextField="RacingInfoID"
                            HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" ImageUrl="../Images/ajaxImages/win.png" ButtonType="Image">
                        </AjaxData:GridViewButtonColumn>
                    </Columns>
                </AjaxData:GridView>
                <span id="spn" style="display:none">موردی یافت نشد.</span> 
            </div>
        </td>
    </tr>
    <tr>
        <td style="text-align: center; font-size:12px; border-color:#222222;border-style:none;border-width:1px">
            <AjaxData:Pager ID="Pager1" runat="server" PageSize="10" HideOnSinglePage="true" PageChangedEvent="pageChanged" CssClass="pager"></AjaxData:Pager>
        </td>
    </tr>
</table>
<div id="divRacingForms" aria-labelledby="ui-dialog-title-dialog-form" role="dialog"
    tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
    style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: auto;
    width: 800px; top: 82px; left: 460px;">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
        <span id="ui-dialog-title-dialog-form" class="ui-dialog-title">ویرایش</span><a role="button"
            class="ui-dialog-titlebar-close ui-corner-all" href="#"><span class="ui-icon ui-icon-closethick">بستن</span></a></div>
    <div style="width: auto; min-height: 0px; height: auto" class="ui-dialog-content ui-widget-content"
        id="dialog-form">
        <form id="frm_RacingResult">
        <fieldset>
            <span id="lbl_Msg" style="display: none; color: #ffcc00;">هیچ فرمی وجود ندارد</span>
            <div id="Div1" style="color: #FFFFFF; border: thin solid #5D5852; font-family: Tahoma;
                font-size: 12px; background-color: #333333; margin: 5px 5px; outline: 0; -moz-border-radius: 2px;
                direction: rtl; -webkit-border-radius: 2px">
            <AjaxData:GridView ID="gv_RacingForm" runat="server"
                CellSpacing="0" CellPadding="2" SortOrderAscendingImageUrl="~/Images/up.gif"
                SortOrderDescendingImageUrl="~/Images/dn.gif" SortCommandEvent="onSortCommand2">
                <HeaderStyle ForeColor="Aqua" VerticalAlign="Middle" HorizontalAlign="Center" BackColor="#996600"
                    BorderColor="#404040" Height="30px" />
                <RowStyle BackColor="#FFFFE0" ForeColor="#333333" Height="35px" />
                <AlternatingRowStyle BackColor="#CCCCCE" ForeColor="#284775" Height="35px" />            
                <Columns>
                    <AjaxData:GridViewBoundColumn HeaderText="ردیف" DataField="RowIndex"
                        HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Wrap="false">
                    </AjaxData:GridViewBoundColumn>
                    <AjaxData:GridViewBoundColumn HeaderText="کد اطلاعاتی مسابقه" DataField="Form_RacingInfoID"
                        SortField="Form_RacingInfoID" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Wrap="false">
                    </AjaxData:GridViewBoundColumn>
                    <AjaxData:GridViewBoundColumn HeaderText="شماره فرم" DataField="FormInfo_FormID"
                        SortField="FormInfo_FormID" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Wrap="false">
                    </AjaxData:GridViewBoundColumn>
                    <AjaxData:GridViewBoundColumn HeaderText="نام کاربری" DataField="Member_UserName"
                        SortField="Member_UserName" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Wrap="false">
                    </AjaxData:GridViewBoundColumn>
                    <AjaxData:GridViewBoundColumn HeaderText="تاریخ ایجاد" DataField="Form_CreationDate"
                        SortField="Form_CreationDate" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                        ItemStyle-Wrap="true">
                    </AjaxData:GridViewBoundColumn>
                    <AjaxData:GridViewBoundColumn HeaderText="تاریخ آخرین ویرایش" DataField="Form_LastUpdate"
                        SortField="Form_LastUpdate" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                        ItemStyle-Wrap="true">
                    </AjaxData:GridViewBoundColumn>
                    <AjaxData:GridViewBoundColumn HeaderText="مبلغ" DataField="Form_Amount" SortField="Form_Amount"
                        HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-Wrap="false">
                    </AjaxData:GridViewBoundColumn>
                    <AjaxData:GridViewBoundColumn HeaderText="امتیاز" DataField="Form_Prominence"
                        SortField="Form_Prominence" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Wrap="false">
                    </AjaxData:GridViewBoundColumn>
                    <AjaxData:GridViewBoundColumn HeaderText="وضعیت" DataField="Form_ActiveStatus"
                        SortField="Form_ActiveStatus" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Wrap="false">
                    </AjaxData:GridViewBoundColumn>
                </Columns>
                <HeaderStyle BackColor="#404040" Font-Bold="True" Height="30px" BorderColor="#5d5852"
                    BorderStyle="Solid" BorderWidth="1" HorizontalAlign="Center" VerticalAlign="Middle"
                    Font-Underline="false" Font-Italic="true" />
                <RowStyle ForeColor="Blue" Height="40px" />
            </AjaxData:GridView>
            </div>
            <div style="color: #FFFFFF; border: thin solid #5d5852; font-family: Tahoma; text-align: center;
                    font-size: 12px; background-color: #333333; margin: 5px 5px; outline: 0; -moz-border-radius: 2px;
                    direction: rtl; -webkit-border-radius: 2px">
                <AjaxData:Pager ID="Pager_Form" runat="server" CssClass="pagination" PageSize="5" HideOnSinglePage="true"
                    PageChangedEvent="pageChanged2">
                </AjaxData:Pager> 
            </div>       
        </fieldset>
        </form>
    </div>
    <div class="ui-resizable-handle ui-resizable-n"></div><div class="ui-resizable-handle ui-resizable-e"></div><div class="ui-resizable-handle ui-resizable-s"></div><div class="ui-resizable-handle ui-resizable-w"></div><div style="z-index: 1001;" class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se"></div><div style="z-index: 1002;" class="ui-resizable-handle ui-resizable-sw"></div><div style="z-index: 1003;" class="ui-resizable-handle ui-resizable-ne"></div><div style="z-index: 1004;" class="ui-resizable-handle ui-resizable-nw"></div><div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix"></div>
</div>
<div id="divWin" aria-labelledby="ui-dialog-title-dialog-form" role="dialog" tabindex="-1"
    class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
    style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: auto;
    width: 800px; top: 82px; left: 460px;">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
        <span id="Span1" class="ui-dialog-title">نمایش برندگان</span><a role="button" class="ui-dialog-titlebar-close ui-corner-all"
            href="#"><span class="ui-icon ui-icon-closethick">بستن</span></a></div>
    <div style="width: auto; min-height: 0px; height: auto" class="ui-dialog-content ui-widget-content"
        id="dialog-form2">
        <form id="Form1">
                <fieldset>
                    <legend style="color: White">
                        <asp:Label ID="lb_RacingTitle" ForeColor="#ffcc00" runat="server" Text=""></asp:Label></legend>
                    <table>
                        <tr>
                            <td>
                                <div>
                                    <p style="text-align: center">
                                        <label style="color: Lime">
                                            لیست نفرات
                                        </label>
                                        <span style="color: #ffcc00">اول </span>
                                    </p>
                                    <AjaxData:GridView ID="gv_RacingFirstWin" runat="server" ForeColor="#333333" CellSpacing="0"
                                        EmptyDataRowStyle-HorizontalAlign="Center"
                                        EmptyDataRowStyle-VerticalAlign="Middle" EmptyDataRowStyle-ForeColor="Yellow"
                                        CellPadding="3" SortOrderAscendingImageUrl="~/Images/up.gif" SortOrderDescendingImageUrl="~/Images/dn.gif">
                                        <Columns>
                                            <AjaxData:GridViewBoundColumn HeaderText="نام کاربری" DataField="Member_UserName" ItemStyle-ForeColor="#ffCC00"
                                                SortField="Member_UserName" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                                                HeaderStyle-Wrap="false">
                                            </AjaxData:GridViewBoundColumn>
                                            <AjaxData:GridViewBoundColumn HeaderText="شماره فرم" DataField="FormInfo_FormID" SortField="FormInfo_FormID"
                                                HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-Wrap="false" ItemStyle-ForeColor="#ffff0">
                                            </AjaxData:GridViewBoundColumn>
                                            <AjaxData:GridViewBoundColumn HeaderText="امتیاز" DataField="Form_Prominence" SortField="Form_Prominence"
                                                HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-Wrap="false" ItemStyle-ForeColor="Lime">
                                            </AjaxData:GridViewBoundColumn>
                                        </Columns>    
                                        <EmptyDataRowStyle HorizontalAlign="Center" VerticalAlign="Middle" ForeColor="Yellow" />                               
                                        <HeaderStyle Height="30px" BackColor="#333333" Font-Bold="True" ForeColor="Aqua"
                                            VerticalAlign="Middle" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#222222" ForeColor="#333333" />
                                    </AjaxData:GridView>
                                    <span id="SpnFirstWin" style="display:none;text-align:center;color:Silver; font-style:italic;">برنده ای وجود ندارد</span> 
                                </div>
                            </td>
                            <td colspan="2">
                                <div>
                                    <p style="text-align: center">
                                        <label style="color: Lime">
                                            لیست نفرات
                                        </label>
                                        <span style="color: #ffcc00">دوم </span>
                                    </p>
                                    <AjaxData:GridView ID="gv_RacingSecondWin" runat="server" ForeColor="#333333" CellSpacing="0"
                                        CellPadding="7" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-VerticalAlign="Middle" EmptyDataRowStyle-ForeColor="Yellow"                                     
                                        SortOrderAscendingImageUrl="~/Images/up.gif" SortOrderDescendingImageUrl="~/Images/dn.gif">
                                        <Columns>
                                            <AjaxData:GridViewBoundColumn HeaderText="نام کاربری" DataField="Member_UserName"
                                                ItemStyle-ForeColor="#ffCC00" ItemStyle-Width="15%" SortField="Member_UserName"
                                                HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-Wrap="false">
                                            </AjaxData:GridViewBoundColumn>
                                            <AjaxData:GridViewBoundColumn HeaderText="شماره فرم" DataField="FormInfo_FormID" ItemStyle-Width="15%"
                                                SortField="FormInfo_FormID" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="#ffff0"
                                                HeaderStyle-Wrap="false">
                                            </AjaxData:GridViewBoundColumn>
                                            <AjaxData:GridViewBoundColumn HeaderText="امتیاز" DataField="Form_Prominence" SortField="Form_Prominence"
                                                ItemStyle-Width="15%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="Lime">
                                            </AjaxData:GridViewBoundColumn>
                                        </Columns>
                                        <EmptyDataRowStyle HorizontalAlign="Center" VerticalAlign="Middle" ForeColor="Yellow" />
                                        <HeaderStyle Height="30px" BackColor="#333333" Font-Bold="True" ForeColor="Aqua"
                                            CssClass="header_Grid" VerticalAlign="Middle" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#222222" ForeColor="#333333" />
                                    </AjaxData:GridView>
                                    <span id="SpnSecondWin" style="display:none;text-align:center;color:Silver; font-style:italic;">برنده ای وجود ندارد</span> 
                                </div>
                            </td>
                        </tr>
                        <tr><td colspan="3"><br /><br /></td></tr>
                        <tr>
                            <td colspan="3"><asp:Label ID="lbl_Sum" runat="server" Text="0"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="lbl_rewardForFirstWin" runat="server" Text="0"></asp:Label></td>                                
                            <td colspan="2"><asp:Label ID="lbl_perFirstWin" runat="server" Text="0"></asp:Label></td>  
                        </tr>
                        <tr>
                            <td><asp:Label ID="lbl_rewardForSecondWin" runat="server" Text="0"></asp:Label></td>
                            <td colspan="2"><asp:Label ID="lbl_perSecondWin" runat="server" Text="0"></asp:Label><br /></td>  
                        </tr>
                        <tr>
                            <td><asp:Label ID="lbl_rewardForGovernment" runat="server" Text="0" ForeColor="BurlyWood"></asp:Label></td>
                            <td><asp:Label ID="lbl_rewardForCharitable" runat="server" Text="0" ForeColor="BurlyWood"></asp:Label><br /></td>
                            <td><asp:Label ID="lbl_rewardForSite" runat="server" Text="0" ForeColor="BurlyWood"></asp:Label><br /></td>
                        </tr>
                    </table>
                </fieldset>
        </form>
    </div>
    <div class="ui-resizable-handle ui-resizable-n"></div><div class="ui-resizable-handle ui-resizable-e"></div><div class="ui-resizable-handle ui-resizable-s"></div><div class="ui-resizable-handle ui-resizable-w"></div><div style="z-index: 1001;" class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se"></div><div style="z-index: 1002;" class="ui-resizable-handle ui-resizable-sw"></div><div style="z-index: 1003;" class="ui-resizable-handle ui-resizable-ne"></div><div style="z-index: 1004;" class="ui-resizable-handle ui-resizable-nw"></div><div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix"></div>
</div>
<script language="javascript" type="text/javascript">
    function getImagePath() { return '<%= ImagePath %>'; } var imagePath = getImagePath();
    function roundNumber(num, dec){var result = Math.round(num * Math.pow(10, dec)) / Math.pow(10, dec);return result;}
    jQuery.noConflict();
    jQuery(document).ready(function ()
    {
        jQuery("#dialog:ui-dialog").dialog("destroy");
        jQuery("#dialog-form").dialog({
            autoOpen: false, resizable: false, height: 'auto', width: 830, direction: 'rtl',
            show: 'clip', hide: 'clip', stack: true, position: 'center', title: 'نمایش فرمهای مسابقه', modal: true
        }); jQuery('.submit').click(function () { jQuery("#dialog-form").dialog("close"); });
        jQuery("#dialog-form2").dialog({
            autoOpen: false, resizable: false, height: 'auto', width: 800, direction: 'rtl',
            show: 'clip', hide: 'clip', stack: true, position: 'center', title: 'نمایش برندگان', modal: true
        }); jQuery('.submit').click(function () { jQuery("#dialog-form2").dialog("close"); });
    });
    function setBlock()
    {
        jQuery.blockUI({ message: '<h4 style="font-family:tahoma;color:lime"><img src="' + imagePath + '/ajaxImages/loading_User.gif" /><br /><br /></h4>',
            fadeIn: 1000, fadeOut: 1000, centerX: true, centerY: true,
            css: { border: 'none', padding: '5px', backgroundColor: 'transparent', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .6, color: '#000' }
        });
    }
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_beginRequest(function (){ setBlock(); });
    prm.add_endRequest(function () { jQuery.unblockUI(); });
</script>
<script type="text/javascript">
    var _gv_RacingSecondWin, _gv_RacingFirstWin, _gv_RacingForm, p, _gridView, _pager, temp, rowFirstWin, rowSecondWin;
    //var isUltimate = false
    function pageLoad(sender, e)
    {
        _gv_RacingForm = $find('<%= gv_RacingForm.ClientID %>');p = $find('<%= Pager_Form.ClientID %>');_gridView = $find('<%= gv_RacingWithInfo.ClientID %>');        
//      _gridView.loadColumnsFromProfile('DndColumns');
        _pager = $find('<%= Pager1.ClientID %>');_gv_RacingFirstWin = $find('<%= gv_RacingFirstWin.ClientID %>');
        _gv_RacingSecondWin = $find('<%= gv_RacingSecondWin.ClientID %>');loadAllRacingWithInfo();
    }
//    function onColumnDropped(sender, e){_gridView.saveColumnsToProfile('DndColumns');}
//    function loadRacingFormsByRacingInfoID(){setBlock();RacingService.getRacingFormsByRacingInfoID(temp, onsuccessForms);}
//    function onsuccessForms(res){_gv_RacingForm.set_dataSource(res);_gv_RacingForm.dataBind();$.unblockUI();}
    function loadRacingFormsByRacingInfoIDCustom()
    {
        setBlock();var sortColumn = _gv_RacingForm.get_sortColumn();
//        if (sortColumn == null || sortColumn == "") { sortColumn = "Form_Prominence"; }
        var sortOrder = (_gv_RacingForm.get_sortOrder() == AjaxDataControls.GridViewSortOrder.Descending) ? 'ASC' : 'DESC';
        var startIndex = (p.get_pageIndex() * p.get_pageSize());
        RacingService.getRacingFormsByRacingInfoIDCustom(temp, startIndex, p.get_pageSize(), sortColumn , sortOrder, onsuccessFormCustom);
    }
    function onsuccessFormCustom(res)
    {
        var Msg = $('span[id$=lbl_Msg]');
        if (res != null && res.Total != null)
        {
            p.set_recordCount(res.Total);_gv_RacingForm.set_dataSource(res.Rows);_gv_RacingForm.dataBind();Msg.css("display", "none");            
        }
        else{_gv_RacingForm.set_dataSource(null);_gv_RacingForm.dataBind();Msg.css("display", "block");}
        jQuery.unblockUI();
    }
    function loadAllRacingWithInfo()
    {
        setBlock();var sortColumn = _gridView.get_sortColumn();if (sortColumn == null || sortColumn == "") { sortColumn = "RacingInfo_CreationDate"; }        
        var sortOrder = (_gridView.get_sortOrder() == AjaxDataControls.GridViewSortOrder.Descending) ? 'ASC' : 'DESC';
        var startIndex = (_pager.get_pageIndex() * _pager.get_pageSize());
        //RacingService.getAllRacingInfo(onLoadSuccess);
        RacingService.GetRacingInfoList(startIndex,_pager.get_pageSize(), sortColumn, sortOrder, onLoadSuccess);
    }
    function onLoadSuccess(result)
    {
        if (result != null && result.Total != null)
        {
            $('#spn').css("display", "none");_pager.set_recordCount(result.Total);
            //$get('<= Pager1.ClientID %>').childNodes[0].innerHTML = "<img src='../images/dn.gif'>";
            _gridView.set_dataSource(result.Rows);_gridView.dataBind();                 
        }
        else{$('#spn').css("display", "block");}
        jQuery.unblockUI();
    }
    function loadAllFirstWins(racingInfoID)
    {
        setBlock();RacingService.getAllFirstWins(racingInfoID, onFirstWinsSuccess);
    }
    function onFirstWinsSuccess(res)
    {
        if (res != null && res.Total != null){$('#SpnFirstWin').css("display", "none");_gv_RacingFirstWin.set_dataSource(res.Rows);rowFirstWin = res.Total;_gv_RacingFirstWin.dataBind();getSumOfFormsByRacingInfoID(temp);}
        else{$('#SpnFirstWin').css("display", "block");_gv_RacingFirstWin.set_dataSource(null);_gv_RacingFirstWin.dataBind();}
        jQuery.unblockUI();
    }
    function loadAllSecondWins(racingInfoID)
    {
        setBlock();RacingService.getAllSecondWins(racingInfoID, onSecondWinsSuccess);
    }
    function onSecondWinsSuccess(res)
    {
        if (res != null && res.Total != null)
        {
            $('#SpnSecondWin').css("display", "none");_gv_RacingSecondWin.set_dataSource(res.Rows);rowSecondWin = res.Total;_gv_RacingSecondWin.dataBind();getSumOfFormsByRacingInfoID(temp);
        }
        else{$('#SpnSecondWin').css("display", "block");_gv_RacingSecondWin.set_dataSource(null);_gv_RacingSecondWin.dataBind();}
        jQuery.unblockUI();
    }
    function getSumOfFormsByRacingInfoID(racingInfoID)
    {
        RacingService.GetSumFormsAmountByRacingInfoID(racingInfoID, onGetSumOfForms);
    }
    function onGetSumOfForms(sum)
    {
        if (isNaN(sum)) sum = "0";
        $("span[id$=lbl_Sum]").html("مبلغ کل فرمهای مسابقه: " + "<span style='color:Lime'>" + addCommas(sum) + " ریال </span>");
        var rewardForFirstWin  = roundNumber(parseFloat(sum) * 0.50, 0);
        var rewardForSecondWin = roundNumber(parseFloat(sum) * 0.30, 0);
        var rewardForGovernment= roundNumber(parseFloat(sum) * 0.05, 0);//دولت
        var rewardForcharitable= roundNumber(parseFloat(sum) * 0.05, 0);//موسسه خیریه
        var rewardForSite      = roundNumber(parseFloat(sum) * 0.10, 0);// سایت

        var perFirstWin = roundNumber(parseFloat(rewardForFirstWin / parseInt(rowFirstWin)),0);
        var perSecondWin = roundNumber(parseFloat(rewardForSecondWin / parseInt(rowSecondWin)), 0);
        if(isNaN(rewardForFirstWin)) rewardForFirstWin = "0";
        if(isNaN(rewardForSecondWin)) rewardForSecondWin = "0";
        if (isNaN(perFirstWin)) perFirstWin = "0";
        if(isNaN(perSecondWin)) perSecondWin = "0";
        $("span[id$=lbl_rewardForFirstWin]").html("جایزه نفرات اول: " + "<h4 style='color:Lime'>" + addCommas(rewardForFirstWin) + " ریال </h4>");
        $("span[id$=lbl_rewardForSecondWin]").html("جایزه نفرات دوم: " + "<h4 style='color:Lime'>" + addCommas(rewardForSecondWin) + " ریال </h4>");
        $("span[id$=lbl_perFirstWin]").html("جایزه هر نفر اول: " + "<h4 style='color:Lime'>" + addCommas(perFirstWin) + " ریال </h4>");
        $("span[id$=lbl_perSecondWin]").html("جایزه هر نفر دوم: " + "<h4 style='color:Lime'>" + addCommas(perSecondWin) + " ریال </h4>");
        $("span[id$=lbl_rewardForGovernment]").html("سهم دولت : " + "<h4 style='color:Lime'>" + addCommas(rewardForGovernment) + " ریال </h4>" );
        $("span[id$=lbl_rewardForCharitable]").html("سهم خیریه: " + "<h4 style='color:Lime'>" + addCommas(rewardForcharitable) + " ریال </h4>");
        $("span[id$=lbl_rewardForSite]").html("سهم سایت: " + "<h4 style='color:Lime'>" + addCommas(rewardForSite) + " ریال </h4>");
        
    }
    function onSortCommand(sender, e)
    {
        setBlock();_gridView.set_sortColumn(e.get_sortColumn());_gridView.set_sortOrder(e.get_sortOrder());
        _pager.set_pageIndex(0);loadAllRacingWithInfo();
    }
    function onSortCommand2(sender, e)
    {
        setBlock();_gv_RacingForm.set_sortColumn(e.get_sortColumn());_gv_RacingForm.set_sortOrder(e.get_sortOrder());
        //_gv_RacingForm.set_sortColumn(e.get_sortColumn() + " " + e.get_sortOrder());
        p.set_pageIndex(0);loadRacingFormsByRacingInfoIDCustom();
    }
    function pageChanged(sender, e)
    {
        setBlock();_pager.set_pageIndex(e.get_newPageIndex());loadAllRacingWithInfo();
    }
    function pageChanged2(sender, e)
    {
        setBlock();p.set_pageIndex(e.get_newPageIndex());loadRacingFormsByRacingInfoIDCustom();
    }
    function setText(element, text)
    {
        if (typeof element.innerText != 'undefined'){element.innerText = text;}
        else if (typeof element.textContent != 'undefined'){element.textContent = text;}
    }
    function onRowDataBound(sender, e)
    {
        var row = e.get_row();
        if (row.get_isDataRowType())
        {
            var racing = row.get_dataItem();var spnRacingInfo = row.findControl('spnRacingInfo');setText(spnRacingInfo, racing.RacingInfoID);  
        }
    }
//    function isRacingUltimate(racingInfoID)
//    {
//        RacingService.IsRacingUltimate(racingInfoID, isUltimateSuccess, isUltimateFailed);
//    }
//    function isUltimateSuccess(res)
//    {
//        isUltimate = res;        
//    }
//    function isUltimateFailed(res)
//    {        
//        alert("خطای " + res);
//    }
//    function hideResult()
//    {
//        _gv_RacingFirstWin.set_dataSource(null);
//        _gv_RacingSecondWin.set_dataSource(null);
//        $("span[id$=lbl_rewardForFirstWin]").html("هیچ");
//        $("span[id$=lbl_Sum]").html("هیچ");
//        $("span[id$=lbl_perFirstWin]").html("هیچ");
//        $("span[id$=lbl_rewardForSecondWin]").html("هیچ");
//        $("span[id$=lbl_perSecondWin]").html("هیچ");
//        $("span[id$=lbl_rewardForGovernment]").html("هیچ");
//        $("span[id$=lbl_rewardForCharitable]").html("هیچ");
//        $("span[id$=lbl_rewardForSite]").html("هیچ");                        
//    }
    function onRowCommand(sender, e)
    {
        if (e.get_commandName() == 'ShowInfo')
        {
            var row = e.get_row();
            if (row.get_isDataRowType())
            {
                var racing = row.get_dataItem();
                var spnRacingInfo = row.findControl('spnRacingInfo');
                if (typeof spnRacingInfo.innerText != 'undefined') { temp = spnRacingInfo.innerText }
                else if (typeof spnRacingInfo.textContent != 'undefined') { temp = spnRacingInfo.textContent; }
                //temp = spnRacingInfo.innerText;//alert(temp);//loadRacingFormsByRacingInfoID();                 
                loadRacingFormsByRacingInfoIDCustom();
                jQuery('#dialog-form').dialog('open');                
            }
        }
        else
            if (e.get_commandName() == 'ShowWin')
            {
                var row = e.get_row();
                if (row.get_isDataRowType())
                {
                    var racing = row.get_dataItem();var spnRacingInfo = row.findControl('spnRacingInfo');
                    if (typeof spnRacingInfo.innerText != 'undefined') { temp = spnRacingInfo.innerText }
                    else if (typeof spnRacingInfo.textContent != 'undefined') { temp = spnRacingInfo.textContent; }
                    //isRacingUltimate(temp);
                    //if (isUltimate)
                    //{
                        isUltimate = false;
                        $("span[id$=lb_RacingTitle]").html("برندگان مسابقه : " + "<span style='color:Aqua'>" + temp + "</span>");
                        loadAllFirstWins(temp); loadAllSecondWins(temp); getSumOfFormsByRacingInfoID(temp); jQuery('#dialog-form2').dialog('open');                       
//                    }
//                    else
//                    {
//                        hideResult();
//                        jQuery('#dialog-form2').dialog('open');
//                    }                    
                }
            }
        }
//    function onRowMouseOver(sender, e)
//    {
//        var row = e.get_row();
//        if (row.get_isDataRowType())
//        {
//            var tr = row.get_container();
//            tr.style.backgroundColor = "Black";
//            tr.style.color = "#ffcc00";
//            tr.style.border = "solid 1px #5D5852";
//        }
//    }
//    function onRowMouseOut(sender, e)
//    {
//        var row = e.get_row();
//        if (row.get_isDataRowType())
//        {
//            var tr = row.get_container();
//            tr.style.backgroundColor = "#F7F6F3";
//            tr.style.border = "none 1px white";
//            tr.style.color = "#ffffff";
//        }
//    }
//        function grdRowDataBound(sender, e)
//        {

//            var row = e.get_row();
//            if (row.get_isDataRowType())
//            {
//                _TotalAmount += row._dataItem.ExtendedPrice;
//                _TotalRetAmount += row._dataItem.GrossPrice;
//                _TotalUnitPrice += row._dataItem.UnitPrice;
//                _TotalWeight += row._dataItem.Weight;
//            }
//            //for footer row
//            if (row._rowType == 2)
//            {
//                row._container.children[5].innerHTML = "Totals:";
//                row._container.children[10].innerHTML = "lb " + _TotalWeight;
//                row._container.children[9].innerHTML = "$" + _TotalAmount;
//                row._container.childrenMusic.innerHTML = "$" + _TotalRetAmount;
//                row._container.children[7].innerHTML = "$" + _TotalUnitPrice;
//            }
//        }
</script>