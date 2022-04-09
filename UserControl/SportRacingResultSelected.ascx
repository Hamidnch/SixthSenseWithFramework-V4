<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportRacingResultSelected.ascx.cs" Inherits="UserControl_SportRacingResultSelected" %>
<link href="../Styles/CSSSportRacingResultSelected.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    .test { border: 1px ridge #C0C0C0; direction: rtl; font-family: Tahoma; font-size: 12px; line-height: 30px; color: #ffffff; width: 98%; margin: 0 auto; }
</style>
<div id="RacingSelectedResult">
    <table class="racingSelectedResult_Table">
        <tr>
            <td colspan="2" class="racingSelectedResult_Titr"><span style="color:Yellow;font-weight:bold">اعلام نتیجه مسابقه </span></td>
        </tr>
        <tr>
            <td class="racingSelected_Cell"><span style="color:White">نام مسابقه : </span><span id="lbl_RacingTitle" runat="server" class="racingSelected_Data"></span></td>            
            <td class="racingSelected_Cell"><span style="color:White">کد مسابقه : </span><span ID="lbl_RacingInfoID" runat="server" class="racingSelected_Data">....</span></td>
        </tr>
        <tr>
            <td class="racingSelected_Cell"><span style="color:White">تعداد فرمهای فعال : </span><span id="lbl_activeFormCount" runat="server" class="racingSelected_Data"></span></td>            
            <td class="racingSelected_Cell"><span style="color:White">تاریخ اعلام نتیجه : </span><span ID="lbl_declare_Date" runat="server"  class="racingSelected_Data">....</span></td>
        </tr>
        <tr>        
            <td colspan="2">
                <asp:GridView ID="gv_RacingSelected" AutoGenerateColumns="False" runat="server" CssClass="racing_Grid"
                    CellPadding="4" ForeColor="#333333" GridLines="None" oncontextmenu="return false;"
                    EmptyDataText="نتیجه مسابقه هنوز اعلام نشده است" EmptyDataRowStyle-ForeColor="Orange" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-VerticalAlign="Middle">
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="Yellow" VerticalAlign="Middle" HorizontalAlign="Center"/>
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <AlternatingRowStyle BackColor="#E7EAF1" />
                    <RowStyle BackColor="#EFF3FB" ForeColor="Black" VerticalAlign="Middle" HorizontalAlign="Center" />
                    <Columns>
                        <asp:TemplateField HeaderText="ردیف">
                            <ItemStyle Width="5%"/>
                            <ItemTemplate>
                                <asp:Label ID="lbl_GameID" runat="server" Text='<%# Eval("Racing_GameID", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="تیم میزبان">
                            <ItemStyle Width="15%" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_HostTeamID" runat="server" Text='<%# Eval("Racing_HostTeamID", "{0}") %>'
                                    Visible="false"></asp:Label>
                                <asp:Label ID="lbl_HostTeam" runat="server" Text='<%# Eval("HostTeam", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="گل میزبان">
                            <ItemStyle Width="15%" ForeColor="Red"/>
                            <ItemTemplate>
                                <asp:Label ID="lbl_HostGoal" runat="server" Text='<%# PersianClass.getPersianNumberStyle(Eval("Racing_GameHostGoal", "{0}")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="گل میهمان">
                            <ItemStyle Width="15%" ForeColor="Red" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_GuestGoal" runat="server" Text='<%# PersianClass.getPersianNumberStyle(Eval("Racing_GameGuestGoal", "{0}")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="تیم میهمان">
                            <ItemStyle Width="15%"/>
                            <ItemTemplate>
                                <asp:Label ID="lbl_GuestTeamID" runat="server" Text='<%# Eval("Racing_GuestTeamID", "{0}") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lbl_GuestTeam" runat="server" Text='<%# Eval("GuestTeam", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="نتیجه بازی">
                            <ItemStyle Width="15%" ForeColor="Purple" Font-Size="Small"/>
                            <ItemTemplate>
                                <asp:Label ID="lbl_GameStatus" runat="server" Text='<%# Eval("Racing_GameStatus", "{0}") %>'></asp:Label>                        
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="racingSelected_Cell"><span style="color:White">تعداد نفرات اول : </span><span id="lbl_FirstCount"  runat="server" class="racingSelected_Data">....</span></td>            
            <td class="racingSelected_Cell"><span style="color:White">تعداد نفرات دوم : </span><span id="lbl_SecondCount" runat="server" class="racingSelected_Data">....</span></td>
        </tr>
        <tr>
            <td colspan="2" class="racingSelected_Cell"><span style="color:Yellow">جمع مبلغ مسابقه : </span><span id="lbl_RacingAmount" runat="server" class="racingSelected_Data">....</span></td>
        </tr>
        <tr>
            <td class="racingSelected_Cell"><span style="color:White">جمع جایزه نفرات اول : </span><span id="lbl_SumFirstReward"  runat="server" class="racingSelected_Data">....</span></td>
            <td class="racingSelected_Cell"><span style="color:White">جایزه هر نفر اول : </span><span id="lbl_FirstReward" runat="server" class="racingSelected_Data">....</span></td>
        </tr>
        <tr>
            <td class="racingSelected_Cell"><span style="color:White">جمع جایزه نفرات دوم : </span><span id="lbl_SumSecondReward"  runat="server" class="racingSelected_Data">....</span></td>
            <td class="racingSelected_Cell"><span style="color:White">جایزه هر نفر دوم : </span><span id="lbl_SecondReward" runat="server" class="racingSelected_Data">....</span></td>
        </tr>
        <tr id="downloadWinForm" runat="server">
            <td colspan="2" class="racingSelected_downloadForm">
                <asp:LinkButton ID="lnl_WinFormDownload" ForeColor="Yellow" runat="server" Text="دانلود فرمهای برندگان" onclick="lnl_WinFormDownload_Click"></asp:LinkButton>
            </td>
        </tr>
        <tr id="downloadActiveForm" runat="server">
            <td colspan="2" class="racingSelected_downloadForm">
                <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Yellow" Text="دانلود فرمهای فعال"></asp:LinkButton>
            </td>
        </tr>
    </table>

    <div class="divBtnForm"><input type="button" class="btnForm" value="برگشت" onclick="javascript:window.location.href='SportRacingTitles.aspx'" /></div>
