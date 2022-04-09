<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportVariance.ascx.cs" Inherits="AdminPanel_AdminUserControl_SportVariance" %>
<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
<fieldset id="fld_RacingResult" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <fieldset>
                <asp:Label ID="lbl_SelectUserName" Text="نام کاربر" runat="server" />                
                <asp:DropDownList ID="ddl_UserSearch" runat="server" CssClass="DropDownList" Width="200px"></asp:DropDownList>
                <asp:Button ID="btnSearch" runat="server" CssClass="btnUser" Text="جستجو" 
                    EnableViewState="false" onclick="btnSearch_Click"/>
            </fieldset>
            <fieldset>
                <asp:GridView ID="gv_SportVariance" runat="server" AutoGenerateColumns="False"
                CssClass="GridViewStyle" AllowPaging="True" CellPadding="4" ForeColor="Lime"
                BackColor="#2C3D5A" GridLines="None" ShowFooter="True" PageSize="10" 
                    onpageindexchanging="gv_SportVariance_PageIndexChanging"> 
                <RowStyle CssClass="RowStyle" HorizontalAlign="Center" VerticalAlign="Middle" />
                <HeaderStyle Font-Bold="True" ForeColor="Lime" CssClass="HeaderStyle" VerticalAlign="Middle" HorizontalAlign="Center" />
                <PagerStyle CssClass="PagerStyle" VerticalAlign="Middle" HorizontalAlign="Center"/>
                <Columns>
                    <asp:TemplateField HeaderText="شماره">
                        <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_VarianceID" runat="server" Text='<%# Eval("Variance_ID", "{0}") %>' ForeColor="Window"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="نام کاربری">
                        <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_Member_UserName" runat="server" Text='<%# Eval("Member_UserName", "{0}") %>' ForeColor="Window"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="نوع مغایرت">
                        <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_Member_Variance_Type" runat="server" Text='<%# Eval("Variance_Type", "{0}") %>' ForeColor="Window"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="مبلغ">
                        <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_Variance_Amount" runat="server" Text='<%# PersianClass.getPersianNumberStyle(Eval("Variance_Amount", "{0:n0}")) %>' ForeColor="Window"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="تاریخ">
                        <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_Variance_Date" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("Variance_Date", "{0}"), "D", false) %>' ForeColor="Window"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="شرح">
                        <ItemStyle Width="50%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_Variance_Description" runat="server" Text='<%# Eval("Variance_Description", "{0}") %>' ForeColor="Window"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns> 
                <EmptyDataTemplate>
                    <asp:Label ID="Label3" runat="server" Text="هیچ موردی یافت نشد" Width="100%"></asp:Label>
                </EmptyDataTemplate>                                               
            </asp:GridView>
            </fieldset>
        </ContentTemplate>
    </asp:UpdatePanel>
</fieldset>
<script type="text/javascript">
    function getImagePath() { return '<%= ImagePath %>'; } var imagePath = getImagePath();
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_beginRequest(function () { setBlock(); });
    prm.add_endRequest(function () { jQuery.unblockUI(); });
</script>