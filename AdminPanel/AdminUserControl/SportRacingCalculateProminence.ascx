<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportRacingCalculateProminence.ascx.cs" Inherits="AdminPanel_AdminUserControl_SportRacingCalculateProminence" %>
<asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="36000"></asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <fieldset>
            <table style="width: 100%">
                <tr>
                    <td><span style="color:#fff; font-size:20px"> امتیازبندی فرمهای یک مسابقه خاص و نمایش برندگان آن</span><br /><br /></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <span style="color:Window">شناسه مسابقه مورد نظر خود را انتخاب نمائید  : </span>
                        <asp:DropDownList ID="ddl_RacingInfoID" runat="server" Height="30px" Width="230px" onselectedindexchanged="ddl_RacingInfoID_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                        
                        <span>نام مسابقه: </span>
                        <asp:Label ID="lbl_RaceTitle" runat="server" Text="...." ForeColor="Lime" Font-Bold="true"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <fieldset>
                            <span style="color:#ffcc00" id="lbl_Note" runat="server" visible="false">
                            درصورتیکه تمایل به حذف یک بازی دارید،نتایج مربوط به آن بازی را الزاما و ضرورتا -5 قرار دهید.
                            </span>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                     <fieldset id="fld_RacingResult" runat="server" visible="false" style="border:2px solid white">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gv_RacingResult" runat="server" AutoGenerateColumns="False" AllowPaging="false"
                                    CellPadding="4" ForeColor="Lime" GridLines="None" ShowFooter="True" DataKeyNames="Racing_RacingInfoID" 
                                    OnRowEditing="gv_RacingResult_RowEditing" OnRowCancelingEdit="gv_RacingResult_CancelingEdit" OnRowUpdating="gv_RacingResult_RowUpdating"
                                    CssClass="GridViewStyle" HeaderStyle-CssClass="HeaderStyle" PagerStyle-CssClass="PagerStyle"
                                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                                    <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="RowStyle" />
