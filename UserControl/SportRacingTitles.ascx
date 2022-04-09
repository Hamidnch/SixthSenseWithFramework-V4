<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportRacingTitles.ascx.cs" Inherits="UserControl_SportRacingTitles" %>
<link href="../Styles/CSSSport_Titles.css" rel="stylesheet" type="text/css" />
<div id="RacingTitles">
    <div class="dl_RacingTitles"> 
    <asp:DataList ID="dl_SportRacingTitles" runat="server" RepeatDirection="Horizontal" RepeatColumns="2" onitemdatabound="dl_SportRacingTitles_ItemDataBound">
            <ItemStyle CssClass="RacingTitle"></ItemStyle>
                <ItemTemplate>
                <fieldset id="fld_RacingTitle" runat="server">
                    <asp:Label ID="lbl_RaceID" runat="server" Text='<%# Eval("Race_ID", "{0}") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lbl_Race_Title" runat="server" Text='<%# Eval("Race_Title", "{0}") %>' CssClass="RacingTitleSubItem"></asp:Label>
                </fieldset>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <br /><br />
    <div class="divBtnForm">  
        <input type="button" class="btnForm" value="برگشت" onclick="javascript:window.location.href='Sport_Home.aspx'" />          
<%--        <asp:Button ID="btn_Exit" runat="server" Text="برگشت"  CssClass="btnForm" onclick="btn_Exit_Click"/>  --%>          
    </div>
</div>
