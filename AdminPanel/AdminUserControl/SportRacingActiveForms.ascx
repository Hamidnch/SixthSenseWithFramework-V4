<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportRacingActiveForms.ascx.cs" Inherits="AdminPanel_AdminUserControl_SportRacingActiveForms" %>
<%@ Register Assembly="MultiDropDown" Namespace="MultiDropDownLib" TagPrefix="MultiDropDownLib" %>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <fieldset>
            <legend>فرمهای فعال مسابقات</legend>
            <table style="width: 100%">
                <tr>
                    <td>
                        <div style="float:right;padding: 5px 10px;">
                            <span style="color:Window"> شماره مسابقه : </span>
                            <asp:DropDownList ID="ddl_RacingInfoID" runat="server" Height="30px" Width="230px" onselectedindexchanged="ddl_RacingInfoID_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        </div>
                        <div style="float:right;padding: 5px 10px;">
                            <span >نام مسابقه: </span>
                            <asp:Label ID="lbl_RaceTitle" runat="server" Text="...." ForeColor="Lime" Font-Bold="true"></asp:Label>
                        </div>
                    </td>
                    <td>
                        <div style="float: right">
                            <span>انتخاب کاربران: </span>
                            <MultiDropDownLib:MultiDropDown ID="ddl_Users" runat="server" TextBoxClass="textbox1" ImageButtonClass="imagebutton1" TooltipClass="tooltip1" DropdownClass="dropdown1 drp1" />  
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btn_Search" runat="server" Text="جستجو" CssClass="submit" onclick="btn_Search_Click" />
                        <asp:Button ID="btn_Referesh" runat="server" Text="تازه سازی"  CssClass="submit" onclick="btn_Referesh_Click" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="gv_RacingActiveForms" ShowFooter="True" 
                AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" runat="server" GridLines="None" 
                CssClass="GridViewStyle" PagerStyle-CssClass="PagerStyle" HeaderStyle-CssClass="HeaderStyle" AllowPaging="True" AllowSorting="True" 
                onpageindexchanging="gv_RacingActiveForms_PageIndexChanging" PageSize="10" onrowcommand="gv_RacingActiveForms_RowCommand">
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />                                
                <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="RowStyle"/>
                <Columns> 
                        <asp:TemplateField HeaderText="شماره">
                            <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>    
                                <asp:Label ID="lbl_RowIndex" runat="server" Text='<%# Container.DataItemIndex + 1%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="شماره مسابقه">
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>    
                                <asp:Label ID="lbl_RacingInfo_ID" runat="server" Text='<%# Eval("RacingInfo_ID", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="نام کاربری">
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>    
                                <asp:Label ID="lbl_Member_UserName" runat="server" Text='<%# Eval("Member_UserName", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="شماره فرم">
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>    
                                <asp:Label ID="lbl_Form_ID" runat="server" Text='<%# Eval("Form_ID", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="عنوان مسابقه">
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>    
                                <asp:Label ID="lbl_Race_Title" runat="server" Text='<%# Eval("Race_Title", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="مبلغ فرم">
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>    
                                <asp:Label ID="lbl_Form_Amount" runat="server" Text='<%# PersianClass.getPersianNumberStyle(Eval("Form_Amount", "{0:n0}")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>   
                        <asp:TemplateField HeaderText="تاریخ ایجاد">
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_Form_CreationDate" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("Form_CreationDate", "{0}"), "D", true, "H") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="تاریخ ویرایش">
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_Form_LastUpdate" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("Form_LastUpdate", "{0}"), "D", true, "H") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText=" نمایش فرم " HeaderStyle-Font-Size="8pt" HeaderStyle-Font-Bold="false"
                            HeaderStyle-Font-Names="Tahoma">
                            <ItemTemplate>
                                <asp:ImageButton ID="img_Show" runat="server" CommandArgument='<%# Eval("Form_ID") %>'
                                    CommandName="form_Show" AlternateText='<%# Eval("Form_ID", "{0}") %>' ImageUrl="~/Images/ajaxImages/Show.png"></asp:ImageButton>
                            </ItemTemplate>
                            <HeaderStyle Font-Bold="False" Font-Names="Tahoma" Font-Size="8pt" />
                        </asp:TemplateField>                                                                                                                                                                                                                          
                </Columns>
                <EmptyDataTemplate>
                    <span>موردی یافت نشد</span>
                </EmptyDataTemplate>
                <EmptyDataRowStyle BackColor="#333333" ForeColor="Yellow" VerticalAlign="Middle" HorizontalAlign="Center" Font-Names="Tahoma" />
                </asp:GridView>
        </fieldset>
        <div id="divFormShow" aria-labelledby="ui-dialog-title-dialog-form" role="dialog"
            tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
            style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: auto;
            width: 800px; top: 82px; left: 460px;">
            <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
                <span id="ui-dialog-title-dialog-form" class="ui-dialog-title">نمایش فرم جاری</span><a role="button"
                    class="ui-dialog-titlebar-close ui-corner-all" href="#"><span class="ui-icon ui-icon-closethick" id="close">بستن</span></a></div>
            <div style="width: auto; min-height: 0px; height: auto" class="ui-dialog-content ui-widget-content" id="dialog-form">
                <form id="frm_FormShow">
                    <fieldset>
                        <legend id="formID" runat="server"></legend>
                        <asp:GridView ID="gv_Racing" AutoGenerateColumns="False" runat="server"
                        CellPadding="4" GridLines="Horizontal" CssClass="racing_Grid">
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <AlternatingRowStyle BackColor="#E7EAF1" />
                        <RowStyle BackColor="#EFF3FB" />
                        <Columns>
                            <asp:TemplateField HeaderText="ردیف">
                                <ItemStyle Width="5%"/>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_GameID" ForeColor="Purple" runat="server" Text='<%# Eval("FormInfo_GameID", "{0}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="تیم میزبان">
                                <ItemStyle Width="15%"/>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_HostTeamID" runat="server" Text='<%# Eval("FormInfo_HostTeamID", "{0}") %>'
                                        Visible="false"></asp:Label>
                                    <asp:Label ID="lbl_HostTeam" ForeColor="Purple" runat="server" Text='<%# Eval("HostTeam", "{0}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CheckBoxField HeaderText="برد میزبان" DataField="FormInfo_IsHostWin"/>
                            <asp:CheckBoxField HeaderText="مساوی" DataField="FormInfo_IsEqualGame" />
                            <asp:CheckBoxField HeaderText="برد میهمان" DataField="FormInfo_IsGuestWin"/>
                            <asp:TemplateField HeaderText="تیم میهمان">
                                <ItemStyle Width="15%"/>
                                <ItemTemplate>
                                    <asp:Label ID="lbl_GuestTeamID" runat="server" Text='<%# Eval("FormInfo_GuestTeamID", "{0}") %>'
                                        Visible="false"></asp:Label>
                                    <asp:Label ID="lbl_GuestTeam" ForeColor="Purple" runat="server" Text='<%# Eval("GuestTeam", "{0}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </fieldset>
            </form>
        </div>
        <%--            <div class="ui-resizable-handle ui-resizable-n"></div><div class="ui-resizable-handle ui-resizable-e"></div><div class="ui-resizable-handle ui-resizable-s"></div><div class="ui-resizable-handle ui-resizable-w"></div><div style="z-index: 1001;" class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se"></div><div style="z-index: 1002;" class="ui-resizable-handle ui-resizable-sw"></div><div style="z-index: 1003;" class="ui-resizable-handle ui-resizable-ne"></div><div style="z-index: 1004;" class="ui-resizable-handle ui-resizable-nw"></div>--%>
    <div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix"></div>
</div>  
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btn_Search" EventName="Click" />
        <asp:AsyncPostBackTrigger ControlID="btn_Referesh" EventName="Click" />
    </Triggers>
</asp:UpdatePanel>          

<script type="text/javascript">
    function getImagePath() { return '<%= ImagePath %>'; } var imagePath = getImagePath();
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
                        backgroundColor: 'transparent',
                        '-webkit-border-radius': '10px',
                        '-moz-border-radius': '10px',
                        opacity: .6,
                        color: '#fff'
                    }
                });
            }
            $(document).ready(function ()
            {
                var pbControl = null;
                var prm = Sys.WebForms.PageRequestManager.getInstance();
                prm.add_beginRequest(function (sender, args)
                {
                    pbControl = args.get_postBackElement();  //the control causing the postback
                    pbControl.disabled = true;
                    setBlock();
                });
                prm.add_endRequest(function (sender, args)
                {
                    pbControl.disabled = false;
                    pbControl = null;
                    $.unblockUI();
                });
            });
</script>