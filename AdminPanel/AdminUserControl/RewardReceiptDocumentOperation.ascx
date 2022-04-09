<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RewardReceiptDocumentOperation.ascx.cs" Inherits="AdminPanel_AdminUserControl_RewardReceiptDocumentOperation" %>
<%@ Register Assembly="PersianDatePickup" Namespace="PersianDatePickup" TagPrefix="pcal" %>
<link href="../AdminStyls/CSSGrid.css" rel="stylesheet" type="text/css" />
<link href="../AdminStyls/Modal/smoothness/jquery-ui-1.8.5.custom.css" rel="stylesheet" type="text/css" />

<asp:ScriptManager ID="ScriptManager2" runat="server" EnablePartialRendering="true">
</asp:ScriptManager>
<fieldset>
    <legend style="color: #ffcc00;">لیست اسناد دریافت - صندوق جوایز</legend>
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
            <input type="button" value="جدید" id="btn_newReceipt" class="submit" />
            <asp:Button ID="btn_Exit" runat="server" Text="برگشت" CssClass="submit" OnClick="btn_Exit_Click" />     
        </div> 
    </fieldset>
    <div style="clear: both"></div><br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <fieldset>
                <asp:GridView ID="gv_rewardReceiptDocuments" runat="server" AutoGenerateColumns="False"
                    CssClass="GridViewStyle" HeaderStyle-CssClass="HeaderStyle" 
                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" 
                    onpageindexchanging="gv_rewardReceiptDocuments_PageIndexChanging" 
                    AllowPaging="True" onrowcommand="gv_rewardReceiptDocuments_RowCommand" 
                    onrowdatabound="gv_rewardReceiptDocuments_RowDataBound">
                    <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="RowStyle" />
                    <PagerStyle CssClass=" PagerStyle" />
                    <Columns>
                        <asp:TemplateField HeaderText="ردیف">
                            <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_RowNumber" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="تاریخ" SortExpression="HdrReceiptDoc_RegisterDate">
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_HdrReceiptDoc_RegisterDate" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("HdrReceiptDoc_RegisterDate","{0}"), "D", false) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="شرح کلی" SortExpression="comment">
                            <ItemStyle Width="30%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_comment" runat="server" Text='<%# Eval("comment", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="شماره سند" SortExpression="HdrReceiptDoc_ID">
                            <ItemStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center" ForeColor="YellowGreen" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_HdrReceiptDoc_ID" runat="server" Text='<%# PersianClass.getPersianNumberStyle(Eval("HdrReceiptDoc_ID", "{0}")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="نام کاربری" SortExpression="Member_UserName">
                            <ItemStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center" ForeColor="Yellow" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_UserName" runat="server" Text='<%# Eval("Member_UserName", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="مبلغ" SortExpression="ReceiptAmount">
                            <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" ForeColor="#ffcc00" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_ReceiptAmount" runat="server" Text='<%# PersianClass.getPersianNumberStyle(Eval("ReceiptAmount", "{0:n0}")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="نمایش سند">
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:ImageButton ID="img_Show" runat="server" CommandArgument='<%# Eval("HdrReceiptDoc_ID", "{0}") %>'
                                    CommandName="receipt_Show" AlternateText="نمایش" ImageUrl="~/Images/ajaxImages/Show.png"></asp:ImageButton>
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
<div id="divSelectUser" aria-labelledby="ui-dialog-title-dialog-form" role="dialog" tabindex="-1"
    class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
    style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: auto;
    width: 800px; top: 82px; left: 460px;">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
        <span id="Span1" class="ui-dialog-title">انتخاب کاربر</span><a role="button" class="ui-dialog-titlebar-close ui-corner-all"
            href="#"><span class="ui-icon ui-icon-closethick">بستن</span></a></div>
    <div style="width: auto; min-height: 0px; height: auto" class="ui-dialog-content ui-widget-content"
        id="dialog-selectUser">
        <fieldset>
            <span>کاربر مورد نظر را انتخاب نمائید</span>
            <br /><br />
            <asp:DropDownList ID="ddl_SelectUser" CssClass="ddl_SelectUser" runat="server"></asp:DropDownList><br />
            <input type="button" value="انتخاب" class="submit" id="btn_SelectUser" />
            <input type="button" value="بازگشت" class="submit" onclick="$('#dialog-selectUser').dialog('close');" />
        </fieldset>
    </div>
    <div class="ui-resizable-handle ui-resizable-n"></div><div class="ui-resizable-handle ui-resizable-e"></div><div class="ui-resizable-handle ui-resizable-s"></div><div class="ui-resizable-handle ui-resizable-w"></div><div style="z-index: 1001;" class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se"></div><div style="z-index: 1002;" class="ui-resizable-handle ui-resizable-sw"></div><div style="z-index: 1003;" class="ui-resizable-handle ui-resizable-ne"></div><div style="z-index: 1004;" class="ui-resizable-handle ui-resizable-nw"></div><div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix"></div>
