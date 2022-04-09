<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ContactUs_InputMessage.ascx.cs" Inherits="AdminPanel_AdminUserControl_ContactUs_InputMessage" %>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:GridView ID="gv_InputMessageContactUs" EnableViewState="false" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                HeaderStyle-CssClass="HeaderStyle" PagerStyle-CssClass="PagerStyle" PageSize="10" onpageindexchanging="gv_InputMessageContactUs_PageIndexChanging" onrowdatabound="gv_InputMessageContactUs_RowDataBound">
                <RowStyle BackColor="#282828" Height="33px" ForeColor="White" VerticalAlign="Middle" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="#333333" BorderWidth="1"/>                
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>                            
                          <asp:CheckBox ID="checkAll" runat="server" onclick = "checkAll(this);" />
                        </HeaderTemplate>
                       <ItemTemplate>
                         <asp:CheckBox ID="CheckBox1" runat="server" onclick = "Check_Click(this)" />
                       </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="شماره" SortExpression="Contact_ID">
                        <ItemStyle Width="5%"/>
                        <ItemTemplate>                    
                            <asp:Label ID="lbl_Contact_ID" runat="server" Text='<%# Eval("Contact_ID") %>'></asp:Label>
                        </ItemTemplate>                            
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="موضوع تماس" SortExpression="Contact_Title">
                        <ItemStyle Width="15%"/>
                        <ItemTemplate>                    
                            <asp:Label ID="lbl_Contact_Title" runat="server" Text='<%# Eval("Contact_Title") %>'></asp:Label>
                        </ItemTemplate>                            
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="تاریخ تماس" SortExpression="Contact_Date">
                        <ItemStyle Width="15%"/>
                        <ItemTemplate>                    
                            <asp:Label ID="lbl_Contact_Date" runat="server" Text='<%# PersianClass.getPersianNumberStyle(PersianClass.getPersiaDate(Eval("Contact_Date", "{0}"), "L", true, "H")) %>'></asp:Label>
                        </ItemTemplate>                            
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="نام فرستنده" SortExpression="Contact_Author">
                        <ItemStyle Width="10%"/>
                        <ItemTemplate>                    
                            <asp:Label ID="lbl_Contact_Author" runat="server" Text='<%# Eval("Contact_Author") %>'></asp:Label>
                        </ItemTemplate>                            
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText=" IPفرستنده" SortExpression="Contact_UserIP">
                        <ItemStyle Width="10%"/>
                        <ItemTemplate>                    
                            <asp:Label ID="lbl_Contact_UserIP" runat="server" Text='<%# Eval("Contact_UserIP") %>'></asp:Label>
                        </ItemTemplate>                            
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ایمیل فرستنده" SortExpression="Contact_Email">
                        <ItemStyle Width="15%"/>
                        <ItemTemplate>                    
                            <asp:Label ID="lbl_Contact_Email" runat="server" Text='<%# Eval("Contact_Email") %>'></asp:Label>
                        </ItemTemplate>                            
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="شماره تماس" SortExpression="Contact_Phone">
                        <ItemStyle Width="10%"/>
                        <ItemTemplate>                    
                            <asp:Label ID="lbl_Contact_Phone" runat="server" Text='<%# Eval("Contact_Phone") %>'></asp:Label>
                        </ItemTemplate>                            
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="نمایش پیام">
                        <ItemStyle Width="10%" />
                        <ItemTemplate>
                            <a id='<%# Eval("Contact_ID") %>' class="MessageInfo_Show" style="cursor: pointer">
                                <img width="30px" height="30px" border="0" src="../Images/ajaxImages/Show.png" alt="نمایش" /></a>
<%--                            <asp:ImageButton ID='<%# Eval("Contact_ID", "{0}") %>' CssClass="Message_Show" runat="server" CommandArgument='<%# Eval("Contact_ID", "{0}") %>' Width="35px" Height="30px"
                                CommandName="Message_Show" AlternateText="نمایش" ImageUrl="~/Images/ajaxImages/Show.png"></asp:ImageButton>--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>   
            <%--<asp:LinkButton ID="LinkButton1" runat="server" style="display:none;" onclick="LinkButton1_Click">LinkButton</asp:LinkButton>                                    --%>
        </ContentTemplate>
