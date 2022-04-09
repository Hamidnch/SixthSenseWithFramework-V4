<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserArchiveForms.ascx.cs" Inherits="UserPanel_UserArchiveForms" %>
<asp:ScriptManager ID="ScriptManager1" runat="server"><Services><asp:ServiceReference Path="~/UserPanelService.asmx" /></Services></asp:ScriptManager>
<h1 style="font-family:Tahoma;color:White; text-align:center">آرشیو فرمهای قدیمی شما</h1>
<table style="direction: rtl; width: 100%; line-height: 35px;">
    <tr>
        <td>
            <div id="Div1" class="grid_ADC">
                <AjaxData:GridView ID="_gv_UserForms" runat="server" CellSpacing="0" CellPadding="2"
                    SortOrderAscendingImageUrl="~/Images/up.gif" Width="100%" SortOrderDescendingImageUrl="~/Images/dn.gif"
                    SortCommandEvent="onSortCommand" RowMouseOverEvent="onRowMouseOver" RowMouseOutEvent="onRowMouseOut"
                    RowDataBoundEvent="onRowDataBound" RowCommandEvent="onRowCommand">
                    <HeaderStyle BackColor="#404040" Font-Bold="True" Height="30px" BorderColor="#5d5852" BorderStyle="Solid" BorderWidth="1" HorizontalAlign="Center" VerticalAlign="Middle"/>
                    <RowStyle ForeColor="#ffffff" Height="40px"/>
                    <Columns>
                        <AjaxData:GridViewBoundColumn HeaderText="ردیف" DataField="RowIndex" HeaderStyle-Wrap="false" ItemStyle-Width="5%">
                        </AjaxData:GridViewBoundColumn>
                        <AjaxData:GridViewBoundColumn HeaderText="کد مسابقه" DataField="RacingInfo_ID" SortField="RacingInfo_ID" HeaderStyle-Wrap="false" ItemStyle-Width="15%"></AjaxData:GridViewBoundColumn>
                        <AjaxData:GridViewBoundColumn HeaderText="شماره فرم" DataField="Form_ID" ItemStyle-Width="15%" SortField="Form_ID" HeaderStyle-Wrap="false" AllowDragAndDrop="true"></AjaxData:GridViewBoundColumn>
                        <AjaxData:GridViewBoundColumn HeaderText="عنوان مسابقه" DataField="Race_Title" SortField="Race_Title" ItemStyle-Width="20%" HeaderStyle-Wrap="false" ItemStyle-ForeColor="#ffcc00"></AjaxData:GridViewBoundColumn>
                        <AjaxData:GridViewBoundColumn HeaderText="تاریخ ایجاد فرم" DataField="Form_CreationDate" ItemStyle-Width="15%" SortField="Form_CreationDate" HeaderStyle-Wrap="false"></AjaxData:GridViewBoundColumn>
                        <AjaxData:GridViewBoundColumn HeaderText="تاریخ آخرین ویرایش" DataField="Form_LastUpdate" ItemStyle-Width="15%" SortField="Form_LastUpdate" HeaderStyle-Wrap="false" ItemStyle-ForeColor="Yellow"></AjaxData:GridViewBoundColumn>
                        <AjaxData:GridViewBoundColumn HeaderText="پایان مهلت" DataField="RacingInfo_EndRespiteDate" ItemStyle-Width="15%" SortField="RacingInfo_EndRespiteDate" HeaderStyle-Wrap="false"></AjaxData:GridViewBoundColumn>
                     </Columns>
                </AjaxData:GridView>
                <span id="spn" style="display:none">موردی یافت نشد.</span>  
            </div>            
        </td> 
    </tr>
    <tr>
        <td>
            <div class="grid_ADC">
                <AjaxData:Pager ID="_pager_UserForms" runat="server" PageSize="10" HideOnSinglePage="false" PageIndex="0"
                    PageChangedEvent="pageChanged" CssClass="pager"> 
                </AjaxData:Pager>
            </div>
        </td>
    </tr>
