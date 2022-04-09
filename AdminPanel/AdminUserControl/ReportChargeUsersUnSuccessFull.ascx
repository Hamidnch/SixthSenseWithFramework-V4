<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ReportChargeUsersUnSuccessFull.ascx.cs" Inherits="AdminPanel_AdminUserControl_ReportChargeUsersUnSuccessFull" %>
<%@ Register Assembly="PersianDatePickup" Namespace="PersianDatePickup" TagPrefix="pcal" %>
<link href="../AdminStyls/CSSGrid.css" rel="stylesheet" type="text/css" />
<link href="../../Styles/CSSUserPayment.css" rel="stylesheet" type="text/css" />
<script src="../../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
<script src="../../Scripts/jquery-blockUI.js" type="text/javascript"></script>
<asp:ScriptManager ID="ScriptManager1" runat="server">
    <Services><asp:ServiceReference Path="~/PaymentReadyService.asmx" /></Services>
</asp:ScriptManager>
<fieldset>
    <legend style="color: #ffcc00;">گزارش شارژهای ناموفق کاربران</legend>
    <table style="direction: rtl; width: 100%; line-height: 35px;">
        <tr>
            <td>
                <div id="Div1" style="color: #FFFFFF; border: thin solid #5D5852; font-family: Tahoma;
                    font-size: 12px; background-color: #333333; margin: 5px 5px; outline: 0; -moz-border-radius: 2px;
                    direction: rtl; -webkit-border-radius: 2px">
                    <AjaxData:GridView ID="_gv_UserPayment" runat="server" CellSpacing="0" CellPadding="2"
                        SortOrderAscendingImageUrl="~/Images/up.gif" Width="100%" SortOrderDescendingImageUrl="~/Images/dn.gif"
                        SortCommandEvent="onSortCommand" RowMouseOverEvent="onRowMouseOver" RowMouseOutEvent="onRowMouseOut"
                        RowDataBoundEvent="onRowDataBound" RowCommandEvent="onRowCommand">
                        <Columns>
                            <AjaxData:GridViewBoundColumn HeaderText="ردیف" DataField="RowIndex" HeaderStyle-HorizontalAlign="Center"
                                ItemStyle-HorizontalAlign="Center" HeaderStyle-Wrap="false">
                            </AjaxData:GridViewBoundColumn>
                            <AjaxData:GridViewBoundColumn HeaderText="تاریخ درخواست" DataField="Payment_SettleDate"
                                ControlStyle-Width="15%" SortField="Payment_SettleDate" HeaderStyle-HorizontalAlign="Center"
                                ItemStyle-HorizontalAlign="Center" HeaderStyle-Wrap="false" AllowDragAndDrop="true">
                            </AjaxData:GridViewBoundColumn>
                            <AjaxData:GridViewBoundColumn HeaderText="شناسه کاربری" DataField="Payment_UserID"
                                ControlStyle-Width="5%" SortField="Payment_UserID" HeaderStyle-HorizontalAlign="Center"
                                ItemStyle-HorizontalAlign="Center" HeaderStyle-Wrap="false" AllowDragAndDrop="true">
                            </AjaxData:GridViewBoundColumn>
                            <AjaxData:GridViewBoundColumn HeaderText="نام کاربری" DataField="Payment_UserName"
                                ControlStyle-Width="15%" SortField="Payment_UserName" HeaderStyle-HorizontalAlign="Center"
                                ItemStyle-HorizontalAlign="Center" HeaderStyle-Wrap="false" AllowDragAndDrop="true">
                            </AjaxData:GridViewBoundColumn>
                            <AjaxData:GridViewBoundColumn HeaderText="مبلغ" DataField="Payment_Amount" SortField="Payment_Amount"
                                ControlStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                                HeaderStyle-Wrap="false" ItemStyle-ForeColor="#ffcc00">
                            </AjaxData:GridViewBoundColumn>
                            <AjaxData:GridViewBoundColumn HeaderText="نام بانک" DataField="BankName" SortField="BankName"
                                ControlStyle-Width="15%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                                HeaderStyle-Wrap="false">
                            </AjaxData:GridViewBoundColumn>
<%--                            <AjaxData:GridViewBoundColumn HeaderText="تاریخ پرداخت" DataField="Payment_VerificationDate"
                                ControlStyle-Width="15%" SortField="Payment_VerificationDate" HeaderStyle-HorizontalAlign="Center"
                                ItemStyle-HorizontalAlign="Center" HeaderStyle-Wrap="false">
                            </AjaxData:GridViewBoundColumn>--%>