<%--        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="LinkButton1" EventName="Click" />
        </Triggers>--%>
    </asp:UpdatePanel>       
</div>
<div id="divMessage" aria-labelledby="ui-dialog-title-dialog-form" role="dialog"
        tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
        style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: auto;
        width: auto; top: 82px; left: 460px;">
    <div id="titlebar" class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
        <span id="ui-dialog-title-dialog-form" class="ui-dialog-title">خواندن پیام و پاسخ به آن</span><a role="button"
            class="ui-dialog-titlebar-close ui-corner-all" href="#"><span id="close" class="ui-icon ui-icon-closethick">بستن</span></a></div>
    <div style="width: auto; min-height: 0px; height: auto" class="ui-dialog-content ui-widget-content" id="dialog-form">
        <form id="frm_Message">
            <fieldset>
                <div style="direction:rtl;font-family:Tahoma">
                    <table>                                    
                        <tr><td><span>شماره پیام: </span><asp:Label ID="lbl_ContactID" Text="text" runat="server" Visible="true" /></td></tr>
                        <tr><td>عنوان پیام</td></tr>
                        <tr>
                            <td><asp:TextBox ID="txt_ContactTitle" ReadOnly="true" CssClass="txtMessage" runat="server" Width="400px" Height="25px"/></td>
                        </tr>
                        <tr><td>متن پیام</td></tr>
                        <tr>
                            <td><asp:TextBox ID="txt_ContactMessage" ReadOnly="true" CssClass="txtMessage" runat="server" Height="100px" Width="600px" TextMode="MultiLine" Wrap="true"/></td>
                        </tr>
                        <tr><td>ایمیل فرستنده</td></tr>
                        <tr>
                            <td><asp:TextBox Visible="true" ID="txt_ContactEmail" CssClass="txtMessage email" ReadOnly="true" runat="server" Width="431px" Height="25px"/></td>
                        </tr>
                        <tr><td>پاسخ به پیام</td></tr>
                        <tr>                                        
                            <td><asp:TextBox ID="txt_Reply" CssClass="txtMessage" runat="server" /></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="button" id="btn_Send" value="ارسال پیام" class="submit" />
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

    /*******************************************************/

    function pageLoad(sender, args)
    {
//        if (args.get_isPartialLoad())
        //        {
        $('.MessageInfo_Show').click(function ()
        {
            var contact_ID = $(this).attr("id");
            setBlock();
            $.ajax({
                type: "POST",
                url: "ContactUs_InputMessage.aspx/GetContactMessageInfoByContactID",
                data: "{ contact_ID: '" + contact_ID + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response)
                {
                    var info = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
                    var txt_ContactTitle = $('#<%= txt_ContactTitle.ClientID %>');
                    var txt_ContactMessage = $('#<%= txt_ContactMessage.ClientID %>');
                    var txt_ContactEmail = $('#<%= txt_ContactEmail.ClientID %>');
                    var lbl_ContactID = $('#<%= lbl_ContactID.ClientID %>');
                    var editor = CKEDITOR.instances.ctl00_ContentPlaceHolder1_ContactUs_InputMessage1_txt_Reply;
                    editor.setData(info.ContactUs_Reply);
                    txt_ContactTitle.val(info.ContactUs_Title);
                    txt_ContactMessage.val(info.ContactUs_Message);
                    txt_ContactEmail.val(info.ContactUs_Email);
                    lbl_ContactID.text(info.ContactUs_ID);
                    //$("#dialog-form").dialog("open");
                    showModal();
//                    var editor_val = CKEDITOR.instances.ctl00_ContentPlaceHolder1_ContactUs_InputMessage1_txt_Reply.document.getBody().getChild(0).getText();
//                    alert(editor_val);
                    $("#btn_Send").css("display", (info.ContactUs_Reply != '')? "none" : "block");
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
        $('#btn_Send').click(function ()
        {
            setBlock();
            var ID = $('#<%= lbl_ContactID.ClientID %>').text();
            var Email = $('#<%= txt_ContactEmail.ClientID %>').val();
            var Subject = $('#<%= txt_ContactTitle.ClientID %>').val();
            var editor = CKEDITOR.instances.ctl00_ContentPlaceHolder1_ContactUs_InputMessage1_txt_Reply;
            var Reply = editor.getData();
            if (Reply == '')
            {
                $.unblockUI(); alert("لطفا متحواي پيام ارسالي را وارد نماييد"); return;
            }
            $.ajax({
                type: "POST",
                url: "ContactUs_InputMessage.aspx/ReplyEmail",
                data: "{ ID: '" + ID + "',Email: '" + Email + "',Subject: '" + Subject + "',Reply: '" + Reply + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response)
                {
                    $.unblockUI();
                   // __doPostBack('%= LinkButton1.ClientID %>', '');
                    alert("پيام شما ارسال گرديد.");
                },
                error: function (xhr, ajaxOptions, thrownError)
                {
                    $.unblockUI();
                    alert(xhr.status);
                    alert(thrownError);
                }
            });
        });
       // }
    }
    function Check_Click(objRef)
    {
        //Get the Row based on checkbox
        var row = objRef.parentNode.parentNode;
        if (objRef.checked)
        {
            //If checked change color to Green
            row.style.backgroundColor = "Green";
        }
        else
        {
            //If not checked change back to original color
            if (row.rowIndex % 2 == 0)
            {
                //Alternating Row Color
                row.style.backgroundColor = "#282828";
                objRef.style.color = "Lime";
            }
            else
            {
                row.style.backgroundColor = "282828";
                objRef.style.color = "Purple";
            }
        }
        //Get the reference of GridView
        var GridView = row.parentNode;
        //Get all input elements in Gridview
        var inputList = GridView.getElementsByTagName("input");
        for (var i = 0; i < inputList.length; i++)
        {
            //The First element is the Header Checkbox
            var headerCheckBox = inputList[0];
            //Based on all or none checkboxes
            //are checked check/uncheck Header Checkbox
            var checked = true;
            if (inputList[i].type == "checkbox" && inputList[i] != headerCheckBox)
            {
                if (!inputList[i].checked)
                {
                    checked = false; break;
                }
            }
        }
        headerCheckBox.checked = checked;
    }
    function checkAll(objRef)
    {
        var GridView = objRef.parentNode.parentNode.parentNode;
        var inputList = GridView.getElementsByTagName("input");
        for (var i = 0; i < inputList.length; i++)
        {
            //Get the Cell To find out ColumnIndex
            var row = inputList[i].parentNode.parentNode;
            if (inputList[i].type == "checkbox" && objRef != inputList[i])
            {
                if (objRef.checked)
                {
                    //If the header checkbox is checked
                    //check all checkboxes
                    //and highlight all rows
                    row.style.backgroundColor = "Green";
                    inputList[i].checked = true;
                }
                else
                {
                    //If the header checkbox is checked
                    //uncheck all checkboxes
                    //and change rowcolor back to original
                    if (row.rowIndex % 2 == 0)
                    {
                        //Alternating Row Color
                        row.style.backgroundColor = "#282828";
                        objRef.style.color = "Lime";
                    }
                    else
                    {
                        row.style.backgroundColor = "#282828";
                        objRef.style.color = "Purple";
                    }
                    inputList[i].checked = false;
                }
            }
        }
    }
    function MouseEvents(objRef, evt)
    {
        var checkbox = objRef.getElementsByTagName("input")[0];
        if (evt.type == "mouseover")
        {
                //Alternating Row Color
            objRef.style.backgroundColor = "#494545";
        }
        else
        {
            if (checkbox.checked)
            {
                objRef.style.backgroundColor = "#5AA200";
            }
            else if (evt.type == "mouseout")
            {
//                if (objRef.rowIndex % 2 == 0)
//                {
//                    //Alternating Row Color
//                    objRef.style.backgroundColor = "#282828";
//                    objRef.style.color = "White";
//                }
//                else
//           //     {
                    objRef.style.backgroundColor = "#282828";
                    objRef.style.color = "White";
          //      }
            }
        }
    }
</script>