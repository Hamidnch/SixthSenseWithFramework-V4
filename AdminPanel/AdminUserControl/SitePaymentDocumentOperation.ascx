<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SitePaymentDocumentOperation.ascx.cs" Inherits="AdminPanel_AdminUserControl_SitePaymentDocumentOperation" %>
<%@ Register Assembly="PersianDatePickup" Namespace="PersianDatePickup" TagPrefix="pcal" %>
<link href="../AdminStyls/CSSGrid.css" rel="stylesheet" type="text/css" />
<link href="../AdminStyls/Modal/smoothness/jquery-ui-1.8.5.custom.css" rel="stylesheet" type="text/css" />

<asp:ScriptManager ID="ScriptManager2" runat="server" EnablePartialRendering="true">
</asp:ScriptManager>
<fieldset>
    <legend style="color: #ffcc00;">لیست اسناد پرداخت - صندوق سایت</legend>
    <fieldset>
        <div style="float: right">
            <span>از تاریخ: </span>
            <pcal:PersianDatePickup ID="pdp_StartDate" runat="server" CssClass="txtPickup"></pcal:PersianDatePickup>
        </div>
        <div style="float: right">
            <span>تا تاریخ: </span>
            <pcal:PersianDatePickup ID="pdp_EndDate" runat="server" CssClass="txtPickup"></pcal:PersianDatePickup>
        </div>
        <div style="float: right;padding-top: 13px">
            <asp:Button ID="btn_Search" runat="server" Text="جستجو" CssClass="submit" OnClick="btn_Search_Click" />
            <asp:Button ID="btn_Refersh" runat="server" Text="تازه سازی" CssClass="submit" OnClick="btn_Refersh_Click" />
        </div>
        <div style="float:left;padding-top: 13px">
            <input type="button" value="جدید" id="btn_newPayment" class="submit" />
            <asp:Button ID="btn_Exit" runat="server" Text="برگشت" CssClass="submit" OnClick="btn_Exit_Click" />     
        </div> 
    </fieldset>
    <div style="clear: both"></div><br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <fieldset>
                <asp:GridView ID="gv_sitePaymentDocuments" runat="server" AutoGenerateColumns="False"
                    CssClass="GridViewStyle" HeaderStyle-CssClass="HeaderStyle"
                    HeaderStyle-HorizontalAlign="Center"  HeaderStyle-VerticalAlign="Middle" 
                    onpageindexchanging="gv_sitePaymentDocuments_PageIndexChanging" 
                    AllowPaging="True" onrowcommand="gv_sitePaymentDocuments_RowCommand" 
                    onrowdatabound="gv_sitePaymentDocuments_RowDataBound">
                    <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="RowStyle"/>
                    <PagerStyle CssClass="PagerStyle" />
                    <Columns>
                        <asp:TemplateField HeaderText="ردیف">
                            <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_RowNumber" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="تاریخ" SortExpression="HdrPaymentDoc_RegisterDate">
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_HdrPaymentDoc_RegisterDate" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("HdrPaymentDoc_RegisterDate","{0}"), "D", false) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="شرح کلی" SortExpression="comment">
                            <ItemStyle Width="30%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_comment" runat="server" Text='<%# Eval("comment", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="شماره سند" SortExpression="HdrPaymentDoc_ID">
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_HdrPaymentDoc_ID" runat="server" Text='<%# PersianClass.getPersianNumberStyle(Eval("HdrPaymentDoc_ID", "{0}")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="مبلغ" SortExpression="PaymentAmount">
                            <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_PaymentAmount" runat="server" Text='<%# PersianClass.getPersianNumberStyle(Eval("PaymentAmount", "{0:n0}")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="نمایش سند">
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:ImageButton ID="img_Show" runat="server" CommandArgument='<%# Eval("HdrPaymentDoc_ID", "{0}") %>'
                                    CommandName="Payment_Show" AlternateText="نمایش" ImageUrl="~/Images/ajaxImages/Show.png"></asp:ImageButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <asp:Label ID="Label3" runat="server" Text="هیچ موردی یافت نشد" Width="100%"></asp:Label>
                    </EmptyDataTemplate>
                </asp:GridView>
            </fieldset>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btn_Search" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btn_Refersh" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</fieldset>