</table>
<script language="javascript" type="text/javascript">
    function getImagePath() { return '<%= ImagePath %>'; } var imagePath = getImagePath();
    function setBlock()
    {
        $.blockUI({ message: '<h4 style="font-family:tahoma;color:lime"><img src="' + imagePath + '/ajaxImages/loading_User.gif" /><br /><br /></h4>',
            fadeIn: 1000, fadeOut: 1000,
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
        $.unblockUI();
    });

    function getUserID()
    {
        return '<%= ActiveUserID %>';
    }
    var activeUserID = getUserID();
    var _gv_UserForms;
    var _pager_UserForms;

    function pageLoad(sender, e)
    {
        setBlock();
        _gv_UserForms = $find('<%=_gv_UserForms.ClientID %>');
        _pager_UserForms = $find('<%=_pager_UserForms.ClientID %>');
        _gv_UserForms.set_sortOrder(AjaxDataControls.GridViewSortOrder.Descending);
        loadActiveUserFormsByUserID();
    }
    function loadActiveUserFormsByUserID()
    {
        //setBlock();
        var sortColumn = _gv_UserForms.get_sortColumn();
        if (sortColumn == null || sortColumn == "")
        {
            sortColumn = "Form_LastUpdate";
        }
        var sortOrder = (_gv_UserForms.get_sortOrder() == AjaxDataControls.GridViewSortOrder.Descending) ? 'DESC' : 'ASC';
        var startIndex = (_pager_UserForms.get_pageIndex() * _pager_UserForms.get_pageSize());
        UserPanelService.getUserForms(activeUserID, 0, startIndex, _pager_UserForms.get_pageSize(), sortColumn, sortOrder, onActiveUserFormsSuccess);
    }
    function onActiveUserFormsSuccess(res)
    {
        if (res != null && res.Total != null)
        {
            $('#spn').css("display", "none");
            _pager_UserForms.set_recordCount(res.Total);
            _gv_UserForms.set_dataSource(res.Rows);
            _gv_UserForms.dataBind();
        }
        else
        {
            $('#spn').css("display", "block");
        }
        $.unblockUI();
    }
    function onSortCommand(sender, e)
    {
        setBlock();
        _gv_UserForms.set_sortColumn(e.get_sortColumn())
        _gv_UserForms.set_sortOrder(e.get_sortOrder());
        _pager_UserForms.set_pageIndex(0); // need to reset the page index as sorting is changed
        loadActiveUserFormsByUserID();
    }
    function pageChanged(sender, e)
    {
        setBlock();
        _pager_UserForms.set_pageIndex(e.get_newPageIndex());
        loadActiveUserFormsByUserID();
    }
    function setColorToHeader(myGridView, headerText, tr, color)
    {
        var ColumnName = myGridView.getColumnIndexByHeaderText(headerText);
        var ColumnText = tr.childNodes[ColumnName].childNodes[0];
        ColumnText.style.color = color;
    }
    function onRowDataBound(sender, e)
    {
        var row = e.get_row();
        //var rowIndex = row.get_rowIndex();
        if (row.get_rowType() == AjaxDataControls.GridViewRowType.Header)
        {
            var row = e.get_row();
            var tr = row.get_container();
            var columnColor = "Lime";
            setColorToHeader(_gv_UserForms, 'کد مسابقه', tr, columnColor);
            setColorToHeader(_gv_UserForms, 'شماره فرم', tr, columnColor);
            setColorToHeader(_gv_UserForms, 'عنوان مسابقه', tr, columnColor);
//            setColorToHeader(_gv_UserForms, 'جزئیات فرم', tr, columnColor);
            setColorToHeader(_gv_UserForms, 'تاریخ ایجاد فرم', tr, columnColor);
            setColorToHeader(_gv_UserForms, 'تاریخ آخرین ویرایش', tr, columnColor);
            setColorToHeader(_gv_UserForms, 'پایان مهلت', tr, columnColor);
            //setColorToHeader(_gv_UserForms, 'ویرایش فرم', tr, columnColor);
        }
    }
    function onRowMouseOver(sender, e)
    {
        var row = e.get_row();
        if (row.get_isDataRowType())
        {
            var tr = row.get_container();
            tr.style.backgroundColor = "#3F3C38";
            tr.style.color = "White";
            tr.style.border = "solid 1 #5D5852";
            //            var myColumnIndex = _gv_UserForms.getColumnIndexByHeaderText('ویرایش فرم');
            //            var myColumn = row.get_container().childNodes[myColumnIndex].childNodes[0];
            //            myColumn.style.color = "#F9B1F0";
        }
    }
    function onRowMouseOut(sender, e)
    {
        var row = e.get_row();
        if (row.get_isDataRowType())
        {
            var tr = row.get_container();
            tr.style.backgroundColor = "#333333";
            tr.style.border = "none 1 white";
            tr.style.color = "#ffffff";
            //            var myColumnIndex = _gv_UserForms.getColumnIndexByHeaderText('ویرایش فرم');
            //            var myColumn = row.get_container().childNodes[myColumnIndex].childNodes[0];
            //            myColumn.style.color = "Aqua";
        }
    }

    function onRowCommand(sender, e)
    {
        if (e.get_commandName() == 'EditForm')
        {
            var row = e.get_row();
            if (row.get_isDataRowType())
            {
//                setBlock();
//                var _userForms = row.get_dataItem();
//                var formID = _userForms.Form_ID;
//                $.unblockUI();
//                location.href = "UserSportRacingEditForm.aspx?formID=" + formID;
            }
        }
    }
</script>