<%--                            <AjaxData:GridViewBoundColumn HeaderText="کد پیگیری" DataField="Payment_ReservationNumber"
                                ControlStyle-Width="15%" SortField="Payment_ReservationNumber" HeaderStyle-HorizontalAlign="Center"
                                ItemStyle-HorizontalAlign="Center" HeaderStyle-Wrap="false" >
                            </AjaxData:GridViewBoundColumn>--%>
                            <AjaxData:GridViewBoundColumn HeaderText="رسید دیجیتالی" DataField="Payment_ReferenceNumber"
                                ControlStyle-Width="15%" SortField="Payment_ReferenceNumber" HeaderStyle-HorizontalAlign="Center"
                                ItemStyle-HorizontalAlign="Center" HeaderStyle-Wrap="false">
                            </AjaxData:GridViewBoundColumn>
                            <AjaxData:GridViewBoundColumn HeaderText="وضعیت پرداخت" DataField="Payment_TransactionState"
                                ControlStyle-Width="10%" SortField="Payment_TransactionState" HeaderStyle-HorizontalAlign="Center"
                                ItemStyle-HorizontalAlign="Center" HeaderStyle-Wrap="false" ItemStyle-ForeColor="Yellow">
                            </AjaxData:GridViewBoundColumn>
                            <AjaxData:GridViewButtonColumn ButtonType="Link" HeaderText="پیگیری" Text="پیگیری تراکنش"
                                CommandName="detectTransaction">
                            </AjaxData:GridViewButtonColumn>
                        </Columns>
                        <HeaderStyle BackColor="#404040" Font-Bold="True" Height="30px" BorderColor="#5d5852"
                            BorderStyle="Solid" BorderWidth="1" HorizontalAlign="Center" VerticalAlign="Middle"
                            Font-Underline="false" Font-Italic="true" />
                        <RowStyle ForeColor="#ffffff" Height="40px" />
                    </AjaxData:GridView>
                    <span id="spn" style="display:none">موردی یافت نشد.</span>  
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="color: #FFFFFF; border: thin solid #5d5852; font-family: Tahoma; text-align: center;
                    font-size: 12px; background-color: #333333; margin: 5px 5px; outline: 0; -moz-border-radius: 2px;
                    direction: rtl; -webkit-border-radius: 2px">
                    <AjaxData:Pager ID="_pager_UserPayment" runat="server" PageSize="10" HideOnSinglePage="false" Height="35px"
                        PageIndex="0" PageChangedEvent="pageChanged" CssClass="pager">
                    </AjaxData:Pager>
                </div>
            </td>
        </tr>
    </table>
<br />
<asp:Button runat="server" Text="برگشت به صفحه گزارشات" CssClass="submit" 
onclick="Unnamed1_Click" />
</fieldset>