<div id="divFinanceOperation" aria-labelledby="ui-dialog-title-dialog-form" role="dialog"
    tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
    style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: auto;
    width: 800px; top: 82px; left: 460px;">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
        <span id="ui-dialog-title-dialog-form" class="ui-dialog-title">ویرایش</span><a role="button"
            class="ui-dialog-titlebar-close ui-corner-all" href="#"><span class="ui-icon ui-icon-closethick">بستن</span></a></div>
    <div style="width: auto; min-height: 0px; height: auto" class="ui-dialog-content ui-widget-content"
        id="dialog-Payment">
        <fieldset>
            <table>
                <tr>
                    <td>شماره سند : <span id="DocumentID"></span></td>
                    <td>تاریخ ثبت : <span id="RegisterDate"></span></td>
                    <td>نام کاربر ثبت : <span id="UserName"></span></td>
                    <td>مانده فعلی صندوق : <span id="CurrentRemainAmountBox"></span></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <span style="float:right">شرح کلی سند: </span>
                        <div style="float:right">
                        <asp:TextBox ID="txt_Comment" CssClass="autoTable_txt" Width="550px" runat="server" ></asp:TextBox>                            
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <table id="table_Payments" cellpadding="6" cellspacing="4" class="autoTable">
                            <thead class="autoTable_Header">
                                <tr>
                                    <td>شماره</td>
                                    <td>تاریخ</td>
                                    <td>شرح</td>
                                    <td>شماره مدرک</td>
                                    <td>مبلغ</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><span id="rowNumber" class="rowNumber"></span></td>
                                    <td>
                                        <select id="txt_Day" style="width: 50px; height: 26px" name="txt" class="autoTable_txt"></select>                                        
                                        <select id="txt_Month" style="width: 50px; height: 26px" name="txt" class="autoTable_txt"></select>
                                        <select id="txt_Year" style="width: 80px; height: 26px" name="txt" class="autoTable_txt"></select>
                                        
                                    </td>
                                    <td><input value="" id="txt_Desc" name="txt" type="text" class="autoTable_txt" /></td>
                                    <td><input value="" name="txt" id="txt_DocNumber" type="text" class="autoTable_txt" /></td>
                                    <td><input value="0" name="txt" id="txt_Amount" type="text" class="autoTable_txt" onkeydown="javascript:return jsNumbers(event);" /></td>
                                    <td><input type="button" class="addRow autoTable_AddButton" value="جدید" /></td>
                                    <td><input type="button" value="حذف" class="delRow autoTable_DelButton" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <br />
                        <input type="button" value="ذخیره" class="submit" id="register" />
                        <input type="button" value="بازگشت" class="submit" onclick="$('#dialog-Payment').dialog('close');" />
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
    <div class="ui-resizable-handle ui-resizable-n"></div><div class="ui-resizable-handle ui-resizable-e"></div><div class="ui-resizable-handle ui-resizable-s"></div><div class="ui-resizable-handle ui-resizable-w"></div><div style="z-index: 1001;" class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se"></div><div style="z-index: 1002;" class="ui-resizable-handle ui-resizable-sw"></div><div style="z-index: 1003;" class="ui-resizable-handle ui-resizable-ne"></div><div style="z-index: 1004;" class="ui-resizable-handle ui-resizable-nw"></div><div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix"></div>
