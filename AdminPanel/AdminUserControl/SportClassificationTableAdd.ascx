<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportClassificationTableAdd.ascx.cs" Inherits="AdminPanel_AdminUserControl_SportClassificationTableAdd" %>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <fieldset>
                <legend style="color: #66FF33">تعریف عناوین جداول رده بندی</legend>
                <table>
                    <tr>
                        <td>
                            <div class="input_field">
                                <label>عنوان:</label>
                                <asp:TextBox ID="txt_Title" CssClass="customTxt medium" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="txt_Title" ErrorMessage="عنوان را تعیین نمائید" 
                                    ForeColor="Yellow" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </div> 
                            <div class="input_field no_margin_bottom">
                                <%--<asp:Button ID="btn_Save" Text="ثبت" CssClass="btn_Save submit" OnClientClick="btnSaveClick();" runat="server" onclick="btn_Save_Click1" /></button>--%>
                                <asp:Button ID="btn_Save" Text="ثبت" CssClass="btn_Save submit" OnClientClick="imagePath='<%= ImagePath %>';setBlock();" runat="server" onclick="btn_Save_Click" />
            <%--                    <input id="btn_Save" type="button" class="btn_Save submit" onClientClick="btnSaveClick()" value="ثبت" runat="server" />--%>
                                <input type="button" id="btn_New" class="submit" value="جدید" onclick="clearControlValue()" />
                                &nbsp;&nbsp;&nbsp;<asp:Label ID="lbl_Msg" CssClass="error" runat="server"></asp:Label>
                            </div>
                        </td>
                    </tr>
                </table>
            </fieldset>
        <fieldset>
            <asp:GridView ID="gv_ClassificationTable" runat="server"  AutoGenerateColumns="False" CssClass="GridViewStyle2"
            GridLines="None" Width="100%" EnableViewState="false" AllowSorting="true" HeaderStyle-CssClass="HeaderStyle" 
            PagerStyle-CssClass="PagerStyle" AllowPaging="True" PagerSettings-Mode="NumericFirstLast" onpageindexchanging="gv_ClassificationTable_PageIndexChanging">
                <Columns>
                    <asp:TemplateField HeaderText="ردیف">
                        <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_RowNumber" runat="server" Text='<%# PersianClass.getPersianNumberStyle(Container.DataItemIndex + 1) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="عنوان">
                        <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_Title" runat="server" Text='<%# Eval("ClassificationTable_Title") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="تاریخ ایجاد">
                        <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_CreationDate" runat="server" Text='<%# Eval("ClassificationTable_CreationDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
<%--                    <asp:TemplateField HeaderText="ایجادکننده">
                        <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_CreationAuthor" runat="server" Text='<%# Eval("ClassificationTable_CreationAuthorID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                </Columns>
                <EmptyDataTemplate>
                    <b>هیچ موردی یافت نشد</b>
                </EmptyDataTemplate>
            </asp:GridView>
        </fieldset>        
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btn_Save" EventName="Click" />
    </Triggers>
</asp:UpdatePanel>
<script type="text/javascript" language="javascript">
    function getImagePath() { return '<%= ImagePath %>'; } imagePath = getImagePath();
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_beginRequest(function () { setBlock(); });
    prm.add_endRequest(function () { $.unblockUI(); });
    function clearControlValue()
    {
        var title = document.getElementById('<%= txt_Title.ClientID %>');
        title.value = "";
        title.focus();
    }
//    function btnRefreshUpdatePanelJavascript_Click()
//    {
//        var pageRequestManager = Sys.WebForms.PageRequestManager.getInstance();
//        pageRequestManager._doPostBack('%= btn_Reload.ClientID %>', '');
//    }
   // $(document).ready(function ()
  //  {
        // $('input:button[id$=btn_Save]').click(function ()
//        function btnSaveClick()
//        {
//            var imagePath = getImagePath();
//            var title = $("input:text[id$=txt_Title]").val();
//            var logo = "فعلا هیچ";
//            var lblMsg = document.getElementById('<%=lbl_Msg.ClientID %>');
//            lblMsg.innerHTML = "";
//            if (title == "")
//            {
//                lblMsg.innerHTML = 'عنوان را وارد کنید';
//                $("input:text[id$=txt_Title]").focus();
//                return;
//            }
//            $.blockUI(
//                {
//                    message: '<h1><img src="' + imagePath + '/ajaxImages/loading2.gif" /><br /> چند لحظه منتظر بمانيد...</h1>',
//                    fadeIn: 700,
//                    fadeOut: 700,
//                    css: {
//                        border: 'none',
//                        padding: '5px',
//                        backgroundColor: 'transparent',
//                        '-webkit-border-radius': '10px',
//                        '-moz-border-radius': '10px',
//                        opacity: .6,
//                        color: '#fff'
//                    }
//                });
//            $.PageMethod('InsertClassificationTable', onSuccess, onFail, 'title', title, 'logo', logo);
//            function onSuccess(response)
//            {
//                // $.unblockUI();
//                //alert(response.d);
//                clearControlValue();
//                $('span[id$=lbl_Msg]').innerHTML = response.d;
//                //btnRefreshUpdatePanelJavascript_Click();
//                $.unblockUI();
//            }
//            function onFail(response)
//            {
//                $.unblockUI();
//                alert("خطای  : " + response.d);
//            }
//        }
  //  });
</script>