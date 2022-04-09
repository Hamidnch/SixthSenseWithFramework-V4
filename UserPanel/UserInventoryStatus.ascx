<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserInventoryStatus.ascx.cs" Inherits="UserPanel_UserInventoryStatus" %>
<div class="userInventory">    
    <fieldset>
        <legend>وضعیت موجودی</legend>
        <table cellpadding="2" cellspacing="3">
            <tr>
                <td colspan="4" class="userInventory_cell">
                    <asp:Label ID="lbl_Today" runat="server" Text="امروز ....." ForeColor="#ffcc00"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="userInventory_cell" style="width: 189px">
                    <asp:Label ID="Label1" runat="server" Text="مشخصات کاربری : "></asp:Label>
                </td>
                <td class="userInventory_cell" style="width: 218px">
                    <asp:Label ID="lbl_UserAttr" runat="server" Text="....................." ForeColor="Lime"></asp:Label>
                </td>
                <td class="userInventory_cell" style="width: 183px">
                    <asp:Label ID="Label3" runat="server" Text="شناسه کاربری : "></asp:Label>
                </td>
                <td style="width: 276px" class="userInventory_cell">
                    <asp:Label ID="lbl_UserName" runat="server" Text="....................." ForeColor="Lime"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="userInventory_cell" style="width: 189px">
                    <asp:Label ID="Label5" runat="server" Text="موجودی صندوق شارژ : "></asp:Label>
                </td>
                <td style="width: 218px" class="userInventory_cell">
                    <asp:Label ID="lbl_ChargeBoxInventory" runat="server" Text="............ ریال" ForeColor="Lime"></asp:Label>
                </td>
                <td class="userInventory_cell" style="width: 183px">
                    <asp:Label ID="Label8" runat="server" Text="موجودی صندوق جایزه : "></asp:Label>
                </td>
                <td style="width: 276px" class="userInventory_cell">
                    <asp:Label ID="lbl_RewardBoxInventory" runat="server" Text="............ ریال" ForeColor="Lime"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="userInventory_cell" style="width: 189px">
                    <asp:Label ID="Label10" runat="server" Text="مبلغ آخرین شارژ : "></asp:Label>
                </td>
                <td class="userInventory_cell" style="width: 218px">
                    <asp:Label ID="lbl_LastChargeAmount" runat="server" Text="............ ریال" ForeColor="Lime"></asp:Label>
                </td>
                <td class="userInventory_cell" style="width: 183px">
                    <asp:Label ID="Label7" runat="server" Text="تاریخ و ساعت آخرین شارژ : "></asp:Label>
                </td>
                <td style="width: 276px" class="userInventory_cell">
                    <asp:Label ID="lbl_LastChargeDate" runat="server" Text="....................." ForeColor="Lime"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <hr style="color:#5D5852"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="Button1" runat="server" Text="شارژ حساب" CssClass="btn" PostBackUrl="~/Sport/Sport_SettleIndex.aspx" />
                </td>
    <%--            <td colspan="2">
                    <asp:Button ID="Button2" runat="server" Text="بازگشت" CssClass="btn"/>
                </td>--%>
            </tr>
        </table>
    </fieldset>    
</div>