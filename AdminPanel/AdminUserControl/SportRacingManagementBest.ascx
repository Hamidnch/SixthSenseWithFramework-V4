<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportRacingManagementBest.ascx.cs" Inherits="AdminPanel_AdminUserControl_SportRacingManagementBest" %>
<link href="AdminStyls/Modal/dark-hive/jquery-ui-1.8.5.custom.css" rel="stylesheet" type="text/css" />
<script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
<script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
<script src="../Scripts/jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">
    function getImagePath() { return '<%= ImagePath %>'; } var imagePath = getImagePath();

    function setBlock()
    {
        jQuery.blockUI({ message: '<h4 style="font-family:tahoma;color:lime"><img src="' + imagePath + '/ajaxImages/loading_User.gif" /><br /><br /></h4>',
            fadeIn: 1000, fadeOut: 1000, centerX: true, centerY: true,
            css: { border: 'none', padding: '5px', backgroundColor: 'transparent', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .6, color: '#000' }
        });
    }
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_beginRequest(function ()
    {
        setBlock();
    });
    prm.add_endRequest(function ()
    {
        jQuery.unblockUI();
    });

    jQuery.noConflict();
    jQuery(document).ready(function ()
    {
        jQuery("#dialog:ui-dialog").dialog("destroy");
        jQuery("#Dialog-Result").dialog({
            autoOpen: false, resizable: false, height: 'auto', width: 830, direction: 'rtl',
            show: 'clip', hide: 'clip', stack: true, position: 'center', title: 'ورود نتایج', modal: true
        }); jQuery('.submit').click(function () { jQuery("#Dialog-Result").dialog("close"); });
    });
</script>
<asp:ScriptManager ID="ScriptManager1" runat="server">
    <Services><asp:ServiceReference Path="~/RacingService.asmx" /></Services>
    <Scripts>
        <asp:ScriptReference Path="~/Scripts/PreviewScripts/PreviewScript.js" />
        <asp:ScriptReference Path="~/Scripts/PreviewScripts/PreviewDragDrop.js" />
        <asp:ScriptReference Path="~/Scripts/PreviewScripts/PreviewGlitz.js" />
    </Scripts>
</asp:ScriptManager>
<table>
    <tr>
        <td style="text-align: left; border-color: #333333; border-style: solid; border-width: 1px">
            <div id="DivRacinfWithInfo" style="color: #FFFFFF; border: thin solid #5d5852; font-family: Tahoma;
                font-size: 12px; background-color: #333333; margin: 5px 5px; outline: 0; -moz-border-radius: 2px;
                direction: rtl; -webkit-border-radius: 2px">
                <AjaxData:GridView ID="gv_RacingManagement" runat="server" CellSpacing="0" CellPadding="3"
                    SortOrderAscendingImageUrl="~/Images/up.gif" 
                    SortOrderDescendingImageUrl="~/Images/dn.gif" SortCommandEvent="onSortCommand"
                    RowCommandEvent="onRowCommand" CssClass="GridView1">
                    <HeaderStyle Font-Bold="True" ForeColor="Aqua" VerticalAlign="Middle" HorizontalAlign="Center" BackColor="#1b1b1b" BorderColor="#404040" Height="30px" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="50px"/>
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
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
                            SortField="RacingDetails" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                            HeaderStyle-Wrap="false">
                        </AjaxData:GridViewBoundColumn>
                        <AjaxData:GridViewBoundColumn HeaderText="نام کشور" DataField="Country" SortField="Country" AllowDragAndDrop="true"
                            HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-Wrap="false">
                        </AjaxData:GridViewBoundColumn>
                        <AjaxData:GridViewBoundColumn HeaderText="تاریخ آخرین ویرایش" DataField="RacingLastUpdateDate" AllowDragAndDrop="true"
                            SortField="RacingLastUpdateDate" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                            HeaderStyle-Wrap="false">
                        </AjaxData:GridViewBoundColumn>
                        <AjaxData:GridViewButtonColumn CommandName="Dialog-Edit" HeaderText="ویرایش" DataTextField="RacingInfoID"
                            HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" ImageUrl="../Images/ajaxImages/win.png"
                            ButtonType="Image">
                        </AjaxData:GridViewButtonColumn>
                        <AjaxData:GridViewButtonColumn CommandName="ShowDialog_Result" HeaderText="ورود نتایج" DataTextField="RacingInfoID"
                            HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" ImageUrl="../Images/ajaxImages/game.png" ButtonType="Image">
                        </AjaxData:GridViewButtonColumn>
                    </Columns>
                </AjaxData:GridView>
                <span id="spn" style="display:none">موردی یافت نشد.</span> 
            </div>
        </td>
    </tr>
    <tr>
        <td style="text-align: center; font-size:12px; border-color:#222222;border-style:none;border-width:1px">
            <AjaxData:Pager ID="Pager1" runat="server" PageSize="5" HideOnSinglePage="true" PageChangedEvent="pageChanged" CssClass="pager">
            </AjaxData:Pager>
        </td>
    </tr>
