<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SportSettleKartToKart.ascx.cs" Inherits="UserControl_SportSettleKartToKart" %>
<link href="../Styles/CSSSport_SettleKartToKart.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(document).ready(function ()
    {
        $("#btn_KartToKart").click(function ()
        {
            alert($("#btn_KartToKart").val());
        });
    });
</script>
<div id="sport_SettleKartToKart">    
    <table style="width: 100%;line-height:35px">
        <tr>
            <td colspan="3">
                <span style="font-size:14px;font-weight:bold;">ارسال اطلاعات پرداخت کارت به کارت</span>
             </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <span>مبلغ واریزی(ریال) :</span>
            </td>
            <td>
                <asp:TextBox ID="txt_SettleAmount" runat="server" Width="150px"></asp:TextBox>
            </td>
            <td>
                <span>4 رقم شماره کارت :</span>
            </td>
            <td>
                <asp:TextBox ID="txt_4KartNumber" runat="server" Width="150px"></asp:TextBox>               
            </td>
        </tr>
        <tr>
            <td>
                <span>شماره فیش (6 رقمی) :</span>
            </td>
            <td>
                <asp:TextBox ID="txt_6StrapNumber" runat="server" Width="150px"></asp:TextBox>
            </td>
            <td>
                <span>شماره ارجاع :</span>
            </td>
            <td>
                <asp:TextBox ID="txt_ReferenceNumber" runat="server" Width="150px"></asp:TextBox>               
            </td>
        </tr>
        <tr>
            <td>
                <span>تاریخ حواله :</span>
            </td>
            <td>
                <asp:DropDownList ID="ddl_Day" runat="server" Width="55px" TabIndex="8">
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
                <asp:DropDownList ID="ddl_Month" runat="server" Width="55px" TabIndex="9">
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
                <asp:DropDownList ID="ddl_Year" runat="server" Width="60px" TabIndex="10">
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
                <input id="btn_KartToKart" class="btn" type="button" value="ثبت" />
            </td>
        </tr>
    </table>    
</div>