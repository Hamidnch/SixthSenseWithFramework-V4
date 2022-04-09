<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportInitialRacing.ascx.cs" Inherits="AdminPanel_AdminUserControl_SportInitialRacing" %>
<%@ Register Assembly="PersianDatePickup" Namespace="PersianDatePickup" TagPrefix="pcal" %>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <fieldset>
            <legend>نمایش مسابقات بدون جریان</legend>
            <asp:GridView ID="gv_InitialRacing" ShowFooter="True" 
                AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" runat="server" GridLines="None" 
                CssClass="GridViewStyle" PagerStyle-CssClass="PagerStyle" 
                HeaderStyle-CssClass="HeaderStyle" AllowPaging="True" AllowSorting="True" 
                onpageindexchanging="gv_InitialRacing_PageIndexChanging" 
                onrowcommand="gv_InitialRacing_RowCommand">
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />                                
                <PagerStyle CssClass="PagerStyle" />
                <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="RowStyle"/>
                <Columns> 
                        <asp:TemplateField HeaderText="ردیف">
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
                        <asp:TemplateField HeaderText="عنوان مسابقه">
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>    
                                <asp:Label ID="lbl_RaceTitle" runat="server" Text='<%# Eval("Race_Title", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="جزئیات مسابقه">
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>    
                                <asp:Label ID="lbl_RacingInfo_Details" runat="server" Text='<%# Eval("RacingInfo_Details", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="نام کشور">
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>    
                                <asp:Label ID="lbl_CountryName" runat="server" Text='<%# Eval("Country_Name", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    <asp:TemplateField HeaderText="نمایش جزئیات">
                        <ItemStyle Width="10%" />
                        <ItemTemplate>
                            <asp:ImageButton ID="img_Show" CausesValidation="false" runat="server" CommandArgument='<%# Eval("RacingInfo_ID") %>'
                                CommandName="InitialRacing_Show" AlternateText='<%# Eval("RacingInfo_ID", "{0}") %>' ImageUrl="~/Images/ajaxImages/Show.png"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateField>                                                                                                                                                                                                              
                </Columns>
                <EmptyDataTemplate>
                    <span>موردی یافت نشد</span>
                </EmptyDataTemplate>
                <EmptyDataRowStyle BackColor="#333333" ForeColor="Yellow" VerticalAlign="Middle" HorizontalAlign="Center" Font-Names="Tahoma" />
            </asp:GridView>
        </fieldset>
        <div id="div_RacingDetailsmShow" aria-labelledby="ui-dialog-title-dialog-form" role="dialog"
            tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
            style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: auto;
            width: auto; top: 82px; left: 460px;">
            <div id="titlebar" class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
                <span id="ui-dialog-title-dialog-form" class="ui-dialog-title">نمایش جزئیات مسابقه جاری</span><a role="button"
                    class="ui-dialog-titlebar-close ui-corner-all" href="#"><span class="ui-icon ui-icon-closethick" id="close">بستن</span></a></div>
            <div style="width: auto; min-height: 0px; height: auto" class="ui-dialog-content ui-widget-content" id="dialog-form">
                <form id="frm_RacingDetailsShow">
                    <fieldset>
                        <legend id="racingInfoID" runat="server"></legend>
                        <asp:Panel ID="pnl_RacingInfo" runat="server" Enabled="false">
                            <table>
                                <tr style="width:100%">
                                    <td>
                                        <label class="field_desc">عنوان مسابقه:</label><br />
<%--                                        <asp:DropDownList ID="ddl_RacingTitle" CssClass="txtPickup inputControl" Width="180px" runat="server"></asp:DropDownList><br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddl_RacingTitle"
                                            ErrorMessage="*" ForeColor="Yellow" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                        <asp:TextBox ID="txt_RacingTitle" runat="server" Width="200px" CssClass="customTxt inputControl"></asp:TextBox>                                        
                                    </td>
                                    <td>
                                        <label class="field_desc">جزئیات مسابقه:</label><br />
                                        <asp:TextBox ID="txt_RacingDetails" runat="server" Width="200px" CssClass="customTxt inputControl"></asp:TextBox><br />
