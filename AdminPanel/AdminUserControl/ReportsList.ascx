<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ReportsList.ascx.cs" Inherits="AdminPanel_AdminUserControl_ReportsList" %>
<fieldset>
    <legend style="color: #ffcc00;">گزارشات</legend>
    <ul style="line-height: 40px;" class="reports">
        <li><a href="../AdminPanel/ReportChargeUsersAccount.aspx" id="report1">1 - گزارش شارژ حساب کاربران</a></li>
        <li><a href="../AdminPanel/ReportChargeUsersUnSuccessFull.aspx" id="report2">2 - گزارش شارژهای ناموفق کاربران</a></li>
        <li><a href="../AdminPanel/ReportRacingActiveInventoryAmount.aspx" id="report3">3 - گزارش مبلغ موجودی فعال شده هر مسابقه</a></li>
        <li><a href="../AdminPanel/ReportRacingStatistic.aspx" id="report4">4 - گزارش عملکرد مسابقه</a></li>
        <li><a href="../AdminPanel/ReportSiteBox.aspx" id="report5">5 - گزارش صندوق سایت</a></li>
        <li><a href="../AdminPanel/ReportGovernBox.aspx" id="report6">6 - گزارش صندوق دولتی</a></li>
        <li><a href="../AdminPanel/ReportCharitableBox.aspx" id="report7">7 - گزارش صندوق عمومی(عام المنفعه)</a></li>
        <li><a href="../AdminPanel/ReportUsersRewardBox.aspx" id="report8">8 - گزارش صندوق جوایز کاربران</a></li>
        <li><a href="../AdminPanel/ReportRewardBoxByUser.aspx" id="report9">9 - گزارش گردش مالی صندوق جایزه کاربران</a></li>
        <li><a href="../AdminPanel/ReportChargeBoxByUser.aspx" id="report10">10 - گزارش گردش مالی صندوق شارژ کاربران</a></li>
    </ul>
</fieldset>
