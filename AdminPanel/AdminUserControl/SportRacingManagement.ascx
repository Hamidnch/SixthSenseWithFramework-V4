<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportRacingManagement.ascx.cs" Inherits="AdminPanel_AdminUserControl_SportRacingManagement" %>
<script language="javascript" type="text/javascript">
    function getImagePath(){ return '<%= ImagePath %>'; } var imagePath = getImagePath();
    function expandcollapse(obj, row)
    {
        var div = document.getElementById(obj);
        var img = document.getElementById('img' + obj);
        img.style.width = "20px";
        img.style.height = "20px"
        if (div.style.display == "none")
        {
            div.style.display = "block";
            if (row == 'alt'){img.src = imagePath + "/ajaxImages/minus.gif";}
            else {img.src = imagePath + "/ajaxImages/minus.gif";}
            //img.alt = "Close to view other Customers";
        }
        else
        {
            div.style.display = "none";
            if (row == 'alt')
            {img.src = imagePath + "/ajaxImages/plus.gif";}
            else{img.src = imagePath + "/ajaxImages/plus.gif";}
            //img.alt = "Expand to show Orders";
        }
    }
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_beginRequest(function (){setBlock();});
    prm.add_endRequest(function () {$.unblockUI();});
</script>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConStr %>"
    SelectCommand="SP_Sport_LoadAllRacingForEnterResults"   
    SelectCommandType="StoredProcedure">
    <SelectParameters>
<%--        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />--%>
        <asp:ControlParameter ControlID="lbl_Today" DefaultValue="" Name="currentDate" 
            PropertyName="Text" Type="DateTime" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:Label ID="lbl_Today" runat="server" Text="0"></asp:Label>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <asp:GridView ID="gv_RacingWithInfo" runat="server" DataSourceID="SqlDataSource1"
            AutoGenerateColumns="False" AllowSorting="True" CellPadding="4" CssClass="GridViewStyle2" HeaderStyle-CssClass="HeaderStyle"
            GridLines="None" DataKeyNames="RacingInfo_ID" 
            OnRowDataBound="gv_RacingWithInfo_RowDataBound">
            <EditRowStyle BackColor="#0FB0E0" />
           <HeaderStyle Font-Bold="True" VerticalAlign="Middle" HorizontalAlign="Center" />
            <Columns>
                <asp:TemplateField HeaderText="ردیف">
                    <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lbl_RowNumber" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText=" ثبت نتایج " HeaderStyle-Font-Size="8pt" HeaderStyle-Font-Bold="false" HeaderStyle-Font-Names="Tahoma">
                  <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <a href="javascript:expandcollapse('div<%# Eval("RacingInfo_ID") %>','one');">
                            <img id="imgdiv<%# Eval("RacingInfo_ID") %>" alt="ثبت نتیجه"
                                width="20px" border="0" src="../Images/ajaxImages/plus.gif" />
                        </a>
                    </ItemTemplate>
                    <HeaderStyle Font-Bold="False" Font-Names="Tahoma" Font-Size="8pt" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="کد اطلاعاتی مسابقه" SortExpression="RacingInfo_ID">
                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lbl_RacingInfoID" runat="server" Text='<%# Eval("RacingInfo_ID", "{0}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="عنوان مسابقه" SortExpression="Race_Title">
                    <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lbl_RaceTitle" runat="server" Text='<%# Eval("Race_Title", "{0}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="جزئیات مسابقه" SortExpression="RacingInfo_Details">
                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lbl_RacingDetails" runat="server" Text='<%# Eval("RacingInfo_Details", "{0}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="نام کشور" SortExpression="Country_Name">
                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lbl_RacingCountryID" runat="server" Text='<%# Eval("Country_Name", "{0}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="آخرین ویرایش" SortExpression="RacingInfo_LastUpdate">
                    <ItemStyle Width="20%" VerticalAlign="Middle" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lbl_RacingInfoLastUpdate" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("RacingInfo_LastUpdate", "{0}"),"L",true) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <tr>
                            <td colspan="100%">
                                <div id="div<%# Eval("RacingInfo_ID") %>" style="display:none" class="divRacingGrid">
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:GridView ID="gv_RacingResult" runat="server" AutoGenerateColumns="False" AllowPaging="false" CssClass="grid"
                                                CellPadding="4" ForeColor="Lime" GridLines="None" ShowFooter="True" DataKeyNames="Racing_RacingInfoID" OnRowEditing="gv_RacingResult_RowEditing" OnRowCancelingEdit="gv_RacingResult_CancelingEdit" OnRowUpdating="gv_RacingResult_RowUpdating">                                                
                                                <HeaderStyle Height="30px" BackColor="#333333" Font-Bold="True" ForeColor="Aqua"
                                                    VerticalAlign="Middle" HorizontalAlign="Center" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="شماره">
                                                        <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="header_Grid" />
                                                        <ItemTemplate>
<%--                                                            <asp:Label ID="lbl_RaingInfoID" runat="server" Text='<%# Eval("Racing_RacingInfoID", "{0}") %>'></asp:Label>--%>
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
                                                        <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_GameDate" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("Racing_GameDate", "{0}"), "L", false) %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="زمان بازی">
                                                        <HeaderStyle CssClass="header_Grid" />
                                                        <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_GameTime" runat="server" Text='<%# Eval("Racing_GameTime", "{0}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="نتیجه">
                                                        <HeaderStyle CssClass="header_Grid" />
                                                        <ItemStyle Width="10%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                        <ItemTemplate>
<%--                                                            <asp:Label ID="lbl_GameResult" runat="server" Text='<%# Eval("Racing_GameResult", "{0}") %>'
                                                                Visible="false"></asp:Label>--%>
                                                            <asp:Label ID="lbl_GameStatus" runat="server" Text='<%# Eval("Racing_GameStatus", "{0}") %>' ForeColor="Green"></asp:Label>
                                                        </ItemTemplate>
<%--                                                        <EditItemTemplate>
                                                            <asp:DropDownList ID="ddl_GameStatus" CssClass="ddl_Result" DataValueField='<%# Eval("Racing_GameStatus", "{0}") %>'
                                                                runat="server">
                                                                <asp:ListItem Value="-1">انتخاب كنيد...</asp:ListItem>
                                                                <asp:ListItem Value="0">برد میزبان</asp:ListItem>
                                                                <asp:ListItem Value="1">مساوی</asp:ListItem>
                                                                <asp:ListItem Value="2">برد میهمان</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </EditItemTemplate>--%>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="میزبان">
                                                        <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_HostResult" Text='<%# Eval("Racing_GameHostGoal", "{0}") %>' runat="server" ForeColor="Green"></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_HostResult" runat="server" CssClass="txt_Result" Text='<%# Eval("Racing_GameHostGoal", "{0}") %>'
                                                                onkeypress="javascript:return OnlyNumberSign(event, this);" MaxLength="2">
                                                            </asp:TextBox>
                                                        </EditItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="میهمان">
                                                        <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_GuestResult" Text='<%# Eval("Racing_GameGuestGoal", "{0}") %>' ForeColor="Green"
                                                                runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txt_GuestResult" runat="server" CssClass="txt_Result" Text='<%# Eval("Racing_GameGuestGoal", "{0}") %>'
                                                                onkeypress="javascript:return OnlyNumberSign(event, this);" MaxLength="2">
                                                            </asp:TextBox>
                                                        </EditItemTemplate>
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
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <asp:Label ID="Label3" runat="server" Text="هیچ موردی یافت نشد" Width="100%"></asp:Label>
            </EmptyDataTemplate>
        </asp:GridView>
    </ContentTemplate>
</asp:UpdatePanel>