<%--                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_Details" runat="server" ControlToValidate="txt_RacingDetails"
                                            ErrorMessage="*" ForeColor="Yellow" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                    </td>
                                    <td>
                                        <label class="field_desc">نام کشور:</label><br />
<%--                                        <asp:DropDownList ID="ddl_RacingCountry" Width="190px" CssClass="txtPickup inputControl" runat="server"></asp:DropDownList><br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddl_RacingCountry"
                                            ErrorMessage="*" ForeColor="Yellow" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                        <asp:TextBox ID="txt_RacingCountry" runat="server" Width="200px" CssClass="customTxt inputControl"></asp:TextBox><br />
                                    </td>
                                </tr>
                                <tr><td colspan="3" class="newLine"><hr /></td></tr>
                                <tr>
                                    <td class="cell" style="width:45%">                                 
                                        <fieldset>
                                            <legend>تاریخ شروع و پایان بازیها</legend>
                                            <div style="width:150px;height:120px; float:right; text-align: right">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <label class="field_desc">تاریخ شروع:</label>
                                                            <asp:TextBox ID="txt_RacingStartDate" CssClass="customTxt inputControl" Width="45px" runat="server" />  
                                                        </td>                                                    
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label class="field_desc">تاریخ پایان:</label>
                                                            <asp:TextBox ID="txt_RacingEndDate" CssClass="customTxt inputControl" Width="45px" runat="server" />                                              
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>    
                                        </fieldset>
                                    </td>
                                    <td colspan="2" class="cell" style="width:45%">                                 
                                        <fieldset>
                                            <legend>شروع و پایان مهلت پیش بینی</legend>
                                            <div style="width:300px;height:120px; float:right; text-align: right">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <label class="field_desc">تاریخ شروع مهلت:</label>
                                                            <asp:TextBox ID="txt_StartRespiteDate" CssClass="customTxt inputControl" Width="45px" runat="server" />                                              
                                                        </td>
                                                        <td>
                                                            <span class="field_desc">ساعت شروع مهلت:</span>
                                                            <asp:TextBox ID="txt_StartRespiteTime" CssClass="customTxt inputControl" runat="server" Width="45px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label class="field_desc">تاریخ پایان مهلت:</label>
                                                            <asp:TextBox ID="txt_EndRespiteDate" CssClass="customTxt inputControl" Width="45px" runat="server" />
                                                        </td>
                                                        <td>
                                                            <span class="field_desc">ساعت پایان مهلت:</span>
                                                            <asp:TextBox ID="txt_EndRespiteTime" CssClass="customTxt inputControl" runat="server" Width="45px"></asp:TextBox>
                                                            <asp:Label ID="lbl_Country_ID" Text="-1" runat="server" Visible="false"/>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>   
                                        </fieldset>
                                    </td>                                               
                                </tr>
                            </table>                    
                        </asp:Panel>
                    </fieldset>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <fieldset>
                                <asp:GridView ID="gv_RacingGames" ShowHeader="true" ShowFooter="true" 
                                    AutoGenerateColumns="false" ShowHeaderWhenEmpty="true"
                                    runat="server" GridLines="None" CssClass="GridViewStyle" PageSize="6"
                                    HeaderStyle-CssClass="HeaderStyle" PagerStyle-CssClass="PagerStyle" 
                                    AllowPaging="True" onpageindexchanging="gv_RacingGames_PageIndexChanging"
                                    OnRowDataBound="gv_RacingGames_RowDataBound" DataKeyNames="Racing_RacingInfoID"
                                   OnRowEditing="gv_RacingGames_RowEditing" OnRowCancelingEdit="gv_RacingGames_CancelingEdit" OnRowUpdating="gv_RacingGames_RowUpdating">
                                <%--<HeaderStyle ForeColor="#ffcc00" BackColor="#161616" VerticalAlign="Middle" HorizontalAlign="Center" BorderColor="#333333" BorderStyle="Solid" BorderWidth="1" />--%>
                                    <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="RowStyle"/> 
                                    <Columns>
                                        <asp:TemplateField HeaderText="شماره">
                                            <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <ItemTemplate>    
                                                <asp:Label ID="lbl_GameID" runat="server" Text='<%# Eval("Racing_GameID")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="تیم میزبان">
                                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <ItemTemplate>    
                                                <asp:Label ID="lbl_HostTeam" runat="server" Text='<%# Eval("HostTeam")%>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="ddl_HostTeam" CssClass="customTxt" Width="100px" runat="server">
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="تیم میهمان">
                                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <ItemTemplate>    
                                                <asp:Label ID="lbl_GuestTeam" runat="server" Text='<%# Eval("GuestTeam")%>'></asp:Label>                                            
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="ddl_GuestTeam" CssClass="customTxt" Width="100px" runat="server">
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="تاریخ بازی">
                                            <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_Racing_GameDate" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("Racing_GameDate","{0}"), "D", false) %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