</div>

<div id="divFinanceOperation" aria-labelledby="ui-dialog-title-dialog-form" role="dialog"
    tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
    style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: auto;
    width: 800px; top: 82px; left: 460px;">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
        <span id="ui-dialog-title-dialog-form" class="ui-dialog-title">عملیات دریافت</span><a role="button"
            class="ui-dialog-titlebar-close ui-corner-all" href="#"><span class="ui-icon ui-icon-closethick">بستن</span></a></div>
    <div style="width: auto; min-height: 0px; height: auto" class="ui-dialog-content ui-widget-content"
        id="dialog-receipt">
        <fieldset>
            <table>
                <tr>
                    <td>شماره سند : <span id="DocumentID"></span></td>
                    <td>تاریخ ثبت : <span id="RegisterDate"></span></td>
                    <td>نام کاربر ثبت : <span id="UserName"></span></td>
                    <td>مانده فعلی صندوق : <span id="CurrentRemainAmountBox"></span></td>
                </tr>
                <tr><td colspan="4"><br /></td></tr>
                <tr>
                    <td colspan="4">
                        <span>نام کاربر برنده: </span>
                        <span id="userNameSelected" style="color:Purple;font-weight:bold"></span>
                    </td>
                </tr>
                <tr>
                    <td><span>مشخصات کاربر: </span><span>نام: </span><span id="firstNameSelected"></span></td>
                    <td><span>نام خانوادگی: </span><span id="lastNameSelected"></span></td>
                    <td><span>شماره حساب: </span><span id="accountNumberSelected"></span></td>
                    <td><span>بانک: </span><span id="bankNameSelected"></span></td>
                </tr>
                <tr><td><br /></td></tr>
                <tr>
                    <td colspan="4"><span style="float:right">شرح کلی سند: </span><div style="float:right"><asp:TextBox ID="txt_Comment" CssClass="autoTable_txt" Width="550px" runat="server" ></asp:TextBox></div></td>
                </tr>
                <tr><td><br /></td></tr>
                <tr>
                    <td colspan="4">
                        <table id="table_receipts" cellpadding="6" cellspacing="4" class="autoTable">
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
                        <input type="button" value="بازگشت" class="submit" onclick="$('#dialog-selectUser').dialog('open');$('#dialog-receipt').dialog('close');" />
                        <%--<asp:Button ID="btn_ref2" runat="server" Text="Refresh" OnClick="btn_Refersh_Click" />  --%>
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
    <div class="ui-resizable-handle ui-resizable-n"></div><div class="ui-resizable-handle ui-resizable-e"></div><div class="ui-resizable-handle ui-resizable-s"></div><div class="ui-resizable-handle ui-resizable-w"></div><div style="z-index: 1001;" class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se"></div><div style="z-index: 1002;" class="ui-resizable-handle ui-resizable-sw"></div><div style="z-index: 1003;" class="ui-resizable-handle ui-resizable-ne"></div><div style="z-index: 1004;" class="ui-resizable-handle ui-resizable-nw"></div><div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix"></div>
