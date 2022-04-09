<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportRacingInsertResult.ascx.cs" Inherits="AdminPanel_AdminUserControl_SportRacingInsertResult" %>
<link href="../AdminStyls/CSSMainAdmin.css" rel="stylesheet" type="text/css" />
    <table>
        <tr>
            <td>
                <div class="input_field">
                    <asp:Label ID="Label1" runat="server" Text="کد اطلاعاتی:"></asp:Label>
                    <asp:Label ID="lbl_RacingInfoID" runat="server" CssClass="mediumfield"></asp:Label>
                </div>
            </td>
            <td>
                <div class="input_field">
                    <asp:Label ID="Label2" runat="server" Text="عنوان مسابقه:"></asp:Label>
                    <asp:Label ID="lbl_RaceTitle" runat="server" CssClass="mediumfield"></asp:Label>
                </div>
            </td>
            <td>
                <div class="input_field">
                    <asp:Label ID="Label3" runat="server" Text="جزئیات مسابقه:"></asp:Label>
                    <asp:Label ID="ddl_RacingDetail" runat="server" CssClass="mediumfield"></asp:Label>
                </div>
            </td>
            <td>
                <div class="input_field">
                    <asp:Label ID="Label4" runat="server" Text="نام کشور:"></asp:Label>
                    <asp:Label ID="ddl_Country" runat="server" CssClass="mediumfield"></asp:Label>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="gv_RacingResult" AutoGenerateColumns="False" runat="server"
                    CellPadding="4" ForeColor="#333333" GridLines="None" oncontextmenu="return false;">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="شماره">
                            <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <HeaderStyle CssClass="header_Grid" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_GameID" runat="server" Text='<%# Eval("Racing_GameID", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="تیم میزبان">
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <HeaderStyle CssClass="header_Grid" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_HostTeam" runat="server" Text='<%# Eval("HostTeam", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="تیم میهمان">
                            <HeaderStyle CssClass="header_Grid" />
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_GuestTeam" runat="server" Text='<%# Eval("GuestTeam", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="تاریخ بازی">
                            <HeaderStyle CssClass="header_Grid" />
                            <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_GameDate" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("Racing_GameDate", "{0}"), "S", false) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="زمان بازی">
                            <HeaderStyle CssClass="header_Grid" />
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_GameTime" runat="server" Text='<%# Eval("Racing_GameTime", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="برد/باخت">
                            <HeaderStyle CssClass="header_Grid" />
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"/>                            
                            <ItemTemplate>                                
                                <asp:DropDownList ID="ddl_GameResult" CssClass="ddl_Result" runat="server">
                                    <asp:ListItem Value="0">برد میزبان</asp:ListItem>
                                    <asp:ListItem Value="1">مساوی</asp:ListItem>
                                    <asp:ListItem Value="2">برد میهمان</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="نتیجه بازی">
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="20%" />
                            <ItemTemplate>
                                    <asp:TextBox ID="txt_HostResult" runat="server" CssClass="txt_Result" 
                                        onkeydown="javascript:return jsNumbers(event);" MaxLength="2"></asp:TextBox>
<%--                                    <span style="float:right">&nbsp;__&nbsp; </span>--%>
                                    <asp:TextBox ID="txt_GuestResult" runat="server" CssClass="txt_Result" 
                                        onkeydown="javascript:return jsNumbers(event);" MaxLength="2"></asp:TextBox>                                     
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <HeaderStyle Height="30px" BackColor="#333333" Font-Bold="True" ForeColor="Aqua" VerticalAlign="Middle" HorizontalAlign="Center" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>                
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <div class="input_field no_margin_bottom">
                    <input type="button" class="btn_SaveTeam submit" value="ثبت" />
                    <input type="button" id="btn_TeamNew" class="submit" value="انصراف" />
                    <asp:Label ID="lbl_Msg" CssClass="error" runat="server"></asp:Label>
                </div>                
            </td>
        </tr>
    </table>
<%--</fieldset>--%>