</div>
<div id="divShowPayment" aria-labelledby="ui-dialog-title-dialog-form" role="dialog"
            tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
            style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: auto;
            width: 800px; top: 82px; left: 460px;">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
        <span id="ui-dialog-title-dialog-form2" class="ui-dialog-title">نمایش سند</span><a role="button"
            class="ui-dialog-titlebar-close ui-corner-all" href="#"><span class="ui-icon ui-icon-closethick">بستن</span></a></div>
    <div style="width: auto; min-height: 0px; height: auto" class="ui-dialog-content ui-widget-content"
        id="dialog-showPayment">
        <fieldset>
            <asp:UpdatePanel runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <div id="gridDiv">
                        <legend style="color: #262626;">                    
                            <table>
                                <tr>
                                    <td>شماره سند : <span id="Span1" runat="server"><asp:Label id="lbl_PaymentDocID" runat="server"></asp:Label></span></td>
                                    <td>تاریخ ثبت : <span id="show_RegDate" runat="server"></span></td>
                                    <td>نام کاربر ثبت : <span id="show_AutorName" runat="server"></span></td>                                
                                </tr>
                                <tr>
                                    <td>شرح کلی : <span id="show_Comment" runat="server"></span></td>
                                </tr>
                                <tr>
                                    <td colspan="4"><br /></td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <asp:GridView ID="gv_ShowPayment" runat="server" AutoGenerateColumns="false"  CssClass="GridViewStyle" HeaderStyle-CssClass="HeaderStyle" PagerStyle-CssClass="PagerStyle">                        
                                        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="RowStyle"/>
                                        <Columns>                                    
                                        <asp:TemplateField HeaderText="ردیف" SortExpression="PaymentDoc_RowNumber">
                                            <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_PaymentDoc_RowNumber" runat="server" Text='<%# Eval("PaymentDoc_RowNumber", "{0}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="تاریخ" SortExpression="PaymentDoc_PaymentDate">
                                            <ItemStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_PaymentDoc_PaymentDate" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("PaymentDoc_PaymentDate","{0}"), "D", false) %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="مانده قبلی" SortExpression="PaymentDoc_BoxCurrentAmount">
                                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_PaymentDoc_BoxCurrentAmount" runat="server" Text='<%#  PersianClass.getPersianNumberStyle(Eval("PaymentDoc_BoxCurrentAmount", "{0:n0}")) %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField> 
                                        <asp:TemplateField HeaderText="شرح" SortExpression="PaymentDoc_Description">
                                            <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_PaymentDoc_Description" runat="server" Text='<%# Eval("PaymentDoc_Description", "{0}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="شماره مدرک" SortExpression="PaymentDoc_DocumentNumber">
                                            <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_PaymentDoc_DocumentNumber" runat="server" Text='<%# Eval("PaymentDoc_DocumentNumber", "{0}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="مبلغ سند" SortExpression="PaymentDoc_PaymentAmount">
                                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_PaymentDoc_PaymentAmount" runat="server" Text='<%#  PersianClass.getPersianNumberStyle(Eval("PaymentDoc_PaymentAmount", "{0:n0}")) %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>                                                                                                   
                                        </Columns>
                                        <EmptyDataTemplate>
                                            <asp:Label ID="Label3" runat="server" Text="هیچ موردی یافت نشد" Width="100%"></asp:Label>
                                        </EmptyDataTemplate>
                                    </asp:GridView>
                                    </td>
                                </tr>
                            </table>                       
                        </legend>
                    </div>
                    <input type="button" value="چاپ" id="btn_printPayment" class="submit" onclick="CallPrint('gridDiv', 'Black', 'White')"/>
                    <input type="button" value="بستن" class="submit" onclick="$('#dialog-showPayment').dialog('close');" />
                </ContentTemplate>
            </asp:UpdatePanel>           
        </fieldset>
    </div>
    <div class="ui-resizable-handle ui-resizable-n"></div><div class="ui-resizable-handle ui-resizable-e"></div><div class="ui-resizable-handle ui-resizable-s"></div><div class="ui-resizable-handle ui-resizable-w"></div><div style="z-index: 1001;" class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se"></div><div style="z-index: 1002;" class="ui-resizable-handle ui-resizable-sw"></div><div style="z-index: 1003;" class="ui-resizable-handle ui-resizable-ne"></div><div style="z-index: 1004;" class="ui-resizable-handle ui-resizable-nw"></div><div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix"></div>
