<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserManagement.ascx.cs" Inherits="AdminPanel_AdminUserControl_UserManagement" %>
<link href="../AdminStyls/CSSGrid.css" rel="stylesheet" type="text/css" />
<link href="../AdminStyls/Modal/dark-hive/jquery-ui-1.8.5.custom.css" rel="stylesheet" type="text/css" />
<asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="false" 
    AsyncPostBackTimeout="360000"></asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <fieldset>
        <asp:DropDownList ID="ddlSearchTypes" runat="server" CssClass="DropDownList" Width="100px">
            <asp:ListItem Selected="True" Text="نام کاربری" Value="UserName"></asp:ListItem>
            <asp:ListItem Text="ایمیل" Value="E-mail"></asp:ListItem>
        </asp:DropDownList>
        شامل
        <asp:TextBox ID="txtSearchText" runat="server" CssClass="customTxt meduim" EnableViewState="false"
            ontextchanged="txtSearchText_TextChanged"></asp:TextBox>&nbsp;
        <asp:Button ID="btnSearch" runat="server" CssClass="btnUser" Text="جستجو" ValidationGroup="1111"
            OnClick="btnSearch_Click" EnableViewState="false" />
    </fieldset>
    <fieldset>                                    
        <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" CssClass="GridViewStyle"
            DataKeyNames="Member_UserName" GridLines="None" Width="100%" EnableViewState="false"
            AllowSorting="True" OnSorting="gvUsers_Sorting" HeaderStyle-CssClass="HeaderStyle"
            PagerStyle-CssClass="PagerStyle" OnRowCreated="gvUsers_RowCreated"
            OnRowEditing="gvUsers_RowDeleting" OnRowCommand="gvUsers_RowCommand" 
            AllowPaging="True" onpageindexchanging="gvUsers_PageIndexChanging" PagerSettings-Mode="NumericFirstLast">
            <PagerSettings FirstPageText="صفحه نخست" LastPageText="صفحه پایان" PageButtonCount="5"
                Position="Bottom" Visible="true"/>
            <PagerStyle CssClass="PagerStyle" />
        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="RowStyle"/>
        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        <Columns>
            <asp:TemplateField HeaderText="ردیف">
                <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                <ItemTemplate>
                    <asp:Label ID="lbl_RowNumber" runat="server" Text='<%# PersianClass.getPersianNumberStyle(Container.DataItemIndex + 1) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="نام کاربری" SortExpression="Member_UserName">
                <ItemStyle Width="25%" VerticalAlign="Middle" HorizontalAlign="Center"/>
                <ItemTemplate>
                    <asp:Label ID="lbl_MemberID" runat="server" Text='<%# Bind("Member_ID") %>' Visible="false"></asp:Label>
                    <asp:HyperLink ID="hl_UserName" runat="server" Font-Bold="True" NavigateUrl='<%# Eval("Member_UserName", "~/ShowProfile.aspx?uid={0}") %>'
                        Text='<%# Bind("Member_UserName") %>'>
                    </asp:HyperLink>
                </ItemTemplate>                            
            </asp:TemplateField>
            <asp:TemplateField HeaderText="نوع کاربری" SortExpression="Role_Name">
                <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"/>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddl_Roles" runat="server">
                        <asp:ListItem Text="كاربر عادي" Selected="True" Value="1"></asp:ListItem>
                        <asp:ListItem Text="مدير سيستم" Selected="False" Value="2"></asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbl_RoleName" runat="server" Text='<%# Bind("Role_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ايميل" SortExpression="Member_Email">
                <ItemStyle Width="20%" CssClass="Date" VerticalAlign="Middle" HorizontalAlign="Center"/>
                <ItemTemplate>
                    <asp:Label ID="lbl_Email" runat="server" Text='<%# Bind("Member_Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="تاریخ ایجاد" SortExpression="Member_RegistrationDate">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" CssClass="Date" />
                <ItemTemplate>
                    <asp:Label ID="lbl_RegistrationDateDate" runat="server" Text='<%# PersianClass.getPersianNumberStyle(PersianClass.getPersiaDate(Eval("Member_RegistrationDate", "{0}"), "L", true, "H")) %>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="آخرین فعالیت" SortExpression="Member_LastLoginDate">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" CssClass="Date" />
                <ItemTemplate>
                    <asp:Label ID="lbl_LastLoginDate" runat="server" Text='<%# PersianClass.getPersianNumberStyle(PersianClass.getPersiaDate(Eval("Member_LastLoginDate", "{0}"), "L", true, "H")) %>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="Member_IsActive" HeaderText="فعال">
                <ItemStyle HorizontalAlign="Center" Width="5%" VerticalAlign="Middle"/>
            </asp:CheckBoxField>
            <asp:TemplateField HeaderText="پروفایل">
                <ItemTemplate>
                    <asp:ImageButton CommandArgument='<%# Eval("Member_UserName") %>' ID="ImgButton" runat="server"
                        CommandName="Select" ImageUrl="~/Images/ajaxImages/game.png" AlternateText="برندگان" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Image" 
                DeleteImageUrl="~/Images/ajaxImages/delete.png" ShowDeleteButton="True" />
