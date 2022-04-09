<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportRacingReport.ascx.cs" Inherits="AdminPanel_AdminUserControl_SportRacingReport" %>
<link href="../AdminStyls/CSSMainAdmin.css" rel="stylesheet" type="text/css" />
<link href="AdminStyls/Modal/dark-hive/jquery-ui-1.8.5.custom.css" rel="stylesheet" type="text/css" />
<%--<link href="../AdminStyls/CSSGrid.css" rel="stylesheet" type="text/css" />--%>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConStr %>" SelectCommand="SP_Sport_LoadAllRacingWithInfo" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
<asp:ScriptManager ID="ScriptManager1" AsyncPostBackTimeout="10000" runat="server"></asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <asp:GridView ID="gv_RacingWithInfo" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="true" CellPadding="4" CssClass="myTable" HeaderStyle-CssClass="header" GridLines="None" DataKeyNames="RacingInfo_ID" OnRowDataBound="gv_RacingWithInfo_RowDataBound" OnRowCommand="gv_RacingWithInfo_RowCommand">
            <HeaderStyle Font-Bold="True" ForeColor="Aqua" VerticalAlign="Middle" HorizontalAlign="Center" />
            <Columns>
                <asp:TemplateField HeaderText="ردیف">
                    <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lbl_RowNumber" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="  فرمها " HeaderStyle-Font-Size="8pt" HeaderStyle-Font-Bold="false"
                    HeaderStyle-Font-Names="Tahoma" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <a href="javascript:expandcollapse('div<%# Eval("RacingInfo_ID") %>','one');"><img id="imgdiv<%# Eval("RacingInfo_ID") %>" alt="نمایش فرمها" width="32px" border="0" src="../Images/ajaxImages/plus.gif" /></a>
                    </ItemTemplate>
                    <HeaderStyle Font-Bold="False" Font-Names="Tahoma" Font-Size="8pt" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="کد اطلاعاتی مسابقه" SortExpression="RacingInfo_ID">
                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" ForeColor="Lime" />
                    <ItemTemplate>
                        <asp:Label ID="lbl_RacingInfoID" runat="server" Text='<%# Eval("RacingInfo_ID", "{0}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="عنوان مسابقه" SortExpression="Race_Title">
                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
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
                <asp:TemplateField HeaderText="آخرین ویرایش" SortExpression="Racing_LastUpdateDate">
                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:Label ID="lbl_RacingLastUpdateDate" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("Racing_LastUpdateDate", "{0}"),"L",true) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="نمایش برندگان">
                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                    <ItemTemplate>
                        <asp:ImageButton CommandArgument='<%# Eval("RacingInfo_ID") %>' ID="ImgButton" runat="server" CommandName="Select" ImageUrl="~/Images/ajaxImages/game.png" AlternateText="برندگان" />                        
                    </ItemTemplate>
                </asp:TemplateField>
                <%--///////////////////////////////////--%>
                <asp:TemplateField>
                    <ItemTemplate>
                        <tr>
                            <td colspan="100%">
                                <div id="div<%# Eval("RacingInfo_ID") %>" style="display: none" class="divRacingGrid">
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:GridView ID="gv_RacingForm" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                                                CellPadding="4" ForeColor="Lime" GridLines="None" ShowFooter="True" DataKeyNames="Form_RacingInfoID"
                                                CssClass="grid_Racing" OnRowDataBound="gv_RacingForm_RowDataBound">
                                                <HeaderStyle Height="30px" BackColor="#301531" Font-Bold="True" ForeColor="Aqua"
                                                    VerticalAlign="Middle" HorizontalAlign="Center" />
                                                <RowStyle VerticalAlign="Middle" HorizontalAlign="Center" BackColor="Navy" ForeColor="White"></RowStyle>
                                                <Columns>
                                                    <asp:TemplateField HeaderText="ردیف">
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_RowNumber" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText=" نمایش فرم " HeaderStyle-Font-Size="8pt" HeaderStyle-Font-Bold="false"
                                                        HeaderStyle-Font-Names="Tahoma">
                                                        <ItemTemplate>
                                                            <a href="javascript:expandcollapse('div<%# Eval("FormInfo_FormID") %>','one');" ><img id="imgdiv<%# Eval("FormInfo_FormID") %>" alt="ثبت نتیجه" width="32px" border="0" src="../Images/ajaxImages/plus.gif" /></a>
                                                        </ItemTemplate>
                                                        <HeaderStyle Font-Bold="False" Font-Names="Tahoma" Font-Size="8pt" />
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
                                                            <asp:Label ID="lbl_CreationDate" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("Form_CreationDate", "{0}"), "L", true) %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="تاریخ آخرین ویرایش">
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_UpdateDate" runat="server" Text='<%# PersianClass.getPersiaDate(Eval("Form_LastUpdate", "{0}"), "L", true) %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="مبلغ فرم">
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_FromAmount" runat="server" Text='<%# Eval("Form_Amount", "{0}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="امتیاز فرم">
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_FromProminence" ForeColor="Red" runat="server" Text='<%# Eval("Form_Prominence", "{0}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="وضعیت فرم">
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_FromStatus" runat="server" Text='<%# Eval("Form_ActiveStatus", "{0}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--///////////////////////////////////--%>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td colspan="100%">                                                          
                                                                <div id='div<%# Eval("FormInfo_FormID") %>' style="display: none">
                                                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <asp:GridView ID="gv_Racing" AutoGenerateColumns="False" runat="server"
                                                                            CellPadding="4" GridLines="Horizontal" DataKeyNames="Form_ID">
                                                                            <Columns>
                                                                                <asp:TemplateField HeaderText="ردیف">
                                                                                    <ItemStyle Width="5%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                                                    <HeaderStyle CssClass="header_Grid" />
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lbl_GameID" ForeColor="Purple" runat="server" Text='<%# Eval("FormInfo_GameID", "{0}") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="تیم میزبان">
                                                                                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                                                    <HeaderStyle CssClass="header_Grid" />
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lbl_HostTeamID" runat="server" Text='<%# Eval("FormInfo_HostTeamID", "{0}") %>'
                                                                                            Visible="false"></asp:Label>
                                                                                        <asp:Label ID="lbl_HostTeam" ForeColor="Purple" runat="server" Text='<%# Eval("HostTeam", "{0}") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:CheckBoxField HeaderText="برد میزبان" DataField="FormInfo_IsHostWin" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" />
                                                                                <asp:CheckBoxField HeaderText="مساوی" DataField="FormInfo_IsEqualGame" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" />
                                                                                <asp:CheckBoxField HeaderText="برد میهمان" DataField="FormInfo_IsGuestWin" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" />
                                                                                <asp:TemplateField HeaderText="تیم میهمان">
                                                                                    <HeaderStyle CssClass="header_Grid" />
                                                                                    <ItemStyle Width="15%" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lbl_GuestTeamID" runat="server" Text='<%# Eval("FormInfo_GuestTeamID", "{0}") %>'
                                                                                            Visible="false"></asp:Label>
                                                                                        <asp:Label ID="lbl_GuestTeam" ForeColor="Purple" runat="server" Text='<%# Eval("GuestTeam", "{0}") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                            <HeaderStyle BackColor="#1b1b1b" Font-Bold="True" ForeColor="Yellow" VerticalAlign="Middle" HorizontalAlign="Center" />
                                                                            <RowStyle BackColor="#1b1b1b" ForeColor="Lime" VerticalAlign="Middle" HorizontalAlign="Center"/>
                                                                        </asp:GridView>
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                                </div>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </ContentTemplate>
</asp:UpdatePanel>
<div id="divRacingResult" aria-labelledby="ui-dialog-title-dialog-form" role="dialog" tabindex="-1" class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable ui-resizable"
    style="display: none; z-index: 1002; outline: 0px none; position: absolute; height: auto; width: 800px; top: 82px; left: 460px;">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix"><span id="ui-dialog-title-dialog-form" class="ui-dialog-title">ویرایش</span><a role="button" class="ui-dialog-titlebar-close ui-corner-all" href="#"><span class="ui-icon ui-icon-closethick">بستن</span></a></div>
    <div style="width: auto; min-height: 0px; height: auto" class="ui-dialog-content ui-widget-content" id="dialog-form">
        <form id="frm_RacingResult">
            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                <ContentTemplate>
                    <fieldset>
                        <legend style="color: White"><asp:Label ID="lb_RacingTitle" ForeColor="#ffcc00" runat="server" Text=""></asp:Label></legend>
                        <table>
                        <tr>
                            <td>
                                <div>
                                <p style="text-align:center"><label style="color:Lime">نفرات  </label><span style="color:#ffcc00">اول </span></p>
                                <asp:GridView ID="gv_RacingFirstWin" AutoGenerateColumns="False" runat="server" CellPadding="7"
                                ForeColor="#333333" GridLines="None" oncontextmenu="return false;">
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
                                            <asp:Label ID="lbl_FormID" runat="server" Text='<%# Eval("FormInfo_FormID", "{0}") %>'></asp:Label>
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
                                            <asp:Label ID="lbl_FormProminence" ForeColor="Lime" runat="server" Text='<%# Eval("Form_Prominence", "{0}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <HeaderStyle Height="30px" BackColor="#333333" Font-Bold="True" ForeColor="Aqua"
                                    VerticalAlign="Middle" HorizontalAlign="Center" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#3465C8" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" /><SortedAscendingHeaderStyle BackColor="#6D95E1" /><SortedDescendingCellStyle BackColor="#E9EBEF" /><SortedDescendingHeaderStyle BackColor="#4870BE" /><SortedAscendingCellStyle BackColor="#F5F7FB" /><SortedAscendingHeaderStyle BackColor="#6D95E1" /><SortedDescendingCellStyle BackColor="#E9EBEF" /><SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>                                
                            </div>
                            </td>
                            <td>
                                <div>
                                <p style="text-align: center"><label style="color: Lime"> نفرات </label><span style="color: #ffcc00">دوم </span></p>
                                <asp:GridView ID="gv_RacingSecondWin" AutoGenerateColumns="False" runat="server" CellPadding="7"
                                ForeColor="#333333" GridLines="None" oncontextmenu="return false;">
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
                                            <asp:Label ID="lbl_FormID" runat="server" Text='<%# Eval("FormInfo_FormID", "{0}") %>'></asp:Label>
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
                                            <asp:Label ID="lbl_FormProminence" ForeColor="Lime" runat="server" Text='<%# Eval("Form_Prominence", "{0}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <HeaderStyle Height="30px" BackColor="#333333" Font-Bold="True" ForeColor="Aqua" VerticalAlign="Middle" HorizontalAlign="Center" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#3465C8" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" /><SortedAscendingHeaderStyle BackColor="#6D95E1" /><SortedDescendingCellStyle BackColor="#E9EBEF" /><SortedDescendingHeaderStyle BackColor="#4870BE" /><SortedAscendingCellStyle BackColor="#F5F7FB" /><SortedAscendingHeaderStyle BackColor="#6D95E1" /><SortedDescendingCellStyle BackColor="#E9EBEF" /><SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
                            </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lbl_Sum" runat="server" Text="0"></asp:Label><br />
                                <asp:Label ID="lbl_rewardForFirstWin" runat="server" Text="0"></asp:Label><br />
                                <asp:Label ID="lbl_rewardForSecondWin" runat="server" Text="0"></asp:Label><br />
                                <asp:Label ID="lbl_perFirstWin" runat="server" Text="0"></asp:Label><br />
                                <asp:Label ID="lbl_perSecondWin" runat="server" Text="0"></asp:Label><br />
                            </td>
                        </tr>
                    </table>                    
                    </fieldset>
                </ContentTemplate>
            </asp:UpdatePanel>
        </form>
    </div>
    <div class="ui-resizable-handle ui-resizable-n"></div><div class="ui-resizable-handle ui-resizable-e"></div><div class="ui-resizable-handle ui-resizable-s"></div>
    <div class="ui-resizable-handle ui-resizable-w"></div><div style="z-index: 1001;" class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se ui-icon-grip-diagonal-se"></div>
    <div style="z-index: 1002;" class="ui-resizable-handle ui-resizable-sw"></div><div style="z-index: 1003;" class="ui-resizable-handle ui-resizable-ne"></div>
    <div style="z-index: 1004;" class="ui-resizable-handle ui-resizable-nw"></div><div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix"></div>