<%--        <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />--%>
    <div id="divpreview" runat="server" style="display:none">               
        <asp:DataList ID="dl_SelectRacingForResult" runat="server" RepeatDirection="Horizontal" RepeatColumns="2" onitemdatabound="dl_SelectRacingForResult_ItemDataBound" GridLines="Both">
            <ItemStyle CssClass="racingSelectedResult_Titr"></ItemStyle>
            <ItemTemplate>
                    <div>
<%--                        <span style="color:Red;font-size:20px;text-align:center">سایت حس ششم</span><br /><br />  --%>                      
<%--                        <asp:Label ID="lbl_RacingHeader" ForeColor="Purple" runat="server" Text="شماره مسابقه :"></asp:Label> 
                        <asp:Label ID="Lbl_RacingInfoIDTitle" runat="server" Text='<%# Eval("RacingWinners_RacingInfoID", "{0}") %>'></asp:Label><br />--%>
                        <asp:Label ID="Label1" ForeColor="Purple" runat="server" Text="شماره فرم :"></asp:Label> 
                        <asp:Label ID="lbl_FormID" runat="server" Text='<%# Eval("RacingWinners_FormID", "{0}") %>'></asp:Label><br />
                    </div>
                    <br /><br />
                    <fieldset style="margin:20px 0">                      
                        <asp:GridView ID="gv_RacingResult" AutoGenerateColumns="False" runat="server" CssClass="racing_Grid"
                             CellSpacing="4" CellPadding="4" GridLines="Horizontal" ForeColor="Red" OnRowDataBound="gv_RacingResult_RowDataBound">
                            <RowStyle Font-Names="Tahoma" />
                                <Columns>
                                    <asp:TemplateField> 
                                        <HeaderTemplate>                                            
                                            <asp:Label ID="lbl_GuestHeader" ForeColor="Purple" runat="server" Text="تیم میهمان"></asp:Label>                                    
                                        </HeaderTemplate>                                                           
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_GuestTeam" ForeColor="Purple" runat="server" Text='<%# Eval("GuestTeam", "{0}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                            
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="lbl_HostWinHeader" ForeColor="Purple" runat="server" Text="بردمیزبان"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>                                
                                            <asp:Label ID="lbl_HostWinStatus" ForeColor="Blue" runat="server" Text='<%# Eval("FormInfo_IsHostWin", "{0}") %>' Visible="false"></asp:Label>
                                            <asp:Image ID="img_HostWinShape" ImageUrl="" AlternateText="" runat="server" />
                                                <%--<asp:Label ID="Label2" runat="server" Text="√"></asp:Label>  --%>
                                        </ItemTemplate>
                                    </asp:TemplateField>                            
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="lbl_EqualGameHeader" ForeColor="Purple" runat="server" Text="مساوی"></asp:Label>                                            
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_EqualGame" ForeColor="Blue" runat="server" Text='<%# Eval("FormInfo_IsEqualGame", "{0}") %>' Visible="false"></asp:Label>
                                            <asp:Image ID="img_EqualGame" ImageUrl="" AlternateText="" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="lbl_GuestWinHeader" ForeColor="Purple" runat="server" Text="بردمیهمان"></asp:Label>                                    
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_GuestWinStatus" ForeColor="Blue" runat="server" Text='<%# Eval("FormInfo_IsGuestWin", "{0}") %>' Visible="false"></asp:Label>
                                            <asp:Image ID="img_GuestWinShape" ImageUrl="" AlternateText="" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="lbl_HostTeamHeader" ForeColor="Purple" runat="server" Text="تیم میزبان"></asp:Label>                                    
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_HostTeam" ForeColor="Purple" runat="server" Text='<%# Eval("HostTeam", "{0}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="lbl_GameIDHeader" ForeColor="Purple" runat="server" Text="ردیف"></asp:Label>                                    
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_GameID" ForeColor="Purple" runat="server" Text='<%# Eval("FormInfo_GameID", "{0}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                    </fieldset>
                </ItemTemplate>            
        </asp:DataList>
    </div>