</div>
<div id="divShowReceipt" aria-labelledby="ui-dialog-title-dialog-form" role="dialog"
            tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
            style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: auto;
            width: 800px; top: 82px; left: 460px;">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
        <span id="ui-dialog-title-dialog-form2" class="ui-dialog-title">نمایش سند</span><a role="button"
            class="ui-dialog-titlebar-close ui-corner-all" href="#"><span class="ui-icon ui-icon-closethick">بستن</span></a></div>
    <div style="width: auto; min-height: 0px; height: auto" class="ui-dialog-content ui-widget-content"
        id="dialog-showReceipt">
        <fieldset>
            <asp:UpdatePanel runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <div id="gridDiv">
                        <legend style="color: #262626;">
                            <table>
                                <tr>
                                    <td>شماره سند : <span id="Span2"><asp:Label id="lbl_ReceiptDocID" runat="server"></asp:Label></span></td>
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
                                        <asp:GridView ID="gv_ShowReceipt" runat="server" AutoGenerateColumns="false"  CssClass="GridViewStyle" HeaderStyle-CssClass="HeaderStyle" PagerStyle-CssClass="PagerStyle">                        
                                        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="RowStyle"/>
                                        <Columns>                                    
                                        <asp:TemplateField HeaderText="ردیف" SortExpression="ReceiptDoc_RowNumber">
                                            <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_ReceiptDoc_RowNumber" runat="server" Text='<%# Eval("ReceiptDoc_RowNumber", "{0}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="تاریخ" SortExpression="ReceiptDoc_ReceiptDate">
                                            <ItemStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_ReceiptDoc_ReceiptDate" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("ReceiptDoc_ReceiptDate","{0}"), "D", false) %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="مانده قبلی" SortExpression="ReceiptDoc_BoxCurrentAmount">
                                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_ReceiptDoc_BoxCurrentAmount" runat="server" Text='<%# PersianClass.getPersianNumberStyle(Eval("ReceiptDoc_BoxCurrentAmount", "{0:n0}")) %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField> 
                                        <asp:TemplateField HeaderText="شرح" SortExpression="ReceiptDoc_Description">
                                            <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_ReceiptDoc_Description" runat="server" Text='<%# Eval("ReceiptDoc_Description", "{0}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="شماره مدرک" SortExpression="ReceiptDoc_DocumentNumber">
                                            <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_ReceiptDoc_DocumentNumber" runat="server" Text='<%# PersianClass.getPersianNumberStyle(Eval("ReceiptDoc_DocumentNumber", "{0}")) %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="مبلغ سند" SortExpression="ReceiptDoc_ReceiptAmount">
                                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_ReceiptDoc_ReceiptAmount" runat="server" Text='<%# PersianClass.getPersianNumberStyle(Eval("ReceiptDoc_ReceiptAmount", "{0:n0}")) %>'></asp:Label>
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
                    <input type="button" value="چاپ" id="btn_printReceipt" class="submit" onclick="CallPrint('gridDiv', 'Black', 'White')"/>
                    <input type="button" value="بستن" class="submit" onclick="$('#dialog-showReceipt').dialog('close');" />
                </ContentTemplate>
            </asp:UpdatePanel>           
        </fieldset>
    </div>
    <div class="ui-resizable-handle ui-resizable-n"></div><div class="ui-resizable-handle ui-resizable-e"></div><div class="ui-resizable-handle ui-resizable-s"></div><div class="ui-resizable-handle ui-resizable-w"></div><div style="z-index: 1001;" class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se"></div><div style="z-index: 1002;" class="ui-resizable-handle ui-resizable-sw"></div><div style="z-index: 1003;" class="ui-resizable-handle ui-resizable-ne"></div><div style="z-index: 1004;" class="ui-resizable-handle ui-resizable-nw"></div><div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix"></div>