</table>

<div id="divRacingManagement" aria-labelledby="ui-dialog-title-dialog-form" role="dialog"
    tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
    style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: auto;
    width: 800px; top: 82px; left: 460px;">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
        <span id="ui-dialog-title-dialog-form" class="ui-dialog-title">ویرایش</span><a role="button"
            class="ui-dialog-titlebar-close ui-corner-all" href="#"><span class="ui-icon ui-icon-closethick">بستن</span></a></div>
    <div style="width: auto; min-height: 0px; height: auto" class="ui-dialog-content ui-widget-content"
        id="Dialog-Result">
        <form id="frm_RacingResult">
        <fieldset>
          
        </fieldset>
        </form>
    </div>
    <div class="ui-resizable-handle ui-resizable-n"></div><div class="ui-resizable-handle ui-resizable-e"></div><div class="ui-resizable-handle ui-resizable-s"></div><div class="ui-resizable-handle ui-resizable-w"></div><div style="z-index: 1001;" class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se"></div><div style="z-index: 1002;" class="ui-resizable-handle ui-resizable-sw"></div><div style="z-index: 1003;" class="ui-resizable-handle ui-resizable-ne"></div><div style="z-index: 1004;" class="ui-resizable-handle ui-resizable-nw"></div><div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix"></div>
</div>
<script type="text/javascript">
    var _gridView;
    var _pager;
    function pageLoad(sender, e)
    {
        _gridView = $find('<%= gv_RacingManagement.ClientID %>');
        _pager = $find('<%= Pager1.ClientID %>');

        loadAllRacingWithInfo();
    }
    function loadAllRacingWithInfo()
    {
        setBlock();
        var sortColumn = _gridView.get_sortColumn();
        var sortOrder = (_gridView.get_sortOrder() == AjaxDataControls.GridViewSortOrder.Descending) ? 'DESC' : 'ASC';
        var startIndex = (_pager.get_pageIndex() * _pager.get_pageSize());
        RacingService.GetRacingInfoList(startIndex, _pager.get_pageSize(), sortColumn, sortOrder, onLoadSuccess);
    }
    function onLoadSuccess(result)
    {
        if (result != null && result.Total != null)
        {
            $('#spn').css("display", "none");
            _pager.set_recordCount(result.Total);
            _gridView.set_dataSource(result.Rows);
            _gridView.dataBind();
        }
        else
        {
            $('#spn').css("display", "block");
        }
        jQuery.unblockUI();
    }
    function onSortCommand(sender, e)
    {
        setBlock();
        _gridView.set_sortColumn(e.get_sortColumn())
        _gridView.set_sortOrder(e.get_sortOrder());
        _pager.set_pageIndex(0);
        loadAllRacingWithInfo();
    }
    function pageChanged(sender, e)
    {
        setBlock();
        _pager.set_pageIndex(e.get_newPageIndex());
        loadAllRacingWithInfo();
    }
    function onRowCommand(sender, e)
    {
        if (e.get_commandName() == 'ShowDialog_Result')
        {
            var row = e.get_row();
            if (row.get_isDataRowType())
            {
//                var racing = row.get_dataItem();
//                var spnRacingInfo = row.findControl('spnRacingInfo');
//                if (typeof spnRacingInfo.innerText != 'undefined') { temp = spnRacingInfo.innerText }
//                else if (typeof spnRacingInfo.textContent != 'undefined') { temp = spnRacingInfo.textContent; }

                jQuery('#Dialog-Result').dialog('open');
            }
        }
    }
</script>