</div>
<script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script><script src="../Scripts/jquery-blockUI.js" type="text/javascript"></script><script src="../Scripts/jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">function getImagePath(){ return '<%= ImagePath %>'; }  var imagePath = getImagePath();
    function expandcollapse(obj, row){var div = document.getElementById(obj); var img = document.getElementById('img' + obj);
    if (div.style.display == "none"){ div.style.display = "block"; if (row == 'alt') { img.src = imagePath + "/ajaxImages/minus.gif"; } else { img.src = imagePath + "/ajaxImages/minus.gif"; }
    } else { div.style.display = "none"; if (row == 'alt') { img.src = imagePath + "/ajaxImages/plus.gif"; } else { img.src = imagePath + "/ajaxImages/plus.gif"; } }}
    function setBlock(){$.blockUI({ message: '<h4 style="font-family:tahoma;color:lime"><img src="' + imagePath + '/ajaxImages/loading_User.gif" /><br /><br />... درحال بارگذاری</h4>',
    fadeIn: 1000, fadeOut: 1000, centerX: true, centerY: true, css: { border: 'none', padding: '5px', backgroundColor: 'transparent', '-webkit-border-radius': '10px', '-moz-border-radius': '10px', opacity: .6, color: '#000'}});}
    var prm = Sys.WebForms.PageRequestManager.getInstance();prm.add_beginRequest(function () { setBlock(); }); prm.add_endRequest(function () { $.unblockUI(); });</script>
<script type="text/javascript">$(document).ready(function (){$("#dialog:ui-dialog").dialog("destroy");$("#dialog-form").dialog({
 autoOpen: false, resizable: false, height: 'auto', width: 800, resizable: false,direction: 'rtl',
 show: 'clip', //blind-clip-drop-explode-fold-puff-slide-scale-size-pulsate
 hide: 'clip', stack: true, position: 'center',
 //show: "blind",hide: "explode",overlay: { opacity: 0.5, background: "cyan" },show: "drop",
 //hide: { effect: "clip", pieces: 60, duration: '1000', autoOpen: false },            
 title: 'نمایش برندگان', modal: true});$('.submit').click(function (){ $("#dialog-form").dialog("close"); });});</script>
