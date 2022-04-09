<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserAccountDetails.ascx.cs" Inherits="AdminPanel_AdminUserControl_UserAccountDetails" %>
<link href="../AdminStyls/CSSGrid.css" rel="stylesheet" type="text/css" />
<asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release" LoadScriptsBeforeUI="false" 
    AsyncPostBackTimeout="360000"></asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <fieldset>
        <asp:Label ID="lbl_SelectUserName" Text="نام کاربری" runat="server" />
        <asp:TextBox ID="txtUserName" runat="server" CssClass="customTxt meduim" EnableViewState="false"></asp:TextBox>&nbsp;
        <asp:Button ID="btnSearch" runat="server" CssClass="btnUser" Text="جستجو" EnableViewState="false" onclick="btnSearch_Click" />
    </fieldset>
    <fieldset>  
        <asp:Table ID="Table2" runat="server">
            <asp:TableRow ID="TableRow1" runat="server" CssClass="HeaderStyle" Font-Names="tahoma" Font-Size="11px" ForeColor="Window" Height="22px">
                    <asp:TableCell ID="TableCell3" Width="5%" runat="server">ردیف</asp:TableCell>
                    <asp:TableCell ID="TableCell4" style="width:15%" runat="server">نام کاربری</asp:TableCell>
                    <asp:TableCell ID="TableCell5" style="width:13.5%" runat="server">تاریخ آخرین شارژ</asp:TableCell>
                    <asp:TableCell ID="TableCell6" style="width:13%" runat="server">مبلغ آخرین شارژ</asp:TableCell>
                    <asp:TableCell ID="TableCell2" style="width:13.5%" runat="server">موجودی صندوق شارژ</asp:TableCell>
                    <asp:TableCell ID="TableCell7" style="width:13%" runat="server">تاریخ آخرین جایزه</asp:TableCell>
                    <asp:TableCell ID="TableCell9" style="width:13.5%" runat="server">مبلغ آخرین جایزه</asp:TableCell>
                    <asp:TableCell ID="TableCell8" style="width:13.5%" runat="server">موجودی صندوق جایزه</asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <%--<table cellpadding="1" cellspacing="1" style="font-family:tahoma; font-size:11px;text-align:center; padding:5px 0;border-right:solid 1px #000000;" class="HeaderStyle">
            <tr>
                <td style="width:5%">ردیف</td>
                <td style="width:15%">نام کاربری</td>
                <td style="width:15%">تاریخ آخرین شارژ</td>
                <td style="width:12%">مبلغ آخرین شارژ</td>
                <td style="width:13%">موجودی صندوق شارژ</td>
                <td style="width:15%">تاریخ آخرین جایزه</td>
                <td style="width:10%">مبلغ آخرین جایزه</td>
                <td style="width:15%">موجودی صندوق جایزه</td>
            </tr>
        </table>--%> 
            <%--<SortedAscendingHeaderStyle CssClass="sortasc" /><SortedDescendingHeaderStyle CssClass="sortdesc" />                   --%>
        <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" CssClass="GridViewStyle2" ShowHeader="false"
            GridLines="None" Width="100%" EnableViewState="false" AllowSorting="true"  
            PagerStyle-CssClass="PagerStyle" AllowPaging="True" PagerSettings-Mode="NumericFirstLast"
            OnSorting="gvUsers_Sorting" OnRowDataBound="gvUsers_RowDataBound" OnPageIndexChanging="gvUsers_PageIndexChanging">
            <PagerSettings FirstPageText="صفحه نخست" LastPageText="صفحه پایان" PageButtonCount="5" Position="Bottom" Visible="true"/>
            <PagerStyle CssClass="PagerStyle" />
        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="RowStyle"/>
        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" ForeColor="Red" />
        <Columns>
            <asp:TemplateField HeaderText="ردیف">
                <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                <ItemTemplate>
                    <asp:Label ID="lbl_RowNumber" ForeColor="#ffcc00" runat="server" Text='<%# PersianClass.getPersianNumberStyle(Container.DataItemIndex + 1) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="نام کاربری" SortExpression="Member_UserName">
                <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center"/>
                <ItemTemplate>
                    <asp:Label ID="lbl_MemberID" runat="server" Text='<%# Bind("Member_ID") %>' Visible="false"></asp:Label>
                    <asp:HyperLink ID="hl_UserName" ForeColor="#ffcc00" runat="server" Font-Bold="True" Text='<%# Bind("Member_UserName") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>            
            <asp:TemplateField HeaderText="جزئیات">
                <ItemStyle Width="80%" VerticalAlign="Middle" HorizontalAlign="Center"/>              
                <ItemTemplate>           
                    <asp:GridView id="gvUserAccountDetails" runat="server" CssClass="GridViewStyle2" AutoGenerateColumns="false" GridLines="Both" ShowHeader="false">
                        <HeaderStyle Font-Size="Small" ForeColor="White"/>                       
                        <Columns>
                            <asp:TemplateField HeaderText="تاریخ آخرین شارژ">
                                <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                <ItemTemplate> 
                                    <asp:Label ID="lbl_Payment_SettleDate" runat="server" Text='<%#  PersianClass.getPersianNumberStyle(PersianClass.getPersiaDate(Eval("Payment_SettleDate", "{0}"), "D", true, "H")) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="مبلغ آخرین شارژ">
                                <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label ID="lbl_Payment_Amount" runat="server" Text='<%# PersianClass.getPersianNumberStyle(Eval("Payment_Amount", "{0:n0}")) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="موجودی صندوق شارژ">
                                <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label ID="lbl_ChargeBox_TotalAmount" runat="server" Text='<%# PersianClass.getPersianNumberStyle(Eval("ChargeBox_TotalAmount", "{0:n0}")) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="تاریخ آخرین جایزه">
                                <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label ID="lbl_RewardIncDate" runat="server" Text='<%# PersianClass.getPersianNumberStyle(PersianClass.getPersiaDate(Eval("RewardIncDate", "{0}"), "D", true, "H")) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="مبلغ آخرین جایزه">
                                <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label ID="lbl_RewardInc_Amount" runat="server" Text='<%# PersianClass.getPersianNumberStyle(Eval("RewardInc_Amount", "{0:n0}")) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="موجودی صندوق جایزه">
                                <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label ID="lbl_RewardBox_TotalAmount" runat="server" Text='<%# PersianClass.getPersianNumberStyle(Eval("RewardBox_TotalAmount", "{0:n0}")) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <b class="field_desc">هیچ موردی یافت نشد</b>
                        </EmptyDataTemplate>
                    </asp:GridView> 
              </ItemTemplate>                           
            </asp:TemplateField>
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
<script language="javascript" type="text/javascript">
    var prm = Sys.WebForms.PageRequestManager.getInstance(); prm.add_pageLoading(onPageLoading);
    function onPageLoading(sender, args) { var gv = $get('<%= gvUsers.ClientID %>'); gv.parentNode.removeChild(gv); }
    function getImagePath() { return '<%= ImagePath %>'; } var imagePath = getImagePath();
    function setBlock()
    {
        $.blockUI({ message: '<h4 style="font-family:tahoma;color:lime"><img src="' + imagePath + '/ajaxImages/loading_User.gif" /><br /><br />  درحال انجام عملیات... </h4>',
            fadeIn: 1000, fadeOut: 1000, centerX: true, centerY: true, css: { border: 'none', padding: '5px', backgroundColor: 'transparent', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .6, color: '#000' }
        });
    }
    prm.add_beginRequest(function () { setBlock(); });
    prm.add_endRequest(function () { $.unblockUI(); });
</script>