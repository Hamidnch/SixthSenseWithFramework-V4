<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sample.aspx.cs" Inherits="Sport_Sample" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/CSSSportRacingResultSelected.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">

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
                    <RowStyle BackColor="#EFF3FB" VerticalAlign="Middle" HorizontalAlign="Center" />
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
            <td colspan="2" class="racingSelected_Cell"><span style="color:yellow">جمع مبلغ مسابقه : </span><span id="lbl_RacingAmount" runat="server" class="racingSelected_Data">....</span></td>
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
            <td colspan="2" class="racingSelected_downloadForm"><a href="*" style="color:Lime">دانلود فرمهای برندگان</a></td>
        </tr>
        <tr id="downloadActiveForm" runat="server">
            <td colspan="2" class="racingSelected_downloadForm"><a href="*" style="color:Lime">دانلود فرمهای فعال</a></td>
        </tr>
    </table>

    <div class="divBtnForm">   
        <input type="button" class="btnForm" value="برگشت" onclick="javascript:window.location.href='SportRacingTitles.aspx'" />             
<%--        <asp:Button ID="btn_Exit" runat="server" Text="برگشت"  CssClass="btnForm" onclick="btn_Exit_Click"/>   --%>         
    </div>
        <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
    <div>
        <asp:DataList ID="dl_SelectRacingForResult" runat="server" RepeatDirection="Horizontal" RepeatColumns="2" onitemdatabound="dl_SelectRacingForResult_ItemDataBound" GridLines="Both">
            <ItemStyle CssClass="racingSelectedResult_Titr"></ItemStyle>
            <ItemTemplate>
                <asp:Label ID="lbl_FormID" runat="server" Text='<%# Eval("RacingWinners_FormID", "{0}")  %>'></asp:Label>
                    <fieldset>
                        <legend id="formID" runat="server"></legend>                        
                        <asp:GridView ID="gv_RacingResult" AutoGenerateColumns="False" runat="server"
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
            </ItemTemplate>            
        </asp:DataList>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </div>
</div>
    </form>
</body>
</html>
