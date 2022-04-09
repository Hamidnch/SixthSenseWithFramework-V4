<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportSettlePocketStrap.ascx.cs" Inherits="UserControl_SportSettlePocketStrap" %>
<link href="../Styles/CssSport_SettlePocketStrap.css" rel="stylesheet" type="text/css" />
<div id="sport_SettlePocketStrap">
    <table style="width: 100%;line-height:35px">
        <tr>
            <td colspan="4">
                <span style="font-size:14px;font-weight:bold;">ارسال اطلاعات پرداخت به وسیله حواله بانکی(فیش نقدی)</span>
            </td>
        </tr>
        <tr>
            <td>
                <span>از طریق بانک:</span>
            </td>
            <td>
                <asp:DropDownList ID="ddl_PocketStrapBankName" runat="server" TabIndex="20">
                    <asp:ListItem>سیبای ملی</asp:ListItem>
                    <asp:ListItem>سپهر صادرات</asp:ListItem>
                    <asp:ListItem>جام ملت</asp:ListItem>
                    <asp:ListItem>مهر کشاورزی</asp:ListItem>
                    <asp:ListItem>بانک سپه</asp:ListItem>
                    <asp:ListItem>بانک تجارت</asp:ListItem>
                    <asp:ListItem>بانک سامان</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <span>شماره فیش(6رقمی):</span>
            </td>
            <td>
                <asp:TextBox ID="txt_PocketStrapAccountNumber" runat="server" Width="150px"></asp:TextBox>               
            </td>
        </tr>
        <tr>
            <td>
                <span>مبلغ واریزی(ریال):</span>
            </td>
            <td>
                <asp:TextBox ID="txt_PocketStrapSettleAmount" runat="server" Width="150px"></asp:TextBox>
            </td>
            <td>
            </td>
            <td>
             
            </td>
        </tr>
        <tr>
            <td>
                <span>تاریخ حواله :</span>
            </td>
            <td>
                <asp:DropDownList ID="ddl_PocketStrapDay" runat="server" Width="55px" TabIndex="8">
                    <asp:ListItem>&lt;روز&gt;</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>21</asp:ListItem>
                    <asp:ListItem>22</asp:ListItem>
                    <asp:ListItem>23</asp:ListItem>
                    <asp:ListItem>24</asp:ListItem>
                    <asp:ListItem>25</asp:ListItem>
                    <asp:ListItem>26</asp:ListItem>
                    <asp:ListItem>27</asp:ListItem>
                    <asp:ListItem>28</asp:ListItem>
                    <asp:ListItem>29</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>31</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddl_PocketStrapMonth" runat="server" Width="55px" TabIndex="9">
                    <asp:ListItem>&lt;ماه&gt;</asp:ListItem>
                    <asp:ListItem Value="1">فروردین</asp:ListItem>
                    <asp:ListItem Value="2">اردیبهشت</asp:ListItem>
                    <asp:ListItem Value="3">خرداد</asp:ListItem>
                    <asp:ListItem Value="4">تیر</asp:ListItem>
                    <asp:ListItem Value="5">مرداد</asp:ListItem>
                    <asp:ListItem Value="6">شهریور</asp:ListItem>
                    <asp:ListItem Value="7">مهر</asp:ListItem>
                    <asp:ListItem Value="7">آبان</asp:ListItem>
                    <asp:ListItem Value="8">آذر</asp:ListItem>
                    <asp:ListItem Value="9">دی</asp:ListItem>
                    <asp:ListItem Value="11">بهمن</asp:ListItem>
                    <asp:ListItem Value="12">اسفند</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddl_PocketStrapYear" runat="server" Width="60px" TabIndex="10">
                    <asp:ListItem>&lt;سال&gt;</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td colspan="2" align="center">
                <input id="btn_PocketStrap" class="btn" type="button" value="ثبت" />
            </td>
        </tr>
    </table>
</div>