<%--                                    <HeaderStyle Height="30px" BackColor="#1d1d1d" Font-Bold="True" ForeColor="Lime"
                                        VerticalAlign="Middle" HorizontalAlign="Center" />--%>
                                    <Columns>
                                        <asp:TemplateField HeaderText="شماره">
                                            <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <HeaderStyle CssClass="header_Grid" />
                                            <ItemTemplate>            
                                                <asp:Label ID="lbl_GameID" runat="server" Text='<%# Eval("Racing_GameID", "{0}") %>' ForeColor="Window"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="تیم میزبان">
                                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <HeaderStyle CssClass="header_Grid" />
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_HostTeam" runat="server" Text='<%# Eval("HostTeam", "{0}") %>' ForeColor="Window"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="تیم میهمان">
                                            <HeaderStyle CssClass="header_Grid" />
                                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_GuestTeam" runat="server" Text='<%# Eval("GuestTeam", "{0}") %>' ForeColor="Window"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="تاریخ بازی">
                                            <HeaderStyle CssClass="header_Grid" />
                                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_GameDate" runat="server" Text='<%# PersianClass.getPersianNumberStyle(PersianClass.getPersiaDate(Eval("Racing_GameDate", "{0}"), "L", false)) %>'
                                                    ForeColor="Window"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="زمان بازی">
                                            <HeaderStyle CssClass="header_Grid" />
                                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_GameTime" runat="server" Text='<%# PersianClass.getPersianNumberStyle(Eval("Racing_GameTime", "{0}")) %>'
                                                    ForeColor="Window"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="نتیجه">
                                            <HeaderStyle CssClass="header_Grid" />
                                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center"/>
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_GameStatus" runat="server" Text='<%# Eval("Racing_GameStatus", "{0}") %>' ForeColor="#ffcc00"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="میزبان">
                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_HostResult" Text='<%# Eval("Racing_GameHostGoal", "{0}") %>'
                                                    runat="server" ForeColor="#ffcc00"></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txt_HostResult" runat="server" CssClass="txt_Result" Text='<%# Eval("Racing_GameHostGoal", "{0}") %>'  onkeypress='javascript:return OnlyNumberSign(event, this)' MaxLength="2">
                                                </asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="میهمان">
                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_GuestResult" Text='<%# Eval("Racing_GameGuestGoal", "{0}") %>' ForeColor="#ffcc00" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>                                                
                                                <asp:TextBox ID="txt_GuestResult" runat="server" CssClass="txt_Result" Text='<%# Eval("Racing_GameGuestGoal", "{0}") %>'  onkeypress='javascript:return OnlyNumberSign(event, this)' MaxLength="2">
                                                </asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>                                                  
                                        <asp:CommandField ShowEditButton="true" HeaderText="ویرایش" ItemStyle-HorizontalAlign="Center"  ItemStyle-VerticalAlign="Middle"
                                            EditText="ویرایش" UpdateText="ثبت" CancelText="لغو"
                                            ControlStyle-Font-Underline="false" ControlStyle-Font-Bold="false" ControlStyle-Font-Names="Tahoma"
                                            ControlStyle-Font-Size="8pt" ControlStyle-ForeColor="#ffcc00" ControlStyle-Width="20%"
                                            ButtonType="Image" CancelImageUrl="~/Images/ajaxImages/cancel.png" EditImageUrl="~/Images/ajaxImages/edit.png"
                                            UpdateImageUrl="~/Images/ajaxImages/save.png">  
                                        <ControlStyle Font-Bold="False" Font-Names="Tahoma" Font-Size="8pt" 
                                            Font-Underline="False" Width="20%" />
                                        </asp:CommandField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <span>موردی یافت نشد</span>
                                    </EmptyDataTemplate>
                                    <EmptyDataRowStyle BackColor="#333333" ForeColor="Yellow" VerticalAlign="Middle"
                                        HorizontalAlign="Center" Font-Names="Tahoma" />
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </fieldset>
                </td>
                </tr>
                <tr>
                <td colspan="2">
                    <asp:UpdatePanel ID="UpdatePanel_RacingForms" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <fieldset id="fld_racingInfo" runat="server" visible="true">
                                <asp:GridView ID="gv_RacingForms" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                                CellPadding="4" ForeColor="Lime" GridLines="None" ShowFooter="True" DataKeyNames="Form_RacingInfoID"
                                CssClass="GridViewStyle" HeaderStyle-CssClass="HeaderStyle" PagerStyle-CssClass="PagerStyle"
                                HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" OnPageIndexChanging="gv_RacingForms_PageIndexChanging">                       
                                <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="RowStyle"/>
                                <Columns>
                                    <asp:TemplateField HeaderText="ردیف">
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_RowNumber" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="کد مسابقه" Visible="false">
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_RacingInfoID" runat="server" Text='<%# Eval("Form_RacingInfoID", "{0}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="شماره فرم">
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" Font-Bold="true" />
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_FormID" runat="server" Text='<%# Eval("FormInfo_FormID", "{0}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="نام کاربری">
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_UserName" runat="server" Text='<%# Eval("Member_UserName", "{0}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="تاریخ ایجاد">
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_CreationDate" runat="server" Text='<%# PersianClass.getPersianNumberStyle(PersianClass.getPersiaDate(Eval("Form_CreationDate", "{0}"), "D", true, "H")) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="آخرین ویرایش">
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_UpdateDate" runat="server" Text='<%# PersianClass.getPersianNumberStyle(PersianClass.getPersiaDate(Eval("Form_LastUpdate", "{0}"), "D", true, "H")) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="مبلغ فرم">
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_FromAmount" runat="server" Text='<%# PersianClass.getPersianNumberStyle(Eval("Form_Amount", "{0:n0}")) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="امتیاز فرم">
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_FromProminence" ForeColor="#ffcc00" Font-Bold="true" runat="server" Text='<%# PersianClass.getPersianNumberStyle(Eval("Form_Prominence", "{0:n0}")) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="توضیحات">
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_FromStatus" runat="server" Text='<%# Eval("Form_Description", "{0}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <span>هیچ فرمی وجود ندارد</span>
                                </EmptyDataTemplate>
                                <EmptyDataRowStyle BackColor="#333333" ForeColor="Yellow" VerticalAlign="Middle"
                                    HorizontalAlign="Center" Font-Names="Tahoma" />
                            </asp:GridView>
                            </fieldset>                            
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="gv_RacingForms" EventName="PageIndexChanging" />
                        </Triggers>
                    </asp:UpdatePanel>                     
                </td>        
            </tr>
                <tr>
                <td colspan="2">
                    <asp:Button ID="btn_Calculate" runat="server" Height="23px" Text="تائید نهائی" Width="87px" OnClick="btn_Calculate_Click" CssClass="btnUser" />
                </td>
            </tr>
            </table>
        </fieldset>
        <fieldset id="fld_wins" runat="server" visible="false">
            <legend style="color: White"><asp:Label ID="lb_RacingTitle" ForeColor="#ffcc00" runat="server" Text=""></asp:Label></legend>
            <table>
                <tr>
                    <td>
                        <div>
                            <p style="text-align:center"><label style="color:Lime">نفرات  </label><span style="color:#ffcc00">اول </span></p>
                            <asp:GridView ID="gv_RacingFirstWin" AutoGenerateColumns="False" runat="server" CellPadding="7"
                                CssClass="GridViewStyle" HeaderStyle-CssClass="HeaderStyle" PagerStyle-CssClass="PagerStyle"
                                HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ForeColor="#333333"
                                GridLines="None" oncontextmenu="return false;" onpageindexchanging="gv_RacingFirstWin_PageIndexChanging">
                                <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="RowStyle" />
                            <Columns>
                                <asp:TemplateField HeaderText="شماره">
                                    <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <HeaderStyle CssClass="header_Grid" />
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_GameID" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="شماره فرم">
                                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <HeaderStyle CssClass="header_Grid" />
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_FirstFormID" runat="server" Text='<%# Eval("FormInfo_FormID", "{0}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>                                    
                                <asp:TemplateField HeaderText="نام کاربری">
                                    <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <HeaderStyle CssClass="header_Grid" />
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_FirstUserName" runat="server" Text='<%# Eval("Member_UserName", "{0}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="امتیاز">
                                    <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                    <HeaderStyle CssClass="header_Grid" />
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_FirstFormProminence" ForeColor="#ffcc00" runat="server" Text='<%# Eval("Form_Prominence", "{0}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <span>موردی یافت نشد</span>
                            </EmptyDataTemplate>
                            <EmptyDataRowStyle BackColor="#333333" ForeColor="Yellow" VerticalAlign="Middle"
                                HorizontalAlign="Center" Font-Names="Tahoma" />
                        </asp:GridView>                                
                </div>
                    </td>
                    <td>
                        <div>
                        <p style="text-align: center"><label style="color: Lime"> نفرات </label><span style="color: #ffcc00">دوم </span></p>
                        <asp:GridView ID="gv_RacingSecondWin" AutoGenerateColumns="False" runat="server"
                            CellPadding="7" CssClass="GridViewStyle" HeaderStyle-CssClass="HeaderStyle" PagerStyle-CssClass="PagerStyle"
                            HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" ForeColor="#333333"
                            GridLines="None" oncontextmenu="return false;" onpageindexchanging="gv_RacingSecondWin_PageIndexChanging">
                        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="RowStyle" />
                        <Columns>
                            <asp:TemplateField HeaderText="شماره">
                                <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                <HeaderStyle CssClass="header_Grid" />
                                <ItemTemplate>
                                    <asp:Label ID="lbl_GameID" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="شماره فرم">
                                <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                <HeaderStyle CssClass="header_Grid" />
                                <ItemTemplate>
                                    <asp:Label ID="lbl_SecondFormID" runat="server" Text='<%# Eval("FormInfo_FormID", "{0}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="نام کاربری">
                                <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                <HeaderStyle CssClass="header_Grid" />
                                <ItemTemplate>
                                    <asp:Label ID="lbl_SecondUserName" runat="server" Text='<%# Eval("Member_UserName", "{0}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="امتیاز">
                                <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                <HeaderStyle CssClass="header_Grid" />
                                <ItemTemplate>
                                    <asp:Label ID="lbl_SecondFormProminence" ForeColor="#ffcc00" runat="server" Text='<%# Eval("Form_Prominence", "{0}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <span>موردی یافت نشد</span>
                        </EmptyDataTemplate>
                        <EmptyDataRowStyle BackColor="#333333" ForeColor="Yellow" VerticalAlign="Middle" HorizontalAlign="Center" Font-Names="Tahoma" />
                    </asp:GridView>
                    </div>
                </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lbl_Sum" runat="server" Text="0"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="lbl_rewardForFirstWin" runat="server" Text="0"></asp:Label><br />
                        <asp:Label ID="lbl_rewardForSecondWin" runat="server" Text="0"></asp:Label><br />
                        <asp:Label ID="lbl_perFirstWin" runat="server" Text="0"></asp:Label><br />
                        <asp:Label ID="lbl_perSecondWin" runat="server" Text="0"></asp:Label><br /><br />
                        <asp:Label ID="lbl_rewardForGovernment" runat="server" Text="0"></asp:Label><br />
                        <asp:Label ID="lbl_rewardForCharitable" runat="server" Text="0"></asp:Label><br />
                        <asp:Label ID="lbl_rewardForSite" runat="server" Text="0"></asp:Label><br />
                    </td>
                </tr>
            </table>                
        </fieldset>
    </ContentTemplate>
</asp:UpdatePanel>
<script type="text/javascript">
    function getImagePath() { return '<%= ImagePath %>'; } var imagePath = getImagePath();
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_beginRequest(function (){setBlock();});
    prm.add_endRequest(function () { $.unblockUI(); });
</script>