<script language="javascript" type="text/javascript">
    function getImagePath() { return '<%= ImagePath %>'; } var imagePath = getImagePath();
    function setBlock()
    {
        $.blockUI({ message: '<h4 style="font-family:tahoma;color:lime"><img src="' + imagePath + '/ajaxImages/loading5.gif" /><br /><br /> لطفا چند لحظه صبر کنید</h4>',
            fadeIn: 1000, fadeOut: 1000,
            css: { border: 'none', padding: '5px', backgroundColor: 'transparent', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .6, color: '#000' }
        });
    }
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_beginRequest(function (){setBlock();});
    prm.add_endRequest(function (){$.unblockUI();});
    function getUserID(){return '<%= ActiveUserID %>';}
    var activeUserID = getUserID(); var _gv_UserPayment;  var _pager_UserPayment;
    function pageLoad(sender, e)
    {
        setBlock();
        _gv_UserPayment = $find('<%=_gv_UserPayment.ClientID %>');
        _pager_UserPayment = $find('<%=_pager_UserPayment.ClientID %>');
        loadUserPaymentUnsuccessFull();
    }
    function loadUserPaymentUnsuccessFull()
    {
        var sortColumn = _gv_UserPayment.get_sortColumn();
        if (sortColumn == null || sortColumn == "") { sortColumn = "Payment_SettleDate"; }
        var sortOrder = (_gv_UserPayment.get_sortOrder() == AjaxDataControls.GridViewSortOrder.Descending) ? 'ASC' : 'DESC';
        var startIndex = (_pager_UserPayment.get_pageIndex() * _pager_UserPayment.get_pageSize());
        PaymentReadyService.getUserPaymentUnSuccessFull(startIndex, _pager_UserPayment.get_pageSize(), sortColumn, sortOrder, onUserPaymentUnSuccess);
    }
    function onUserPaymentUnSuccess(res)
    {
        if (res != null && res.Total != null)
        {
            $('#spn').css("display", "none");
            _pager_UserPayment.set_recordCount(res.Total);
            _gv_UserPayment.set_dataSource(res.Rows);
            _gv_UserPayment.dataBind();
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
        _gv_UserPayment.set_sortColumn(e.get_sortColumn())
        _gv_UserPayment.set_sortOrder(e.get_sortOrder());
        _pager_UserPayment.set_pageIndex(0); // need to reset the page index as sorting is changed
        loadUserPaymentUnsuccessFull();
    }
    function pageChanged(sender, e)
    {
        setBlock();
        _pager_UserPayment.set_pageIndex(e.get_newPageIndex());
        loadUserPaymentUnsuccessFull();
    }
    function setText(element, text)
    {
        if (typeof element.innerText != 'undefined') { element.innerText = text; }
        else if (typeof element.textContent != 'undefined') { element.textContent = text; }
    }
    function onRowDataBound(sender, e)
    {
        var row = e.get_row();
        if (row.get_isDataRowType())
        {
            var rowItem = row.get_dataItem();
            var bank = rowItem.BankName;
            var myColumnIndex = _gv_UserPayment.getColumnIndexByHeaderText('پیگیری');
            var myColumn = row.get_container().childNodes[myColumnIndex].childNodes[0];
            myColumn.style.color = "Aqua";
            if (bank != "ملی" && bank != "صادرات")
            {
                myColumn.style.display = "none";
            }
        }
        else
            if (row.get_rowType() == AjaxDataControls.GridViewRowType.Header)
            {
                var tr = row.get_container();
                var ColumnIndex1 = _gv_UserPayment.getColumnIndexByHeaderText('مبلغ');
                var Column1 = tr.childNodes[ColumnIndex1].childNodes[0];
                Column1.style.color = "Lime";
                Column1.style.textDecoration = "none";
                var ColumnIndex2 = _gv_UserPayment.getColumnIndexByHeaderText('نام بانک');
                var Column2 = tr.childNodes[ColumnIndex2].childNodes[0];
                Column2.style.color = "Lime";
                Column2.style.textDecoration = "none";
//                var ColumnIndex3 = _gv_UserPayment.getColumnIndexByHeaderText('تاریخ پرداخت');
//                var Column3 = tr.childNodes[ColumnIndex3].childNodes[0];
//                Column3.style.color = "Lime";
//                Column3.style.textDecoration = "none";
                var ColumnIndex4 = _gv_UserPayment.getColumnIndexByHeaderText('نام کاربری');
                var Column4 = tr.childNodes[ColumnIndex4].childNodes[0];
                Column4.style.color = "Lime";
                Column4.style.textDecoration = "none";
                var ColumnIndex5 = _gv_UserPayment.getColumnIndexByHeaderText('رسید دیجیتالی');
                var Column5 = tr.childNodes[ColumnIndex5].childNodes[0];
                Column5.style.color = "Lime";
                Column5.style.textDecoration = "none";
                var ColumnIndex6 = _gv_UserPayment.getColumnIndexByHeaderText('وضعیت پرداخت');
                var Column6 = tr.childNodes[ColumnIndex6].childNodes[0];
                Column6.style.color = "Lime";
                Column6.style.textDecoration = "none";
                var ColumnIndex7 = _gv_UserPayment.getColumnIndexByHeaderText('تاریخ درخواست');
                var Column7 = tr.childNodes[ColumnIndex7].childNodes[0];
                Column7.style.color = "Lime";
                Column7.style.textDecoration = "none";
            }
    }
    function onRowCommand(sender, e)
    {
        if (e.get_commandName() == 'detectTransaction')
        {
            var row = e.get_row();
            if (row.get_isDataRowType())
            {
                setBlock();
                var _userPayment = row.get_dataItem();
                var resNumber = _userPayment.Payment_ReservationNumber;
                //                alert(resNumber);
                var rowItem = row.get_dataItem();
                var userID = rowItem.Payment_UserID;
                var bank = rowItem.BankName;
                if (bank == "ملی")
                {
                    PaymentReadyService.DetectTransactionForMelli(resNumber, userID, onDetectTransactionSuccess);
                }
                else
                    if (bank == "صادرات")
                    {
                        PaymentReadyService.DetectTransactionForSaderat(resNumber, userID, onDetectTransactionSuccess);
                    }
            }
        }
    }
    function onDetectTransactionSuccess(result)
    {
        loadUserPaymentUnsuccessFull();
        $.unblockUI(); 
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
            var myColumnIndex = _gv_UserPayment.getColumnIndexByHeaderText('پیگیری');
            var myColumn = row.get_container().childNodes[myColumnIndex].childNodes[0];
            myColumn.style.color = "#F9B1F0";
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
            var myColumnIndex = _gv_UserPayment.getColumnIndexByHeaderText('پیگیری');
            var myColumn = row.get_container().childNodes[myColumnIndex].childNodes[0];
            myColumn.style.color = "Aqua";
        }
    }
</script>