<%--        <asp:TemplateField HeaderText="فعال">
                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                <ItemTemplate>
                    <asp:CheckBox ID="chk_IsActive" Checked="true" runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:CheckBox ID="chk_IsActive" Checked="true" runat="server" />
                </EditItemTemplate>
            </asp:TemplateField>--%>
        </Columns>                      
        <EmptyDataTemplate>
            <b>هیچ کاربری یافت نشد</b>
        </EmptyDataTemplate>
    </asp:GridView>
    </fieldset>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
    </Triggers>
</asp:UpdatePanel>

<div id="divRacingResult" aria-labelledby="ui-dialog-title-dialog-form" role="dialog"
    tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
    style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: auto;
    width: 800px; top: 82px; left: 460px;">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
        <span id="ui-dialog-title-dialog-form" class="ui-dialog-title">ویرایش</span><a role="button"
            class="ui-dialog-titlebar-close ui-corner-all" href="#"><span class="ui-icon ui-icon-closethick">بستن</span></a></div>
    <div style="width: auto; min-height: 0px; height: auto" class="ui-dialog-content ui-widget-content"
        id="dialog-form">
<%--        <form id="frm_UserProfile">--%>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <fieldset>
                        <div style="float:right; width:65%;">
                            <table>
                                <tr>
                                    <td style="width: 133px">
                                        <label for="mf">
                                            نام کاربری:
                                        </label>
                                    </td>
                                    <td style="width: 294px">
                                        <asp:Label ID="lbl_UserName" CssClass="field_desc" ForeColor="Lime" Font-Bold="true" runat="server" Text="..."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 133px">
                                        نام:
                                    </td>
                                    <td style="width: 294px">
                                        <asp:Label ID="lbl_FirstName" CssClass="field_desc" runat="server" Text="..."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 133px">
                                        نام خانوادگی:
                                    </td>
                                    <td style="width: 294px">
                                        <asp:Label ID="lbl_LastName" CssClass="field_desc" runat="server" Text="..."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 133px">
                                        ایمیل:
                                    </td>
                                    <td style="width: 294px">
                                        <asp:Label ID="lbl_Email" CssClass="field_desc" runat="server" Text="..."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 133px">
                                        جنسیت:
                                    </td>
                                    <td style="width: 294px">
                                        <asp:Label ID="lbl_Sex" CssClass="field_desc" runat="server" Text="..."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 133px">
                                        تاریخ تولد:
                                    </td>
                                    <td style="width: 294px">
                                        <asp:Label ID="lbl_BirthDay" CssClass="field_desc" runat="server" Text="..."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 133px">
                                        تلفن تماس:
                                    </td>
                                    <td style="width: 294px">
                                        <asp:Label ID="lbl_Phone" CssClass="field_desc" runat="server" Text="..."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 133px">
                                        موبایل:
                                    </td>
                                    <td style="width: 294px">
                                        <asp:Label ID="lbl_Mobile" CssClass="field_desc" runat="server" Text="..."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 133px">
                                        آدرس:
                                    </td>
                                    <td style="width: 294px">
                                        <asp:Label ID="lbl_Address" CssClass="field_desc" runat="server" Text="..."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 133px">
                                        نام کشور:
                                    </td>
                                    <td style="width: 294px">
                                        <asp:Label ID="lbl_Country" CssClass="field_desc" runat="server" Text="..."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 133px">
                                        محل سکونت:
                                    </td>
                                    <td style="width: 294px">
                                        <asp:Label ID="lbl_City" CssClass="field_desc" runat="server" Text="..."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 133px">
                                        نام صاحب حساب:
                                    </td>
                                    <td style="width: 294px">
                                        <asp:Label ID="lbl_AccountName" CssClass="field_desc" runat="server" Text="..."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 133px">
                                        نام خانوادگی صاحب حساب:
                                    </td>
                                    <td style="width: 294px">
                                        <asp:Label ID="lbl_AccountFamily" CssClass="field_desc" runat="server" Text="..."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 133px">
                                        شماره حساب:
                                    </td>
                                    <td style="width: 294px">
                                        <asp:Label ID="lbl_AccountNumber" CssClass="field_desc" runat="server" Text="..."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 133px">
                                        بانک محل واریز:
                                    </td>
                                    <td style="width: 294px">
                                        <asp:Label ID="lbl_BankName" CssClass="field_desc" runat="server" Text="..."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 133px">
                                        آدرس یاهو:
                                    </td>
                                    <td style="width: 294px">
                                        <asp:Label ID="lbl_Yahoo" CssClass="field_desc" runat="server" Text="..."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 133px">
                                        آدرس سایت:
                                    </td>
                                    <td style="width: 294px">
                                        <asp:Label ID="lbl_WebSite" CssClass="field_desc" runat="server" Text="..."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 133px">
                                        تاریخ عضویت:
                                    </td>
                                    <td style="width: 294px">
                                        <asp:Label ID="lbl_RegDate" CssClass="field_desc" runat="server" Text="..."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 133px">
                                        تاریخ آخرین ورود:
                                    </td>
                                    <td style="width: 294px">
                                        <asp:Label ID="lbl_LastLoginDate" CssClass="field_desc" runat="server" Text="..."></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div style="float:left;width:30%" class="field_desc">
                            <asp:Image ID="img_User" runat="server" Width="200px" Height="240px" />
                        </div>
                     </fieldset>
                </ContentTemplate>
            </asp:UpdatePanel>