</div>
<script type="text/javascript">
    function getImagePath() { return '<%= ImagePath %>'; } var imagePath = getImagePath();
    var n = 0; var sumAmount = 0; var flag;var selUserID;
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
    function getRewardReceiptInfo(userID)
    {
        $.PageMethod('GetRewardReceiptInfo', onRewardReceiptInfoSuccess, onRewardReceiptInfoFail, 'userID', userID );
        function onRewardReceiptInfoSuccess(result)
        {
            var info = result.d;
            $('span[id$=DocumentID]').html(info.DocumentID);
            $('span[id$=RegisterDate]').html(info.RegisterDate);
            $('span[id$=UserName]').html(info.UserName);
            $('span[id$=CurrentRemainAmountBox]').html(info.CurrentRemainAmountBox);

            $.unblockUI();
        }
        function onRewardReceiptInfoFail(response)
        {
            alert("خطای فراخوانی اطلاعات دریافت");
            $.unblockUI();
        }
    }
    function addAmountToRewardBoxByReceiptAndUserID(userID, amount)
    {
        setBlock();
        $.PageMethod('AddAmountToRewardBoxByReceiptAndUserID', onAddAmountSuccess, onAddAmountFail, 'userID', userID, 'amount', amount);
        function onAddAmountSuccess(result)
        {
            //$('#<= btn_Refersh.ClientID %>').click();
            $.unblockUI();
        }
        function onAddAmountFail(response)
        {
            alert("خطای افزودن مبلغ به صندوق جایزه کاربر");
            $.unblockUI();
        }
    }
    function saveReceipt(receiptID, boxKind, currentAmount, rowNumber, receiptDate, receiptDesc, docNumber, receiptAmount, comment, selectUserID)
    {
        $.PageMethod('InsertReceiptDocument', onSuccess, onFail, 'receiptID', receiptID, 'boxKind', boxKind,
                'currentAmount', currentAmount, 'rowNumber', rowNumber, 'receiptDate', receiptDate, 'receiptDesc', receiptDesc,
                'docNumber', docNumber, 'receiptAmount', receiptAmount, 'comment', comment, 'selectUserID', selectUserID);

        function onSuccess(response)
        {
            userID = selUserID;
            getRewardReceiptInfo(userID);
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
            alert(" خطای ثبت رسید  : " + response);
        }
    }
    function insertIntoDocumentsBox(receiptID, receiptAmount, remainAmount, comment)
    {
        $.PageMethod('InsertIntoDocumentsBox', onDocumentBoxSuccess, onDocumentBoxFail, 'receiptID', receiptID, 
        'receiptAmount', receiptAmount, 'remainAmount', remainAmount, 'comment', comment);

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
    function loadAllUsers()
    {
        $.PageMethod('LoadAllUsers', onUsersSuccess, onUsersFail);
        function onUsersSuccess(response)
        {
            var users = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;

            $("select[id$=ddl_SelectUser] > option").remove();
            for (var i = 0; i < users.length; i++)
            {
                var val = users[i].MemberID;
                var text = users[i].Username;
                $('select[id$=ddl_SelectUser]').append("<option value ='" + val + "'>" + text + "</option>");
            }
            $.unblockUI();
        }
        function onUsersFail(response)
        {
            alert("خطای لود کاربران");
            $.unblockUI();
        }
    }
    function getUserAttributes(userName)
    {
        $.PageMethod('GetUserAttributes', onUserAttrSuccess, onUserAttrFail, 'userName', userName);
        function onUserAttrSuccess(response)
        {
            var attr = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
            $('span[id$=userNameSelected]').html(attr.Username);
            $('span[id$=firstNameSelected]').html(attr.FName);
            $('span[id$=lastNameSelected]').html(attr.LastName);
            $('span[id$=accountNumberSelected]').html(attr.AccountNumber)
            $('span[id$=bankNameSelected]').html(attr.BankName);
            $.unblockUI();
        }
        function onUserAttrFail(response)
        {
            alert("خطای لود مشخصات کاربران");
            $.unblockUI();
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
        $("#dialog-receipt").dialog({
            autoOpen: false, resizable: false, height: 'auto', width: 850, direction: 'rtl',
            show: 'clip', hide: 'clip', stack: true, position: 'center', title: 'سند دریافت - صندوق جوایز', modal: true
        });
        $("#dialog-showReceipt").dialog({
            autoOpen: false, resizable: false, height: 'auto', width: 850, direction: 'rtl',
            show: 'clip', hide: 'clip', stack: true, position: 'center', title: 'نمایش سند', modal: true
        });
        $("#dialog-selectUser").dialog({
            autoOpen: false, resizable: false, height: 'auto', width: 500, direction: 'rtl',
            show: 'clip', hide: 'clip', stack: true, position: 'center', title: 'انتخاب کاربر', modal: true
        });

        $('.submit').click(function () { $("#dialog-form").dialog("close"); });

        $('#btn_newReceipt').click(function ()
        {
            setBlock();
            //$('#dialog-receipt').dialog("option", "title", "");
            //$('#dialog-receipt').dialog("option", "position", [left, top]);
            //open: function(event, ui) {
            //$(this).parent().appendTo("#");
            loadAllUsers();
            $('#dialog-selectUser').dialog('open');
        });
        $("#btn_SelectUser").click(function ()
        {
            $('#dialog-selectUser').dialog('close');
            selUserID = $('select[id$=ddl_SelectUser] option:selected').val();
            selectUserName = $('select[id$=ddl_SelectUser] option:selected').text();
            getRewardReceiptInfo(selUserID);
            getUserAttributes(selectUserName);
            $('#dialog-receipt').dialog('open');
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

        function getSumReceiptAmount()
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
        $('#register').live('click', function (e)
        {
            n = 0;
            var receiptID = $('span[id$=DocumentID]').html();
            var txt_comment = $('input[type=text][id$=txt_Comment]').val();
            var remainAmount = parseFloat($('span[id$=CurrentRemainAmountBox]').html());
            if (getSumReceiptAmount() == true)
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

            //.autoTable tr:not(:first)
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
                var receiptDate = txt_year + "/" + txt_month + "/" + txt_day;
                saveReceipt(receiptID, "4", oldAmount, n, receiptDate, txt_Desc, txt_DocNumber, txt_Amount, txt_comment, selUserID);
                $('span[id$=CurrentRemainAmountBox]').html(parseFloat(oldAmount) + parseFloat(txt_Amount));
                remainAmount += parseFloat(txt_Amount);
            });
            addAmountToRewardBoxByReceiptAndUserID(selUserID, sumAmount);
            insertIntoDocumentsBox(receiptID, sumAmount, remainAmount, txt_comment);
            //__doPostBack("<= btn_Refersh.ClientID %>", "");                 
            //$('#btnRefreshNext').click();
            //$('#<= btn_Refersh.ClientID %>').click();
            //__doPostBack('UpdatePanel1', ''); 
            __doPostBack('<%= btn_Refersh.ClientID %>', null);
            $('#dialog-receipt').dialog('close');
            e.preventDefault();
        });
    });
</script>