<%--                                                <asp:TextBox ID="txt"  Text='<%# PersianClass.getPersiaDate(Eval("Racing_GameDate","{0}"), "D", false) %>'  runat="server" />--%>
                                                <pcal:PersianDatePickup ID="pdp_RacingGameDate" runat="server" CssClass="txtPickup" ReadOnly="True"></pcal:PersianDatePickup>
                                            </EditItemTemplate>                                    
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="زمان بازی">
                                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <ItemTemplate>    
                                                <asp:Label ID="lbl_Racing_GameTime" runat="server" Text='<%# Eval("Racing_GameTime")%>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txt_Racing_GameTime" Text='<%# Eval("Racing_GameTime")%>' runat="server" CssClass="txtTime" Width="45px" />
                                                        <Ajax:MaskedEditExtender ID="MaskedEditExtender3" runat="server" Enabled="True"
                                                            Mask="99:99" MaskType="Time" TargetControlID="txt_Racing_GameTime">
                                                        </Ajax:MaskedEditExtender>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="محل بازی">
                                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <ItemTemplate>    
                                                <asp:Label ID="lbl_Racing_GameLocation" runat="server" Text='<%# Eval("Racing_GameLocation")%>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txt_Racing_GameLocation" Text='<%# Eval("Racing_GameLocation")%>' runat="server" />
                                            </EditItemTemplate>
                                        </asp:TemplateField>
<%--                                        <asp:CommandField ShowEditButton="true" EditText="ویرایش" UpdateText="ثبت"
                                            CancelText="لغو" ControlStyle-Font-Underline="false" ControlStyle-Font-Bold="false"
                                            ControlStyle-Font-Names="Tahoma" ControlStyle-Font-Size="8pt" ControlStyle-ForeColor="Lime" 
                                            ControlStyle-Width="25%" ButtonType="Image"
                                            CancelImageUrl="~/Images/ajaxImages/cancel.png" 
                                            EditImageUrl="~/Images/ajaxImages/edit.png" 
                                            UpdateImageUrl="~/Images/ajaxImages/save.png" >  <ItemStyle Width="25%" />
                                        </asp:CommandField>--%>
                                    </Columns>                                                               
                                </asp:GridView>
                            </fieldset>                        
                        </ContentTemplate>
                    </asp:UpdatePanel>                    
                </form>
            </div>
                <%--<div class="ui-resizable-handle ui-resizable-n"></div><div class="ui-resizable-handle ui-resizable-e"></div><div class="ui-resizable-handle ui-resizable-s"></div><div class="ui-resizable-handle ui-resizable-w"></div><div style="z-index: 1001;" class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se"></div><div style="z-index: 1002;" class="ui-resizable-handle ui-resizable-sw"></div><div style="z-index: 1003;" class="ui-resizable-handle ui-resizable-ne"></div><div style="z-index: 1004;" class="ui-resizable-handle ui-resizable-nw"></div>--%>
            <div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix"></div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>  
<script type="text/javascript">
    function getImagePath() { return '<%= ImagePath %>'; } var imagePath = getImagePath();
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_beginRequest(function () { setBlock(); });
    prm.add_endRequest(function () { $.unblockUI(); });
</script>