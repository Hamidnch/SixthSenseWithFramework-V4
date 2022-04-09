<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ContactUs_OutputMessage.ascx.cs" Inherits="AdminPanel_AdminUserControl_ContactUs_OutputMessage" %>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:GridView ID="gv_OutputMessage" EnableViewState="false" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                HeaderStyle-CssClass="HeaderStyle" PagerStyle-CssClass="PagerStyle" PageSize="10" OnPageIndexChanging="gv_OutputMessageContactUs_PageIndexChanging">
                <RowStyle BackColor="#8C7AAD" Height="33px" ForeColor="Yellow" VerticalAlign="Middle" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="#333333" BorderWidth="1"/>                
                <Columns>
                    <asp:TemplateField HeaderText="شماره پیام" SortExpression="Message_ID">
                        <ItemStyle Width="10%"/>
                        <ItemTemplate>                    
                            <asp:Label ID="lbl_Message_ID" runat="server" Text='<%# Eval("Message_ID") %>'></asp:Label>
                        </ItemTemplate>                            
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="تاریخ ایجاد" SortExpression="Message_CreationDate">
                        <ItemStyle Width="30%"/>
                        <ItemTemplate>                    
                            <asp:Label ID="lbl_Message_CreationDate" runat="server" Text='<%# PersianClass.getPersianNumberStyle(PersianClass.getPersiaDate(Eval("Message_CreationDate", "{0}"), "L", true, "H")) %>'></asp:Label>
                        </ItemTemplate>                            
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="موضوع تماس" SortExpression="Message_Subject">
                        <ItemStyle Width="50%"/>
                        <ItemTemplate>                    
                            <asp:Label ID="lbl_Message_Subject" runat="server" Text='<%# Eval("Message_Subject") %>'></asp:Label>
                        </ItemTemplate>                            
                    </asp:TemplateField>
<%--                    <asp:TemplateField HeaderText="نام گیرندگان" SortExpression="Message_ReceiverEmail">
                        <ItemStyle Width="10%"/>
                        <ItemTemplate>                    
                            <asp:Label ID="lbl_Message_ReceiverEmail" runat="server" Text='<%# Eval("Message_ReceiverEmail") %>'></asp:Label>
                        </ItemTemplate>                            
                    </asp:TemplateField>--%>
<%--                    <asp:TemplateField HeaderText="متن پیام" SortExpression="Message_Context">
                        <ItemStyle Width="10%"/>
                        <ItemTemplate>                    
                            <asp:Label ID="lbl_Contact_Phone" runat="server" Text='<%# Eval("Message_Context") %>'></asp:Label>
                        </ItemTemplate>                            
                    </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="نمایش پیام">
                        <ItemStyle Width="10%" />
                        <ItemTemplate>
                            <a id='<%# Eval("Message_ID") %>' class="Message_Show" style="cursor: pointer">
                                <img border="0" src="../Images/ajaxImages/Show.png" alt="نمایش" /></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>               
        </ContentTemplate>
    </asp:UpdatePanel>   
</div><div id="divMessage" aria-labelledby="ui-dialog-title-dialog-form" role="dialog"
                tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
                style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: auto;
                width: auto; top: 82px; left: 460px;">
    <div id="titlebar" class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
        <span id="ui-dialog-title-dialog-form" class="ui-dialog-title">پیام های ارسال شده به کاربران</span><a role="button"
            class="ui-dialog-titlebar-close ui-corner-all" href="#"><span id="close" class="ui-icon ui-icon-closethick">بستن</span></a></div>
    <div style="width: auto; min-height: 0px; height: auto" class="ui-dialog-content ui-widget-content" id="dialog-form">
        <form id="frm_Message">
            <fieldset>
                <div style="direction:rtl;font-family:Tahoma">
                    <table>                                    
                        <tr><td><span>شماره پیام: </span><asp:Label ID="lbl_MessageID" Text="text" runat="server" Visible="true" /></td></tr>
                        <tr><td>عنوان پیام</td></tr>
                        <tr>
                            <td><asp:TextBox ID="txt_Message_Subject" ReadOnly="true" CssClass="txtMessage" runat="server" Width="400px" Height="25px"/></td>
                        </tr>
                        <tr><td>متن پیام</td></tr>
                        <tr>
                            <td><asp:TextBox ID="txt_Message_Context" ReadOnly="true" CssClass="txtMessage" runat="server" Height="140px" Width="590px" TextMode="MultiLine" Wrap="true"/></td>
                        </tr>
                        <tr><td>گیرندگان پیام</td></tr>
                        <tr>
                            <td><asp:TextBox Visible="true" ID="txt_Message_ReceiverEmail" TextMode="MultiLine" CssClass="txtMessage email" ReadOnly="true" runat="server" Width="431px" Height="40px"/></td>
                        </tr>
                        <tr>
                            <td>
<%--                                <input type="button" id="btn_Send" value="ارسال پیام" class="submit" />--%>
                                <input type="button" id="btn_Close" value="بستن" class="submit" onclick="$('#divMessage').hide('slow');" />
                            </td>
                        </tr>
                    </table>
                </div>
            </fieldset>
        </form>
    </div>
    <div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix"></div>
</div> 
<script language="javascript" type="text/javascript">
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    function getImagePath() { return '<%= ImagePath %>'; } var imagePath = getImagePath();
    prm.add_beginRequest(function () { setBlock(); });
    prm.add_endRequest(function () { $.unblockUI(); });
    function pageLoad(sender, args)
    {
        $('.Message_Show').click(function ()
        {
            var messageID = $(this).attr("id");
            setBlock();
            $.ajax({
                type: "POST",
                url: "ContactUs_OutputMessage.aspx/MessageInfoByMessageID",
                data: "{ messageID: '" + messageID + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response)
                {
                    var info = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
                    var txt_Message_Subject = $('#<%= txt_Message_Subject.ClientID %>');
                   // var txt_Message_Context = $('#<= txt_Message_Context.ClientID %>');
                    var txt_Message_ReceiverEmail = $('#<%= txt_Message_ReceiverEmail.ClientID %>');
                    var lbl_MessageID = $('#<%= lbl_MessageID.ClientID %>');

                    var editor = CKEDITOR.instances.ctl00_ContentPlaceHolder1_ContactUs_OutputMessage1_txt_Message_Context;

                    txt_Message_Subject.val(info.Message_Subject);
                    //txt_Message_Context.val(info.Message_Context);
                    txt_Message_ReceiverEmail.val(info.Message_ReceiverEmail);
                    //txt_Reply.val(info.ContactUs_Reply);
                    editor.setData(info.Message_Context);
                    lbl_MessageID.text(info.Message_ID);
                    //$("#dialog-form").dialog("open");
                    showModal();
                    $.unblockUI();
                },
                error: function (xhr, ajaxOptions, thrownError)
                {
                    $.unblockUI();
                    alert(xhr.status);
                    alert(thrownError);
                }
            });
        });
    }
</Script>