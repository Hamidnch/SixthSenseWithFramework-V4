<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportRacingEdition.ascx.cs" Inherits="SportRacingEdition" %>
<%@ Register Assembly="PersianDatePickup" Namespace="PersianDatePickup" TagPrefix="pcal" %>
<link href="../AdminStyls/CSSMainAdmin.css" rel="stylesheet" type="text/css" />
<link href="../AdminStyls/CSSGrid.css" rel="stylesheet" type="text/css" />
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <fieldset>
            <legend>ویرایش مسابقات</legend>
            <table style="width: 100%">
                <tr>
                    <td>
                        <span style="color:Window">شناسه مسابقه مورد نظر خود را انتخاب نمائید  : </span>
                        <asp:DropDownList ID="ddl_RacingInfoID" runat="server" Height="30px" 
                            Width="230px" 
                            onselectedindexchanged="ddl_RacingInfoID_SelectedIndexChanged" 
                            AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td>            
                    </td>
                </tr>
                <tr>
                    <td colspan="2"></td>
                </tr>
            </table>
            <asp:GridView ID="gv_RacingGames" ShowHeader="true" ShowFooter="true" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true"
                                    runat="server" GridLines="None" CssClass="GridViewStyle" HeaderStyle-CssClass="HeaderStyle" PagerStyle-CssClass="PagerStyle">                                    
                <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="RowStyle"/>
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
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_HostTeam" runat="server" CssClass="txt_Result" Text='<%# Eval("HostTeam", "{0}") %>'>                                    
                                </asp:TextBox>                                
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="تیم میهمان">
                            <HeaderStyle CssClass="header_Grid" />
                            <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_GuestTeam" runat="server" Text='<%# Eval("GuestTeam", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_GuestTeam" runat="server" CssClass="txt_Result" Text='<%# Eval("GuestTeam", "{0}") %>'>                                    
                                </asp:TextBox>                                
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="تاریخ بازی">
                            <HeaderStyle CssClass="header_Grid" />
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_GameDate" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("Racing_GameDate", "{0}"), "L", false) %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <%--<pcal:PersianDatePickup ID="pdp_GameDate" runat="server" CssClass="txtPickup" Text='<%# Eval("Racing_GameDate", "{0}") %>' ReadOnly="True"></pcal:PersianDatePickup>                               --%>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ساعت بازی">
                            <HeaderStyle CssClass="header_Grid" />
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_GameTime" runat="server" Text='<%# Eval("Racing_GameTime", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="محل بازی">
                            <HeaderStyle CssClass="header_Grid" />
                            <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_GameTime" runat="server" Text='<%# Eval("Racing_GameLocation", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>                                                  
                        <asp:CommandField ShowEditButton="true" EditText="ویرایش" UpdateText="ثبت"
                            CancelText="لغو" ControlStyle-Font-Underline="false" ControlStyle-Font-Bold="false"
                            ControlStyle-Font-Names="Tahoma" ControlStyle-Font-Size="8pt" ControlStyle-ForeColor="Lime" 
                            ControlStyle-Width="20%" ButtonType="Image" 
                            CancelImageUrl="~/Images/ajaxImages/cancel.png" 
                            EditImageUrl="~/Images/ajaxImages/edit.png" 
                            UpdateImageUrl="~/Images/ajaxImages/save.png" >  
                        <ControlStyle Font-Bold="False" Font-Names="Tahoma" Font-Size="8pt" 
                            Font-Underline="False" Width="20%" />
                        </asp:CommandField>
                </Columns>
                <EmptyDataTemplate>
                    <asp:Label ID="Label3" runat="server" Text="هیچ موردی یافت نشد" Width="100%"></asp:Label>
                </EmptyDataTemplate>
                </asp:GridView>
        </fieldset>
    </ContentTemplate>
</asp:UpdatePanel>