<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportTeamManagement.ascx.cs" Inherits="AdminPanel_AdminUserControl_SportTeamManagement" %>
<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
<fieldset id="fld_RacingResult" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <fieldset>
                <asp:Label ID="lbl_SelectCountryName" Text="نام کشور" runat="server" />                
                <asp:DropDownList ID="ddl_CountrySearch" runat="server" CssClass="DropDownList" Width="200px"></asp:DropDownList>
                <asp:Button ID="btnSearch" runat="server" CssClass="btnUser" Text="جستجو" EnableViewState="false" onclick="btnSearch_Click"/>
            </fieldset>
            <fieldset>
                <asp:GridView ID="gv_RacingTeamManagement" runat="server" AutoGenerateColumns="False"
                CssClass="GridViewStyle" AllowPaging="True" CellPadding="4" ForeColor="Lime"
                BackColor="#2C3D5A" GridLines="None" ShowFooter="True" DataKeyNames="Team_ID"
                PageSize="10" OnPageIndexChanging="gv_RacingTeamManagement_PageIndexChanging"
                OnRowCancelingEdit="gv_RacingTeamManagement_RowCancelingEdit" OnRowEditing="gv_RacingTeamManagement_RowEditing"
                OnRowDataBound="gv_RacingTeamManagement_RowDataBound" OnRowUpdating="gv_RacingTeamManagement_RowUpdating">
                <RowStyle CssClass="RowStyle" HorizontalAlign="Center" VerticalAlign="Middle" />
                <HeaderStyle Font-Bold="True" ForeColor="Lime" CssClass="HeaderStyle" VerticalAlign="Middle" HorizontalAlign="Center" />
                <PagerStyle CssClass="PagerStyle" VerticalAlign="Middle" HorizontalAlign="Center"/>
                <Columns>
                    <asp:TemplateField HeaderText="ردیف">
                        <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>                            
                            <asp:Label ID="lbl_RowNumber" runat="server" Text='<%# PersianClass.getPersianNumberStyle(Container.DataItemIndex + 1) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="شناسه تیم">
                        <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_teamID" runat="server" Text='<%# Eval("Team_ID", "{0}") %>'
                                ForeColor="Window"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="نام تیم">
                        <ItemStyle Width="30%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_TeamName" runat="server" Text='<%# Eval("Team_Name", "{0}") %>'
                                ForeColor="Window"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_TeamName" runat="server" CssClass="txt_Result" Width="100px" Text='<%# Eval("Team_Name", "{0}") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="نام کشور">
                        <ItemStyle Width="30%" VerticalAlign="Middle" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="lbl_CountryName" runat="server" Text='<%# Eval("Country_Name", "{0}") %>'
                                ForeColor="Window"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddl_CountryName" CssClass="customTxt medium" runat="server">
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>                    
                    <asp:CommandField ShowEditButton="true" HeaderText="ویرایش" ItemStyle-HorizontalAlign="Center"
                        ItemStyle-VerticalAlign="Middle" EditText="ویرایش" UpdateText="ثبت" CancelText="لغو"
                        ControlStyle-Font-Underline="false" ControlStyle-Font-Bold="false" ControlStyle-Font-Names="Tahoma"
                        ControlStyle-Font-Size="8pt" ControlStyle-ForeColor="#ffcc00" ControlStyle-Width="20%"
                        ButtonType="Image" CancelImageUrl="~/Images/ajaxImages/cancel.png" EditImageUrl="~/Images/ajaxImages/edit.png"
                        UpdateImageUrl="~/Images/ajaxImages/pencil.png">
                        <ControlStyle Font-Bold="False" Font-Names="Tahoma" Font-Size="8pt" Font-Underline="False"
                            Width="15%" />
                    </asp:CommandField>
                </Columns> 
                <EmptyDataTemplate>
                    <asp:Label ID="Label3" runat="server" Text="هیچ موردی یافت نشد" Width="100%"></asp:Label>
                </EmptyDataTemplate>                                               
            </asp:GridView>
            </fieldset>
        </ContentTemplate>
        <Triggers><asp:AsyncPostBackTrigger ControlID="gv_RacingTeamManagement" EventName="RowCommand" /></Triggers>
    </asp:UpdatePanel>
</fieldset>
<script type="text/javascript">
    function getImagePath() { return '<%= ImagePath %>'; } var imagePath = getImagePath();
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_beginRequest(function (){setBlock();});
    prm.add_endRequest(function (){jQuery.unblockUI();});
</script>