<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportClassificationTable.ascx.cs" Inherits="UserControl_SportClassificationTable" %>

<div id="ClassificationTable">
    <div class="dl_RacingTitles"> 
    <asp:DataList ID="dl_ClassificationTable" runat="server" RepeatDirection="Horizontal" RepeatColumns="2" onitemdatabound="dl_ClassificationTable_ItemDataBound">
            <ItemStyle CssClass="RacingTitle"></ItemStyle>
                <ItemTemplate>
                <fieldset id="fld_ClassificationTable" runat="server">
                    <asp:Label ID="lbl_ClassificationTable_ID" runat="server" Text='<%# Eval("ClassificationTable_ID", "{0}") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lbl_ClassificationTable_Title" runat="server" Text='<%# Eval("ClassificationTable_Title", "{0}") %>' CssClass="RacingTitleSubItem"></asp:Label>
                </fieldset>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <br /><br />
    <div class="divBtnForm" style="float: right">  
        <input type="button" class="btnForm" value="برگشت" onclick="javascript:window.location.href='Sport_Home.aspx'" />
    </div>
</div>