<%--        </form>--%>
    </div>
    <div class="ui-resizable-handle ui-resizable-n"></div><div class="ui-resizable-handle ui-resizable-e"></div><div class="ui-resizable-handle ui-resizable-s"></div><div class="ui-resizable-handle ui-resizable-w"></div><div style="z-index: 1001;" class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se"></div><div style="z-index: 1002;" class="ui-resizable-handle ui-resizable-sw"></div><div style="z-index: 1003;" class="ui-resizable-handle ui-resizable-ne"></div><div style="z-index: 1004;" class="ui-resizable-handle ui-resizable-nw"></div><div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix"></div>
</div>
<script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
<script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script>
<script src="../Scripts/jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
    var prm = Sys.WebForms.PageRequestManager.getInstance(); prm.add_pageLoading(onPageLoading);
    function onPageLoading(sender, args) { var gv = $get('<%= gvUsers.ClientID %>'); gv.parentNode.removeChild(gv); }
    function getImagePath() { return '<%= ImagePath %>'; } var imagePath = getImagePath();
    function setBlock()
    {
        $.blockUI({ message: '<h4 style="font-family:tahoma;color:lime"><img src="' + imagePath + '/ajaxImages/loading_User.gif" /><br /><br />  درحال انجام عملیات... </h4>',
            fadeIn: 1000, fadeOut: 1000, centerX: true, centerY: true, css: { border: 'none', padding: '5px', backgroundColor: 'transparent', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .6, color: '#000'}
        });
    }
    prm.add_beginRequest(function () { setBlock(); });
    prm.add_endRequest(function () { $.unblockUI(); });
    $(document).ready(function ()
    {
        $("#dialog:ui-dialog").dialog("destroy"); $("#dialog-form").dialog({
            autoOpen: false, resizable: false, height: 'auto', width: 800, resizable: false, direction: 'rtl',
            show: 'clip', hide: 'clip', stack: true, position: 'center', title: 'نمایش پروفایل', modal: true
        }); $('.submit').click(function () { $("#dialog-form").dialog("close"); });
    });
</script>