</div>
<script type="text/javascript">
    function getImagePath() { return '<%= ImagePath %>'; } var imagePath = getImagePath();
    var n = 0; var sumAmount = 0; var flag;
    function setBlock()
    {
        $.blockUI(
                {  //'<img src="<=ResolveUrl("~") %>/ajaxImages/loading2.gif" />'
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
    }
    function getSitePaymentInfo()
    {
        $.PageMethod('GetSitePaymentInfo', onSitePaymentInfoSuccess, onSitePaymentInfoFail);
        function onSitePaymentInfoSuccess(result)
        {
            var info = result.d;
            $('span[id$=DocumentID]').html(info.DocumentID);
            $('span[id$=RegisterDate]').html(info.RegisterDate);
            $('span[id$=UserName]').html(info.UserName);
            $('span[id$=CurrentRemainAmountBox]').html(info.CurrentRemainAmountBox);

            $.unblockUI();
        }
        function onSitePaymentInfoFail(response)
        {
            alert("خطای برگرداندن اطلاعات سایت");
            $.unblockUI();
        }
    }
    function reduceAmountFromSiteBoxByPayment(amount)
    {
        setBlock();
        $.PageMethod('ReduceAmountFromSiteBoxByPayment', onReduceAmountSuccess, onReduceAmountFail, 'amount', amount);
        function onReduceAmountSuccess(result)
        {
            //$('#<= btn_Refersh.ClientID %>').click();
            $.unblockUI();
        }
        function onReduceAmountFail(response)
        {
            alert("خطای کاهش از صندوق");
            $.unblockUI();
        }
    }
    function savePayment(paymentID, boxKind, currentAmount, rowNumber, paymentDate, paymentDesc, docNumber, paymentAmount, comment, selectUserID)
    {
        $.PageMethod('InsertPaymentDocument', onSuccess, onFail, 'paymentID', paymentID, 'boxKind', boxKind,
                'currentAmount', currentAmount, 'rowNumber', rowNumber, 'paymentDate', paymentDate, 'paymentDesc', paymentDesc,
                'docNumber', docNumber, 'paymentAmount', paymentAmount, 'comment', comment, 'selectUserID', selectUserID);

        function onSuccess(response)
        {
            getSitePaymentInfo();
            $('.autoTable tbody tr').find("input[type=text][id$=txt_Desc]").val("");
            $('.autoTable tbody tr').find("input[type=text][id$=txt_DocNumber]").val("");
            $('.autoTable tbody tr').find("input[type=text][id$=txt_Amount]").val("");
            $('.autoTable tbody tr:not(:first)').remove();
            $('select[id$=txt_Year]').get(0).selectedIndex = 88;
            $(".addRow").btnAddRow();
            $(".delRow").btnDelRow();
            $.unblockUI();
        }
        function onFail(response)
        {
            $.unblockUI();
            alert("خطای ثبت سند پرداخت  : " + response);
        }
    }
    function insertIntoDocumentsBox(paymentID, paymentAmount, remainAmount, comment)
    {
        $.PageMethod('InsertIntoDocumentsBox', onDocumentBoxSuccess, onDocumentBoxFail, 'paymentID', paymentID, 
        'paymentAmount', paymentAmount, 'remainAmount', remainAmount, 'comment', comment);

        function onDocumentBoxSuccess(response)
        {
            $.unblockUI();
        }
        function onDocumentBoxFail(response)
        {
            $.unblockUI();
            alert("خطای  : " + response);
        }
    }
    $(document).ready(function ()
    {
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_beginRequest(function ()
        {
            setBlock();
        });
        prm.add_endRequest(function ()
        {
            $.unblockUI();
        });
        $("#dialog:ui-dialog").dialog("destroy");
        $("#dialog-Payment").dialog({
            autoOpen: false, resizable: false, height: 'auto', width: 850, direction: 'rtl',
            show: 'clip', hide: 'clip', stack: true, position: 'center', title: 'سند پرداخت - صندوق سایت', modal: true

        });
        $("#dialog-showPayment").dialog({
            autoOpen: false, resizable: false, height: 'auto', width: 850, direction: 'rtl',
            show: 'clip', hide: 'clip', stack: true, position: 'center', title: 'نمایش سند پرداخت', modal: true
        });
        $('.submit').click(function () { __doPostBack('<%= btn_Refersh.ClientID %>', ''); $("#dialog-form").dialog("close"); });

        $('#btn_newPayment').click(function ()
        {
            setBlock();
            getSitePaymentInfo();
            //$('#dialog-Payment').dialog("option", "title", "");
            //$('#dialog-Payment').dialog("option", "position", [left, top]);
            //open: function(event, ui) {
            //$(this).parent().appendTo("#");
            $('#dialog-Payment').dialog('open');
        });
        //$(".autoTable").tableAutoAddRow({ autoAddRow: true });
        //$(".delRow").btnDelRow();
        $(".addRow").btnAddRow({ rowNumColumn: "rowNumber", oddRowCSS: "oddRow", evenRowCSS: "evenRow" });
        $(".delRow").btnDelRow();

        for (var i = 1302; i <= 1500; i++)
        {
            $('#txt_Year').append($('<option></option>').val(i.toString()).html(i.toString()));
        }
        for (var i = 1; i <= 12; i++)
        {
            $('#txt_Month').append($('<option></option>').val(i.toString()).html(i.toString()));
        }
        for (var i = 1; i <= 31; i++)
        {
            $('#txt_Day').append($('<option></option>').val(i.toString()).html(i.toString()));
        }
        //$('select[id$=txt_Year] option:selected').text("1390");
        $('select[id$=txt_Year]').get(0).selectedIndex = 88;

        function getSumPaymentAmount()
        {
            sumAmount = 0;
            flag = false;
            $(".autoTable tbody tr").each(function (item, i)
            {
                var txt_Desc = $(this).find("input[type=text][id$=txt_Desc]").val();
                var txt_DocNumber = $(this).find("input[type=text][id$=txt_DocNumber]").val();
                var txt_Amount = $(this).find("input[type=text][id$=txt_Amount]").val();
                if (txt_Desc == "" || txt_Desc == null || txt_DocNumber == "" || txt_DocNumber == null || txt_Amount == "" || txt_Amount == null || txt_Amount == "0")
                {
                    flag = true;
                    return;
                }
                var txt_Amount = $(this).find("input[type=text][id$=txt_Amount]").val();
                sumAmount += parseFloat(txt_Amount);
            });
            return flag;
        }
        $('#register').live("click", function (e)
        {
            n = 0;
            var PaymentID = $('span[id$=DocumentID]').html();
            var txt_comment = $('input[type=text][id$=txt_Comment]').val();
            var remainAmount = parseFloat($('span[id$=CurrentRemainAmountBox]').html());
            if (getSumPaymentAmount() == true)
            {
                $.unblockUI();
                alert("اطلاعات در برخی خانه ها خالی و یا مبلغ صفر است لطفا تمامی خانه های موجود را پر نمائید");
                return;
            }
            if (sumAmount == "" || isNaN(sumAmount) || sumAmount == 0)
            {
                alert("جمع مبلغ(ها) صفر یا نامعتبر است");
                $.unblockUI();
                return;
            }
            var currentAmount = $('span[id$=CurrentRemainAmountBox]').html();
            //.autoTable tr:not(:first)
            if (currentAmount >= sumAmount)
            {
                $(".autoTable tbody tr").each(function (item, i)
                {
                    setBlock();
                    n++;
                    var oldAmount = $('span[id$=CurrentRemainAmountBox]').html();
                    var txt_year = $(this).find('select[id$=txt_Year] option:selected').val();
                    var txt_month = $(this).find('select[id$=txt_Month] option:selected').val();
                    var txt_day = $(this).find('select[id$=txt_Day] option:selected').val();
                    var txt_Desc = $(this).find("input[type=text][id$=txt_Desc]").val();
                    var txt_DocNumber = $(this).find("input[type=text][id$=txt_DocNumber]").val();
                    var txt_Amount = $(this).find("input[type=text][id$=txt_Amount]").val();
                    if (txt_month.length == 1) { txt_month = "0" + txt_month };
                    if (txt_day.length == 1) { txt_day = "0" + txt_day };
                    var PaymentDate = txt_year + "/" + txt_month + "/" + txt_day;
                    //                    alert(PaymentID); alert(currentAmount); alert(PaymentDate); alert(txt_Desc); alert(txt_DocNumber);
                    //                    alert(txt_Amount);
                    savePayment(PaymentID, "1", oldAmount, n, PaymentDate, txt_Desc, txt_DocNumber, txt_Amount, txt_comment, "-1");
                    $('span[id$=CurrentRemainAmountBox]').html(parseFloat(oldAmount) - parseFloat(txt_Amount));
                    remainAmount -= parseFloat(txt_Amount);
                });
                reduceAmountFromSiteBoxByPayment(sumAmount);
                insertIntoDocumentsBox(PaymentID, sumAmount, remainAmount, txt_comment);
                //__doPostBack("<= btn_Refersh.ClientID %>", "");                 
                //$('#btnRefreshNext').click();
                //$('#<= btn_Refersh.ClientID %>').click();
                //__doPostBack('UpdatePanel1', ''); 
                $('#dialog-Payment').dialog('close');
                e.preventDefault();
            }
            else
            {
                alert("موجودی صندوق از مبلغ درخواستی کمتر است");
                $.unblockUI();
                return;
            }
        });
    });
</script>