<%--    <div id="divpreviewActiveForms" runat="server" style="font-family:Tahoma;color:Blue;direction:rtl;text-align: right;display:block">               
        <asp:DataList ID="dl_ActiveForms" runat="server" RepeatDirection="Horizontal" RepeatColumns="2" onitemdatabound="dl_ActiveForms_ItemDataBound" GridLines="Both">
            <ItemStyle CssClass="racingSelectedResult_Titr"></ItemStyle>
            <ItemTemplate>
                    <div>
                        <span style="color:Red;font-size:20px;text-align:center">سایت حس ششم</span><br /><br />                     
                        <asp:Label ID="lbl_RacingHeader" ForeColor="Purple" runat="server" Text="شماره مسابقه :"></asp:Label> 
                        <asp:Label ID="Lbl_RacingInfoIDTitle2" runat="server" Text='<%# Eval("RacingInfo_ID", "{0}") %>'></asp:Label><br />
                        <asp:Label ID="Label1" ForeColor="Purple" runat="server" Text="شماره فرم :"></asp:Label> 
                        <asp:Label ID="lbl_FormID2" runat="server" Text='<%# Eval("Form_ID", "{0}") %>'></asp:Label><br />
                    </div>
                    <br /><br />
                    <fieldset style="margin:20px 0">                      
                        <asp:GridView ID="gv_RacingResult2" AutoGenerateColumns="False" runat="server" CssClass="racing_Grid"
                             CellSpacing="4"   CellPadding="4" GridLines="Horizontal" ForeColor="Red" OnRowDataBound="gv_RacingResult2_RowDataBound">
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <RowStyle Font-Names="Tahoma" />
                                <Columns>
                                    <asp:TemplateField> 
                                        <HeaderTemplate>                                            
                                            <asp:Label ID="lbl_GuestHeader2" ForeColor="Purple" runat="server" Text="تیم میهمان"></asp:Label>                                    
                                        </HeaderTemplate>                                                           
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_GuestTeam2" ForeColor="Purple" runat="server" Text='<%# Eval("GuestTeam", "{0}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                            
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="lbl_HostWinHeader2" ForeColor="Purple" runat="server" Text="بردمیزبان"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>                                
                                            <asp:Label ID="lbl_HostWinStatus2" ForeColor="Blue" runat="server" Text='<%# Eval("FormInfo_IsHostWin", "{0}") %>' Visible="false"></asp:Label>
                                            <asp:Image ID="img_HostWinShape2" ImageUrl="" AlternateText="" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>                            
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="lbl_EqualGameHeader2" ForeColor="Purple" runat="server" Text="مساوی"></asp:Label>                                            
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_EqualGame2" ForeColor="Blue" runat="server" Text='<%# Eval("FormInfo_IsEqualGame", "{0}") %>' Visible="false"></asp:Label>
                                            <asp:Image ID="img_EqualGame2" ImageUrl="" AlternateText="" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="lbl_GuestWinHeader2" ForeColor="Purple" runat="server" Text="بردمیهمان"></asp:Label>                                    
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_GuestWinStatus2" ForeColor="Blue" runat="server" Text='<%# Eval("FormInfo_IsGuestWin", "{0}") %>' Visible="false"></asp:Label>
                                            <asp:Image ID="img_GuestWinShape2" ImageUrl="" AlternateText="" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="lbl_HostTeamHeader2" ForeColor="Purple" runat="server" Text="تیم میزبان"></asp:Label>                                    
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_HostTeam2" ForeColor="Purple" runat="server" Text='<%# Eval("HostTeam", "{0}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="lbl_GameIDHeader2" ForeColor="Purple" runat="server" Text="ردیف"></asp:Label>                                    
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_GameID2" ForeColor="Purple" runat="server" Text='<%# Eval("FormInfo_GameID", "{0}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                    </fieldset>
                </ItemTemplate>            
        </asp:DataList>
    </div>--%>

</div>
